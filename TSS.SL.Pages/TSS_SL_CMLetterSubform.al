page 50052 "CM Letter Subform"
{
    Caption = 'CM Letter Subform';
    PageType = ListPart;
    SourceTable = "CM Letter Form";
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
                field("Date"; Date)
                {
                    ApplicationArea = all;
                }
                field("Letter Form"; "Letter Form")
                {
                    Visible = false;
                    //   ApplicationArea = all;
                }
                field("Letter From"; "Letter From")
                {
                    ApplicationArea = all;
                }
                field("Action Taken"; "Action Taken")
                {
                    ApplicationArea = all;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = all;
                }
                field("Hearing Date"; "Hearing Date")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}