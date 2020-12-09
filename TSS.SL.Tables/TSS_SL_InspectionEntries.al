table 50017 "Inspections"
{
  Caption = 'Inspections';
  DataClassification = ToBeClassified;
  DataCaptionFields = "Taxi ID", "Inspection Type", "Inspection Expiry Date";
  DrillDownPageId = Inspections;
  LookupPageId = Inspections;

  fields
  {
    field(1;"Entry No.";Integer)
    {
      Caption = 'Entry No.';
      AutoIncrement = true;
      Editable = false;
      DataClassification = ToBeClassified;
    }
    field(2;"Taxi ID";Code[10])
    {
      Caption = 'Taxi ID';
      TableRelation = taxis;
      DataClassification = ToBeClassified;
    }
    field(3;"Inspection Type";Option)
    {
      Caption = 'Inspection Type';
      OptionMembers = "Car", "Meter";
      DataClassification = ToBeClassified;
    }
    field(4;"Inspection Date";Date)
    {
      Caption = 'Inspection Date';
      DataClassification = ToBeClassified;
    }
    field(5;"Inspection Expiry Date";Date)
    {
      Caption = 'Inspection Expiry Date';
      DataClassification = ToBeClassified;
    }
    field(6;"Puspakom Location";Text[50])
    {
      Caption = 'Puspakom Location';
      DataClassification = ToBeClassified;
    }
    field(7;"Inform Date";Date)
    {
      Caption = 'Inform Date';
      DataClassification = ToBeClassified;
    }
    field(8;"Original Grant";Boolean)
    {
      Caption = 'Original Grant';
      DataClassification = ToBeClassified;
    }
    field(9;VR1;Boolean)
    {
      Caption = 'VR1';
      DataClassification = ToBeClassified;
    }
    field(10;"Surat Meter";Boolean)
    {
      Caption = 'Surat Meter';
      DataClassification = ToBeClassified;
    }
    field(11;"Sign out Date";Date)
    {
      Caption = 'Sign out Date';
      DataClassification = ToBeClassified;
    }
    field(12;"Sign Out By";Code[10])
    {
      Caption = 'Sign Out By';
      DataClassification = ToBeClassified;
    }
    field(13;"Sign In Date";Date)
    {
      Caption = 'Sign In Date';
      DataClassification = ToBeClassified;
    }
    field(14;"Entitle to Claim";Boolean)
    {
      Caption = 'Entitle to Claim';
      DataClassification = ToBeClassified;
    }
    field(15;"Entitled to Claim Date";Date)
    {
      Caption = 'Entitled to Claim Date';
      DataClassification = ToBeClassified;
    }
    field(16;Amount;Decimal)
    {
      Caption = 'Amount';
      DataClassification = ToBeClassified;
    }
    field(17;"E-Booking Type";Option)
    {
      Caption = 'E-Booking Type';
      DataClassification = ToBeClassified;
      OptionMembers = "Driver", "Company";
    }
    field(18;"E-Booking Created";Boolean)
    {
      Caption = 'E-Booking Created';
      DataClassification = ToBeClassified;
    }
    field(19;"E-Booking Tracking No.";Boolean)
    {
      Caption = 'E-Booking Tracking No.';
      DataClassification = ToBeClassified;
    }
    field(20;"E-Booking Inspection Date";Date)
    {
      Caption = 'E-Booking Inspection Date';
      DataClassification = ToBeClassified;
    }
    field(21;"E-Booking Confirmation";Date)
    {
      Caption = 'E-Booking Confirmation';
      DataClassification = ToBeClassified;
    }
    field(22;"Open Date for Inspection";Date)
    {
      Caption = 'Open Date for Inspection';
      DataClassification = ToBeClassified;
    }
    field(23;"Close Date for Inspection";Date)
    {
      Caption = 'Close Date for Inspection';
      DataClassification = ToBeClassified;
    }
    field(24;Reason;Text[50])
    {
      Caption = 'Reason';
      DataClassification = ToBeClassified;
    }
  }
  keys
  {
    key(PK;"Entry No.")
    {
      Clustered = true;
    }
    Key(Taxi;"taxi ID")
    {
    }
  }
}
