table 50012 "Car Make"
{
  Caption = 'Car Make';
  DataClassification = ToBeClassified;
  LookupPageId = "Car Make";

  fields
  {
    field(1;Code;Code[20])
    {
      Caption = 'Code';
      DataClassification = CustomerContent;
    }
    field(2;Description;Text[50])
    {
      Caption = 'Description';
      DataClassification = CustomerContent;
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
