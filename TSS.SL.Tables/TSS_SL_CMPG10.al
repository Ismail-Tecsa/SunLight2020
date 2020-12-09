table 50030 "CM PG10"
{
  Caption = 'CM PG10';
  DataClassification = ToBeClassified;
  DataPerCompany = false;

  fields
  {
    field(1;"Case ID";Code[10])
    {
      Caption = 'Case ID';
      DataClassification = ToBeClassified;
    }
    field(2;"Settlement ID";Code[10])
    {
      Caption = 'Settlement ID';
      DataClassification = ToBeClassified;
      TableRelation = "Settlement Header" where("Settlement Type"=const("PG-10"));

      trigger OnValidate()var settlement: record "Settlement Header";
      taxi: Record Taxis;
      begin
        settlement.get("Settlement ID");
        settlement.TestField(Status, settlement.Status::Closed);
        taxi.get(settlement."Taxi ID");
        if taxi."Active Contract" <> '' then begin
          settlement.CalcFields("Settlement Amount", "Settlement Paid");
          if settlement."Settlement Paid" <> settlement."Settlement Amount" then error('The Settlement must be fully paid before PG10 can be started.')end;
        "Previous Taxi Status":=taxi.Status;
        taxi.Status:=taxi.status::"Under Maintenance";
        taxi.modify;
      end;
    }
    field(3;"Workshop Dismantle";Boolean)
    {
      Caption = 'Workshop Dismantle';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        if "Workshop Dismantle" then "Workshop Dismantle Date":=today;
      end;
    }
    field(4;"Workshop Dismantle Date";Date)
    {
      Caption = 'Workshop Dismantle Date';
      DataClassification = ToBeClassified;
    }
    field(5;"Permit Cancellation";Boolean)
    {
      Caption = 'Permit Cancellation';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        if "Permit Cancellation" then "Permit Cancellation Date":=today;
      end;
    }
    field(6;"Permit Cancellation Date";Date)
    {
      Caption = 'Permit Cancellation Date';
      DataClassification = ToBeClassified;
    }
    field(7;"B2 Inspection";Boolean)
    {
      Caption = 'B2 Inspection';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        if "B2 Inspection" then "B2 Inspection Date":=today;
      end;
    }
    field(8;"B2 Inspection Date";Date)
    {
      Caption = 'B2 Inspection Date';
      DataClassification = ToBeClassified;
    }
    field(9;"Custom Duty";Boolean)
    {
      Caption = 'Custom Duty';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        if "Custom Duty" then "custom duty Date":=today;
      end;
    }
    field(10;"Custom Duty Date";Date)
    {
      Caption = 'Custom Duty Date';
      DataClassification = ToBeClassified;
    }
    field(11;"Company Document";Boolean)
    {
      Caption = 'Company Document';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        if "company document" then "Company document Date":=today;
      end;
    }
    field(12;"Company Document Date";Date)
    {
      Caption = 'Company Document Date';
      DataClassification = ToBeClassified;
    }
    field(13;"B5 Inspection";Boolean)
    {
      Caption = 'B5 Inspection';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        if "B5 Inspection" then "b5 inspection Date":=today;
      end;
    }
    field(14;"B5 Inspection Date";Date)
    {
      Caption = 'B5 Inspection Date';
      DataClassification = ToBeClassified;
    }
    field(15;"JPJ Transfer Ownership";Boolean)
    {
      Caption = 'JPJ Transfer Ownership';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        if "JPJ Transfer Ownership" then "JPJ Transfer Ownership Date":=today;
      end;
    }
    field(16;"JPJ Transfer Ownership Date";Date)
    {
      Caption = 'JPJ Transfer Ownership Date';
      DataClassification = ToBeClassified;
    }
    field(18;Released;Boolean)
    {
      Caption = 'Released';
      DataClassification = ToBeClassified;

      trigger OnValidate()var CaseM: record Case;
      taxis: record taxis;
      begin
        if confirm('Are you sure you would like to release the PG10?')then begin
          casem.get("Settlement ID");
          taxis.get(casem."Taxi ID");
          taxis.Status:=taxis.Status::"PG-10";
          taxis.Modify();
        end
        else
        begin
          error('Process stopped.')end;
      end;
    }
    field(19;"Dismantle ID";Code[10])
    {
      Caption = 'Dismantle ID';
      DataClassification = ToBeClassified;
      TableRelation = Case."Case ID" where(Type=const(Dismantle));
    }
    field(20;"Car Taken By";Text[50])
    {
      Caption = 'Car Taken By';
      DataClassification = ToBeClassified;
    }
    field(21;"Process By";Text[50])
    {
      Caption = 'Process By';
      DataClassification = ToBeClassified;
    }
    field(22;"Dismantle and Disposal";Boolean)
    {
      Caption = 'Dismantle and Disposal';
      DataClassification = ToBeClassified;
    }
    field(23;"Taxi Release for B2 ";Text[30])
    {
      Caption = 'Taxi Release for B2 ';
      DataClassification = ToBeClassified;
    }
    field(24;"Taxi Custody after B5";Text[30])
    {
      Caption = 'Taxi Custody after B5';
      DataClassification = ToBeClassified;
    }
    field(25;Geran;Text[30])
    {
      Caption = 'Geran';
      DataClassification = ToBeClassified;
    }
    field(26;Insurance;Boolean)
    {
      Caption = 'Insurance';
      DataClassification = ToBeClassified;
    }
    field(27;"Insurance Date";Boolean)
    {
      Caption = 'Insurance Date';
      DataClassification = ToBeClassified;
    }
    field(28;"Road Tax";Boolean)
    {
      Caption = 'Road Tax';
      DataClassification = ToBeClassified;
    }
    field(29;"Road Tax Date";Date)
    {
      Caption = 'Road Tax Date';
      DataClassification = ToBeClassified;
    }
    field(30;"Geran Copy";Boolean)
    {
      Caption = 'Geran Copy';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        if "Geran Copy" then "geran copy Date":=today;
      end;
    }
    field(31;"Geran Copy Date";Date)
    {
      Caption = 'Geran Copy Date';
      DataClassification = ToBeClassified;
    }
    field(32;"Handle by";Text[50])
    {
      Caption = 'Handle by';
      DataClassification = ToBeClassified;
    }
    field(33;"Cancel PG10";Boolean)
    {
      DataClassification = CustomerContent;

      trigger OnValidate()var CaseM: record Case;
      taxis: record taxis;
      begin
        if "JPJ Transfer Ownership" then error('Cannot cancel as JPJ process already started.');
        if confirm('Are you sure you would like to cancel the PG10 process?')then begin
          casem.get("Settlement ID");
          taxis.get(casem."Taxi ID");
          taxis.Status:="Previous Taxi Status";
          taxis.Modify();
        end
        else
        begin
          error('Process Stopped.');
        end;
      end;
    }
    field(34;"Previous Taxi Status";Option)
    {
      OptionMembers = "In Progress", Available, "On the Road", "Under Maintenance", "PG-10", "Disposal";
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
