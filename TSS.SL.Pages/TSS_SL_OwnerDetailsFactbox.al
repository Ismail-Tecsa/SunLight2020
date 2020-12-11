page 50026 "Owner Details FactBox"
{
    Caption = 'Owner Details';
    PageType = CardPart;
    SourceTable = "taxis";
    RefreshOnActivate = true;
    Editable = false;

    layout
    {
        area(content)
        {
            field(OwnerName; owner.Name)
            {
                ApplicationArea = All;
                Caption = 'Owner';

                trigger OnDrillDown()
                begin
                    ShowDetailsOwner;
                end;
            }
            field(Driver1Name; Driver1.Name)
            {
                Caption = 'Driver 1';
                ApplicationArea = all;

                trigger OnDrillDown()
                begin
                    ShowDetailsDriver1;
                end;
            }
            field(Driver1Phone; Driver1."Phone No.")
            {
                Caption = 'Phone';
                ApplicationArea = all;
            }
            field("Driving License Expiry"; driver1."Driving License Expiry")
            {
                Caption = 'Driving Lic. Expiry';
                ApplicationArea = all;
            }
            field(LicStatus; LicStatus1)
            {
                ApplicationArea = all;
                Caption = '';
            }
            field("PSV License Expiry"; driver1."PSV License Expiry")
            {
                Caption = 'PSV Lic. Expiry';
                ApplicationArea = all;
            }
            field(PSVStatus; PSVStatus1)
            {
                ApplicationArea = all;
                Caption = '';
            }
            field(Gender; driver1.Gender)
            {
                ApplicationArea = all;
            }
            field(Race; driver1.Race)
            {
                ApplicationArea = all;
            }
            field("Date of Birth"; driver1."Date of Birth")
            {
                ApplicationArea = all;
            }
            field(Age; Age1)
            {
                Caption = 'Age';
                ApplicationArea = all;
            }
            //TSA_ISMAIL
            field(SerialNo; SerialNo)
            {
                Caption = 'Serial No.';
                ApplicationArea = all;
            }
            field(ExpireDate; ExpireDate)
            {
                Caption = 'Pass Card Expire Date';
                ApplicationArea = all;
            }
            field(Driver2Name; Driver2.Name)
            {
                Caption = 'Driver 2';
                ApplicationArea = all;

                trigger OnDrillDown()
                begin
                    ShowDetailsDriver2;
                end;
            }
            field(Driver2Phone; Driver2."Phone No.")
            {
                ApplicationArea = all;
                Caption = 'Phone';
            }
            field("Driving License Expiry2"; driver2."Driving License Expiry")
            {
                ApplicationArea = all;
                Caption = 'Driving Lic. Expiry';
            }
            field(LicStatus2; LicStatus2)
            {
                ApplicationArea = all;
                Caption = '';
            }
            field("PSV License Expiry2"; driver2."PSV License Expiry")
            {
                Caption = 'PSV Lic. Expiry';
                ApplicationArea = all;
            }
            field(PSVStatus2; PSVStatus2)
            {
                ApplicationArea = all;
                Caption = '';
            }
            field(Gender2; driver2.Gender)
            {
                Caption = 'Gender';
                ApplicationArea = all;
            }
            field(Race2; driver2.Race)
            {
                Caption = 'Race';
                ApplicationArea = all;
            }
            field("Date of Birth2"; driver2."Date of Birth")
            {
                Caption = 'Date of Birth';
                ApplicationArea = all;
            }
            field(Age2; Age2)
            {
                Caption = 'Age';
                ApplicationArea = all;
            }
            field(SerialNo1; SerialNo1)
            {
                Caption = 'Serial No';
                ApplicationArea = all;
            }
            field(ExpireDate1; ExpireDate1)
            {
                Caption = 'Pass Card Expire Date';
                ApplicationArea = all;
            }
            field(Contract; ContractHead."Contract No.")
            {
                ApplicationArea = all;
                trigger OnDrillDown()
                begin
                    ShowPackageDetails();
                end;
            }
            field("Overdue Days"; ContractHead."Overdue Days")
            {
                ApplicationArea = all;
            }
            field("Overdue Amount"; ContractHead."Overdue Amount")
            {
                ApplicationArea = all;
            }
        }
    }

    var

        LicStatus1: Option Active,Expired;
        PSVStatus1: option Active,Expired;
        LicStatus2: Option Active,Expired;
        PSVStatus2: option Active,Expired;
        age1: Integer;
        age2: Integer;
        //TSA_ISMAIL
        SerialNo: Code[20];
        ExpireDate: Date;
        SerialNo1: Code[20];
        ExpireDate1: Date;
        //TSA_ISMAIL

        Owner: record customer;
        Driver1: record Customer;
        Driver2: record customer;
        ContractHead: record "Service Contract Header";



    trigger OnInit()
    begin
        clear(ContractHead);
        clear(owner);
        clear(Driver1);
        Clear(Driver2);
        LicStatus1 := LicStatus1::Expired;
        PSVStatus1 := PSVStatus1::Expired;
        LicStatus2 := LicStatus2::Expired;
        PSVStatus2 := PSVStatus2::Expired;
        clear(age1);
        Clear(age2);

    end;

    trigger OnAfterGetRecord()
    var
        Passcard: Record "Pass Card";
    begin
        clear(ContractHead);
        clear(owner);
        clear(Driver1);
        Clear(Driver2);
        if "Active Contract" <> '' then
            ContractHead.get(ContractHead."Contract Type"::Contract, "Active Contract");
        if ContractHead."Customer No." <> '' then
            owner.get(ContractHead."Customer No.");
        if ContractHead."Driver 1" <> '' then
            driver1.get(ContractHead."Driver 1");

        if ContractHead."Driver 2" <> '' then
            driver2.get(ContractHead."Driver 2");
        LicStatus1 := LicStatus1::Expired;
        PSVStatus1 := PSVStatus1::Expired;
        if driver1."Driving License Expiry" > today then
            LicStatus1 := LicStatus1::Active;
        if driver1."PSV License Expiry" > today then
            PSVStatus1 := PSVStatus1::Active;
        LicStatus2 := LicStatus2::Expired;
        PSVStatus2 := PSVStatus2::Expired;
        if driver2."Driving License Expiry" > today then
            LicStatus2 := LicStatus2::Active;
        if driver2."PSV License Expiry" > today then
            PSVStatus2 := PSVStatus2::Active;

        CalcAge();
        SerialExpire();

        contracthead.setfilter("Date Filter", '..%1', WorkDate());
        contracthead.CalcFields("Overdue Amount", "Overdue Days");

    end;

    local procedure ShowDetailsOwner()
    begin
        PAGE.Run(PAGE::"Driver Card", Owner);
    end;

    local procedure ShowDetailsDriver1()
    begin
        PAGE.Run(PAGE::"Driver Card", Driver1);
    end;

    local procedure ShowDetailsDriver2()
    begin
        PAGE.Run(PAGE::"Driver Card", Driver2);
    end;
    //TSA_ISMAIL
    local procedure SerialExpire()
    var
        passcard: Record "Pass Card";
    Begin
        passcard.Reset();
        Clear(SerialNo);
        Clear(ExpireDate);
        passcard.SetRange("Driver No.", Driver1."No.");
        if passcard.FindFirst() then begin
            SerialNo := passcard."Serial No.";
            ExpireDate := passcard."Expiry Date";
        end;

        passcard.Reset();
        Clear(SerialNo1);
        Clear(ExpireDate1);
        passcard.SetRange("Driver No.", Driver2."No.");
        If passcard.FindFirst() then begin
            SerialNo1 := passcard."Serial No.";
            ExpireDate1 := passcard."Expiry Date";
        end;
    End;
    //TSA_ISMAIL
    local procedure CalcAge()

    var
        month: Integer;

    begin
        age1 := 0;
        age2 := 0;
        if driver1."Date of Birth" <> 0D then begin
            age1 := Date2DMY(Today, 3) - Date2DMY(driver1."Date of Birth", 3);

            if Date2DMY(today, 2) < Date2DMY(driver1."date of birth", 2) then
                age1 -= 1;
        end;
        if driver2."Date of Birth" <> 0D then begin
            age2 := Date2DMY(Today, 3) - Date2DMY(driver2."Date of Birth", 3);

            if Date2DMY(today, 2) < Date2DMY(driver2."date of birth", 2) then
                age2 -= 1;
        end;

    end;

    local procedure ShowPackageDetails()
    begin
        PAGE.Run(PAGE::"Service Contract", ContractHead);
    end;
}


