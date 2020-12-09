table 50011 "Car Model"
{
  Caption = 'Car Model';
  DataClassification = ToBeClassified;
  LookupPageId = "Car Model";
  DrillDownPageId = "Car Make";

  fields
  {
    field(1;Code;Code[20])
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
