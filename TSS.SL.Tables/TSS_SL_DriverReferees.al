table 50004 "Driver Referees"
{
    Caption = 'Driver Referees';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Driver No."; code[20])
        {
            Caption = 'Driver No.';
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Referee Type"; Option)
        {
            OptionMembers = "Spouse","Mother","Father","Relative","Other";
            Caption = 'Referee Type';
            DataClassification = CustomerContent;
        }
        field(4; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            DataClassification = ToBeClassified;
            TableRelation = contact;
            ValidateTableRelation = true;
        }
    }
    keys
    {
        key(PK; "Driver No.", "Line No.")
        {
            Clustered = true;
        }
    }

}
