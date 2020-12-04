pageextension 50007 "Bank Card Extension" extends "Bank Account Card"
{
    layout
    {
        addafter("Bank Account No.")
        {
            field("Transaction Type"; "Transaction Type")
            {
                Importance = Standard;
                ApplicationArea = all;
            }
        }
    }
}
