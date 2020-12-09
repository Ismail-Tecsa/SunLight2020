table 50026 "Settlement Lines"
{
  Caption = 'Settlement Lines';
  DataClassification = ToBeClassified;

  fields
  {
    field(1;"Document No.";Code[10])
    {
      Caption = 'Document No.';
      DataClassification = ToBeClassified;
    }
    field(2;"Line No.";Integer)
    {
      Caption = 'Line No.';
      DataClassification = ToBeClassified;
    }
    field(3;Code;Code[10])
    {
      Caption = 'Code';
      DataClassification = ToBeClassified;
      TableRelation = "Settlement Code";

      trigger OnValidate()var SetCode: record "Settlement Code";
      begin
        if SetCode.get(code)then Description:=SetCode.Description;
        if SetHeader.get("Document No.")then begin
          "Taxi ID":=Setheader."Taxi ID";
        end;
      end;
    }
    field(4;Description;Text[50])
    {
      Caption = 'Description';
      DataClassification = ToBeClassified;
    }
    field(5;Amount;Decimal)
    {
      Caption = 'Amount';
      DataClassification = ToBeClassified;
    }
    field(6;Remark;Text[50])
    {
      Caption = 'Remark';
      DataClassification = ToBeClassified;
    }
    field(7;"Receipt No.";Code[10])
    {
      Caption = 'Receipt No.';
      DataClassification = CustomerContent;
      TableRelation = "Taxis Ledger Entry" where("Taxi ID"=field("Taxi ID"));

      trigger OnValidate()var TLE: record "Taxis Ledger Entry";
      begin
        tle.reset;
        tle.setrange("Taxi ID", "Taxi ID");
        tle.setrange("Document No.", "Receipt No.");
        if tle.FindFirst()then begin
          validate(Amount, tle.Amount);
        end;
      end;
    }
    field(10;"Taxi ID";code[10])
    {
      Caption = 'Taxi ID';
      DataClassification = CustomerContent;
      TableRelation = taxis;
    }
  }
  keys
  {
    key(PK;"Document No.", "Line No.")
    {
      Clustered = true;
    }
  }
  var SetHeader: Record "Settlement Header";
}
