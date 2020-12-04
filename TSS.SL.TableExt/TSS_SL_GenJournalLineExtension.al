tableextension 50004 "Gen. Journal Line Extension" extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            DataClassification = ToBeClassified;
            TableRelation = "Service Contract Header";

            trigger OnValidate()

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
            end;
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
            //TableRelation = customer;
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
            trigger OnValidate()
            var
                Insurance: Record 5628;
                Taxi: Code[20];
            Begin
                If Insurance.Get("Insurance No.", "Insurance No.") then Begin
                    //  Message('%1', Insurance."No.");
                    "Taxi No." := Insurance."Taxi No.";
                    //Message('%1', Taxi);
                    "Driver No." := Insurance."Driver No.";
                End;
            End;
        }
        field(50006; "Days"; Integer)
        {
            trigger OnValidate()
            begin

            end;
        }

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
