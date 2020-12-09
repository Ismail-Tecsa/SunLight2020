pageextension 50008 "Gen. Journal Extension" extends "General Journal"
{
    layout
    {
        addafter("Account No.")
        {
            field("Insurance Policy"; "Insurance Policy")
            {
                ApplicationArea = all;
            }

            field("Taxi No."; "Taxi No.")
            {
                ApplicationArea = all;

            }
            field("Driver No."; "Driver No.")
            {
                ApplicationArea = all;
            }
            field("Contract No."; "Contract No.")
            {
                ApplicationArea = all;
            }
            field("Insurance Vendor No."; "Insurance Vendor No.")
            {
                ApplicationArea = all;
                Visible = false; //TSA_ISMAIl added Incurance vendor No 
            }
            field("Annual Premium"; "Annual Premium")
            {
                ApplicationArea = all;
            }
            field("TIP Step"; "TIP Step")
            {
                ApplicationArea = all;
            }
            field("Taxi Company"; "Taxi Company")
            {
                ApplicationArea = all;
            }
        }

    }

    actions
    {
        addafter("Opening Balance")
        {
            group("SunCab Functions")
            {
                action("Get Payments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Get Payments';
                    Image = Entries;
                    Promoted = true;
                    PromotedIsBig = true;
                    ToolTip = 'Get daily entries for Sun Cab.';

                    trigger OnAction()

                    var
                        Customer: Record Customer;
                        CreateSunCabJournalLines: Report "Create SunCab Journal Lines";
                        DocumentTypes: Option;
                        PostingDate: Date;
                    begin

                        //CreateCustomerJournalLines.SetTableView(Customer);
                        //PostingDate := GetPostingDate();
                        CreateSunCabJournalLines.InitializeRequest(DocumentTypes, PostingDate, PostingDate);
                        CreateSunCabJournalLines.InitializeRequestTemplate("Journal Template Name", "Journal Batch Name", '');
                        CreateSunCabJournalLines.UseRequestPage(false);
                        //CreateCustomerJournalLines.SetDefaultDocumentNo(CurrentDocNo);
                        Commit();  // Commit is required for Create Lines.
                        CreateSunCabJournalLines.Run();
                    end;
                }
            }
        }
    }

}
