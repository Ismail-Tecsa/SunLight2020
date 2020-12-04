page 50104 Taxis
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Taxis;
    Editable = True;

    layout
    {
        area(Content)
        {
            group(Taxis)
            {
                field("Taxi ID"; "Taxi ID")
                {
                    ApplicationArea = All;

                }
                field("Taxi Plate"; "Taxi Plate")
                {
                    ApplicationArea = All;

                }

                field(Company; "Company")
                {
                    ApplicationArea = All;

                }


                field(URL; "URL")
                {
                    ApplicationArea = All;

                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                }
                field("Active Contract"; "Active Contract")
                {
                    ApplicationArea = all;
                }
                field("Permit ID"; "Permit ID")
                {
                    ApplicationArea = all;
                }
                field("Permit Locked"; "Permit Locked")
                {
                    ApplicationArea = all;
                }
                field(Finance; "Finance")
                {
                    ApplicationArea = all;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = all;
                }
                field("Car Type"; Rec."Car Type")
                {
                    ApplicationArea = All;
                }
                field("Chassis No."; Rec."Chassis No.")
                {
                    ApplicationArea = All;
                }
                field("Engine No."; Rec."Engine No.")
                {
                    ApplicationArea = All;
                }
                field(Bank; Rec.Bank)
                {
                    ApplicationArea = All;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                }
                field("Private Plate"; Rec."Private Plate")
                {
                    ApplicationArea = All;
                }

                field("Meter TR1"; Rec."Meter TR1")
                {
                    ApplicationArea = All;
                }
                field("Meter T1 Date"; Rec."Meter T1 Date")
                {
                    ApplicationArea = All;
                }
                field("Meter TR2"; Rec."Meter TR2")
                {
                    ApplicationArea = All;
                }


                field("NGV Cert. Ref."; Rec."NGV Cert. Ref.")
                {
                    ApplicationArea = All;
                }
                field("NGV Cert Date"; Rec."NGV Cert Date")
                {
                    ApplicationArea = All;
                }
                field("NGV Installation"; Rec."NGV Installation")
                {
                    ApplicationArea = All;
                }
                field("On the Road Date"; Rec."On the Road Date")
                {
                    ApplicationArea = All;
                }
            }
            group("Custom Exemption")
            {

                field("Custom Exemption Submit Date"; Rec."Custom Exemption Submit Date")
                {
                    ApplicationArea = All;
                }

                field("Custom Exemption Return Date"; Rec."Custom Exemption Return Date")
                {
                    ApplicationArea = All;
                }

                field("K1 Receive Date"; Rec."K1 Receive Date")
                {
                    ApplicationArea = All;
                }

                field("Sales Letter Receive Date"; Rec."Sales Letter Receive Date")
                {
                    ApplicationArea = All;
                }
                field("Custom Exemption Cheque issued"; Rec."Custom Exemption Cheque issued")
                {
                    ApplicationArea = All;
                }
            }
            group("Puspakom Inspection")
            {
                field("Inspected by"; Rec."Inspected by")
                {
                    ApplicationArea = All;
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = All;
                }
                field("Next Inspection Date"; Rec."Next Inspection Date")
                {
                    ApplicationArea = All;
                }
                field("Puspakom Booking Date"; Rec."Puspakom Booking Date")
                {
                    ApplicationArea = All;
                }
                field("Puspakom Inspection Report Date"; Rec."Puspakom Insp. Report Date")
                {
                    ApplicationArea = All;
                }
            }
            group("JPJ Registration")
            {

                field("JPJ Submission Date"; Rec."JPJ Submission Date")
                {
                    ApplicationArea = All;
                }
                field("JPJ Return Date"; Rec."JPJ Return Date")
                {
                    ApplicationArea = All;
                }
            }
            group("Geran")
            {

                field("Car Make"; Rec."Car Make")
                {
                    ApplicationArea = All;
                }
                field("Car Model"; Rec."Car Model")
                {
                    ApplicationArea = All;
                }
                field("Engine CC"; Rec."Engine CC")
                {
                    ApplicationArea = All;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;
                }
                field(Colour; Rec.Colour)
                {
                    ApplicationArea = All;
                }
                field("Body Type"; Rec."Body Type")
                {
                    ApplicationArea = All;
                }
                field("Year Made"; Rec."Year Made")
                {
                    ApplicationArea = All;
                }
                field("Date of Registration"; Rec."Date of Registration")
                {
                    ApplicationArea = All;
                }
            }
            group("Spec - Fixed Permit")
            {

                field("Yellow Card"; Rec."Yellow Card")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Planned Collection Date"; Rec."Planned Collection Date")
                {
                    ApplicationArea = All;
                    Importance = Standard;
                }
                field("Actual Collection Date"; Rec."Actual Collection Date")
                {
                    ApplicationArea = All;
                    Importance = Standard;

                }
            }
            group("Insurance")
            {
                field("Insurance Submission"; "Insurance Submission")
                {
                    ApplicationArea = all;
                    Importance = Standard;
                }
            }
            group("Road Tax")
            {
                field("Road Tax Serial No."; "Road Tax Serial No.")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Road Tax Start Date"; "Road Tax Start Date")
                {
                    ApplicationArea = all;
                    Importance = Standard;
                }
                field("Road Tax End Date"; "Road Tax End Date")
                {
                    ApplicationArea = all;
                    Importance = Standard;
                }
                field("Grant VR1"; Rec."Grant VR1")
                {
                    ApplicationArea = All;
                }
                field("Grant VR1 Received Date"; Rec."Grant VR1 Received Date")
                {
                    ApplicationArea = All;
                }

            }


            part("Taxi in Progress"; "TIP Steps Subform")
            {
                ApplicationArea = all;
                Caption = 'Taxi In Progress';
                SubPageLink = "Taxi ID" = FIELD("Taxi ID");
                UpdatePropagation = Both;
            }
        }

        area(factboxes)
        {

            part("Owner Details"; "Owner Details FactBox")
            {
                ApplicationArea = all;
                SubPageLink = "Taxi ID" = field("Taxi ID");
            }
            part("Attached Documents"; "Sunlight Attachments Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(50000),
                               "No." = FIELD("Taxi ID");
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Inspections)
            {
                ApplicationArea = All;
                RunObject = page Inspections;
                RunPageLink = "Taxi ID" = field("Taxi ID");
                RunPageView = sorting("Taxi ID");
            }
            action(ServiceItem)
            {
                ApplicationArea = all;
                Caption = 'Create Service Item';
                trigger OnAction()
                var
                    servitem: Record "Service Item";
                    servitemgrp: Record "Service Item Group";
                begin
                    if servitem.get("Taxi ID") then
                        error('Service Item already exists');

                    clear(servitem);
                    servitem.init;
                    servitem."No." := "Taxi ID";
                    if servitemgrp.get("Car Type") then
                        servitem.Validate(Description, servitemgrp.Description)
                    else
                        servitem.validate(Description, "Taxi Plate");
                    servitem.insert;
                end;
            }
        }

        area(Navigation)
        {
            action("Ledger Entry")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Ledger E&ntries';
                Image = Ledger;
                Promoted = true;
                //PromotedCategory = Category9;
                PromotedIsBig = true;
                RunObject = Page "Taxi Ledger Entries";
                RunPageLink = "taxi ID" = FIELD("Taxi ID");
                //  RunPageView = SORTING("Customer No.")
                //                ORDER(Descending);
                //  ShortCutKey = 'Ctrl+F7';
                ToolTip = 'View the history of transactions that have been posted for the selected record.';
            }
        }

    }

    var
        myInt: Integer;
}

page 50105 "Taxi List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Taxis;
    Editable = false;
    CardPageId = "Taxis";

    layout
    {
        area(Content)
        {
            repeater(Taxis)
            {
                field(ID; "Taxi ID")
                {
                    ApplicationArea = All;

                }
                field(TaxiPlate; "Taxi Plate")
                {
                    ApplicationArea = All;

                }
                //field(PrivatePlate; "Private Plate")
                //{
                //    ApplicationArea = All;

                //}
                //field(Company; "Company")
                //{
                //    ApplicationArea = All;

                //}

                field(URL; "URL")
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}