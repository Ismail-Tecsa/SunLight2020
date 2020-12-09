page 50025 "Driver Details FactBox"
{
  Caption = 'Driver Details';
  PageType = CardPart;
  SourceTable = Customer;
  Editable = false;
  RefreshOnActivate = true;

  layout
  {
    area(content)
    {
      field(Name;Name)
      {
        ApplicationArea = All;
        Caption = 'Name';

        trigger OnDrillDown()begin
          ShowDetails;
        end;
      }
      field("Phone No.";"Phone No.")
      {
        ApplicationArea = all;
      }
      field(NRIC;NRIC)
      {
        ApplicationArea = all;
      }
      field(Gender;Gender)
      {
        ApplicationArea = all;
      }
      field(Race;Race)
      {
        ApplicationArea = all;
      }
      field("Date of Birth";"Date of Birth")
      {
        ApplicationArea = all;
      }
      field(Age;Age)
      {
        ApplicationArea = all;
      }
      field("Driving License Expiry";"Driving License Expiry")
      {
        ApplicationArea = all;
      }
      field(LicStatus;LicStatus)
      {
        ApplicationArea = all;
        Caption = '';
      }
      field("PSV License Expiry";"PSV License Expiry")
      {
        ApplicationArea = all;
      }
      field(PSVStatus;PSVStatus)
      {
        ApplicationArea = all;
        Caption = '';
      }
      field(Contract;Contract)
      {
        ApplicationArea = all;

        trigger OnDrillDown()begin
          ShowPackageDetails();
        end;
      }
      field("Overdue Days";"Overdue Days")
      {
        ApplicationArea = all;
      }
      field("Overdue Amount";"Overdue Amount")
      {
        ApplicationArea = all;
      }
    }
  }
  var age: integer;
  LicStatus: Option Active, Expired;
  PSVStatus: option Active, Expired;
  trigger OnAfterGetRecord()begin
    CalcAge();
    LicStatus:=LicStatus::Expired;
    PSVStatus:=PSVStatus::Expired;
    if "Driving License Expiry" > today then LicStatus:=LicStatus::Active;
    if "PSV License Expiry" > today then PSVStatus:=PSVStatus::Active;
  end;
  local procedure ShowDetails()begin
    PAGE.Run(PAGE::"Driver Card", Rec);
  end;
  local procedure CalcAge()var month: Integer;
  begin
    if "Date of Birth" <> 0D then begin
      age:=Date2DMY(Today, 3) - Date2DMY("Date of Birth", 3);
      if Date2DMY(today, 2) < Date2DMY("date of birth", 2)then age-=1;
    end;
  end;
  local procedure ShowPackageDetails()var contracthead: record "Service Contract Header";
  begin
    if contracthead.get(contracthead."Contract Type"::Contract, contract)then PAGE.Run(PAGE::"Service Contract", ContractHead);
  end;
}
