page 50020 "TIP Steps Subform"
{

    Caption = 'TIP Steps';
    PageType = ListPart;
    SourceTable = "TIP Entry";
    InsertAllowed = false;
    DeleteAllowed = false;
    LinksAllowed = false;
    MultipleNewLines = true;


    layout
    {
        area(content)
        {
            repeater("Taxi In Progress")
            {
                field(Step; Rec.Step)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Date Started"; Rec."Date Started")
                {
                    ApplicationArea = All;
                }
                field("Date Finished"; Rec."Date Finished")
                {
                    ApplicationArea = All;
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = All;
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {

        area(processing)
        {

            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                group("F&unctions")
                {
                    Caption = 'F&unctions';
                    Image = "Action";
                    action("Create Steps")
                    {
                        //AccessByPermission = TableData "Sales Price" = R;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Steps';
                        Ellipsis = true;
                        Image = New;

                        trigger OnAction()

                        var
                            tipmaster: Record "TIP Master Setup";
                            tipentry: Record "TIP Entry";
                        begin

                            tipentry.Reset();
                            tipentry.setrange("Taxi ID", "Taxi ID");
                            if tipentry.findfirst() then error('Steps already exist for this Taxi!');
                            tipmaster.reset;
                            tipmaster.findfirst;
                            repeat
                                clear(tipentry);
                                tipentry."Taxi ID" := "Taxi ID";
                                tipentry.Step := tipmaster."Step No.";
                                tipentry.Description := tipmaster.Description;
                                tipentry.insert;
                            until tipmaster.next = 0;

                        end;
                    }
                }
                action("Start Next Step")
                {
                    //AccessByPermission = TableData "Sales Price" = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Start Next Step';
                    Ellipsis = true;
                    Image = Start;

                    trigger OnAction()

                    var
                        tipmaster: record "TIP Master Setup";
                        tipentry: Record "TIP Entry";
                        taxis: record taxis;
                    begin

                        tipentry.Reset();
                        tipentry.setrange("Taxi ID", "Taxi ID");
                        tipentry.findfirst();

                        repeat
                            if tipentry.Status = tipentry.Status::Open then begin
                                tipmaster.get(tipentry.Step);
                                taxis.get("Taxi ID");
                                if ((tipmaster."Permit Change Locked") and not (taxis."Permit Locked")) then
                                    error('Cannot proceed, Permit must be locked');
                                tipentry.Status := tipentry.Status::"In Progress";
                                tipentry."Date Started" := WorkDate();
                                tipentry.Modify();
                                exit;
                            end;
                        until tipentry.next = 0;

                    end;
                }

                action("Complete Current Step")
                {
                    //AccessByPermission = TableData "Sales Price" = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Complete Current Step';
                    Ellipsis = true;
                    Image = Completed;

                    trigger OnAction()

                    var

                        tipentry: Record "TIP Entry";
                    begin

                        tipentry.Reset();
                        tipentry.setrange("Taxi ID", "Taxi ID");
                        tipentry.findfirst();

                        repeat
                            if tipentry.Status = tipentry.Status::"In Progress" then begin
                                tipentry.Status := tipentry.Status::"closed";
                                tipentry."Date finished" := WorkDate();
                                tipentry.Modify();
                                exit;
                            end;
                        until tipentry.next = 0;

                    end;
                }
            }
        }
    }

    trigger onaftergetrecord()
    var

    begin

    end;

    var


}
