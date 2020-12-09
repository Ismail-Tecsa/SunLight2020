table 50025 "Settlement Header"
{
  Caption = 'Settlement Header';
  DataClassification = ToBeClassified;
  LookupPageId = "Settlement List";
  DrillDownPageId = "Settlement List";

  fields
  {
    field(1;"Settlement ID";Code[10])
    {
      Caption = 'Settlement ID';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        if "settlement ID" <> xRec."settlement ID" then begin
          GLSetup.Get();
          NoSeriesMgt.TestManual(GLSetup."settlement No. Series");
        end;
      end;
    }
    field(2;"Taxi ID";Code[10])
    {
      Caption = 'Taxi ID';
      DataClassification = ToBeClassified;
      TableRelation = taxis;

      trigger OnValidate()var SetLines: Record "Settlement Lines";
      begin
        SetLines.reset;
        SetLines.setrange("Document No.", "Settlement ID");
        if SetLines.findfirst then begin
          repeat setlines."Taxi ID":="Taxi ID";
            SetLines.modify;
          until SetLines.next = 0;
        end;
      end;
    }
    field(3;"Creation Date";Date)
    {
      Caption = 'Creation Date';
      DataClassification = ToBeClassified;
    }
    field(4;"Settlement Type";Option)
    {
      Caption = 'Settlement Type';
      OptionMembers = " ", "Surrender", "Transfer", "Repo", "Restructure", "Untracable", "Total Loss", "Projected Taxi", "PG-10", "Repurchase", "Sambung";
      DataClassification = ToBeClassified;

      trigger OnValidate()var SetLines: Record "Settlement Lines";
      SetMaster: record "Settlement Master";
      begin
        setlines.reset;
        setlines.setrange("Document No.", "Settlement ID");
        if not SetLines.findset then begin
          if confirm('Would you like to auto create the lines?')then begin
            Setmaster.reset;
            setmaster.Findfirst();
            repeat if(SetMaster."Settlement Type" = SetMaster."Settlement Type"::" ") or (SetMaster."Settlement Type" = "Settlement Type")then begin
                clear(SetLines);
                SetLines."Document No.":="Settlement ID";
                SetLines."Line No.":=SetMaster."Line No.";
                SetLines.Validate(code, SetMaster.Code);
                SetLines.Amount:=SetMaster."Fixed Amount";
                SetLines.insert;
              end;
            until SetMaster.next = 0;
          end;
        end;
      end;
    }
    field(5;"Cut off Date";Date)
    {
      Caption = 'Cut off Date';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        SetFilter("Cut off Date Filter", '..%1', "Cut off Date");
        CalcFields("Cutoff Overdue Amount", "Cutoff Overdue Days");
      end;
    }
    field(6;"Dismantle No.";Code[10])
    {
      Caption = 'Dismantle No.';
      DataClassification = ToBeClassified;
      TableRelation = "Case" where(Type=const(Dismantle));
    }
    field(7;"PG10 No.";Code[10])
    {
      Caption = 'PG10 No.';
      DataClassification = ToBeClassified;
      TableRelation = "Case" where(Type=const(PG10));
    }
    field(8;"Repo No.";Code[10])
    {
      Caption = 'Repo No.';
      DataClassification = ToBeClassified;
      TableRelation = "Case" where(Type=const(Repo));
    }
    field(9;"Created By";Text[50])
    {
      Caption = 'Created By';
      DataClassification = ToBeClassified;
    }
    field(10;Status;Option)
    {
      Caption = 'Status';
      OptionMembers = "In Progress", "Pending Approval", "Pending Payment", "Closed", "Cancelled";
      DataClassification = ToBeClassified;
    }
    field(11;"Supervisor Approval";Option)
    {
      Caption = 'Supervisor Approval';
      OptionMembers = " ", "Pending Approval", "Approved";
      DataClassification = ToBeClassified;
    }
    field(12;"Supervisor ID";Text[50])
    {
      Caption = 'Supervisor ID';
      DataClassification = ToBeClassified;
    }
    field(13;"Management Approval";Option)
    {
      Caption = 'Management Approval';
      OptionMembers = " ", "Pending Approval", "Approved";
      DataClassification = ToBeClassified;
    }
    field(14;"Management ID";Text[50])
    {
      Caption = 'Management ID';
      DataClassification = ToBeClassified;
    }
    field(15;"Remark";Text[100])
    {
      Caption = 'Remark';
      DataClassification = ToBeClassified;
    }
    field(20;"Transferee";code[10])
    {
      DataClassification = CustomerContent;
      TableRelation = customer;
    }
    field(21;"Date Closed";date)
    {
      DataClassification = CustomerContent;
    }
    field(22;"Account Closed Date";date)
    {
      DataClassification = CustomerContent;
    }
    Field(23;CTOS;Boolean)
    {
      DataClassification = CustomerContent;
    }
    Field(24;"Internal Blacklist";Boolean)
    {
      DataClassification = CustomerContent;
    }
    Field(25;"TAXI.COM";Boolean)
    {
      DataClassification = CustomerContent;
    }
    field(26;"Cutoff Overdue Days";Integer)
    {
      FieldClass = FlowField;
      CalcFormula = Count("Booking Entry" WHERE("Taxi No."=FIELD("Taxi ID"), "Posting Date"=field("Cut off Date Filter")));
      Editable = false;
      Caption = 'Cutoff Overdue Days';
    }
    field(27;"Cutoff Overdue Amount";Decimal)
    {
      CalcFormula = Sum("Booking Entry".Amount WHERE("Taxi No."=FIELD("Taxi ID"), "Posting Date"=field("Cut off Date Filter")));
      Editable = false;
      FieldClass = FlowField;
      Caption = 'Cutoff Overdue Amount';
    }
    field(28;"Cut off Date Filter";Date)
    {
      Caption = 'Cut off Date Filter';
      FieldClass = FlowFilter;
    }
    field(29;"Settlement Amount";Decimal)
    {
      Caption = 'Settlement Amount';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = sum("Settlement Lines".Amount where("Document No."=field("Settlement ID")));
    }
    field(30;"Settlement Paid";Decimal)
    {
      Caption = 'Settlement Paid';
      FieldClass = FlowField;
      Editable = false;
      CalcFormula = sum("Taxis Ledger Entry".Amount where("Document Type"=const("Settlement Paid")));
    }
  }
  keys
  {
    key(PK;"Settlement ID")
    {
      Clustered = true;
    }
  }
  trigger OnInsert()begin
    if "settlement ID" = '' then begin
      GLSetup.Get();
      GLSetup.TestField("settlement No. Series");
      NoSeriesMgt.InitSeries(GLSetup."settlement No. Series", GLSetup."settlement No. Series", 0D, "Settlement ID", GLSetup."settlement No. Series");
    end;
    "Creation Date":=today;
    "Created by":=UserId;
  end;
  trigger OnModify()begin
  end;
  trigger OnRename()begin
  end;
  var GLSetup: record "General Ledger Setup";
  NoSeriesMgt: Codeunit NoSeriesManagement;
}
