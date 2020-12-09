table 50029 "Taxis Ledger Entry"
{
  Caption = 'Taxis Ledger Entry';
  DataClassification = ToBeClassified;
  DrillDownPageID = "Taxi Ledger Entries";
  LookupPageID = "Taxi Ledger Entries";

  fields
  {
    field(1;"Entry No.";Integer)
    {
      Caption = 'Entry No.';
    }
    field(2;"Service Contract No.";Code[20])
    {
      Caption = 'Service Contract No.';
      TableRelation = "Service Contract Header"."Contract No." WHERE("Contract Type"=CONST(Contract));
    }
    field(3;"Document Type";option)
    {
      Caption = 'Document Type';
      OptionMembers = "Collections", "Fees Acrrued", "Fees Paid", "Deposit", "Deposit Refund", "Settlement Paid";
    }
    field(4;"Document No.";Code[20])
    {
      Caption = 'Document No.';
    }
    field(5;"Serv. Contract Acc. Gr. Code";Code[10])
    {
      Caption = 'Serv. Contract Acc. Gr. Code';
      TableRelation = "Service Contract Account Group".Code;
    }
    field(6;"Document Line No.";Integer)
    {
      Caption = 'Document Line No.';
    }
    field(9;"Posting Date";Date)
    {
      Caption = 'Posting Date';
    }
    field(11;"Amount (LCY)";Decimal)
    {
      AutoFormatType = 1;
      Caption = 'Amount (LCY)';
    }
    field(12;"Customer No.";Code[20])
    {
      Caption = 'Customer No.';
      TableRelation = Customer;
    }
    field(14;"Taxi ID";Code[20])
    {
      Caption = 'Item No. (Serviced)';
      TableRelation = taxis;
    }
    field(16;"User ID";Code[50])
    {
      Caption = 'User ID';
      DataClassification = EndUserIdentifiableInformation;
      TableRelation = User."User Name";
    //This property is currently not supported
    //TestTableRelation = false;
    }
    field(18;"Global Dimension 1 Code";Code[20])
    {
      CaptionClass = '1,2,1';
      Caption = 'Global Dimension 1 Code';
      TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(1));
    }
    field(19;"Global Dimension 2 Code";Code[20])
    {
      CaptionClass = '1,2,2';
      Caption = 'Global Dimension 2 Code';
      TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(2));
    }
    field(20;"Service Item No. (Serviced)";Code[20])
    {
      Caption = 'Service Item No. (Serviced)';
      TableRelation = "Service Item";
    }
    field(22;"Contract Group Code";Code[10])
    {
      Caption = 'Contract Group Code';
      TableRelation = "Contract Group".Code;
    }
    field(23;Type;enum "Service Ledger Entry Type")
    {
      Caption = 'Type';
    }
    field(24;"No.";Code[20])
    {
      Caption = 'No.';
      TableRelation = IF(Type=CONST("Service Contract"))"Service Contract Header"."Contract No." WHERE("Contract Type"=CONST(Contract))
      ELSE IF(Type=CONST(" "))"Standard Text"
      ELSE IF(Type=CONST(Item))Item
      ELSE IF(Type=CONST(Resource))Resource
      ELSE IF(Type=CONST("Service Cost"))"Service Cost"
      ELSE IF(Type=CONST("G/L Account"))"G/L Account";
    }
    field(25;"Cost Amount";Decimal)
    {
      AutoFormatType = 1;
      Caption = 'Cost Amount';
    }
    field(26;"Discount Amount";Decimal)
    {
      AutoFormatType = 1;
      Caption = 'Discount Amount';
    }
    field(27;"Unit Cost";Decimal)
    {
      AutoFormatType = 2;
      Caption = 'Unit Cost';
    }
    field(28;Quantity;Decimal)
    {
      Caption = 'Quantity';
      DecimalPlaces = 0: 5;
    }
    field(30;"Unit Price";Decimal)
    {
      AutoFormatType = 2;
      Caption = 'Unit Price';
    }
    field(31;"Discount %";Decimal)
    {
      Caption = 'Discount %';
      DecimalPlaces = 0: 5;
    }
    field(32;"Contract Disc. Amount";Decimal)
    {
      AutoFormatType = 1;
      Caption = 'Contract Disc. Amount';
    }
    field(33;"Bill-to Customer No.";Code[20])
    {
      Caption = 'Bill-to Customer No.';
      TableRelation = Customer;
    }
    field(35;Description;Text[100])
    {
      Caption = 'Description';
    }
    field(37;"Service Order Type";Code[10])
    {
      Caption = 'Service Order Type';
      TableRelation = "Service Order Type";
    }
    field(39;"Service Order No.";Code[20])
    {
      Caption = 'Service Order No.';

      trigger OnLookup()begin
        Clear(ServOrderMgt);
        ServOrderMgt.ServHeaderLookup(1, "Service Order No.");
      end;
    }
    field(41;"Gen. Bus. Posting Group";Code[20])
    {
      Caption = 'Gen. Bus. Posting Group';
      TableRelation = "Gen. Business Posting Group";
    }
    field(42;"Gen. Prod. Posting Group";Code[20])
    {
      Caption = 'Gen. Prod. Posting Group';
      TableRelation = "Gen. Product Posting Group";
    }
    field(43;"Location Code";Code[10])
    {
      Caption = 'Location Code';
      TableRelation = Location;
    }
    field(44;"Unit of Measure Code";Code[10])
    {
      Caption = 'Unit of Measure Code';
      TableRelation = "Unit of Measure";
    }
    field(47;"Responsibility Center";Code[10])
    {
      Caption = 'Responsibility Center';
      TableRelation = "Responsibility Center";
    }
    field(51;Open;Boolean)
    {
      Caption = 'Open';
    }
    field(54;Prepaid;Boolean)
    {
      Caption = 'Prepaid';
    }
    field(57;Amount;Decimal)
    {
      AutoFormatType = 1;
      Caption = 'Amount';
    }
    field(480;"Dimension Set ID";Integer)
    {
      Caption = 'Dimension Set ID';
      Editable = false;
      TableRelation = "Dimension Set Entry";

      trigger OnLookup()begin
        ShowDimensions();
      end;
    }
  }
  keys
  {
    key(Key1;"Entry No.")
    {
      Clustered = true;
    }
    key(Key2;"Document No.", "Posting Date")
    {
    }
  }
  fieldgroups
  {
    fieldgroup(DropDown;"Entry No.", "Taxi ID", "Service Contract No.", "Posting Date")
    {
    }
  }
  var ServOrderMgt: Codeunit ServOrderManagement;
  DimMgt: Codeunit DimensionManagement;
  procedure GetLastEntryNo(): Integer;
  var FindRecordManagement: Codeunit "Find Record Management";
  begin
    exit(FindRecordManagement.GetLastEntryIntFieldValue(Rec, FieldNo("Entry No.")))end;
  procedure ShowDimensions()begin
    DimMgt.ShowDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', TableCaption, "Entry No."));
  end;
}
