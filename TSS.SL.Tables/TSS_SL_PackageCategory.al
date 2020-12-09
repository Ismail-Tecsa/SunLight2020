table 50002 "Package Category"
{
  Caption = 'Package Category';
  DataClassification = ToBeClassified;

  fields
  {
    field(1;Code;Code[10])
    {
      Caption = 'Code';
      DataClassification = CustomerContent;
    }
    field(2;"Rental Rate";Decimal)
    {
      Caption = 'Rental Rate';
      DataClassification = CustomerContent;
    }
    field(3;"Discount Bonus Day";Option)
    {
      Caption = 'Discount Bonus Day';
      OptionMembers = "None", "15th-1 EoM-1";
      DataClassification = CustomerContent;
    }
    field(4;Penalty;Option)
    {
      Caption = 'Penalty';
      OptionMembers = "None", ">30 days (rm80)", ">45 days (+rm80)", ">30 days (+2 days)", ">45 day (+2 day)";
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
