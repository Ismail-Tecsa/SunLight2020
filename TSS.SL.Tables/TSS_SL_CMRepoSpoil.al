table 50035 "CM Repo Spoil"
{
  Caption = 'CM Repo Spoil';
  DataClassification = ToBeClassified;

  fields
  {
    field(1;"Case ID";Code[10])
    {
      Caption = 'Case ID';
      DataClassification = ToBeClassified;
    }
    field(2;"Line No.";Integer)
    {
      Caption = 'Line No.';
      DataClassification = ToBeClassified;
    }
    field(3;Description;Text[50])
    {
      Caption = 'Description';
      DataClassification = ToBeClassified;
    }
    field(4;Estimate;Decimal)
    {
      Caption = 'Estimate';
      DataClassification = ToBeClassified;
    }
    field(5;Remark;Text[100])
    {
      Caption = 'Remark';
      DataClassification = ToBeClassified;
    }
  }
  keys
  {
    key(PK;"Case ID", "Line No.")
    {
      Clustered = true;
    }
  }
}
