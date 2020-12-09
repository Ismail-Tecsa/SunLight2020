table 50020 "CM Pass Card"
{
  Caption = 'CM Pass Card';
  DataClassification = ToBeClassified;
  DataPerCompany = false;

  fields
  {
    field(1;"Case ID";Code[20])
    {
      Caption = 'Case ID';
      DataClassification = CustomerContent;
    }
    field(2;"Serial No.";Text[30])
    {
      Caption = 'Serial No.';
      DataClassification = ToBeClassified;
      TableRelation = "Pass Card";
    }
    field(3;"Start Date";Date)
    {
      Caption = 'Start Date';
      DataClassification = ToBeClassified;
    }
    field(4;"End Date";Date)
    {
      Caption = 'End Date';
      DataClassification = ToBeClassified;
    }
    field(5;"Driver Status";Option)
    {
      Caption = 'Driver Status';
      DataClassification = ToBeClassified;
      OptionMembers = "Owner", "1st Driver", "2nd Driver";
    }
    field(23;Type;Option)
    {
      Caption = 'Type';
      DataClassification = ToBeClassified;
      OptionMembers = "New", "Renewal";
    }
    field(6;Permit;Boolean)
    {
      Caption = 'Permit';
      DataClassification = ToBeClassified;
    }
    field(7;"Driver IC";Boolean)
    {
      Caption = 'Driver IC';
      DataClassification = ToBeClassified;
    }
    field(8;"Driver License";Boolean)
    {
      Caption = 'Driver License';
      DataClassification = ToBeClassified;
    }
    field(9;"Driver PSV";Boolean)
    {
      Caption = 'Driver PSV';
      DataClassification = ToBeClassified;
    }
    field(10;"Signatories IC";Boolean)
    {
      Caption = 'Signatories IC';
      DataClassification = ToBeClassified;
    }
    field(11;"Permit Company Auth. Letter";Boolean)
    {
      Caption = 'Permit Company Auth. Letter';
      DataClassification = ToBeClassified;
    }
    field(12;"Form APAD";Boolean)
    {
      Caption = 'Form APAD';
      DataClassification = ToBeClassified;
    }
    field(13;"Form APAD Date Received";Date)
    {
      Caption = 'Form APAD Date Received';
      DataClassification = ToBeClassified;
    }
    field(14;Remark;Text[250])
    {
      Caption = 'Remark';
      DataClassification = ToBeClassified;
    }
    field(15;"Pass Card Renewal Date";Date)
    {
      Caption = 'Pass Card Renewal Date';
      DataClassification = ToBeClassified;
    }
    field(16;"Takeout Form";Boolean)
    {
      Caption = 'Takeout Form';
      DataClassification = ToBeClassified;
    }
    field(17;"Document on Hand Date";Date)
    {
      Caption = 'Document on Hand Date';
      DataClassification = ToBeClassified;
    }
    field(18;"Collected by Driver";Date)
    {
      Caption = 'Collected by Driver';
      DataClassification = ToBeClassified;
    }
    field(19;"Reason not Collected";Option)
    {
      Caption = 'Reason not Collected';
      DataClassification = ToBeClassified;
      OptionMembers = " ", "PG10", "2nd Hand", "Untrace", "Transfer";
    }
    field(20;"Reason for Cant Renew";Option)
    {
      Caption = 'Reason for Cant Renew';
      DataClassification = ToBeClassified;
      OptionMembers = " ", "Permit", "Others";
    }
    field(21;"Reason for Not Receiving";Option)
    {
      Caption = 'Reason for Not Receiving';
      DataClassification = ToBeClassified;
      OptionMembers = " ", "Multiple Drivers", "Others";
    }
    field(22;"Document From Driver";Date)
    {
      Caption = 'Document From Driver';
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
  trigger OnModify()begin
    if "Form APAD" and Permit and "Driver IC" and "Driver License" and "Driver PSV" and "Permit Company Auth. Letter" and "Signatories IC" and "Takeout Form" then begin
      if "Document on Hand Date" <> 0D then "Document on Hand Date":=today;
    end
    else
    begin
      if "Document on Hand Date" <> 0D then "Document on Hand Date":=0D;
    end end;
}
