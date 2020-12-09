table 50003 "Fesitval Discount Scheme"
{
  Caption = 'Fesitval Discount Scheme';
  DataClassification = ToBeClassified;

  fields
  {
    field(1;Code;Code[10])
    {
      Caption = 'Code';
      DataClassification = CustomerContent;
    }
    field(2;Festival;Option)
    {
      OptionMembers = "CNY", "Hari Raya", "Deepavali";
      Caption = 'Festival';
      DataClassification = CustomerContent;
    }
    field(3;"Date From";Date)
    {
      Caption = 'Date From';
      DataClassification = ToBeClassified;
    }
    field(4;"Date To";Date)
    {
      Caption = 'Date To';
      DataClassification = ToBeClassified;
    }
    field(5;"Discount Days";Integer)
    {
      Caption = 'Discount Days';
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
