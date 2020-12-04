page 50038 Settlement
{

    Caption = 'Settlement';
    PageType = Document;
    SourceTable = "Settlement Header";
    RefreshOnActivate = true;
    PromotedActionCategories = 'New,Process';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Settlement ID"; Rec."Settlement ID")
                {
                    ApplicationArea = All;
                }
                field("Settlement Type"; Rec."Settlement Type")
                {
                    ApplicationArea = All;
                }
                field("Taxi ID"; Rec."Taxi ID")
                {
                    ApplicationArea = All;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Cut off Date"; Rec."Cut off Date")
                {
                    ApplicationArea = All;
                }
                field("Cutoff Overdue Days"; "Cutoff Overdue Days")
                {
                    ApplicationArea = all;
                }
                field("Cutoff Overdue Amount"; "Cutoff Overdue Amount")
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = All;
                }
                field("Dismantle No."; Rec."Dismantle No.")
                {
                    ApplicationArea = All;
                }
                field("PG10 No."; Rec."PG10 No.")
                {
                    ApplicationArea = All;
                }
                field("Repo No."; Rec."Repo No.")
                {
                    ApplicationArea = All;
                }
            }
            group(Approval)
            {
                field("Supervisor Approval"; Rec."Supervisor Approval")
                {
                    ApplicationArea = All;
                }
                field("Supervisor ID"; Rec."Supervisor ID")
                {
                    ApplicationArea = All;
                }
                field("Management Approval"; Rec."Management Approval")
                {
                    ApplicationArea = All;
                }
                field("Management ID"; Rec."Management ID")
                {
                    ApplicationArea = All;
                }
            }

            part("Settlement Lines"; "Settlement Line Subform")
            {
                ApplicationArea = all;
                Caption = 'Lines';
                SubPageLink = "Document No." = FIELD("Settlement ID");
                UpdatePropagation = Both;
            }

            group(Totals)
            {
                field("Settlement Amount"; "Settlement Amount")
                {
                    ApplicationArea = all;
                }
                field("Settlement Paid"; "Settlement Paid")
                {
                    ApplicationArea = all;
                }
            }
            group(Closure)
            {
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = All;
                }
                field("Account Closed Date"; Rec."Account Closed Date")
                {
                    ApplicationArea = All;
                }
                field("Internal Blacklist"; Rec."Internal Blacklist")
                {
                    ApplicationArea = All;
                }
                field("TAXI.COM"; Rec."TAXI.COM")
                {
                    ApplicationArea = All;
                }
                field(CTOS; Rec.CTOS)
                {
                    ApplicationArea = All;
                }
                field(Transferee; Rec.Transferee)
                {
                    ApplicationArea = All;
                }
            }
        }


        area(factboxes)
        {


            part(OwnerFactbox; "Owner Details FactBox")
            {
                ApplicationArea = all;
                SubPageLink = "Taxi ID" = FIELD("Taxi ID");
                // Visible = ("Taxi ID" <> '');
            }

            part("Taxi Details"; "Taxi Details FactBox")
            {
                ApplicationArea = all;
                SubPageLink = "Taxi ID" = field("Taxi ID");
                //  Visible = ("Taxi ID" <> '');

            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                //  Visible = ("Taxi ID" <> '');
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(50022),
                              "No." = FIELD("Settlement ID");

            }

            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                //  Visible = ("Taxi ID" <> '');
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                //  Visible = ("Taxi ID" <> '');
            }
        }
    }

    actions
    {
        area(Processing)
        {
            //    group(Approvals)
            //   {
            action("Request Approval")
            {
                ApplicationArea = all;
                trigger OnAction()
                begin
                    TestField(Status, status::"In Progress");
                    status := status::"Pending Approval";
                    "Supervisor Approval" := "Supervisor Approval"::"Pending Approval";
                    "Management Approval" := "Management Approval"::"Pending Approval";
                    modify;
                end;
            }
            action("Cancel Request Approval")
            {
                ApplicationArea = all;
                trigger OnAction()
                begin
                    TestField(status, status::"Pending Approval");
                    status := Status::"In Progress";
                    "Supervisor Approval" := "Supervisor Approval"::" ";
                    "Supervisor ID" := '';
                    "Management Approval" := "Management Approval"::" ";
                    modify;
                end;
            }

            action("Approve")
            {
                ApplicationArea = all;
                trigger OnAction()

                var
                    UserSetup: record "User Setup";

                begin
                    TestField(Status, status::"Pending Approval");
                    usersetup.get(userid);
                    if UserSetup."Supervisor Approver" then begin
                        "Supervisor Approval" := "Supervisor Approval"::Approved;
                        Status := Status::"Pending Payment";
                        "Supervisor ID" := userid;
                        Modify();
                    end;
                    if UserSetup."management Approver" then begin
                        "Management Approval" := "Management Approval"::Approved;
                        if Status = Status::"Pending Approval" then
                            Status := Status::"Pending Payment";
                        "Management ID" := userid;
                        Modify();
                    end;
                end;
            }
            //     }

            //   group("Status Change")

            // {

            action("Close Settlement")
            {
                ApplicationArea = all;
                trigger OnAction()

                var
                    SetLines: record "Settlement Lines";
                    SetLines2: Record "Settlement Lines";

                begin

                    testfield(status, status::"Pending Payment");

                    if confirm('Are you sure you want to close this settlement?') then begin
                        status := status::Closed;
                        modify;

                        SetLines.reset;
                        setlines.SetRange("Document No.", "Settlement ID");
                        if SetLines.findlast then begin
                            clear(SetLines2);
                            SetLines2."Document No." := "Settlement ID";
                            SetLines2."Line No." := SetLines."Line No." + 10000;
                            SetLines2.Validate(code, 'CLOSED');
                            SetLines2.insert;
                        end;

                    end;
                end;

            }

            action("Cancel Settlement")
            {
                ApplicationArea = all;
                trigger OnAction()
                begin

                    if "PG10 No." <> '' then
                        error('You cannot cancel a settlement that already has a PG10');

                    if confirm('Are you sure you want to cancel this settlement?') then begin
                        Status := Status::Cancelled;
                        Modify();
                    end;
                end;
            }
            //    }
        }
    }

    trigger OnAfterGetRecord()

    begin
        CalcFields("Settlement Amount", "Settlement Paid", "Cutoff Overdue Amount", "Cutoff Overdue Days");
    end;

    trigger OnAfterGetCurrRecord()
    begin
        CalcFields("Settlement Amount", "Settlement Paid", "Cutoff Overdue Amount", "Cutoff Overdue Days");
    end;

}
