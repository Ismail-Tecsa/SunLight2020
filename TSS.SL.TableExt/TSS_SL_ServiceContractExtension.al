tableextension 50002 "Service Contract Extension" extends "Service Contract Header"
{
  fields
  {
    field(50000;"Package Scheme";Code[20])
    {
      Caption = 'Package Scheme';
      DataClassification = ToBeClassified;
      TableRelation = "Package Scheme";
    }
    field(50001;"Festival Discount Scheme";Code[20])
    {
      Caption = 'Festival Discount Scheme';
      DataClassification = ToBeClassified;
      TableRelation = "Fesitval Discount Scheme";
    }
    field(50002;"Driver 1";code[10])
    {
      TableRelation = customer;

      trigger OnValidate()var customer: record customer;
      begin
        if customer.get("Driver 1")then begin
          customer.TestField("Black Listed", false);
          customer.TestField(Contract, '');
          customer.Contract:=rec."Contract No.";
          customer.modify;
        end;
      end;
    }
    field(50003;"Driver 2";code[10])
    {
      TableRelation = customer;

      trigger OnValidate()var customer: record customer;
      begin
        if customer.get("Driver 2")then begin
          customer.TestField("Black Listed", false);
          customer.TestField(Contract, '');
          customer.Contract:=rec."Contract No.";
          customer.modify;
        end;
      end;
    }
    field(50004;"Overdue Days";Integer)
    {
      FieldClass = FlowField;
      CalcFormula = Count("Booking Entry" WHERE("Contract No."=field("Contract No."), "Posting Date"=field("Date Filter")));
      Editable = false;
      Caption = 'Overdue Days';
    }
    field(50005;"Overdue Amount";Decimal)
    {
      CalcFormula = Sum("Booking Entry".Amount WHERE("Contract No."=FIELD("Contract No."), "Posting Date"=field("Date Filter")));
      Editable = false;
      FieldClass = FlowField;
      Caption = 'Overdue Amount';
    }
    field(50006;Freeze;Boolean)
    {
      Caption = 'Freeze';
    }
  }
  trigger OnAfterDelete()var driver: Record customer;
  begin
    if "Driver 1" <> '' then begin
      driver.get("Driver 1");
      driver.Contract:='';
      driver.Modify();
    end;
    if "Driver 2" <> '' then begin
      driver.get("Driver 2");
      driver.Contract:='';
      driver.Modify();
    end;
    driver.get("Customer No.");
    driver.Contract:='';
    driver.Modify();
  end;
}
