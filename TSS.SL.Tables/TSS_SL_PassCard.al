table 50031 "Pass Card"
{
    Caption = 'Pass Card';
    DataClassification = ToBeClassified;
    LookupPageId = "Pass Card List";
    DrillDownPageId = "Pass Card List";

    fields
    {
        field(1; "Serial No."; Code[20])
        {
            Caption = 'Serial No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Driver No."; Code[10])
        {
            Caption = 'Driver No.';
            DataClassification = ToBeClassified;
            TableRelation = customer;
        }
        field(3; "Taxi ID"; Code[10])
        {
            Caption = 'Taxi ID';
            DataClassification = ToBeClassified;
            TableRelation = Taxis;
        }
        field(4; "Contract No."; Code[10])
        {
            Caption = 'Contract No.';
            DataClassification = ToBeClassified;
            TableRelation = "Service Contract Header" where("Contract type" = const(Contract));
        }
        field(5; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Serial No.")
        {
            Clustered = true;
        }
    }
}
