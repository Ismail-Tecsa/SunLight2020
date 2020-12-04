tableextension 50011 "Vendor Extension" extends Vendor
{
    fields
    {
        field(50000; "Repo Fee Item No."; Code[20])
        {
            Caption = 'Repo Fee Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item where(Type = const(Service));
        }

    }
}
