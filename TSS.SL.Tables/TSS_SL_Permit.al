table 50007 Permit
{
    Caption = 'Permit';
    DataClassification = ToBeClassified;
    DataCaptionFields = "Permit ID", "Permit Company";
    DataPerCompany = false;
    LookupPageId = "Permit List";
    DrillDownPageId = "Permit List";

    fields
    {
        field(1; "Permit ID"; Code[20])
        {
            Caption = 'Permit ID';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(2; "Permit Company"; Text[30])
        {
            Caption = 'Permit Company';
            DataClassification = CustomerContent;
            TableRelation = Company;

            trigger OnValidate()
            begin
                if "Management Company" = '' then validate("Management Company", "Permit Company");
            end;
        }
        field(3; "License Class"; Option)
        {
            Caption = 'License Class';
            OptionMembers = "","Teksi","Limousine";
            DataClassification = CustomerContent;
        }
        field(4; "Service Location"; Code[20])
        {
            Caption = 'Service Location';
            DataClassification = CustomerContent;
        }
        field(5; "Seating Capacity"; Integer)
        {
            Caption = 'Seating Capacity';
            DataClassification = CustomerContent;
        }
        field(6; "Passenger No."; Integer)
        {
            Caption = 'Passenger No.';
            DataClassification = CustomerContent;
        }
        field(7; "Special Condition"; Text[250])
        {
            Caption = 'Special Condition';
            DataClassification = CustomerContent;
        }
        field(8; "Permit Status"; Option)
        {
            Caption = 'Permit Status';
            OptionMembers = "In-Active","Active";
            DataClassification = CustomerContent;
        }
        field(9; "Permit Condition"; Option)
        {
            Caption = 'Permit Condition';
            OptionMembers = "New","PG10","SK-Used";
            DataClassification = CustomerContent;
        }
        field(10; "Permit Start Date"; Date)
        {
            Caption = 'Permit Start Date';
            DataClassification = CustomerContent;
        }
        field(11; "Permit End Date"; Date)
        {
            Caption = 'Permit End Date';
            DataClassification = CustomerContent;
        }
        field(12; "Permit Ref. No."; Code[20])
        {
            Caption = 'Permit Ref. No.';
            DataClassification = CustomerContent;
        }
        field(13; "Set ID"; code[10])
        {
            Caption = 'Set ID';
            DataClassification = CustomerContent;
        }
        field(14; "Offer Letter Start Date"; Date)
        {
            Caption = 'Offer Letter Start Date';
            DataClassification = CustomerContent;
        }
        field(15; "Offer Letter End Date"; Date)
        {
            Caption = 'Offer Letter End Date';
            DataClassification = CustomerContent;
        }
        field(16; Reserved; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = Exist(taxis where("Permit ID" = field("Permit ID")));
        }
        field(17; Locked; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(40; "Management Company"; Text[30])
        {
            Caption = 'Management Company';
            DataClassification = CustomerContent;
            TableRelation = Company;
        }
        field(50; "Taxi No."; Code[20])
        {
            Caption = 'Taxi No.';
            FieldClass = FlowField;
            CalcFormula = lookup(Taxis."Taxi ID" where("Permit ID" = field("Permit ID")));
        }
        //TSA_ISMAIL added fields
        field(60; "Permit Cancellation Date"; Date)
        {
            Caption = 'Permit Cancellation Date';
        }
        field(61; "Pre –SK Submission"; Boolean)
        {
            Caption = 'Pre –SK Submission';
        }
        field(62; "Pre SK Submission Date"; Date)
        {
            Caption = 'Pre SK Submission Date';
        }
        field(63; "Extend Subm. Date"; Date)
        {
            Caption = 'Extend Subm. Date';
        }
        field(70; "Document to SPAD"; Boolean)
        {
            Caption = 'Document to SPAD';
        }
        field(71; "Permit Copy"; Boolean)
        {
            Caption = 'Permit Copy';
        }
        field(72; "Grand Copy"; Boolean)
        {
            Caption = 'Grand Copy';
        }
        field(73; "Issue GPC to Runner"; Boolean)
        {
            Caption = 'Issue GPC to Runner';
        }
        field(74; "GPC No."; Code[30])
        {
            Caption = 'GPC No.';
        }
        field(75; "GPC Date Issued"; Date)
        {
            Caption = 'GPC Date Issued';
        }
        field(76; "GPC Amount"; Decimal)
        {
            Caption = 'GPC Amount';
        }
        field(77; "Name of Receive"; Text[50])
        {
            Caption = 'Name of Receive';
        }
        field(78; "Received Date"; Date)
        {
            Caption = 'Received Date';
        }
        field(79; "Expenses Category"; Option)
        {
            Caption = 'Expenses Category';
            OptionMembers = "Permit Renewal Fee","Permit Extand Fee","Reclass Fee","Lost of Permit";
        }
        field(80; "Expenses Description"; Text[50])
        {
            Caption = 'Expenses Description';
        }
        field(81; "Invoice Date"; Date)
        {
            Caption = 'Invoice Date';
        }
        field(82; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
        }
        field(83; "Handle By"; Code[50])
        {
            Caption = 'Handle By';
        }
        field(84; "Remark"; Text[100])
        {
            Caption = 'Remark';
        }
        field(85; "Renewal Status"; Option)
        {
            Caption = 'Renewal Status';
            OptionMembers = "Pending","Settle","Closed","Prosesing","Other";
        }
        field(86; "Branch SPAD"; code[50])
        {
            Caption = 'Branch SPAD';
        }
        field(87; "Payment Info"; code[50])
        {
            Caption = 'Payment Info';
        }
        field(88; "Payment method"; Option)
        {
            Caption = 'Payment method';
            OptionMembers = "Cash","Cek","Transfer","Online","Othres";
        }
        field(89; "Date Call/Time"; DateTime)
        {
            Caption = 'Date Call/Time';
        }
        field(90; "Date confirm payment"; Boolean)
        {
            Caption = 'Date confirm payment';
        }
        field(91; "TOD Received"; Boolean)
        {
            Caption = 'TOD Received';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "TOD Received" then
                    "TOD Received Date" := today;
            end;
        }
        field(92; "TOD Received Date"; Date)
        {
            Caption = 'TOD Received Date';
            DataClassification = ToBeClassified;
        }
        field(93; "Received By"; Text[80])
        {
            Caption = 'Received By';
        }
        field(94; "Received By Date"; Text[80])
        {
            Caption = 'Received By Date';
        }
        field(95; "No log Permit"; Code[30])
        {
        }

    }
    keys
    {
        key(PK; "Permit ID")
        {
            Clustered = true;
        }
    }
    trigger OnModify()
    begin
        if Locked = xRec.Locked then TestField(locked, false);
    end;

    procedure LockPermit()
    var
        entry: Integer;
        PermHistory: record "Permit History";
    begin
        if confirm('Do you want to lock the record and record the status in history?') then begin
            PermHistory.reset;
            PermHistory.setrange("Permit ID", "Permit ID");
            if PermHistory.FindLast() then
                entry := PermHistory."Entry No." + 1
            else
                entry := 1;
            clear(PermHistory);
            PermHistory.TransferFields(rec);
            CalcFields("Taxi No.");
            PermHistory."Entry No." := entry;
            PermHistory."Taxi No." := "Taxi No.";
            PermHistory.insert;
            Locked := true;
            modify;
        end;
    end;
}
