table 50023 "CM Accident Offer"
{
  Caption = 'CM Accident Offer';
  DataClassification = ToBeClassified;
  DataPerCompany = false;

  fields
  {
    field(1;"Case ID";Code[10])
    {
      Caption = 'Case ID';
      DataClassification = ToBeClassified;
    }
    field(2;"Entry No.";Integer)
    {
      Caption = 'Entry No.';
      DataClassification = ToBeClassified;
    }
    field(3;"Offer Letter Date";Date)
    {
      Caption = 'Offer Letter Date';
      DataClassification = ToBeClassified;
    }
    field(4;"Offer Amount";Decimal)
    {
      Caption = 'Offer Amount';
      DataClassification = ToBeClassified;
    }
    field(5;"Appeal Date";Date)
    {
      Caption = 'Appeal Date';
      DataClassification = ToBeClassified;
    }
  }
  keys
  {
    key(PK;"Case ID", "Entry No.")
    {
      Clustered = true;
    }
  }
}
