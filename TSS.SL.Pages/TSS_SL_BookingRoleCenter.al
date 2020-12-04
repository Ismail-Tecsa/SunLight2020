page 50005 "Booking Manager Role Center"
{
    Caption = 'Booking Manager Role Center';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Queues; "Booking Manager Activities")
            {
                AccessByPermission = tabledata "customer" = R;
                ApplicationArea = Basic, Suite;
            }
            part(Queues2; "Permit Cues")
            {
                Caption = 'Permits';
                //AccessByPermission = tabledata "permit" = R;
                ApplicationArea = Basic, Suite;
            }
            part(Queues3; "Case Cues")
            {
                Caption = 'Case Management';
                //AccessByPermission = tabledata "permit" = R;
                ApplicationArea = Basic, Suite;
            }
            part(Queues4; "Settlement Cues")
            {
                Caption = 'Settlement';
                //AccessByPermission = tabledata "permit" = R;
                ApplicationArea = Basic, Suite;
            }
            systempart(BookingNotes; MyNotes)
            {
                ApplicationArea = Advanced;
            }
        }

    }

    actions
    {
        area(Embedding)
        {
            ToolTip = 'Manage Drivers, Processes, Bookings etc.';
            action("Case Management")
            {
                ApplicationArea = All;
                Caption = 'Case Management';
                RunObject = page "Case List";
            }
            action("Settlements")
            {
                ApplicationArea = all;
                Caption = 'Settlement';
                RunObject = page "Settlement List";
            }
            action(Drivers)
            {
                ApplicationArea = All;
                Caption = 'Drivers';
                RunObject = page "Driver List";
            }
            action(Contracts)
            {
                ApplicationArea = All;
                Caption = 'Contracts';
                RunObject = page "Service Contracts";
            }
            action(Permits)
            {
                ApplicationArea = All;
                Caption = 'Company Permits';
                RunObject = page "Permit List";
                //               RunPageLink = "Permit Company" = ;
            }
            action(Permits2)
            {
                ApplicationArea = All;
                Caption = 'Permit Overview';
                RunObject = page "permit overview";
            }
            action(Taxis)
            {
                ApplicationArea = All;
                Caption = 'Taxi';
                RunObject = page "Taxis";
            }
            action("ServiceItem")
            {
                ApplicationArea = all;
                Caption = 'Service Items';
                RunObject = page "Service Item List";
            }
            action(Inspections2)
            {
                ApplicationArea = all;
                Caption = 'Inspections';
                RunObject = page Inspections;
            }
            action(Insurance2)
            {
                ApplicationArea = all;
                Caption = 'Insurance';
                RunObject = page "Insurance List";
            }

        }

        area(Creation)
        {
            action(Driver)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Drivers';
                Image = Customer;
                Promoted = false;
                RunObject = Page "Driver Card";
                RunPageMode = Create;
                ToolTip = 'Create new Driver';
            }
            action(Taxi)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Taxi';
                Image = Customer;
                Promoted = false;
                RunObject = Page "Taxis";
                RunPageMode = Create;
                ToolTip = 'Create new Taxi';
            }
            action(Contract)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Contract';
                Image = Customer;
                Promoted = false;
                RunObject = Page "Service Contract";
                RunPageMode = Create;
                ToolTip = 'Create new contract';
            }
            action("Case")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Case';
                Image = Help;
                Promoted = false;
                RunObject = Page "Case Management Card";
                RunPageMode = Create;
                ToolTip = 'Create new case.';
            }
            action("Settlement")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Settlement';
                Image = FileContract;
                Promoted = false;
                RunObject = Page Settlement;
                RunPageMode = Create;
                ToolTip = 'Create new settlement.';
            }
        }

        area(Sections)
        {
            group("Group")
            {
                Caption = 'Sunlight Functions';
                action("Taxis3")
                {
                    ApplicationArea = All;
                    Caption = 'Taxis';
                    RunObject = page "Taxi List";
                }
                /*
                action("Items")
                {
                    ApplicationArea = All;
                    Caption = 'Items';
                    RunObject = page "Item List";
                }
                */
                /*             action("Contacts")
                               {
                                   ApplicationArea = All;
                                   Caption = 'Contacts';
                                   RunObject = page "Contact List";

                               }
               */
                action("Customers")
                {
                    ApplicationArea = All;
                    Caption = 'Drivers';
                    RunObject = page "Driver List";
                }
                action("Contracts3")
                {
                    ApplicationArea = All;
                    Caption = 'Contracts';
                    RunObject = page "Service Contracts";
                }
                action("Contract Quotes")
                {
                    ApplicationArea = All;
                    Caption = 'Contract Quotes';
                    RunObject = page "Service Contract Quotes";
                }
                action("Packages")
                {
                    ApplicationArea = All;
                    Caption = 'Package Scheme';
                    RunObject = page "Package Scheme List";
                }
                /*       action("Credit Memos")
                       {
                           ApplicationArea = All;
                           Caption = 'Service Credit Memos';
                           RunObject = page "Service Credit Memos";
                       }*/
                /*       action("Create Contract Orders")
                       {
                           ApplicationArea = All;
                           Caption = 'Create Contract Service Orders';
                           RunObject = report "Create Contract Service Orders";
                       }*/
                action("Driver Cash Receipt")
                {
                    ApplicationArea = All;
                    Caption = 'Driver Cash Receipt';
                    RunObject = report "Create Contract Invoices"; //mjr
                }
                group("Taxi Admin")
                {
                    //permit
                    //insurance
                    //roadtax
                    //inspection
                    Caption = 'Taxi Admin';
                    action(Taxis2)
                    {
                        ApplicationArea = all;
                        Caption = 'Taxi';
                        RunObject = page "Taxi List";
                    }
                    action(Inspections)
                    {
                        ApplicationArea = all;
                        Caption = 'Inspections';
                        RunObject = page Inspections;
                    }
                    action(Insurance)
                    {
                        ApplicationArea = all;
                        Caption = 'Insurance';
                        RunObject = page "Insurance List";
                    }
                    action(Permit)
                    {
                        ApplicationArea = all;
                        Caption = 'Permit';
                        RunObject = page "Permit List";
                    }
                }
                group("Group1")
                {
                    Caption = 'Contract Outstanding Payment';
                    action("Contract & Group")
                    {
                        ApplicationArea = All;
                        Caption = 'Contract Outstanding';
                        RunObject = page "Contract Gain/Loss (Groups)";
                    }
                    action("Contracts1")
                    {
                        ApplicationArea = All;
                        Caption = 'Contract Outstanding (Contract)';
                        RunObject = page "Contract Gain/Loss (Contracts)";
                    }
                    action("Customers1")
                    {
                        ApplicationArea = All;
                        Caption = 'Contract Outstanding (Driver)';
                        RunObject = page "Contract Gain/Loss (Customers)";
                    }

                    action("Responsibility Center")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Contract Outstanding (Taxi)';
                        RunObject = page "Contract Gain/Loss (Resp.Ctr)";
                    }
                }
                group("Group2")
                {
                    Caption = 'Reports';
                    /*               action("Contract - Salesperson")
                                   {
                                       ApplicationArea = All;
                                       Caption = 'Serv. Contract - Salesperson';
                                       RunObject = report "Serv. Contract - Salesperson";
                                   }
                                   action("Contr. GainLoss - Resp. Ctr.")
                                   {
                                       ApplicationArea = All;
                                       Caption = 'Contr. Gain/Loss - Resp. Ctr.';
                                       RunObject = report "Contr. Gain/Loss - Resp. Ctr.";
                                   }
                                   action("Contract - Customer")
                                   {
                                       ApplicationArea = All;
                                       Caption = 'Service Contract - Customer';
                                       RunObject = report "Service Contract - Customer";
                                   }
                                   action("Maintenance Visit - Planning")
                                   {
                                       ApplicationArea = All;
                                       Caption = 'Maintenance Visit - Planning';
                                       RunObject = report "Maintenance Visit - Planning";
                                   }
                                   action("Maintenance Performance")
                                   {
                                       ApplicationArea = All;
                                       Caption = 'Maintenance Performance';
                                       RunObject = report "Maintenance Performance";
                                   }
                                   action("Contract GainLoss Entries")
                                   {
                                       ApplicationArea = All;
                                       Caption = 'Contract Gain/Loss Entries';
                                       RunObject = report "Contract Gain/Loss Entries";
                                   }
                                   action("Contract Quotes to Be Signed")
                                   {
                                       ApplicationArea = All;
                                       Caption = 'Contract Quotes to Be Signed';
                                       RunObject = report "Contract Quotes to Be Signed";
                                   }*/
                    action("Profit (Contracts)")
                    {
                        ApplicationArea = All;
                        Caption = 'Service Profit (Contracts)';
                        RunObject = report "Service Profit (Contracts)";
                    }
                    /*                    action("Service Items1")
                                        {
                                            ApplicationArea = All;
                                            Caption = 'Service Items';
                                            RunObject = report "Service Items";
                                        }
                                        action("Service Items Out of Warranty")
                                        {
                                            ApplicationArea = All;
                                            Caption = 'Service Items Out of Warranty';
                                            RunObject = report "Service Items Out of Warranty";
                                        }
                                        action("Service Item Line Labels")
                                        {
                                            ApplicationArea = All;
                                            Caption = 'Service Item Line Labels';
                                            RunObject = report "Service Item Line Labels";
                                        }*/
                }
            }


            group("Group5")
            {
                Caption = 'Order Processing';
                action(Taxis4)
                {
                    ApplicationArea = All;
                    Caption = 'Taxi';
                    RunObject = page "Taxi List";
                }


                action("Customers2")
                {
                    ApplicationArea = All;
                    Caption = 'Drivers';
                    RunObject = page "Customer List";
                }

                action("Contracts2")
                {
                    ApplicationArea = All;
                    Caption = 'Contracts';
                    RunObject = page "Service Contracts";
                }


                action("Admin")
                {
                    ApplicationArea = All;
                    Caption = 'Admin';
                    RunObject = page "System Utilities";
                }
                group("Group6")
                {
                    Caption = 'Posted Documents';
                    action("Posted Credit Memos")
                    {
                        ApplicationArea = All;
                        Caption = 'Posted Payments';
                        RunObject = page "Posted Service Credit Memos"; //MJR
                    }
                }
                group("Group10")
                {
                    Caption = 'Setup';
                    action("Service Setup")
                    {
                        ApplicationArea = ALl;
                        Caption = 'Service Setup';
                        RunObject = page "Service Mgt. Setup";
                    }
                    action("Package Schemes")
                    {
                        ApplicationArea = ALl;
                        Caption = 'Package Schemes';
                        RunObject = page "Package Scheme List";
                    }
                    action("Package Category Codes")
                    {
                        ApplicationArea = all;
                        Caption = 'Package Category Codes';
                        RunObject = page "Package Category List";
                    }
                    action("Festival Discount Schemes")
                    {
                        ApplicationArea = ALL;
                        Caption = 'Festival Discount Schemes';
                        RunObject = page "Festival Discount Schemes";
                    }
                    action("TIP Master Steps")
                    {
                        ApplicationArea = All;
                        caption = 'TIP Master Steps';
                        RunObject = page "TIP Master Steps";
                    }

                    action("Car Make")
                    {
                        ApplicationArea = all;
                        caption = 'Car Make';
                        RunObject = page "Car Make";
                    }
                    action("Car Model")
                    {
                        ApplicationArea = all;
                        caption = 'Car Model';
                        RunObject = page "Car Model";
                    }
                    action("SunCab Bank Setup")
                    {
                        ApplicationArea = All;
                        caption = 'SunCab Bank Setup';
                        RunObject = page "SunCab Bank Setup";
                    }
                    action("SunCab Gen Jnl Lines")
                    {
                        ApplicationArea = all;
                        Caption = 'SunCab Journal Lines';
                        RunObject = page "SunCab Gen Journal Line";
                    }
                    action("Settlement Line Template")
                    {
                        ApplicationArea = all;
                        RunObject = page "Settlement Line Template";
                    }
                }
            }
        }

    }

}