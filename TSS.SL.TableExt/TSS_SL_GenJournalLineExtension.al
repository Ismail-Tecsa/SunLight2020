tableextension 50004 "Gen. Journal Line Extension" extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            DataClassification = ToBeClassified;
            TableRelation = "Service Contract Header";
            //TSA_ISMAIL diaabled code
            /*trigger OnValidate()

            var
                SCH: record "Service Contract Header";
                SCL: record "Service Contract Line";

            begin
                if sch.get("Contract No.") then begin
                    "Driver No." := sch."Customer No.";
                    scl.reset;
                    scl.setrange("Contract No.", sch."Contract No.");
                    if scl.findfirst then
                        "Taxi No." := scl."Service Item No.";
                end;
            end;*/
            //TSA_ISMAIL diaabled code
        }
        field(50001; "Taxi No."; Code[20])
        {
            Caption = 'Taxi No.';
            TableRelation = taxis;
            DataClassification = ToBeClassified;
        }
        field(50002; "TIP Step"; Integer)
        {
            Caption = 'TIP Step';
            TableRelation = "TIP Entry".Step where("Taxi ID" = field("Taxi No."));
            DataClassification = ToBeClassified;
        }
        field(50003; "Driver No."; Code[20])
        {
            Caption = 'Driver No.';
            DataClassification = ToBeClassified;
            TableRelation = customer;
        }
        field(50004; "Taxi Company"; Text[30])
        {
            Caption = 'Taxi Company';
            DataClassification = ToBeClassified;
            TableRelation = Company;
        }
        field(50005; "Insurance Policy"; Text[30])
        {
            Caption = 'Insurance Policy';
            DataClassification = ToBeClassified;
            TableRelation = Insurance;
            //Tsa_ISMAIL Modified code
            trigger OnValidate()
            var
                Insurance: Record 5628;
                Taxi: Code[20];
            Begin
                Insurance.Reset();
                If Insurance.Get("Insurance Policy") then begin
                    "Driver No." := Insurance."Driver No.";
                    "Taxi No." := Insurance."Taxi No.";
                    "Annual Premium" := Insurance."Annual Premium";
                    "Insurance Vendor No." := Insurance."Insurance Vendor No.";
                    "Contract No." := Insurance."Contract No.";
                end;
            End;
            //Tsa_ISMAIL Modified code 
        }
        field(50006; "Days"; Integer)
        {
            trigger OnValidate()
            begin
            end;
        }
        //TSA_ISMAIL added field
        field(50007; "Annual Premium"; Decimal)
        {
            Caption = 'Annual Premium';
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(50008; "Insurance Vendor No."; Code[20])
        {
            Caption = 'Insurance Vendor No.';
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        //Tsa_Ismail Added field
        modify("Account No.")
        {
            trigger OnAfterValidate()
            begin
                "Taxi Company" := CompanyName;
            end;
        }
    }
    var
        SunLightMgmt: Codeunit "SunCab Journal Management";
}
