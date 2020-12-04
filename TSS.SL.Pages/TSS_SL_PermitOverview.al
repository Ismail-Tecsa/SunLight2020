page 50016 "Permit Overview"
{

    ApplicationArea = All;
    Caption = 'Permit Overview';
    PageType = List;
    SourceTable = "Permit Cue";
    UsageCategory = Lists;
    editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = All;
                }
                field("Active Permits"; Rec."Active Permits")
                {
                    ApplicationArea = All;
                }
                field("New Permits"; Rec."New Permits")
                {
                    ApplicationArea = All;
                }
                field("PG10 Permits"; Rec."PG10 Permits")
                {
                    ApplicationArea = All;
                }
                field("SK-Used Permits"; Rec."SK-Used Permits")
                {
                    ApplicationArea = All;
                }
                field("Total Permits"; Rec."Total Permits")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
