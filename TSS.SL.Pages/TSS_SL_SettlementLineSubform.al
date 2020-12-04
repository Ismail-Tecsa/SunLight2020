
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
        }

    }

}
