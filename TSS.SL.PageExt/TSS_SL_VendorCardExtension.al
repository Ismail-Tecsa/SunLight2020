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
            //TSA_ISMAIL Added fields
            field("Annual Premium"; "Annual Premium")
            {
                ApplicationArea = all;
            }
            field("Annual Premium paid"; "Annual Premium paid")
            {
                ApplicationArea = all;
            }
            field("Annual Premium Balance"; "Annual Premium Balance")
            {
                ApplicationArea = all;
            }
            //TSA_ISMAIL Added fields
        }
    }
    //TSA_ISMAIL Added balance calculation
    trigger OnOpenPage()
    var
    begin
        CalcFields("Annual Premium");
        CalcFields("Annual Premium Paid");
        "Annual Premium Balance" := "Annual Premium" - "Annual Premium Paid";
        Modify();
        //Message('%1', "Annual Premium Balance");
    end;
    //TSA_ISMAIL Added balance calculation
}
