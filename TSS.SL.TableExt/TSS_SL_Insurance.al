tableextension 50009 "Insurance Extension" extends "Insurance"
{
    fields
    {
        //TSA_ISMAIL Modified No as Policy No
        modify("No.")
        {
            Caption = 'Policy No.';
        }
        //TSA_ISMAIL Modified Policy No as Policy New No.
        modify("Policy No.")
        {
            Caption = 'Policy new No.';
        }
        field(50000; "Type of Coverage"; Option)
        {
            Caption = 'Type of Coverage';
            OptionMembers = "Motor","Non-Motor";
            DataClassification = CustomerContent;
        }
        field(50001; "Policy Holder"; Text[30])
        {
            //permit company
            Caption = 'Policy Holder';
            TableRelation = Company; //TSA_ISMAIL Modified tablerelation for policy holder
            DataClassification = CustomerContent;
        }
        field(50002; "Taxi No."; Code[10])
        {
            Caption = 'Taxi No.';
            TableRelation = Taxis;
            DataClassification = CustomerContent;
            //TSA_ISMAIL Added contract and driver to flow when user select Item
            trigger OnValidate()
            var
                driver: record customer;
                taxi: record taxis;
                ContractLine: record "Service Contract Line";
            begin
                if taxi.get("Taxi No.") then begin
                    ContractLine.Reset();
                    ContractLine.setrange("Taxi ID", "Taxi No.");
                    if ContractLine.FindLast() then begin
                        validate("Contract No.", ContractLine."Contract No.");
                        Validate("Driver No.", ContractLine."Customer No.");
                        //   Message('%1', "Driver No.");
                    end;
                end;
            end;
            //TSA_ISMAIL Added contract and driver to flow when user select Item
        }
        field(50003; "Driver No."; Code[20])
        {
            Caption = 'Driver No.';
            TableRelation = customer;
            DataClassification = CustomerContent;
        }
        field(50016; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = CustomerContent;
        }
        field(50004; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
            DataClassification = CustomerContent;
        }
        field(50005; "Annual Premium Paid"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("G/L Entry"."Debit Amount" WHERE("Insurance Policy" = FIELD("No.")));
            Editable = false;
            Caption = 'Annual Premium Paid';
        }
        field(50006; "Cancellation Date"; Date)
        {
            Caption = 'Cancellation Date';
            DataClassification = CustomerContent;
        }
        field(50007; "Reimbursement from"; Date)
        {
            Caption = 'Reimbursement from';
            DataClassification = CustomerContent;
        }
        field(50008; "Reimbursement to"; Date)
        {
            Caption = 'Reimbursement to';
            DataClassification = CustomerContent;
        }
        field(50009; "Reimbursement Refund Date"; Date)
        {
            Caption = 'Reimbursement Refund Date';
            DataClassification = CustomerContent;
        }
        field(50010; "Reimbursement Amount"; Decimal)
        {
            Caption = 'Reimbursement Amount';
            DataClassification = CustomerContent;
        }
        field(50011; "Reimbursement Details"; Text[50])
        {
            Caption = 'Reimbursement Details';
            DataClassification = CustomerContent;
        }
        field(50012; "NCB Transfer to Taxi"; Code[10])
        {
            Caption = 'NCB Transfer to Taxi';
            DataClassification = CustomerContent;
        }
        field(50013; "NCB Transfer Date"; Date)
        {
            Caption = 'NCB Transfer Date';
            DataClassification = CustomerContent;
        }
        field(50014; "NCB Transfer Remark"; Text[50])
        {
            Caption = 'NCB Transfer Remark';
            DataClassification = CustomerContent;
        }
        field(50015; "Excess Amount"; decimal)
        {
            Caption = 'Excess Amount';
            DataClassification = CustomerContent;
        }
        //TSA_ISMAIL added Contract 
        field(50020; "Contract No."; code[20])
        {
            Caption = 'Contract No.';
            //TableRelation = "Service Contract Header";
            // DataClassification = CustomerContent;
        }
    }
}
