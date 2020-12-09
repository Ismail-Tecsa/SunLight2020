table 50001 "Package Scheme"
{
  Caption = 'Package Scheme';
  DataClassification = ToBeClassified;
  LookupPageId = "Package Scheme List";
  DrillDownPageId = "Package Scheme List";

  fields
  {
    field(1;ID;Code[10])
    {
      Caption = 'ID';
      DataClassification = CustomerContent;
    }
    field(2;Category;Code[10])
    {
      Caption = 'Category';
      DataClassification = CustomerContent;
    }
    field(3;"Daily Rate";Decimal)
    {
      Caption = 'Daily Rate';
      DataClassification = CustomerContent;
    }
    field(4;"Down Payment";Decimal)
    {
      Caption = 'Down Payment';
      DataClassification = CustomerContent;
    }
    field(5;"Booking Fees";Decimal)
    {
      Caption = 'Booking Fees';
      DataClassification = CustomerContent;
    }
    field(6;"Contract Period";Integer)
    {
      Caption = 'Contract Period';
      DataClassification = CustomerContent;
    }
    field(7;"Car Model";Code[10])
    {
      Caption = 'Car Model';
      DataClassification = CustomerContent;
      TableRelation = "Dimension Value".Code where("Dimension Code"=const('MODEL'));
    }
    field(8;"Service Location";Code[10])
    {
      Caption = 'Service Location';
      DataClassification = CustomerContent;
    }
    field(9;"Car Condition";Option)
    {
      Caption = 'Car Condition';
      OptionMembers = "New", "2nd Hand";
      DataClassification = CustomerContent;
    }
    field(10;"Expiry Date";Date)
    {
      Caption = 'Expiry Date';
      DataClassification = CustomerContent;
    }
    field(11;"Year Made";Integer)
    {
      Caption = 'Year Made';
      DataClassification = CustomerContent;
    }
    field(12;"Accident Penalty";Boolean)
    {
      Caption = 'Accident Penalty';
      DataClassification = CustomerContent;
    }
    field(13;NGV;Boolean)
    {
      Caption = 'NGV';
      DataClassification = CustomerContent;
    }
    field(14;Enabled;Boolean)
    {
      Caption = 'Enabled';
      DataClassification = CustomerContent;
    }
  }
  keys
  {
    key(PK;ID)
    {
      Clustered = true;
    }
  }
}
