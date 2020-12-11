pageextension 50010 "Insurance Extension" extends "Insurance Card"
{
    layout
    {
        //TSA_ISMAIL Modified Policy No 
        modify("Policy No.")
        {
            Visible = false;
        }
        //TSA_ISMAIL_ modified Excess Amount position
        addafter("Last Date Modified")
        {
            field("Excess Amount"; "Excess Amount")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
        //TSA_ISMAIL_ modified Excess Amount position
        addafter("Annual Premium")
        {
            field("Annual Premium Paid"; Rec."Annual Premium Paid")
            {
                ApplicationArea = All;
            }
        }
        addafter("Policy Coverage")
        {
            field("Total Value Insured64422"; "Total Value Insured")
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Type of Coverage13543"; "Type of Coverage")
            {
                ApplicationArea = All;
            }
            field("Policy Holder05047"; "Policy Holder")
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    if not PolicyHolder.get("Policy Holder") then clear(PolicyHolder);
                end;
            }
            field("Policy Holder Name"; PolicyHolder.name)
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
        addafter("Insurance Vendor No.")
        {
            field("Insurer Name"; Insurer.name)
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
        addafter("Insurance Type")
        {
            field("Taxi No.24947"; "Taxi No.")
            {
                ApplicationArea = All;
            }
            //TSA_ISAMIL added contract No.
            field("Contract No."; "Contract No.")
            {
                ApplicationArea = all;
            }

            field("Driver No.37274"; "Driver No.")
            {
                ApplicationArea = All;
                //Visible = false; //TSA_ISMAIL modified
            }
        }
        /*         addafter("Policy No.")
                    {
                        field("Start Date99794"; "Start Date")
                        {
                            ApplicationArea = All;
                        }
                        field("Expiry Date53356"; "Expiry Date")
                        {
                            ApplicationArea = All;
                        }
                    } */
        addlast(Posting)
        {
            //      group(Cancellation)
            //      {
            field("Cancellation Date08960"; "Cancellation Date")
            {
                ApplicationArea = All;
            }
            field("Reimbursement from39718"; "Reimbursement from")
            {
                ApplicationArea = All;
            }
            field("Reimbursement to84438"; "Reimbursement to")
            {
                ApplicationArea = All;
            }
            field("Reimbursement Refund Date79114"; "Reimbursement Refund Date")
            {
                ApplicationArea = All;
            }
            field("Reimbursement Amount25897"; "Reimbursement Amount")
            {
                ApplicationArea = All;
            }
            field("Reimbursement Details72476"; "Reimbursement Details")
            {
                ApplicationArea = All;
            }
            field("NCB Transfer to Taxi37046"; "NCB Transfer to Taxi")
            {
                ApplicationArea = All;
            }
            field("NCB Transfer Date43044"; "NCB Transfer Date")
            {
                ApplicationArea = All;
            }
            field("NCB Transfer Remark82853"; "NCB Transfer Remark")
            {
                ApplicationArea = All;
            }
            field("Excess Amount65314"; "Excess Amount")
            {
                ApplicationArea = All;
                Visible = false; //TSA_ISMAIL_ modified Visibelity for Excess Amount
            }
            //    }
        }
        addlast(factboxes)
        {
            /*part("Driver Details"; "Driver Details FactBox")
            {
                ApplicationArea = all;
                SubPageLink = "No." = field("Driver No.");
            }*/   //TSA_ISMAIL blocked Code

            //TSA_ISMAIL added factboxes
            part(DriverFactbox; "Owner Details FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Taxi ID" = FIELD("Taxi No.");
                Visible = true;
            }
            //TSA_ISMAIL added factboxes

            part("Package Details"; "Taxi Details FactBox")
            {
                ApplicationArea = all;
                SubPageLink = "Taxi ID" = field("Taxi No.");
            }
            part("Attached Documents"; "Sunlight Attachments Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(5628), "No." = FIELD("No.");
            }
        }
        modify("Insurance Vendor No.")
        {
            trigger OnAfterValidate()
            begin
                if not Insurer.get("Insurance Vendor No.") then clear(Insurer);
            end;
        }
    }
    var
        PolicyHolder: record Vendor;
        Insurer: record Vendor;

    trigger OnAfterGetRecord()
    begin
        if not PolicyHolder.get("Policy Holder") then clear(PolicyHolder);
        if not Insurer.get("Insurance Vendor No.") then clear(Insurer);
    end;
}
