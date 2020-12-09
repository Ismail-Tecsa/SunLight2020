table 50024 "Case Cue"
{
  Caption = 'Case Cue';
  DataClassification = ToBeClassified;
  DataPerCompany = false;

  fields
  {
    field(1;"Primary Key";text[30])
    {
      Caption = 'Taxi Company';
      DataClassification = ToBeClassified;
    }
    field(2;"Pending Cases";Integer)
    {
      Caption = 'Cases';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = count("Case" where(Status=const(Pending), "Case Company"=field("Primary Key")));
    }
    field(3;"Lost Doc";Integer)
    {
      Caption = 'Lost Docs.';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = count("case" where("Status"=const(Pending), type=const("Lost Document"), "Case Company"=field("Primary Key")));
    }
    field(4;"Endorse Engine";Integer)
    {
      Caption = 'Endorse Engine';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = count("case" where("Status"=const(Pending), type=const("Endorse Engine"), "Case Company"=field("Primary Key")));
    }
    field(5;"Pass Card";Integer)
    {
      Caption = 'Pass Card';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = count("case" where("Status"=const(Pending), type=const("Pass Card"), "Case Company"=field("Primary Key")));
    }
    field(6;"Summons";Integer)
    {
      Caption = 'Summons';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = count("case" where("Status"=const(Pending), type=const(Summon), "Case Company"=field("Primary Key")));
    }
    field(7;"Accidents";Integer)
    {
      Caption = 'Accidents';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = count("case" where("Status"=const(Pending), type=const(Accident), "Case Company"=field("Primary Key")));
    }
    field(8;"Closed Cases";Integer)
    {
      Caption = 'Settled & Closed Cases';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = count("Case" where(Status=const(Closed), "Case Settled"=const(true), "Case Company"=field("Primary Key")));
    }
    field(9;"Closed Cases2";Integer)
    {
      Caption = 'Unsettled & Closed Cases';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = count("Case" where(Status=const(Closed), "Case Settled"=const(false), "Case Company"=field("Primary Key")));
    }
    field(10;"PG10";Integer)
    {
      Caption = 'PG10';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = count("case" where("Status"=const(Pending), type=const(PG10), "Case Company"=field("Primary Key")));
    }
    field(11;"Dismantle";Integer)
    {
      Caption = 'Dismantle';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = count("case" where("Status"=const(Pending), type=const(Dismantle), "Case Company"=field("Primary Key")));
    }
    field(12;"repo";Integer)
    {
      Caption = 'Repo';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = count("case" where("Status"=const(Pending), type=const(Repo), "Case Company"=field("Primary Key")));
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
