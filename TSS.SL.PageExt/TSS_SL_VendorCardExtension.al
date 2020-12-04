pageextension 50013 "Vendor Card Extension" extends "Vendor Card"
{
    layout
    {
        addafter("Purchaser Code")
        {
            field("Repo Fee Item No."; "Repo Fee Item No.")
            {
                ApplicationArea = all;
            }
        }
    }
}
