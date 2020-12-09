tableextension 50011 "Vendor Extension" extends Vendor
{
    fields
    {
        field(50000; "Repo Fee Item No."; Code[20])
        {
            Caption = 'Repo Fee Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item where(Type = const(Service));
        }
        //TSA_ISMAIL Added fields
        field(50001; "Annual Premium"; Decimal)
        {
            Caption = 'Annual Premium';
            FieldClass = FlowField;
            CalcFormula = Sum(Insurance."Annual Premium" WHERE("Insurance Vendor No." = FIELD("No.")));
            Editable = false;
        }
        field(50002; "Annual Premium paid"; Decimal)
        {
            Caption = 'Annual Premium Paid';
            FieldClass = FlowField;
            CalcFormula = Sum("G/L Entry"."Debit Amount" WHERE("Insurance Vendor No." = FIELD("No.")));
            Editable = false;
        }
        field(50003; "Annual Premium Balance"; Decimal)
        {
            Caption = 'Annual Premium Balance';
            Editable = false;
        }
        //TSA_ISMAIL Added fields
    }
}
