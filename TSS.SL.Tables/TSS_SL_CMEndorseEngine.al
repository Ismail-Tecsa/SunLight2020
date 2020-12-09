table 50019 "CM Endorse Engine"
{
  Caption = 'CM Endorse Engine';
  DataClassification = ToBeClassified;
  DataPerCompany = false;

  fields
  {
    field(1;"Case ID";Code[10])
    {
      Caption = 'Case ID';
      DataClassification = ToBeClassified;
    }
    field(2;"Receipt No.";Text[30])
    {
      Caption = 'Receipt No.';
      DataClassification = ToBeClassified;
    }
    field(3;"Receipt Amount";Decimal)
    {
      Caption = 'Receipt Amount';
      DataClassification = ToBeClassified;
    }
    field(4;"JPJ Approval Letter Submit";Date)
    {
      Caption = 'JPJ Approval Letter Submit';
      DataClassification = ToBeClassified;
    }
    field(5;"JPJ Approval Letter Received";Date)
    {
      Caption = 'JPJ Approval Letter Received';
      DataClassification = ToBeClassified;
    }
    field(6;"Custom Letter Obtained";Boolean)
    {
      Caption = 'Original Custom Letter Obtained';
      DataClassification = ToBeClassified;
    }
    field(7;"Custom Letter Obtained Date";Date)
    {
      Caption = 'Orig. Custom Letter Obtained Date';
      DataClassification = ToBeClassified;
    }
    field(8;"Original Invoice";Boolean)
    {
      Caption = 'Original Invoice';
      DataClassification = ToBeClassified;
    }
    field(9;"Original Surat Jualan";Boolean)
    {
      Caption = 'Original Surat Jualan';
      DataClassification = ToBeClassified;
    }
    field(10;"Permit Com SSM (CTC Copy)";Boolean)
    {
      Caption = 'Permit Com SSM (CTC Copy)';
      DataClassification = ToBeClassified;
    }
    field(11;"Director IC";Boolean)
    {
      Caption = 'Director IC';
      DataClassification = ToBeClassified;
    }
    field(12;"Resit Rasmi";Boolean)
    {
      Caption = 'Resit Rasmi (Jabatan Kastam MY)';
      DataClassification = ToBeClassified;
    }
    field(13;"Puspakom VR1";Boolean)
    {
      Caption = 'Puspakom VR1';
      DataClassification = ToBeClassified;
    }
    field(14;"Puspakom B2 Report";Boolean)
    {
      Caption = 'Puspakom B2 Report';
      DataClassification = ToBeClassified;
    }
    field(15;"JPJ Approval Letter";Boolean)
    {
      Caption = 'JPJ Approval Letter';
      DataClassification = ToBeClassified;
    }
    field(16;"Original Grant";Boolean)
    {
      Caption = 'Original Grant';
      DataClassification = ToBeClassified;
    }
    field(17;"Original VR1";Boolean)
    {
      Caption = 'Original VR1';
      DataClassification = ToBeClassified;
    }
    field(18;"Proceed to Endors. Puspakom";Boolean)
    {
      Caption = 'Proceed to Endorsement Puspakom';
      DataClassification = ToBeClassified;
    }
    field(19;"Date to Proceeed End. Puspakom";Boolean)
    {
      Caption = 'Date to Proceeed End. Puspakom';
      DataClassification = ToBeClassified;
    }
    field(20;"Runner Name";Text[50])
    {
      Caption = 'Runner Name';
      DataClassification = ToBeClassified;
    }
    field(21;"GPC Date";Date)
    {
      Caption = 'GPC Date';
      DataClassification = ToBeClassified;
    }
    field(22;"GPC No.";Text[30])
    {
      Caption = 'GPC No.';
      DataClassification = ToBeClassified;
    }
    field(23;"GPC Amount";Decimal)
    {
      Caption = 'GPC Amount';
      DataClassification = ToBeClassified;
    }
    field(24;"JPJ Letter Expiry Date";Date)
    {
      Caption = 'JPJ Letter Expiry Date';
      DataClassification = ToBeClassified;
    }
    field(25;"Collection Date";Date)
    {
      Caption = 'Driver / Runner Collection Date';
      DataClassification = ToBeClassified;
    }
    field(26;"Puspakom Tracking ID";Text[30])
    {
      Caption = 'Puspakom Tracking ID';
      DataClassification = ToBeClassified;
    }
    field(27;"Payment Mode";Option)
    {
      Caption = 'Payment Mode';
      DataClassification = ToBeClassified;
      OptionMembers = "Company", "Driver";
    }
    field(28;"Doc. Received Driver / Runner";Boolean)
    {
      Caption = 'Doc. Received Driver / Runner';
      DataClassification = ToBeClassified;
    }
    field(29;"Puspakom B2 Report Expiry Date";Date)
    {
      Caption = 'Puspakom B2 Report Expiry Date';
      DataClassification = ToBeClassified;
    }
    field(30;"Inspection Location";Text[30])
    {
      Caption = 'Inspection Location';
      DataClassification = ToBeClassified;
    }
    field(31;"Inspection Date";Date)
    {
      Caption = 'Inspection Date';
      DataClassification = ToBeClassified;
    }
    field(32;"Inspection e-booking date";Date)
    {
      Caption = 'Inspection e-booking date';
      DataClassification = ToBeClassified;
    }
    field(33;"Insurance Update Date";Date)
    {
      Caption = 'Insurance Update Date';
      DataClassification = ToBeClassified;
    }
    field(34;"Insurance Endorsement Date";Date)
    {
      Caption = 'Insurance Endorsement Date';
      DataClassification = ToBeClassified;
    }
  }
  keys
  {
    key(PK;"Case ID")
    {
      Clustered = true;
    }
  }
}
