table 50027 "Settlement Code"
{
  Caption = 'Settlement Code';
  DataClassification = ToBeClassified;
  LookupPageId = "Settlement Code List";
  DrillDownPageId = "Settlement Code List";

  fields
  {
    field(1;Code;Code[10])
    {
      Caption = 'Code';
      DataClassification = ToBeClassified;
    }
    field(2;Description;Text[50])
    {
      Caption = 'Description';
      DataClassification = ToBeClassified;
    }
  }
  keys
  {
    key(PK;Code)
    {
      Clustered = true;
    }
  }
}
