table 50022 "CM Accident"
{
  Caption = 'CM Accident';
  DataClassification = ToBeClassified;
  DataPerCompany = false;

  fields
  {
    field(1;"Case ID";Code[10])
    {
      Caption = 'Case ID';
      DataClassification = ToBeClassified;
    }
    field(2;Type;Option)
    {
      Caption = 'Type';
      DataClassification = ToBeClassified;
      OptionMembers = " ", "Non-Claimable", "Claimable", "Others";
    }
    field(3;"Raised By";Option)
    {
      Caption = 'Raised By';
      DataClassification = ToBeClassified;
      OptionMembers = " ", "Driver", "Police Inv. Letter", "Insurance Notf. Letter", "Lawyer Letter";
    }
    field(4;"Accident Date";Date)
    {
      Caption = 'Accident Date';
      DataClassification = ToBeClassified;
    }
    field(5;"Accident Venue";Text[100])
    {
      Caption = 'Accident Venue';
      DataClassification = ToBeClassified;
    }
    field(6;"Police Report Obtained";Boolean)
    {
      Caption = 'Police Report Obtained';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        if "Police Report Obtained" then "Police Report Obtained Date":=today;
      end;
    }
    field(7;"Police Report Obtained Date";Date)
    {
      Caption = 'Police Report Obtained Date';
      DataClassification = ToBeClassified;
    }
    field(8;"Insurance Category";Code[10])
    {
      Caption = 'Insurance Category';
      DataClassification = ToBeClassified;
      TableRelation = "Insurance Type";
    }
    field(9;"Opposing Party";Text[50])
    {
      Caption = 'Opposing Party';
      DataClassification = ToBeClassified;
    }
    field(10;"Penalty Charge";Boolean)
    {
      Caption = 'Penalty Charge';
      DataClassification = ToBeClassified;
    }
    field(11;"Penalty Amount";Decimal)
    {
      Caption = 'Penalty Amount';
      DataClassification = ToBeClassified;
    }
    field(12;LTA;Text[30])
    {
      Caption = 'LTA';
      DataClassification = ToBeClassified;
    }
    field(13;"LTA Amount";Decimal)
    {
      Caption = 'LTA Amount';
      DataClassification = ToBeClassified;
    }
    field(14;"Receipt No.";Text[30])
    {
      Caption = 'Receipt No.';
      DataClassification = ToBeClassified;
    }
    field(15;"Receipt Amount";Decimal)
    {
      Caption = 'Receipt Amount';
      DataClassification = ToBeClassified;
    }
    field(16;"Report Reference No.";Text[30])
    {
      Caption = 'Report Reference No.';
      DataClassification = ToBeClassified;
    }
    field(17;"Sargeant Name";Text[30])
    {
      Caption = 'Sargeant Name';
      DataClassification = ToBeClassified;
    }
    field(18;"Police Station Name";Text[30])
    {
      Caption = 'Police Station Name';
      DataClassification = ToBeClassified;
    }
    field(19;"Investigation Date";Date)
    {
      Caption = 'Investigation Date';
      DataClassification = ToBeClassified;
    }
    field(20;"Inform Driver";Boolean)
    {
      Caption = 'Inform Driver';
      DataClassification = ToBeClassified;
    }
    field(21;"Investigation Result";Text[250])
    {
      Caption = 'Investigation Result';
      DataClassification = ToBeClassified;
    }
    field(22;"Insurance Ref. No.";Text[30])
    {
      Caption = 'Insurance Ref. No.';
      DataClassification = ToBeClassified;
    }
    field(23;"Submission Date";Date)
    {
      Caption = 'Submission Date';
      DataClassification = ToBeClassified;
    }
    field(24;"Lawyer Letter Ref. No.";Text[30])
    {
      Caption = 'Lawyer Letter Ref. No.';
      DataClassification = ToBeClassified;
    }
    field(25;"3rd Party Lawyer Firm Name";Text[30])
    {
      Caption = '3rd Party Lawyer Firm Name';
      DataClassification = ToBeClassified;
    }
    field(26;"Company Lawyer Firm Name";Text[30])
    {
      Caption = 'Company Lawyer Firm Name';
      DataClassification = ToBeClassified;
    }
    field(27;"Telephone No.";Text[30])
    {
      Caption = 'Telephone No.';
      DataClassification = ToBeClassified;
    }
    field(28;"Plaintiff Name";Text[30])
    {
      Caption = 'Plaintiff Name';
      DataClassification = ToBeClassified;
    }
    field(29;"Court Hearing Date";Date)
    {
      Caption = 'Court Hearing Date';
      DataClassification = ToBeClassified;
    }
    field(30;Workshop;Option)
    {
      Caption = 'Workshop';
      DataClassification = ToBeClassified;
      OptionMembers = "Internal", "External";
    }
    field(31;"Car In Date";Date)
    {
      Caption = 'Car In Date';
      DataClassification = ToBeClassified;
    }
    field(32;"Car Out Date";Date)
    {
      Caption = 'Car Out Date';
      DataClassification = ToBeClassified;
    }
    field(33;"Repair Start Date";Date)
    {
      Caption = 'Repair Start Date';
      DataClassification = ToBeClassified;
    }
    field(34;"Repair Finish Date";Date)
    {
      Caption = 'Repair Finish Date';
      DataClassification = ToBeClassified;
    }
    field(35;"Cost of Repair";Decimal)
    {
      Caption = 'Cost of Repair';
      DataClassification = ToBeClassified;
    }
    field(36;"Workshop Name";Text[30])
    {
      Caption = 'Workshop Name';
      DataClassification = ToBeClassified;
    }
    field(37;"Workshop Telephone No.";Text[30])
    {
      Caption = 'Workshop Telephone No.';
      DataClassification = ToBeClassified;
    }
    field(38;"Workshop Picture";Boolean)
    {
      Caption = 'Workshop Picture';
      DataClassification = ToBeClassified;
    }
    field(39;"Security Deposit OR No.";Text[30])
    {
      Caption = 'Security Deposit OR No.';
      DataClassification = ToBeClassified;
    }
    field(40;"Security Depost OR Date";Date)
    {
      Caption = 'Security Depost OR Date';
      DataClassification = ToBeClassified;
    }
    field(41;"Security Depost OR Amount";Decimal)
    {
      Caption = 'Security Depost OR Amount';
      DataClassification = ToBeClassified;
    }
    field(42;"Document Handover";Boolean)
    {
      Caption = 'Document Handover';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        if "Document Handover" then "Doc. Handover Date":=today;
      end;
    }
    field(43;"Doc. Handover Date";Date)
    {
      Caption = 'Doc. Handover Date';
      DataClassification = ToBeClassified;
    }
    field(44;"Refund Sec. Deposit GPC No.";Text[30])
    {
      Caption = 'Refund Sec. Deposit GPC No.';
      DataClassification = ToBeClassified;
    }
    field(45;"Refund Sec. Deposit Date";Date)
    {
      Caption = 'Refund Sec. Deposit Date';
      DataClassification = ToBeClassified;
    }
    field(46;"Refund Sec. Deposit Amount";Decimal)
    {
      Caption = 'Refund Sec. Deposit Amount';
      DataClassification = ToBeClassified;
    }
    field(47;"File No.";Text[30])
    {
      Caption = 'File No.';
      DataClassification = ToBeClassified;
    }
    field(48;"Repair Amount";Decimal)
    {
      Caption = 'Repair Amount';
      DataClassification = ToBeClassified;
    }
    field(49;"3rd Party Vehicle No.";Text[30])
    {
      Caption = '3rd Party Vehicle No.';
      DataClassification = ToBeClassified;
    }
    field(50;"Police Inv. Result Date";Date)
    {
      Caption = 'Police Inv. Result Date';
      DataClassification = ToBeClassified;
    }
    field(51;"Police Inv. Result Amount";Decimal)
    {
      Caption = 'Police Inv. Result Amount';
      DataClassification = ToBeClassified;
    }
    field(52;"Police Photo Amount";Decimal)
    {
      Caption = 'Police Photo Amount';
      DataClassification = ToBeClassified;
    }
    field(53;"JPJ Search (3rd Party Ins.)";Text[30])
    {
      Caption = 'JPJ Search (3rd Party Ins.)';
      DataClassification = ToBeClassified;
    }
    field(54;"JPJ Search Amount";Decimal)
    {
      Caption = 'JPJ Search Amount';
      DataClassification = ToBeClassified;
    }
    field(55;"Submit to Merimen Date";Date)
    {
      Caption = 'Submit to Merimen Date';
      DataClassification = ToBeClassified;
    }
    field(56;"Merimen Amount";Decimal)
    {
      Caption = 'Merimen Amount';
      DataClassification = ToBeClassified;
    }
    field(57;"Adjusted Report Date";Date)
    {
      Caption = 'Adjusted Report Date';
      DataClassification = ToBeClassified;
    }
    field(58;"Adjuster Amount";Decimal)
    {
      Caption = 'Adjuster Amount';
      DataClassification = ToBeClassified;
    }
    field(59;"Total Cost";Decimal)
    {
      Caption = 'Total Cost';
      DataClassification = ToBeClassified;
    }
    field(60;"Estimated Repair Cost";Decimal)
    {
      Caption = 'Estimated Repair Cost';
      DataClassification = ToBeClassified;
    }
    field(61;"Submit To Ins. Date";Date)
    {
      Caption = 'Submit To Ins. Date';
      DataClassification = ToBeClassified;
    }
    field(62;"Submit to Ins .Amount";Decimal)
    {
      Caption = 'Submit to Ins .Amount';
      DataClassification = ToBeClassified;
    }
    field(63;"LoU Adjuster Amount";Decimal)
    {
      Caption = 'LoU Adjuster Amount';
      DataClassification = ToBeClassified;
    }
    field(64;"LoU By our Workshop";Decimal)
    {
      Caption = 'LoU By our Workshop';
      DataClassification = ToBeClassified;
    }
    field(65;"LoU By Insurance Amount";Decimal)
    {
      Caption = 'LoU By Insurance Amount';
      DataClassification = ToBeClassified;
    }
    field(66;"LoU Paid to Driver Amount";Decimal)
    {
      Caption = 'LoU Paid to Driver Amount';
      DataClassification = ToBeClassified;
    }
    field(67;"LoU Paid to Driver Date";Date)
    {
      Caption = 'LoU Paid to Driver Date';
      DataClassification = ToBeClassified;
    }
    field(68;"LoU Voucher No.";Text[30])
    {
      Caption = 'LoU Voucher No.';
      DataClassification = ToBeClassified;
    }
    field(69;"LoU Voucher Date";Date)
    {
      Caption = 'LoU Voucher Date';
      DataClassification = ToBeClassified;
    }
    field(70;"LoU GPC No.";Text[30])
    {
      Caption = 'LoU GPC No.';
      DataClassification = ToBeClassified;
    }
    field(71;"LoU GPC Date";Date)
    {
      Caption = 'LoU GPC Date';
      DataClassification = ToBeClassified;
    }
    field(72;"Claim Status";Option)
    {
      Caption = 'Claim Status';
      DataClassification = ToBeClassified;
      OptionMembers = " ", "Claim", "Loan Claim", "Cash Claim", "Total Loss", "Claim without Repair";
    }
    field(73;"Discharge Voucher Amount";Decimal)
    {
      Caption = 'Discharge Voucher Amount';
      DataClassification = ToBeClassified;
    }
    field(74;"Insurance Payment Amount";Decimal)
    {
      Caption = 'Insurance Payment Amount';
      DataClassification = ToBeClassified;
    }
    field(75;"Insurance Payment Date";Date)
    {
      Caption = 'Insurance Payment Date';
      DataClassification = ToBeClassified;
    }
    field(76;"External Repair Fee Refund";Decimal)
    {
      Caption = 'External Repair Fee Refund';
      DataClassification = ToBeClassified;
    }
    field(77;"Refund Driver Amount";Decimal)
    {
      Caption = 'Refund Driver Amount';
      DataClassification = ToBeClassified;
    }
    field(78;"Refund Driver Date";Date)
    {
      Caption = 'Refund Driver Date';
      DataClassification = ToBeClassified;
    }
    field(79;"Check Date";Date)
    {
      Caption = 'Check Date';
      DataClassification = ToBeClassified;
    }
    field(80;"Check No.";Text[30])
    {
      Caption = 'Check No.';
      DataClassification = ToBeClassified;
    }
    field(81;"Staff Commission Amount";Decimal)
    {
      Caption = 'Staff Commission Amount';
      DataClassification = ToBeClassified;
    }
    field(82;"Nett Profit Amount";Decimal)
    {
      Caption = 'Nett Profit Amount';
      DataClassification = ToBeClassified;
    }
    field(83;"Case Status";Option)
    {
      Caption = 'Case Status';
      DataClassification = ToBeClassified;
      OptionMembers = " ", "Submitted", "Pending Offer Letter", "Appeal", "Pending Payment", "Closed";
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
