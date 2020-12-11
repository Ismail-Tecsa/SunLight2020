codeunit 50001 "SunCab Journal Management"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterPostGenJnlLine', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnAfterPostGenJnlLine"
    (
        var GenJournalLine: Record "Gen. Journal Line";
        Balancing: Boolean
    )

    var
        Bank: record "Bank Account";
        SunCab: Record "SunCab Bank Setup";
        CompInfo: record "Company Information";
        SunCabGJL: record "SunCab Gen. Journal Line";
        GenJnlLine: Record "Gen. Journal Line";
        entryno: Integer;

    begin

        CompInfo.get;
        if not CompInfo."Taxi Company" then exit;

        SunCabGJL.SetCurrentKey("Document No.", "Document Date");
        SunCabGJL.SetRange("Document Date", GenJournalLine."Document Date");
        SunCabGJL.SetRange("document no.", GenJournalLine."Document No.");
        SunCabGJL.setrange("Journal Template Name", GenJournalLine."Journal Template Name");
        suncabgjl.setrange("Journal Batch Name", GenJournalLine."Journal Batch Name");
        if suncabgjl.FindFirst() then exit;

        genjnlline.reset;
        genjnlline.setrange("Journal Batch Name", GenJournalLine."Journal Batch name");
        genjnlline.setrange("Journal Template Name", GenJournalLine."Journal Template Name");
        //GenJnlLine.SetRange("Line No.", GenJournalLine."Line No.");
        GenJnlLine.findfirst;

        SunCabGJL.reset;

        entryno := 0;
        if SunCabGJL.findlast then entryno := SunCabGJL."Entry No.";

        repeat
            if genjnlLine."Bal. Account Type" = genjnlline."Bal. Account Type"::"Bank Account" then begin
                bank.get(genjnlLine."Bal. Account No.");
                if bank."Transaction Type" <> '' then begin
                    suncab.get(bank."Transaction Type");
                    entryno += 1;
                    SunCabGJL.TransferFields(genjnlLine);
                    suncabgjl."Entry No." := entryno;
                    SunCabGJL."Account Type" := suncabgjl."Account Type"::"Bank Account";
                    suncabgjl."Account No." := SunCab."SunCab Bank";
                    suncabgjl."Bal. Account Type" := SunCab."Account Type";
                    suncabgjl."Bal. Account No." := suncab."Account No.";
                    suncabgjl.validate(Amount, -genjnlLine.amount);
                    suncabgjl.insert;
                end;
            end;
        until genjnlLine.next = 0;

    end;


    procedure DaysToAmt(_contract: code[10]; _days: Integer) Amount: Decimal
    var
        ContHead: record "Service Contract Header";
        BookEntry: Record "Booking Entry";
    begin

        conthead.get(ContHead."Contract Type"::Contract, _contract);
        BookEntry.reset;
        BookEntry.SetCurrentKey("Contract No.", "Posting Date", Closed);
        BookEntry.setrange("Contract No.", ContHead."Contract No.");

    end;


    procedure CalculatePayment(_jnlbatch: code[10]; _contract: code[10]; _Amount: Decimal; _days: Integer; _date: date)
    var
        ContHead: record "Service Contract Header";
        ContLine: record "Service Contract Line";
        Taxi: Record Taxis;
        BookEntry: Record "Booking Entry";
        package: record "Package Scheme";
        PackCat: Record "Package Category";
        CalcType: Option "Latest","Day","Amount","Date";
        GJL: Record "Gen. Journal Line";
        lineno: Integer;
        totamount: Integer;
        DayCount: Integer;
        diff: Decimal;
        WorkMonth: Integer;
        WorkYear: Integer;
        WorkDay: integer;
        BookMonth: Integer;
        BookYear: Integer;
        BookDay: Integer;
        EoMDay: Integer;

    begin

        CalcType := CalcType::Latest;
        if _amount <> 0 then CalcType := CalcType::Amount;
        if _date <> 0D then CalcType := CalcType::Date;
        if _days <> 0 then CalcType := CalcType::day;

        conthead.get(ContHead."Contract Type"::Contract, _contract);
        contline.setrange("Contract No.", conthead."Contract No.");
        contline.FindFirst();
        taxi.get(contline."Taxi ID");
        package.get(ContHead."Package Scheme");
        packcat.get(package.Category);
        BookEntry.reset;
        BookEntry.SetCurrentKey("Contract No.", "Posting Date", Closed);
        BookEntry.setrange("Contract No.", ContHead."Contract No.");

        // First calculate rental due based on data provided.

        BookEntry.SetRange(Closed, false);
        case CalcType of
            CalcType::Latest:
                begin
                    BookEntry.setrange("Posting Date", 0D, workdate);
                    _amount := 999999;
                    _days := 999;
                end;
            CalcType::Amount:
                begin
                    BookEntry.setrange("Posting Date", 0D, 99991231D);
                    _days := 999;
                end;
            CalcType::Date:
                begin
                    BookEntry.setrange("Posting Date", 0D, _date);
                    _amount := 999999;
                    _days := 999;
                end;
            CalcType::Day:
                begin
                    BookEntry.setrange("Posting Date", 0D, 99991231D);
                    _amount := 999999;
                end;
        end;

        lineno := 0;
        totamount := 0;
        DayCount := 0;
        workmonth := Date2DMY(workdate, 2);
        workyear := date2dmy(Workdate, 3);
        workday := date2dmy(workdate, 1);


        if BookEntry.findfirst then begin
            repeat
                clear(gjl);
                gjl.Init();
                gjl.validate("Journal Template Name", 'CASHRCPT');
                gjl.Validate("Journal Batch Name", _jnlbatch);
                lineno += 10000;
                GJL."Line No." := lineno;
                gjl."Document No." := copystr(UserId, 1, 20);
                gjl.Validate("Taxi No.", taxi."Taxi ID");
                gjl.validate(Amount, BookEntry."Amount Due");
                gjl."Posting Date" := workdate;
                gjl."Document Date" := BookEntry."Posting Date";
                gjl.insert;

                BookMonth := Date2DMY(BookEntry."Posting Date", 2);
                bookyear := date2dmy(BookEntry."Posting Date", 3);
                bookday := date2dmy(BookEntry."Posting Date", 1);

                // if workdate <= 15th of current month and document date = 15th of current month then free
                if PackCat."Discount Bonus Day" = packcat."Discount Bonus Day"::"15th-1 EoM-1" then begin
                    //check if document year / month match current / future
                    if bookyear >= workyear then begin // this year or future
                        if BookMonth >= WorkMonth then begin // this month or future
                            if workday <= 15 then begin
                                if BookDay = 15 then begin
                                    gjl.validate(Amount, 0);
                                    gjl."External Document No." := 'FREE';
                                    gjl.modify;
                                end;
                            end;
                            EoMDay := date2dmy(calcdate('CM', BookEntry."Posting Date"), 1);
                            if workday <= EoMDay then begin
                                if BookDay = EoMDay then begin
                                    gjl.validate(Amount, 0);
                                    gjl."External Document No." := 'FREE';
                                    gjl.modify;
                                end;
                            end;
                        end;
                    end;
                end;

                totamount += gjl.Amount;
                if CalcType = CalcType::Amount then begin
                    if totamount > _amount then
                        diff := totamount - _amount;
                    GJL.VALIDATE(amount, gjl.amount - diff);
                    gjl.Modify();
                    totamount -= diff;
                end;

                DayCount += 1;

            until (BookEntry.next = 0) or (DayCount >= _days) or (totamount >= _Amount);
        end;


    end;

    // booking the payment
    // for each date check holiday if in range then free.
    // bonus always from 1st,
    //special discount

}


