table 50005 "Booking Entry"
{
  Caption = 'Booking Entry';
  DataClassification = CustomerContent;

  fields
  {
    field(1;"Entry No.";Integer)
    {
      Caption = 'Entry No.';
      DataClassification = CustomerContent;
    }
    field(2;"Posting Date";Date)
    {
      Caption = 'Posting Date';
      DataClassification = CustomerContent;
    }
    field(3;"Contract No.";Code[20])
    {
      Caption = 'Contract No.';
      DataClassification = CustomerContent;
    }
    field(4;"Driver No.";Code[20])
    {
      Caption = 'Driver No.';
      DataClassification = CustomerContent;
    }
    field(5;"Taxi No.";Code[20])
    {
      Caption = 'Taxi No.';
      DataClassification = CustomerContent;
    }
    field(6;"Amount Due";Decimal)
    {
      Caption = 'Amount Due';
      DataClassification = CustomerContent;
    }
    field(7;"Amount Paid";Decimal)
    {
      Caption = 'Amount Paid';
      DataClassification = CustomerContent;
    }
    field(8;"User ID";Text[250])
    {
      Caption = 'User ID';
      DataClassification = CustomerContent;
    }
    field(9;"Type";Option)
    {
      Caption = 'Type';
      OptionMembers = "Due", "Paid", "Holiday", "Free", "Good Will";
      DataClassification = CustomerContent;
    }
    field(10;Amount;Decimal)
    {
      Caption = 'Amount';
      DataClassification = CustomerContent;
    }
    field(11;Closed;Boolean)
    {
      Caption = 'Closed';
      DataClassification = CustomerContent;
    }
  }
  keys
  {
    key(PK;"Entry No.")
    {
      Clustered = true;
    }
    key(SK1;"Contract No.", "Posting Date", Closed)
    {
    }
  }
}
