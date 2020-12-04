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


    // booking the payment
    // for each date check holiday if in range then free.
    // bonus always from 1st,
    //special discount

}


