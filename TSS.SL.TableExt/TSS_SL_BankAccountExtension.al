tableextension 50007 "Bank Account Extension" extends "Bank Account"
{
    fields
    {
        field(50000; "Transaction Type"; Code[20])
        {
            Caption = 'Transaction Type';
            DataClassification = CustomerContent;
            TableRelation = "SunCab Bank Setup";
            //TSA_ISMAIL
        }
    }
}
