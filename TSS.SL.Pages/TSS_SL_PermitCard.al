page 50013 "Permit Card"
{
    Caption = 'Permit Card';
    PageType = Card;
    SourceTable = Permit;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Permit ID"; Rec."Permit ID")
                {
                    ApplicationArea = All;
                }
                field("Permit ref. no."; "Permit Ref. No.")
                {
                    ApplicationArea = All;
                }
                field("Set ID"; "Set ID")
                {
                    ApplicationArea = All;
                }
                field("Permit Status"; Rec."Permit Status")
                {
                    ApplicationArea = All;
                }
                field(Locked; Locked)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Offer Letter Start Date"; "Offer Letter Start Date")
                {
                    ApplicationArea = All;
                }
                field("Offer Letter End Date"; "Offer Letter End Date")
                {
                    ApplicationArea = All;
                }
                field("Permit Condition"; Rec."Permit Condition")
                {
                    ApplicationArea = All;
                }
                field("Permit Comany"; Rec."Permit Company")
                {
                    ApplicationArea = All;
                }
                field("Management Company"; Rec."Management Company")
                {
                    ApplicationArea = All;
                }
                field("License Class"; Rec."License Class")
                {
                    ApplicationArea = All;
                }
                field("Passenger No."; Rec."Passenger No.")
                {
                    ApplicationArea = All;
                }
                field("Seating Capacity"; Rec."Seating Capacity")
                {
                    ApplicationArea = All;
                }
                field("Special Condition"; Rec."Special Condition")
                {
                    ApplicationArea = All;
                }
                field("Permit Start Date"; Rec."Permit Start Date")
                {
                    ApplicationArea = All;
                }
                field("Permit End Date"; Rec."Permit End Date")
                {
                    ApplicationArea = All;
                }
                field("Service Location"; Rec."Service Location")
                {
                    ApplicationArea = All;
                }
                field("Taxi No."; Rec."Taxi No.")
                {
                    ApplicationArea = All;
                }
                //TSA_ISMAIL Added fields
                field("Permit Cancellation Date"; "Permit Cancellation Date")
                {
                    ApplicationArea = all;
                }
                field("Pre –SK Submission"; "Pre –SK Submission")
                {
                    ApplicationArea = all;
                }
                field("Pre SK Submission Date"; "Pre SK Submission Date")
                {
                    ApplicationArea = all;
                }
                field("Extend Subm. Date"; "Extend Subm. Date")
                {
                    ApplicationArea = all;
                }

            }
            //TSA_ISMAIL Added Group and fileds 
            group("Permit Renewal")
            {
                field("Document to SPAD"; "Document to SPAD")
                {
                    ApplicationArea = All;
                }
                field("Permit Copy"; "Permit Copy")
                {
                    ApplicationArea = all;
                }
                field("Grand Copy"; "Grand Copy")
                {
                    ApplicationArea = all;
                }
                field("Issue GPC to Runner"; "Issue GPC to Runner")
                {
                    ApplicationArea = all;
                }
                field("GPC No."; "GPC No.")
                {
                    ApplicationArea = all;
                }
                field("GPC Date Issued"; "GPC Date Issued")
                {
                    ApplicationArea = all;
                }
                field("GPC Amount"; "GPC Amount")
                {
                    ApplicationArea = all;
                }
                field("Name of Receive"; "Name of Receive")
                {
                    ApplicationArea = all;
                }
                field("Received Date"; "Received Date")
                {
                    ApplicationArea = all;
                }
                field("Expenses Category"; "Expenses Category")
                {
                    ApplicationArea = all;
                }
                field("Expenses Description"; "Expenses Description")
                {
                    ApplicationArea = all;
                }
                field("Invoice Date"; "Invoice Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Invoice No."; "Invoice No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Handle By"; "Handle By")
                {
                    ApplicationArea = all;
                }
                field("Remark"; "Remark")
                {
                    ApplicationArea = all;
                }
                field("Renewal Status"; "Renewal Status")
                {
                    ApplicationArea = all;
                }
                field("TOD Received"; "TOD Received")
                {
                    ApplicationArea = all;
                }
                field("TOD Received Date"; "TOD Received Date")
                {
                    ApplicationArea = all;
                }
                field("Recived By"; "Received By")
                {
                    ApplicationArea = all;
                }
                field("Received By Date"; "Received By Date")
                {
                    ApplicationArea = all;
                }
                field("Branch SPAD"; "Branch SPAD")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Payment Info"; "Payment Info")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Payment method"; "Payment method")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Date Call/Time"; "Date Call/Time")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Date confirm payment"; "Date confirm payment")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
            }
            //TSA_ISMAIL Added Group and fileds
            part(History; "Permit History")
            {
                ApplicationArea = all;
                Caption = 'Permit History';
                SubPageLink = "Permit ID" = FIELD("Permit ID");

            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Sunlight Attachments Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(50007), "No." = FIELD("Permit ID");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Lock)
            {
                ApplicationArea = all;

                trigger OnAction()
                var
                    PermHistory: record "Permit History";
                    entry: Integer;
                begin
                    testfield(Locked, false);
                    LockPermit();
                end;
            }
            action(Unlock)
            {
                ApplicationArea = all;

                trigger OnAction()
                begin
                    Locked := false;
                    modify;
                end;
            }
        }
    }
    //TSA_ISMAIL Permit Cancellation Date auto fill
    trigger OnAfterGetCurrRecord()
    var
        CaseMana: Record 50015;
        CasePG10: Record 50030;
        CaseId: code[10];
    begin
        CaseMana.Reset();
        Clear(CaseId);
        CaseMana.SetRange("Permit ID", "Permit ID");
        If CaseMana.FindSet() then
            CaseId := CaseMana."Case ID";
        CasePG10.SetRange("Case ID", CaseId);
        If CasePG10.FindSet() then
            "Permit Cancellation Date" := CasePG10."Permit Cancellation Date";
        Modify();
        Message('%1', "Permit Cancellation Date");
    end;
    //TSA_ISMAIL Permit Cancellation Date auto fill
}
