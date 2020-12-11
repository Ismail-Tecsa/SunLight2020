table 50031 "Pass Card"
{
    Caption = 'Pass Card';
    DataClassification = ToBeClassified;
    LookupPageId = "Pass Card List";
    DrillDownPageId = "Pass Card List";

    fields
    {
        field(1; "Serial No."; Code[20])
        {
            Caption = 'Serial No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Driver No."; Code[10])
        {
            Caption = 'Driver No.';
            DataClassification = ToBeClassified;
            TableRelation = customer;
            //TSA_ISMAIL Driver Lookup
            trigger OnLookup()
            var
                Driver: Record Customer;
            begin
                Driver.Reset();
                Driver.SetRange(Contract, "Contract No.");
                if Page.RunModal(0, Driver) = Action::LookupOK then begin
                    "Driver No." := Driver."No.";
                end;
            end;
            //TSA_ISMAIL Driver Lookup
        }
        field(3; "Taxi ID"; Code[10])
        {
            Caption = 'Taxi ID';
            DataClassification = ToBeClassified;
            TableRelation = Taxis;
            trigger OnValidate()
            var
                Taxi: Record taxis;
                Contract: Record "Service Contract Line";
            Begin
                Taxi.Reset();
                Taxi.SetRange("Taxi ID", "Taxi ID");
                if Taxi.FindFirst() then begin
                    Contract.Reset();
                    Contract.SetRange("Taxi ID", Taxi."Taxi ID");
                    If Contract.FindLast() then Begin
                        "Contract No." := Contract."Contract No.";
                        //"Driver No." := Contract."Customer No.";
                    end;
                end;
            End;
        }
        field(4; "Contract No."; Code[10])
        {
            Caption = 'Contract No.';
            DataClassification = ToBeClassified;
            TableRelation = "Service Contract Header"."Contract No." where("Contract type" = const(Contract));
        }
        field(5; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Serial No.")
        {
            Clustered = true;
        }
    }

}
