pageextension 50005 "GL Entry Extension" extends "General Ledger Entries"
{
    layout
    {
        addafter("G/L Account Name")
        {
            field("Contract No."; "Contract No.")
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
}
