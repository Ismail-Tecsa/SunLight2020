table 50013 "SunCab Bank Setup"
{
  Caption = 'SunCab Bank Setup';
  DataClassification = ToBeClassified;
  DataPerCompany = false;
  LookupPageId = "SunCab Bank Setup";
  DrillDownPageId = "SunCab Bank Setup";

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
    field(3;"SunCab Bank";Code[20])
    {
      Caption = 'SunCab Bank';
      DataClassification = CustomerContent;
      TableRelation = "Bank Account";
    }
    field(4;"Journal Template Name";Code[20])
    {
      Caption = 'Journal Batch Name';
      TableRelation = "Gen. Journal Batch".Name where("Journal Template Name"=const('GENERAL'));
      DataClassification = CustomerContent;
    }
    field(5;"Account Type";Enum "Gen. Journal Account Type")
    {
      Caption = 'Account Type';

      trigger OnValidate()begin
        Validate("Account No.", '');
      end;
    }
    field(6;"Account No.";Code[20])
    {
      Caption = 'Account No.';
      TableRelation = IF("Account Type"=CONST("G/L Account"))"G/L Account" WHERE("Account Type"=CONST(Posting), Blocked=CONST(false))
      ELSE IF("Account Type"=CONST(Customer))Customer
      ELSE IF("Account Type"=CONST(Vendor))Vendor
      ELSE IF("Account Type"=CONST("Bank Account"))"Bank Account"
      ELSE IF("Account Type"=CONST("Fixed Asset"))"Fixed Asset"
      ELSE IF("Account Type"=CONST("IC Partner"))"IC Partner"
      ELSE IF("Account Type"=CONST(Employee))Employee;
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
