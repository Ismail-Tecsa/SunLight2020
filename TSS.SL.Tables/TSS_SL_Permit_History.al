table 50036 "Permit History"
{
    Caption = 'Permit History';
    DataClassification = ToBeClassified;
    DataCaptionFields = "Permit ID", "Permit Company";
    DataPerCompany = false;
    //    LookupPageId = "Permit List";
    //    DrillDownPageId = "Permit List";

    fields
    {
        field(1; "Permit ID"; Code[20])
        {
            Caption = 'Permit ID';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(2; "Permit Company"; Text[30])
        {
            Caption = 'Permit Company';
            DataClassification = CustomerContent;
            TableRelation = Company;
            trigger OnValidate()

            begin
                if "Management Company" = '' then
                    validate("Management Company", "Permit Company");
            end;
        }
        field(3; "License Class"; Option)
        {
            Caption = 'License Class';
            OptionMembers = "","Teksi","Limousine";
            DataClassification = CustomerContent;
        }
        field(4; "Service Location"; Code[20])
        {
            Caption = 'Service Location';
            DataClassification = CustomerContent;
        }
        field(5; "Seating Capacity"; Integer)
        {
            Caption = 'Seating Capacity';
            DataClassification = CustomerContent;
        }
        field(6; "Passenger No."; Integer)
        {
            Caption = 'Passenger No.';
            DataClassification = CustomerContent;
        }
        field(7; "Special Condition"; Text[250])
        {
            Caption = 'Special Condition';
            DataClassification = CustomerContent;
        }
        field(8; "Permit Status"; Option)
        {
            Caption = 'Permit Status';
            OptionMembers = "In-Active","Active";
            DataClassification = CustomerContent;
        }
        field(9; "Permit Condition"; Option)
        {
            Caption = 'Permit Condition';
            OptionMembers = "New","PG10","SK-Used";
            DataClassification = CustomerContent;
        }

        field(10; "Permit Start Date"; Date)
        {
            Caption = 'Permit Start Date';
            DataClassification = CustomerContent;
        }
        field(11; "Permit End Date"; Date)
        {
            Caption = 'Permit End Date';
            DataClassification = CustomerContent;
        }
        field(12; "Permit Ref. No."; Code[20])
        {
            Caption = 'Permit Ref. No.';
            DataClassification = CustomerContent;
        }
        field(13; "Set ID"; code[10])
        {
            Caption = 'Set ID';
            DataClassification = CustomerContent;

        }
        field(14; "Offer Letter Start Date"; Date)
        {
            Caption = 'Offer Letter Start Date';
            DataClassification = CustomerContent;
        }
        field(15; "Offer Letter End Date"; Date)
        {
            Caption = 'Offer Letter End Date';
            DataClassification = CustomerContent;
        }

        field(16; Reserved; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = Exist(taxis where("Permit ID" = field("Permit ID")));
        }
        field(40; "Management Company"; Text[30])
        {
            Caption = 'Management Company';
            DataClassification = CustomerContent;
            TableRelation = Company;
        }
        field(50; "Taxi No."; Code[20])
        {
            Caption = 'Taxi No.';
            TableRelation = Taxis;
        }
        field(100; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(101; "Date"; Date)
        {
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; "Permit ID", "Entry No.")
        {
            Clustered = true;
        }
    }

}
