table 50018 "CM Lost Document"
{
  Caption = 'CM Lost Document';
  DataClassification = ToBeClassified;
  DataPerCompany = false;

  fields
  {
    field(1;"Case ID";Code[10])
    {
      Caption = 'Case ID';
      DataClassification = CustomerContent;
    }
    field(2;"Original Permit";Boolean)
    {
      Caption = 'Original Permit';
      DataClassification = CustomerContent;
    }
    field(3;"Original Grant";Boolean)
    {
      Caption = 'Original Grant';
      DataClassification = CustomerContent;
    }
    field(4;"Puspakom VR1";Boolean)
    {
      Caption = 'Puspakom VR1';
      DataClassification = CustomerContent;
    }
    field(5;"Puspakom TR2";Boolean)
    {
      Caption = 'Puspakom TR2';
      DataClassification = CustomerContent;
    }
    field(6;"Copy of Directors IC";Boolean)
    {
      Caption = 'Copy of Directors IC';
      DataClassification = CustomerContent;
    }
    field(7;"Original Polis Report";Boolean)
    {
      Caption = 'Original Polis Report';
      DataClassification = CustomerContent;
    }
    field(8;"Authorised Letter";Boolean)
    {
      Caption = 'Authorised Letter';
      DataClassification = CustomerContent;
    }
    field(9;"Permit Company Auth. Letter";Boolean)
    {
      Caption = 'Permit Company Authorised Letter';
      DataClassification = CustomerContent;
    }
    field(10;"Copy Road Tax";Boolean)
    {
      Caption = 'Copy Road Tax';
      DataClassification = CustomerContent;
    }
    field(11;"Puspakom Branch";Text[50])
    {
      Caption = 'Puspakom Branch';
      DataClassification = CustomerContent;
    }
    field(12;"Receipt No.";Text[30])
    {
      Caption = 'Receipt No.';
      DataClassification = CustomerContent;
    }
    field(13;"Puspakom TR2 Receive Date";Date)
    {
      Caption = 'Puspakom TR2 Receive Date';
      DataClassification = CustomerContent;
    }
    field(14;"Grant Receive Date";Date)
    {
      Caption = 'Grant Receive Date';
      DataClassification = CustomerContent;
    }
    field(15;"Runner Name";Text[50])
    {
      Caption = 'Runner Name';
      DataClassification = CustomerContent;
    }
    field(16;"GPC Claim";Date)
    {
      Caption = 'GPC Claim';
      DataClassification = CustomerContent;
    }
    field(17;"GPC No.";Text[30])
    {
      Caption = 'GPC No.';
      DataClassification = CustomerContent;
    }
    field(18;"Claim Fees";Decimal)
    {
      Caption = 'Claim Fees';
      DataClassification = CustomerContent;
    }
    field(19;Remark;Text[100])
    {
      Caption = 'Remark';
      DataClassification = CustomerContent;
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
