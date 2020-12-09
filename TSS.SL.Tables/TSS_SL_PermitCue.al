table 50008 "Permit Cue"
{
    Caption = 'Permit Cue';
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; "Primary Key"; text[30])
        {
            Caption = 'Taxi Company';
            DataClassification = ToBeClassified;
        }
        field(2; "Active Permits"; Integer)
        {
            Caption = 'Active Permits';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = count(Permit where("Permit Status" = filter(Active), "Permit Company" = field("Primary Key")));
        }
        field(3; "New Permits"; Integer)
        {
            Caption = 'New Permits';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = count(Permit where("Permit Status" = filter("In-Active"), "Permit Condition" = filter(New), "Permit Company" = field("Primary Key")));
        }
        field(4; "Total Permits"; Integer)
        {
            Caption = 'Total Permits';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = count(Permit where("Permit Company" = field("Primary Key")));
        }
        field(5; "PG10 Permits"; Integer)
        {
            Caption = 'PG10 Permits';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = count(Permit where("Permit Condition" = filter(PG10), "Permit Company" = field("Primary Key")));
        }
        field(6; "SK-Used Permits"; Integer)
        {
            Caption = 'SK-Used Permits';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = count(Permit where("Permit Condition" = filter("SK-Used"), "Permit Company" = field("Primary Key")));
        }
        field(20; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(21; "Permits Expiring"; Integer)
        {
            Caption = 'Permits Expiring';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = count(Permit where( //"Permit End Date" = filter("Date Filter"),
      "Permit Company" = field("Primary Key")));
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
