table 50021 "CM Summon"
{
  Caption = 'Summon';
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
      OptionMembers = " ", "AES", "JPJ / Town Council", "Traffic";
    }
    field(3;"Internal Reference";Text[30])
    {
      Caption = 'Internal Reference';
      DataClassification = ToBeClassified;
    }
    field(4;"Offense Charge";Decimal)
    {
      Caption = 'Offense Charge';
      DataClassification = ToBeClassified;
    }
    field(5;"Offense Location";Text[100])
    {
      Caption = 'Offense Location';
      DataClassification = ToBeClassified;
    }
    field(6;"Inform Driver";Boolean)
    {
      Caption = 'Inform Driver';
      DataClassification = ToBeClassified;

      trigger onValidate()begin
        if "Inform Driver" then "Inform Driver Date":=today;
      end;
    }
    field(7;"Inform Driver Date";Date)
    {
      Caption = 'Inform Driver Date';
      DataClassification = ToBeClassified;
    }
    field(8;"Driver Collect";Boolean)
    {
      Caption = 'Driver Collect';
      DataClassification = ToBeClassified;

      trigger onValidate()begin
        if "Driver Collect" then "driver collect Date":=today;
      end;
    }
    field(9;"Driver Collect Date";Date)
    {
      Caption = 'Driver Collect Date';
      DataClassification = ToBeClassified;
    }
    field(10;"Investigation Progress";Text[30])
    {
      Caption = 'Investigation Progress';
      DataClassification = ToBeClassified;
    }
    field(11;"Investigation Date";Date)
    {
      Caption = 'Investigation Date';
      DataClassification = ToBeClassified;
    }
    field(12;"External Reference No.";Text[30])
    {
      Caption = 'External Reference No.';
      DataClassification = ToBeClassified;
    }
    field(13;"Investigation Result";Text[250])
    {
      Caption = 'Investigation Result';
      DataClassification = ToBeClassified;
    }
    field(14;"Investigation Venue";Text[30])
    {
      Caption = 'Investigation Venue';
      DataClassification = ToBeClassified;
    }
    field(15;"Investigator Name";Text[30])
    {
      Caption = 'Investigator Name';
      DataClassification = ToBeClassified;
    }
    field(16;"1st Follow Up";Boolean)
    {
      Caption = '1st Follow Up';
      DataClassification = ToBeClassified;

      trigger onValidate()begin
        if "1st Follow Up" then "1st Follow Up Date":=today;
      end;
    }
    field(17;"1st Follow Up Date";Date)
    {
      Caption = '1st Follow Up Date';
      DataClassification = ToBeClassified;
    }
    field(18;"2nd Follow Up";Boolean)
    {
      Caption = '2nd Follow Up';
      DataClassification = ToBeClassified;

      trigger onValidate()begin
        if "2nd Follow Up" then "2nd Follow Up Date":=today;
      end;
    }
    field(19;"2nd Follow Up Date";Date)
    {
      Caption = '2nd Follow Up Date';
      DataClassification = ToBeClassified;
    }
    field(20;"3rd Follow Up";Boolean)
    {
      Caption = '3rd Follow Up';
      DataClassification = ToBeClassified;

      trigger onValidate()begin
        if "3rd Follow Up" then "3rd Follow Up Date":=today;
      end;
    }
    field(21;"3rd Follow Up Date";Date)
    {
      Caption = '3rd Follow Up Date';
      DataClassification = ToBeClassified;
    }
    field(22;"Attendance Letter";Boolean)
    {
      Caption = 'Attendance Letter';
      DataClassification = ToBeClassified;

      trigger onValidate()begin
        if "Attendance Letter" then "Attendance Letter Date":=today;
      end;
    }
    field(23;"Attendance Letter Date";Date)
    {
      Caption = 'Attendance Letter Date';
      DataClassification = ToBeClassified;
    }
    field(24;"Result Received";Boolean)
    {
      Caption = 'Result Received';
      DataClassification = ToBeClassified;

      trigger onValidate()begin
        if "Result Received" then "Result Received Date":=today;
      end;
    }
    field(25;"Result Received Date";Date)
    {
      Caption = 'Result Received Date';
      DataClassification = ToBeClassified;
    }
    field(26;"Result Status";Option)
    {
      Caption = 'Result Status';
      DataClassification = ToBeClassified;
      OptionMembers = " ", "Warning Letter", "Summon";
    }
    field(27;"Summon Issue To";Option)
    {
      Caption = 'Summon Issue To';
      DataClassification = ToBeClassified;
      OptionMembers = " ", "Driver", "Company";
    }
    field(28;"Summon Transferred";Boolean)
    {
      Caption = 'Summon Transferred';
      DataClassification = ToBeClassified;

      trigger onValidate()begin
        if "Summon Transferred" then "Date of Transfer":=today;
      end;
    }
    field(29;"Date of Transfer";Date)
    {
      Caption = 'Date of Transfer';
      DataClassification = ToBeClassified;
    }
    field(30;"Payment Method";Option)
    {
      Caption = 'Payment Method';
      DataClassification = ToBeClassified;
      OptionMembers = " ", "Direct Payment", "Via Company";
    }
    field(31;"Summon Amount";Decimal)
    {
      Caption = 'Summon Amount';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        "Total Summon Charge":="Summon Amount" + "Runner Fee";
      end;
    }
    field(32;"Runner Fee";Decimal)
    {
      Caption = 'Runner Fee';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        "Total Summon Charge":="Summon Amount" + "Runner Fee";
      end;
    }
    field(33;"Total Summon Charge";Decimal)
    {
      Caption = 'Total Summon Charge';
      DataClassification = ToBeClassified;
      Editable = false;
    }
    field(34;"Receipt Obtained";Boolean)
    {
      Caption = 'Receipt Obtained';
      DataClassification = ToBeClassified;

      trigger onValidate()begin
        if "Receipt Obtained" then "Receipt Date":=today;
      end;
    }
    field(35;"Receipt Date";Date)
    {
      Caption = 'Receipt Date';
      DataClassification = ToBeClassified;
    }
    field(36;"Receipt No.";Text[30])
    {
      Caption = 'Receipt No.';
      DataClassification = ToBeClassified;
    }
    field(37;"Handled By";Code[50])
    {
      Caption = 'Handled By';
      DataClassification = ToBeClassified;
      TableRelation = user;
    }
    field(38;"Driver Pay By";Option)
    {
      Caption = 'Driver Pay By';
      DataClassification = ToBeClassified;
      Optionmembers = " ", "Cash", "Loan";
    }
    field(39;"Invoice Generated";Boolean)
    {
      Caption = 'Invoice Generated';
      DataClassification = ToBeClassified;

      trigger onValidate()begin
        if "Invoice Generated" then "Invoice Generated Date":=today;
      end;
    }
    field(40;"Invoice Generated Date";Date)
    {
      Caption = 'Invoice Generated Date';
      DataClassification = ToBeClassified;
    }
    field(41;GOR;Text[30])
    {
      Caption = 'GOR';
      DataClassification = ToBeClassified;
    }
    field(42;"GOR Date";Date)
    {
      Caption = 'GOR Date';
      DataClassification = ToBeClassified;
    }
    field(43;"GOR Amount";Decimal)
    {
      Caption = 'GOR Amount';
      DataClassification = ToBeClassified;
    }
    field(44;"LTA No.";Text[30])
    {
      Caption = 'LTA No.';
      DataClassification = ToBeClassified;
    }
    field(45;"Commencement Date";Date)
    {
      Caption = 'Commencement Date';
      DataClassification = ToBeClassified;
    }
    field(46;"Loan Amount";Decimal)
    {
      Caption = 'Loan Amount';
      DataClassification = ToBeClassified;
    }
    field(47;"Claim Generated";Boolean)
    {
      Caption = 'Claim Generated';
      DataClassification = ToBeClassified;

      trigger onValidate()begin
        if "Claim Generated" then "Claim Generated Date":=today;
      end;
    }
    field(48;"Claim Generated Date";Date)
    {
      Caption = 'Claim Generated Date';
      DataClassification = ToBeClassified;
    }
    field(49;"GPC No.";Text[30])
    {
      Caption = 'GPC No.';
      DataClassification = ToBeClassified;
    }
    field(50;"GPC Date";Date)
    {
      Caption = 'GPC Date';
      DataClassification = ToBeClassified;
    }
    field(51;"GPC Amount";Decimal)
    {
      Caption = 'GPC Amount';
      DataClassification = ToBeClassified;
    }
    field(52;"Runner Name";Text[30])
    {
      Caption = 'Runner Name';
      DataClassification = ToBeClassified;
    }
    field(53;"Pay Receipt Obtained";Boolean)
    {
      Caption = 'Pay Receipt Obtained';
      DataClassification = ToBeClassified;

      trigger onValidate()begin
        if "Pay Receipt Obtained" then "Pay Receipt Date":=today;
      end;
    }
    field(54;"Pay Receipt Date";Date)
    {
      Caption = 'Pay Receipt Date';
      DataClassification = ToBeClassified;
    }
    field(55;"Pay Receipt No.";Text[30])
    {
      Caption = 'Pay Receipt No.';
      DataClassification = ToBeClassified;
    }
    field(56;"Pay Receipt Amount";Decimal)
    {
      Caption = 'Pay Receipt Amount';
      DataClassification = ToBeClassified;
    }
    field(57;"Outstanding Balance";Option)
    {
      Caption = 'Outstanding Balance';
      DataClassification = ToBeClassified;
      OptionMembers = " ", "Short Payment", "Over Payment";
    }
    field(58;"Balance Amount";Decimal)
    {
      Caption = 'Balance Amount';
      DataClassification = ToBeClassified;
    }
    field(59;"Outst. GOR No.";Text[30])
    {
      Caption = 'Outst. GOR No.';
      DataClassification = ToBeClassified;
    }
    field(60;"Outst. GOR Date";Date)
    {
      Caption = 'Outst. GOR Date';
      DataClassification = ToBeClassified;
    }
    field(61;"Outst. GOR Amount";Decimal)
    {
      Caption = 'Outst. GOR Amount';
      DataClassification = ToBeClassified;
    }
    field(62;"Outst. GPC No.";Text[30])
    {
      Caption = 'Outst. GPC No.';
      DataClassification = ToBeClassified;
    }
    field(63;"Outst. GPC Date";Date)
    {
      Caption = 'Outst. GPC Date';
      DataClassification = ToBeClassified;
    }
    field(64;"Outst. GPC Amount";Decimal)
    {
      Caption = 'Outst. GPC Amount';
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
