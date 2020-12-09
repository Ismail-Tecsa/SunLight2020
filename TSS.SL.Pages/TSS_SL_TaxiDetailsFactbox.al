page 50024 "Taxi Details FactBox"
{
  Caption = 'Taxi Details';
  PageType = CardPart;
  SourceTable = Taxis;

  layout
  {
    area(content)
    {
      field("Taxi ID";"Taxi ID")
      {
        ApplicationArea = All;
        Caption = 'Taxi ID';
        ToolTip = 'Specifies the number of the Taxi. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';

        trigger OnDrillDown()begin
          ShowDetails;
        end;
      }
      field("Management Company";permit."Management Company")
      {
        ApplicationArea = all;
      }
      field("Permit Company";permit."Permit Company")
      {
        ApplicationArea = all;

        trigger OnDrillDown()begin
          ShowPermitDetails;
        end;
      }
      field("Permit Expiry";permit."Permit End Date")
      {
        ApplicationArea = all;
      }
      field("Service Location";permit."Service Location")
      {
        ApplicationArea = all;
      }
      field("Road Tax End Date";"Road Tax End Date")
      {
        ApplicationArea = all;
      }
      field(insurance;insurance."Expiration Date")
      {
        Caption = 'Insurance Expiry Date';
        ApplicationArea = all;

        trigger OnDrillDown()begin
          ShowInsuranceDetails;
        end;
      }
      field(Inspection;inspection1."Inspection Expiry Date")
      {
        Caption = 'Car Inspection Expiry';
        ApplicationArea = all;

        trigger OnDrillDown()begin
          ShowCarInspectionDetails;
        end;
      }
      field(MeterInspection;inspection2."Inspection Expiry Date")
      {
        Caption = 'Meter Inspection Expiry';
        ApplicationArea = all;

        trigger OnDrillDown()begin
          ShowMeterInspectionDetails;
        end;
      }
      field("Taxi Plate";"Taxi Plate")
      {
        ApplicationArea = Basic, Suite;
        ToolTip = 'Specifies the Taxi Plate';
      }
      field("Chassis No.";Rec."Chassis No.")
      {
        ApplicationArea = All;
      }
      field("Engine No.";Rec."Engine No.")
      {
        ApplicationArea = All;
      }
      field("Car Model";Rec."Car Model")
      {
        ApplicationArea = All;
      }
      field("Fuel Type";Rec."Fuel Type")
      {
        ApplicationArea = All;
      }
      field("Engine CC";Rec."Engine CC")
      {
        ApplicationArea = All;
      }
      field("Car Make";Rec."Car Make")
      {
        ApplicationArea = All;
      }
      field("Car Type";Rec."Car Type")
      {
        ApplicationArea = All;
      }
      field("Contract";Package."Contract No.")
      {
        ApplicationArea = Basic, Suite;

        trigger OnDrillDown()begin
          ShowPackageDetails;
        end;
      }
      field("Contract Status";Package.Status)
      {
        ApplicationArea = all;
      }
      field("Contract End Date";package."Expiration Date")
      {
        ApplicationArea = all;
      }
    }
  }
  var Package: record "Service Contract Header";
  PackageLine: record "Service Contract Line";
  permit: Record permit;
  insurance: Record insurance;
  inspection1: record inspections;
  inspection2: record inspections;
  trigger OnAfterGetRecord()begin
    clear(package);
    packageline.reset;
    packageline.SetRange("Service Item No.", "Taxi ID");
    if packageline.findfirst then begin
      Package.get(packageline."Contract Type", PackageLine."Contract No.");
    end;
    if not permit.get("Permit ID")then begin
      clear(permit);
    end;
    insurance.reset;
    insurance.setrange("Taxi No.", "Taxi ID");
    if not insurance.findlast()then clear(insurance);
    inspection1.reset;
    inspection1.setrange("Taxi ID", "Taxi ID");
    inspection1.SetRange("Inspection Type", inspection1."Inspection Type"::Car);
    if not inspection1.findlast then clear(inspection1);
    inspection2.reset;
    inspection2.setrange("Taxi ID", "Taxi ID");
    inspection2.SetRange("Inspection Type", inspection1."Inspection Type"::Meter);
    if not inspection2.findlast then clear(inspection2);
  end;
  local procedure ShowDetails()begin
    PAGE.Run(PAGE::"Taxis", Rec);
  end;
  local procedure ShowPackageDetails()begin
    PAGE.Run(PAGE::"Service Contract", Package);
  end;
  local procedure ShowInsuranceDetails()begin
    PAGE.Run(PAGE::"Insurance Card", insurance);
  end;
  local procedure ShowCarInspectionDetails()begin
    PAGE.Run(PAGE::"Inspection Card", inspection1);
  end;
  local procedure ShowMeterInspectionDetails()begin
    PAGE.Run(PAGE::"Inspection Card", inspection2);
  end;
  local procedure ShowPermitDetails()begin
    PAGE.Run(PAGE::"Permit card", permit);
  end;
}
