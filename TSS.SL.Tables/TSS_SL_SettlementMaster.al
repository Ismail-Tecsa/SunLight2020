table 50028 "Settlement Master"
{
  Caption = 'Settlement Master';
  DataClassification = ToBeClassified;
  DataPerCompany = false;

  fields
  {
    field(1;"Line No.";Integer)
    {
      Caption = 'Line No.';
      DataClassification = ToBeClassified;
    }
    field(2;Code;Code[10])
    {
      Caption = 'Code';
      DataClassification = ToBeClassified;
      TableRelation = "Settlement Code";
    }
    field(4;"Settlement Type";Option)
    {
      Caption = 'Settlement Type';
      OptionMembers = " ", "Surrender", "Transfer", "Repo", "Restructure", "Untracable", "Total Loss", "Projected Taxi", "PG-10", "Repurchase", "Sambung";
      DataClassification = ToBeClassified;
    }
    field(5;"Fixed Amount";Decimal)
    {
      DataClassification = CustomerContent;
    }
  }
  keys
  {
    key(PK;"Line No.")
    {
      Clustered = true;
    }
  }
}
