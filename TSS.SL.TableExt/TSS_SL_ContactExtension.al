tableextension 50001 "Contact Extension" extends Contact
{
  fields
  {
    field(50000;NRIC;Text[20])
    {
      Caption = 'NRIC';
      DataClassification = CustomerContent;
    }
    field(50116;"Employed by";code[20])
    {
      Caption = 'Employed by';
      TableRelation = Contact where(Type=const(Company));
      DataClassification = CustomerContent;
    }
    field(50117;Position;Text[50])
    {
      Caption = 'Position';
      DataClassification = CustomerContent;
    }
    field(50118;"Years of Service";Integer)
    {
      Caption = 'Years of Service';
      DataClassification = CustomerContent;
    }
    field(50119;"Monthly Income";Decimal)
    {
      Caption = 'Monthly Income';
      DataClassification = CustomerContent;
    }
    field(50120;"No. of Children";Integer)
    {
      Caption = 'No. of Children';
      DataClassification = CustomerContent;
    }
    field(50121;"Relationship";Text[50])
    {
      Caption = 'Relationship';
      DataClassification = CustomerContent;
    }
  }
}
