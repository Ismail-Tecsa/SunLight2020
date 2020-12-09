codeunit 50000 "Sunlight Event Handling"
{
    trigger onrun()
    begin
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', true, true)]
    local procedure "Document Attachment Details_OnAfterOpenForRecRef"(var DocumentAttachment: Record "Document Attachment";
    var RecRef: RecordRef;
    var FlowFieldsEditable: Boolean)
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            DATABASE::Taxis, DATABASE::permit:
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    documentattachment.SetRange("No.", RecNo);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnBeforeInsertAttachment', '', true, true)]
    local procedure "Document Attachment_OnBeforeInsertAttachment"(var DocumentAttachment: Record "Document Attachment";
    var RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        LineNo: Integer;
    begin
        documentattachment.Validate("Table ID", RecRef.Number);
        case RecRef.Number of
            DATABASE::taxis, DATABASE::permit:
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    documentattachment.Validate("No.", RecNo);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertGLEntryBuffer', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnBeforeInsertGLEntryBuffer"(var TempGLEntryBuf: Record "G/L Entry";
    var GenJournalLine: Record "Gen. Journal Line";
    var BalanceCheckAmount: Decimal;
    var BalanceCheckAmount2: Decimal;
    var BalanceCheckAddCurrAmount: Decimal;
    var BalanceCheckAddCurrAmount2: Decimal;
    var NextEntryNo: Integer;
    var TotalAmount: Decimal;
    var TotalAddCurrAmount: Decimal)
    begin
        TempGLEntryBuf."Taxi No." := GenJournalLine."Taxi No.";
        TempGLEntryBuf."Taxi Company" := GenJournalLine."Taxi Company";
        TempGLEntryBuf."Contract No." := GenJournalLine."Contract No.";
        TempGLEntryBuf."TIP Step" := GenJournalLine."TIP Step";
        TempGLEntryBuf."Driver No." := GenJournalLine."Driver No.";
        tempglentrybuf."Insurance Policy" := GenJournalLine."Insurance Policy";
        TempGLEntryBuf."Insurance Vendor No." := GenJournalLine."Insurance Vendor No.";//TSA_ISMAIL
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Lock-OpenServContract", 'OnBeforeLockServContract', '', true, true)]
    local procedure "Lock-OpenServContract_OnBeforeLockServContract"(var ServiceContractHeader: Record "Service Contract Header")
    var
        BookEntry: record "Booking Entry";
        PackScheme: record "Package Scheme";
        ServContLine: record "Service Contract Line";
        months: integer;
        nextentryno: integer;
        nextdate: date;
        lastday: Date;
    begin
        //Create Booking Entries
        PackScheme.get(ServiceContractHeader."Package Scheme");
        BookEntry.reset;
        //BookEntry.LockTable(false, false);
        ServContLine.reset;
        ServContLine.SetRange("Contract No.", ServiceContractHeader."Contract No.");
        ServContLine.findfirst();
        nextdate := ServiceContractHeader."Starting Date";
        months := 0;
        lastday := CalcDate('CM+' + format(PackScheme."Contract Period") + 'M', nextdate);
        if not BookEntry.findlast then
            nextentryno := 0
        else
            nextentryno := BookEntry."Entry No.";
        repeat
            nextentryno += 1;
            clear(BookEntry);
            BookEntry."Entry No." := nextentryno;
            BookEntry."Driver No." := ServiceContractHeader."Customer No.";
            BookEntry."Taxi No." := ServContLine."Service Item No.";
            BookEntry."Posting Date" := nextdate;
            BookEntry.Type := BookEntry.Type::Due;
            bookentry."User ID" := UserId;
            BookEntry."Contract No." := ServiceContractHeader."Contract No.";
            BookEntry.Amount := PackScheme."Daily Rate";
            bookentry.insert;
            nextdate := CalcDate('<1D>', nextdate);
        until nextdate = lastday;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Lock-OpenServContract", 'OnAfterOpenServContract', '', true, true)]
    local procedure "Lock-OpenServContract_OnAfterOpenServContract"(var ServiceContractHeader: Record "Service Contract Header")
    var
        BookEntry: record "Booking Entry";
    begin
        bookentry.reset;
        bookentry.setrange("Contract No.", ServiceContractHeader."Contract No.");
        bookentry.DeleteAll();
    end;
    //TSA_ISMAIL Expiration date
    [EventSubscriber(ObjectType::Table, 5628, 'OnAfterValidateEvent', 'Effective Date', false, False)]
    local procedure "OnAfterValidateEffectiveDate"(var Rec: Record Insurance)
    var
    Begin
        Rec."Expiration Date" := CalcDate('1Y', Rec."effective Date")
    End;
    //TSA_ISMAIL Expiration date
}
