tableextension 50000 "Customer Extension" extends Customer
{
    fields
    {
        modify(Name)
        {

            trigger OnAfterValidate()
            var
                contact: Record contact;
            begin
                if rec.name <> xRec.name then begin
                    if "Primary Contact No." = '' then
                        rec.validate(contact, name)
                    else begin
                        contact.get("Primary Contact No.");
                        contact.Validate(name, name);
                        contact.modify
                    end;
                end;
            end;
        }
        field(50000; NRIC; Text[20])
        {
            Caption = 'NRIC';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                contact: Record contact;
            begin
                if rec.NRIC <> xRec.NRIC then begin
                    if "Primary Contact No." <> '' then
                        if contact.get("Primary Contact No.") then begin
                            contact.Validate(NRIC, NRIC);
                            contact.modify
                        end;
                end;
            end;
        }

        field(50001; "Date joined"; date)
        {
            caption = 'Date joined';
            DataClassification = CustomerContent;
        }
        field(50002; "Driver Status"; option)
        {
            caption = 'Driver Status';
            OptionMembers = "In Progress","Pending Approval","Approved","Rejected","Active","In-Active";
            DataClassification = CustomerContent;
        }
        field(50003; "Original IC sighted"; Boolean)
        {
            Caption = 'Original IC sighted';
            DataClassification = CustomerContent;
        }
        field(50004; "Place of Birth"; text[50])
        {
            caption = 'Place of Birth';
            DataClassification = CustomerContent;
        }
        field(50005; "Staying Period"; text[10])
        {
            Caption = 'Current Address Staying Period.';
            DataClassification = CustomerContent;
        }
        field(50006; "Home Town"; text[50])
        {
            caption = 'Home Town';
            DataClassification = CustomerContent;
        }
        field(50007; "Driving License No."; Text[20])
        {
            caption = 'Driving License No.';
            DataClassification = CustomerContent;
        }
        field(50008; "Driving License Expiry"; date)
        {
            caption = 'Driving License Expiry Date.';
            DataClassification = CustomerContent;
        }
        field(50009; "PSV License No."; Text[20])
        {
            caption = 'PSV License No.';
            DataClassification = CustomerContent;
        }
        field(50010; "PSV License Expiry"; date)
        {
            caption = 'PSV License Expiry Date.';
            DataClassification = CustomerContent;
        }
        field(50011; "Utility Bill received"; Boolean)
        {
            Caption = 'Utility Bill received';
            DataClassification = CustomerContent;
        }
        field(50012; "Quit Rent"; Boolean)
        {
            Caption = 'Quit Rent';
            DataClassification = CustomerContent;
        }
        field(50013; "Bank Statement"; Boolean)
        {
            Caption = 'Bank Statement';
            DataClassification = CustomerContent;
        }

        field(50014; "Original License Sighted"; Boolean)
        {
            Caption = 'Original License Sighted';
            DataClassification = CustomerContent;
        }

        field(50015; "Original PSV Sighted"; Boolean)
        {
            Caption = 'Original PSV Sighted';
            DataClassification = CustomerContent;
        }
        field(50016; "Overdue Days"; Integer)
        {

            FieldClass = FlowField;
            CalcFormula = Count("Booking Entry" WHERE("Driver No." = FIELD("No."),
                                                     "Posting Date" = field("Date Filter")));
            Editable = false;
            Caption = 'Overdue Days';
        }
        field(50017; "Overdue Amount"; Decimal)
        {
            CalcFormula = Sum("Booking Entry".Amount WHERE("Driver No." = FIELD("No."),
                                                    "Posting Date" = field("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Overdue Amount';

        }
        field(50018; "Black Listed"; Boolean)
        {
            Editable = true;
            Caption = 'Black Listed';
        }
        field(50019; "Date of Birth"; date)
        {
            caption = 'Date of Birth';
        }
        field(50020; "Contract"; code[10])
        {
            TableRelation = "Service Contract Header";
            Editable = false;
        }
        field(50021; "Gender"; Option)
        {
            OptionMembers = "Male","Female";
            Caption = 'Gender';
        }
        field(50022; Race; Option)
        {
            OptionMembers = "Malay","Chinese","Indian","Other";
            Caption = 'Race';
        }
        //TS_ISMAIL added field
        field(50023; "Area of Operating"; Text[50])
        {
            Caption = 'Area of Operating';
        }
        //TS_ISMAIL added field
    }
}