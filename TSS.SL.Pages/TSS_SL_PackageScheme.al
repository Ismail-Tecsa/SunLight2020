page 50002 "Package Scheme List"
{

    ApplicationArea = All;
    Caption = 'Package Scheme';
    PageType = List;
    SourceTable = "Package Scheme";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field("Car Model"; Rec."Car Model")
                {
                    ApplicationArea = All;
                }
                field("Car Condition"; Rec."Car Condition")
                {
                    ApplicationArea = All;
                }
                field("Contract Period"; Rec."Contract Period")
                {
                    ApplicationArea = All;
                }
                field("Daily Rate"; Rec."Daily Rate")
                {
                    ApplicationArea = All;
                }
                field("Down Payment"; Rec."Down Payment")
                {
                    ApplicationArea = All;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = All;
                }
                field("Service Location"; Rec."Service Location")
                {
                    ApplicationArea = All;
                }
                field("Year Made"; Rec."Year Made")
                {
                    ApplicationArea = All;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                }
                field("Booking Fees"; Rec."Booking Fees")
                {
                    ApplicationArea = All;
                }
                field("Accident Penalty"; Rec."Accident Penalty")
                {
                    ApplicationArea = All;
                }
                field(NGV; Rec.NGV)
                {
                    ApplicationArea = All;
                }
                field(Enabled; Rec.Enabled)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
