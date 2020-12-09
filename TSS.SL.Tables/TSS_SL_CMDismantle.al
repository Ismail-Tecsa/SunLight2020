table 50032 "CM Dismantle"
{
  Caption = 'CM Dismantle';
  DataClassification = ToBeClassified;

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
      TableRelation = "Settlement Header";
    }
    field(3;"Car Taken By";Text[50])
    {
      Caption = 'Car Taken By';
      DataClassification = ToBeClassified;
    }
    field(4;"Process By";Text[50])
    {
      Caption = 'Process By';
      DataClassification = ToBeClassified;
    }
    field(5;"Dismantle Done";Boolean)
    {
      Caption = 'Dismantle Done';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        if "Dismantle Done" then "Dismantle Done Date":=today;
      end;
    }
    field(6;"Dismantle Done Date";Date)
    {
      Caption = 'Dismantle Done Date';
      DataClassification = ToBeClassified;
    }
    field(7;"Dismantle Purpose";Text[50])
    {
      Caption = 'Dismantle Purpose';
      DataClassification = ToBeClassified;
    }
    field(8;NGV;Boolean)
    {
      Caption = 'NGV';
      DataClassification = ToBeClassified;
    }
    field(9;"NGV Serial No.";Text[50])
    {
      Caption = 'NGV Serial No.';
      DataClassification = ToBeClassified;
    }
    field(10;Meter;Boolean)
    {
      Caption = 'Meter';
      DataClassification = ToBeClassified;
    }
    field(11;"Meter Serial No.";Text[50])
    {
      Caption = 'Meter Serial No.';
      DataClassification = ToBeClassified;
    }
    field(12;GPS;Boolean)
    {
      Caption = 'GPS';
      DataClassification = ToBeClassified;
    }
    field(13;"GPS Info";Text[50])
    {
      Caption = 'GPS Info';
      DataClassification = ToBeClassified;
    }
    field(14;"Radio Call";Boolean)
    {
      Caption = 'Radio Call';
      DataClassification = ToBeClassified;
    }
    field(15;"Radia Call Info";Text[50])
    {
      Caption = 'Radia Call Info';
      DataClassification = ToBeClassified;
    }
    field(16;Remark;Text[100])
    {
      Caption = 'Remark';
      DataClassification = ToBeClassified;
    }
    field(17;"Fee Charge Company";Text[30])
    {
      Caption = 'Fee Charge Company';
      DataClassification = ToBeClassified;
      TableRelation = Company;
    }
    field(18;"Driver Take Another Taxi";Boolean)
    {
      Caption = 'Driver Take Another Taxi';
      DataClassification = ToBeClassified;
    }
    field(19;"Taxi ID";Code[10])
    {
      Caption = 'Taxi ID';
      DataClassification = ToBeClassified;
      TableRelation = taxis;
    }
    field(20;"Black List Updated";Boolean)
    {
      Caption = 'Black List Updated';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        if "Black List Updated" then "Black List Updated date":=today;
      end;
    }
    field(21;"Black List Updated Date";Date)
    {
      Caption = 'Black List Updated Date';
      DataClassification = ToBeClassified;
    }
    field(22;"Handled by";Text[50])
    {
      Caption = 'Handled by';
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
