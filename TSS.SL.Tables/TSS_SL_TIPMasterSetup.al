table 50009 "TIP Master Setup"
{
    Caption = 'TIP Master Setup';
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; "Step No."; Integer)
        {
            Caption = 'Step No.';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Permit Change Locked"; Boolean)
        {
            Caption = 'Permit Change Locked';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Step No.")
        {
            Clustered = true;
        }
    }

}
