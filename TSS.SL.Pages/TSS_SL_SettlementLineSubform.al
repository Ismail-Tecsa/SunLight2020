
page 50040 "Settlement Line Subform"
{

    Caption = 'Settlement Line Subform';
    PageType = ListPart;
    SourceTable = "Settlement Lines";
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;


    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;

                    trigger OnValidate()

                    begin
                        DocTotals();
                        CurrPage.Update();

                    end;
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = All;
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = All;
                }

            }

            group(Totals)
            {
                ShowCaption = false;
                field("Settlement Amount"; "SetAmount")
                {
                    ApplicationArea = all;
                    Editable = false;

                }
                field("Settlement Paid"; "SetPaid")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

            }

        }

    }
    trigger OnAfterGetRecord()

    begin
        doctotals;
    end;

    trigger OnAfterGetCurrRecord()

    begin
        doctotals;
    end;

    trigger OnFindRecord(Which: Text): Boolean

    begin
        DocTotals();
        exit(Find(Which));
    end;

    trigger OnModifyRecord(): Boolean

    begin
        DocTotals();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean

    begin
        DocTotals();
    end;

    var
        SetAmount: Decimal;
        SetPaid: Decimal;
        GlobalDocNo: code[20];


    local procedure DocTotals()
    var
        Settlement: record "Settlement Header";
    begin

        Setamount := 0;
        SetPaid := 0;
        if settlement.get(GlobalDocNo) then begin
            settlement.CalcFields("Settlement Amount", "Settlement Paid");
            SetAmount := settlement."Settlement Amount";
            SetPaid := settlement."Settlement Paid";

        end;
    end;

    procedure SetDoc(LocalDocNo: code[20])

    begin
        GlobalDocNo := LocalDocNo;
    end;
}
