table 50037 "CM Letter Form"
{
    Caption = 'Court Hearing';
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; "Case ID"; Code[10])
        {
            Caption = 'Case ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(3; "Action Taken"; Text[50])
        {
            Caption = 'Action Taken';
            DataClassification = ToBeClassified;
        }
        field(4; "Remarks"; Text[80])
        {
            Caption = 'Remarks';
            DataClassification = ToBeClassified;
        }
        field(5; "Hearing Date"; Date)
        {
            Caption = 'Hearing Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Letter Form"; Text[50])
        {
            Caption = 'Letter Form';
            DataClassification = ToBeClassified;
        }
        field(7; "Letter From"; Text[50])
        {
            Caption = 'Letter From';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Case ID")
        {
            Clustered = true;
        }
    }

}
