table 50000 Taxis
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;


    fields
    {

        field(1; "Taxi ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
        }

        field(2; "Taxi Plate"; Code[10])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Private Plate"; Code[10])
        {

        }
        field(4; "Company"; Text[30])
        {
            TableRelation = Company.Name;
            ValidateTableRelation = true;

            // "OnValidate" trigger executes when data is entered in a field.
            trigger OnValidate();
            begin
                "URL" := GETURL(CURRENTCLIENTTYPE, Company, OBJECTTYPE::Page, 50104, Rec);
            end;
        }
        field(5; URL; text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            ExtendedDatatype = URL;
        }
        field(6; Status; Option)
        {
            OptionMembers = "In Progress",Available,"On the Road","Under Maintenance","PG-10","Disposal";
            DataClassification = ToBeClassified;
        }

        field(11; "On the Road Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(12; "Permit Locked"; Boolean)
        {
            Caption = 'Permit Locked';

            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
                Permit: record permit;
            begin
                UserSetup.get(USERID);
                usersetup.TestField("TIP Permit Status Change", true);

                permit.get("Permit ID");
                if Permit.locked then
                    error('This Permit is locked for changes, please unlock the permit to assign it to a new Taxi');

                Permit.LockPermit();

            end;
        }

        field(20; "Car Type"; Code[20])
        {
            Caption = 'Car Type';
            TableRelation = "Service Item Group";
        }
        field(21; "Permit ID"; code[20])
        {
            Caption = 'Permit ID';
            TableRelation = Permit;

            trigger OnValidate()

            var
                TIPEntry: Record "TIP Entry";
                TIPMaster: Record "TIP Master Setup";

            begin

                testfield("Permit Locked", false);

                if "Permit ID" <> xrec."Permit ID" then begin
                    TIPEntry.reset;
                    TIPEntry.SetRange("Taxi ID", "Taxi ID");

                end;
            end;
        }
        field(22; Finance; Option)
        {
            Caption = 'Finance';
            OptionMembers = "Cash","Loan";
        }
        field(23; Bank; code[20])
        {
            caption = 'Bank';
            TableRelation = "Bank Account";
        }
        field(24; "Chassis No."; text[30])
        {
            Caption = 'Chassis No.';
        }
        field(25; "Engine No."; text[30])
        {
            Caption = 'Engine No.';
        }
        field(26; Location; option)
        {
            Caption = 'Location';
            OptionMembers = "OTR","Workshop";
        }
        field(27; "NGV Installation"; date)
        {
            Caption = 'NGV Installation';
        }
        field(28; "NGV Cert. Ref."; text[50])
        {
            Caption = 'NGV Cert. Ref.';
        }
        field(29; "Meter TR1"; text[50])
        {
            Caption = 'Meter TR1';
        }
        field(30; "Meter TR2"; text[50])
        {
            Caption = 'Meter TR2';
        }
        // custom exemption

        field(32; "Custom Exemption Submit Date"; date)
        {
            caption = 'Custom Exemption Submit';
        }

        field(34; "Custom Exemption Return Date"; date)
        {
            Caption = 'Custom Exemption Return Date';
        }

        field(36; "Sales Letter Receive Date"; date)
        {
            Caption = 'Sales Letter Receive Date';
        }

        field(38; "K1 Receive Date"; Date)
        {
            Caption = 'K1 Receive Date';
        }
        field(39; "Custom Exemption Cheque issued"; Boolean)
        {
            Caption = 'Custom Exemption Cheque issued';
        }
        // Puspakom
        field(40; "Puspakom Booking Date"; date)
        {
            Caption = 'Puspakom Booking Date';
        }
        field(41; "NGV Cert Date"; Date)
        {
            Caption = 'NGV Cert Date';
        }
        field(42; "Meter T1 Date"; Date)
        {
            Caption = 'Meter T1 Date';
        }
        field(43; "Inspected by"; text[50])
        {
            Caption = 'Inspected by';
        }
        field(44; "Inspection Date"; date)
        {
            Caption = 'Inspection Date';
        }
        field(45; "Next Inspection Date"; date)
        {
            Caption = 'Next Inspection Date';
        }
        field(46; "Puspakom Insp. Report Date"; Date)
        {
            Caption = 'Puspakom Inspection Report Date';
        }
        //JPJ Registration'
        field(47; "JPJ Submission Date"; date)
        {
            Caption = 'JPJ Submission Date';
        }
        field(48; "JPJ Return Date"; date)
        {
            Caption = 'JPJ Return Date';
        }
        //geran
        field(49; "Car Model"; code[20])
        {
            Caption = 'Car Model';
            TableRelation = "Car Model";
        }
        field(50; "Car Make"; code[20])
        {
            Caption = 'Car Make';
            TableRelation = "Car Make";
        }
        field(51; "Engine CC"; Option)
        {
            Caption = 'Engine CC';
            OptionMembers = "1.3 cc","1.6 cc","1.8 cc","2.0 cc","2.5 cc";
        }
        field(52; "Fuel Type"; Option)
        {
            Caption = 'Fuel Type';
            OptionMembers = "NGV & Petrol","Petrol";
        }
        field(53; Colour; Option)
        {
            Caption = 'Colour';
            OptionMembers = "Red+White","Green";
        }
        field(54; "Body Type"; Option)
        {
            Caption = 'Body Type';
            OptionMembers = "Motor Car","Window Van";
        }
        field(55; "Year Made"; code[4])
        {
            caption = 'Year Made';
        }
        field(56; "Date of Registration"; date)
        {
            caption = 'Date of Registgration';
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        //Spec
        field(57; "Yellow Card"; Boolean)
        {
            Caption = 'Yellow Card';
        }
        field(58; "Planned Collection Date"; date)
        {
            Caption = 'Planned Collection Date';
        }
        field(59; "Actual Collection Date"; date)
        {
            Caption = 'Actual Collection';
        }
        //Insurance
        field(60; "Insurance Submission"; date)
        {
            Caption = 'Insurance Submission';
        }
        // JPJ License & Road Tax
        field(61; "Road Tax Serial No."; text[50])
        {
            Caption = 'Road Tax Serial No.';
        }
        field(62; "Road Tax Start Date"; date)
        {
            Caption = 'Road Tax Start Date';
        }
        field(63; "Road Tax End Date"; date)
        {
            Caption = 'Road Tax End Date';
        }
        field(64; "Grant VR1"; Boolean)
        {
            Caption = 'Grant VR1';

            trigger OnValidate()
            begin
                if "Grant VR1" then
                    "Grant VR1 Received Date" := workdate;
            end;
        }
        field(65; "Grant VR1 Received Date"; date)
        {
            Caption = 'Grant VR1 Received Date';
        }
        field(66; "Active Contract"; code[10])
        {
            TableRelation = "Service Contract Header";
            Editable = false;
        }

    }

    keys
    {
        // The field "Taxi ID" is used as the primary key of this table.
        key(PK; "Taxi ID")
        {
            // Create a clustered index from this key.
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Taxi ID", "Taxi Plate", "Company")
        {

        }
        fieldgroup(Brick; Company, "taxi Plate")
        {

        }
    }
}

