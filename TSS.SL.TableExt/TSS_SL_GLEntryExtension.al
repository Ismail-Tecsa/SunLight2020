tableextension 50005 "G/LEntry Extension" extends "G/L Entry"
{
    fields
    {
        field(50000; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            DataClassification = ToBeClassified;
            TableRelation = "Service Contract Header";
        }
        field(50001; "Taxi No."; Code[20])
        {
            Caption = 'Taxi No.';
            TableRelation = taxis;
            DataClassification = ToBeClassified;
        }
        field(50002; "TIP Step"; Integer)
        {
            Caption = 'TIP Step';
            TableRelation = "TIP Entry" where("Taxi ID" = field("Taxi No."));
            DataClassification = ToBeClassified;
        }
        field(50003; "Driver No."; Code[20])
        {
            Caption = 'Driver No.';
            DataClassification = ToBeClassified;
        }
        field(50004; "Taxi Company"; Text[30])
        {
            Caption = 'Taxi Company';
            DataClassification = ToBeClassified;
        }
        field(50005; "Insurance Policy"; Text[30])
        {
            Caption = 'Insurance Policy';
            DataClassification = ToBeClassified;
            TableRelation = Insurance;
        }
        //TSA_ISAMIL added field
        field(50006; "Insurance Vendor No."; Code[20])
        {
            Caption = 'Insurance Vendor No.';
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        //TSA_ISAMIL added field
    }
}
