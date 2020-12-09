table 50006 "Black List History"
{
  Caption = 'Black List History';
  DataClassification = ToBeClassified;

  fields
  {
    field(1;"Driver No.";Code[20])
    {
      Caption = 'Driver No.';
      DataClassification = ToBeClassified;
    }
    field(2;"Black List Date";Date)
    {
      Caption = 'Black List Date';
      DataClassification = ToBeClassified;
    }
    field(3;"Black List By";Code[20])
    {
      Caption = 'Black List By';
      DataClassification = ToBeClassified;
    }
    field(4;"Settlement Date";Date)
    {
      Caption = 'Settlement Date';
      DataClassification = ToBeClassified;
    }
    field(5;"Settlement ID";Code[20])
    {
      Caption = 'Settlement ID';
      DataClassification = ToBeClassified;
    }
    field(6;"Black List Amount";Decimal)
    {
      Caption = 'Black List Amount';
      DataClassification = ToBeClassified;
    }
    field(7;"Contract No.";Code[20])
    {
      Caption = 'Contract No,';
      DataClassification = ToBeClassified;
      TableRelation = "Service Contract Header";
    }
    field(8;"Taxi No.";Code[20])
    {
      Caption = 'Taxi No.';
      TableRelation = "Service Item";
      DataClassification = ToBeClassified;
    }
    field(9;"Bad Debt Recovery Date";Date)
    {
      Caption = 'Bad Debt Recovery Date';
      DataClassification = ToBeClassified;
    }
    field(10;"Bad Debt Recovery Amount";Decimal)
    {
      Caption = 'Bad Debt Recovery Amount';
      DataClassification = ToBeClassified;
    }
    field(11;"Handled By";Code[20])
    {
      Caption = 'Handled By';
      DataClassification = ToBeClassified;
    }
  }
  keys
  {
    key(PK;"Driver No.", "Black List Date")
    {
      Clustered = true;
    }
  }
}
