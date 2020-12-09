table 50033 "Settlement Cues"
{
  Caption = 'Settlement Cues';
  DataClassification = ToBeClassified;

  fields
  {
    field(1;"Primary Key";text[30])
    {
      Caption = 'Primary Key';
      DataClassification = ToBeClassified;
    }
    field(2;Open;Integer)
    {
      Caption = 'Open';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = count("Settlement Header" where("Status"=filter("In Progress")));
    }
    field(3;"Pending Approval";Integer)
    {
      Caption = 'Pending Approval';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = count("Settlement Header" where("Status"=filter("Pending Approval")));
    }
    field(4;"Pending Payment";Integer)
    {
      Caption = 'Pending Payment';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = count("Settlement Header" where("Status"=filter("Pending Payment")));
    }
  }
  keys
  {
    key(PK;"Primary Key")
    {
      Clustered = true;
    }
  }
}
