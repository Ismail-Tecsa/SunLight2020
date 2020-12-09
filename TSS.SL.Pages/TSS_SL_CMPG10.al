page 50044 "CM PG10"
{
  Caption = 'CM PG10';
  PageType = CardPart;
  SourceTable = "CM PG10";

  layout
  {
    area(content)
    {
      group(General)
      {
        field("Settlement ID";Rec."Settlement ID")
        {
          ApplicationArea = All;

          trigger OnValidate()begin
            Settlement.get("Settlement ID");
          end;
        }
        field("Settlement Type";Settlement."Settlement Type")
        {
          ApplicationArea = all;
          Editable = false;
        }
        field("Settlement Date";Settlement."Creation Date")
        {
          ApplicationArea = all;
          Editable = false;
        }
        field("Workshop Dismantle";Rec."Workshop Dismantle")
        {
          ApplicationArea = All;
        }
        field("Workshop Dismantle Date";Rec."Workshop Dismantle Date")
        {
          ApplicationArea = All;
        }
        field("Dismantle and Disposal";Rec."Dismantle and Disposal")
        {
          ApplicationArea = All;
        }
        field("Dismantle ID";Rec."Dismantle ID")
        {
          ApplicationArea = All;
        }
        field("Permit Cancellation";Rec."Permit Cancellation")
        {
          ApplicationArea = All;
        }
        field("Permit Cancellation Date";Rec."Permit Cancellation Date")
        {
          ApplicationArea = All;
        }
        field("B2 Inspection";Rec."B2 Inspection")
        {
          ApplicationArea = All;
        }
        field("B2 Inspection Date";Rec."B2 Inspection Date")
        {
          ApplicationArea = All;
        }
        field("B5 Inspection";Rec."B5 Inspection")
        {
          ApplicationArea = All;
        }
        field("B5 Inspection Date";Rec."B5 Inspection Date")
        {
          ApplicationArea = All;
        }
        field("Custom Duty";Rec."Custom Duty")
        {
          ApplicationArea = All;
        }
        field("Custom Duty Date";Rec."Custom Duty Date")
        {
          ApplicationArea = All;
        }
        field("Company Document";Rec."Company Document")
        {
          ApplicationArea = All;
        }
        field("Company Document Date";Rec."Company Document Date")
        {
          ApplicationArea = All;
        }
        field("JPJ Transfer Ownership";Rec."JPJ Transfer Ownership")
        {
          ApplicationArea = All;
        }
        field("JPJ Transfer Ownership Date";Rec."JPJ Transfer Ownership Date")
        {
          ApplicationArea = All;
        }
        field("Geran Copy";Rec."Geran Copy")
        {
          ApplicationArea = All;
        }
        field("Geran Copy Date";Rec."Geran Copy Date")
        {
          ApplicationArea = All;
        }
        field(Geran;Rec.Geran)
        {
          ApplicationArea = All;
        }
        field(Insurance;Rec.Insurance)
        {
          ApplicationArea = All;
        }
        field("Insurance Date";Rec."Insurance Date")
        {
          ApplicationArea = All;
        }
        field("Road Tax";Rec."Road Tax")
        {
          ApplicationArea = All;
        }
        field("Road Tax Date";Rec."Road Tax Date")
        {
          ApplicationArea = All;
        }
        field(Released;Rec.Released)
        {
          ApplicationArea = All;
        }
        field("Taxi Release for B2 ";Rec."Taxi Release for B2 ")
        {
          ApplicationArea = All;
        }
        field("Taxi Custody after B5";Rec."Taxi Custody after B5")
        {
          ApplicationArea = All;
        }
        field("Handle by";Rec."Handle by")
        {
          ApplicationArea = All;
        }
        field("Process By";Rec."Process By")
        {
          ApplicationArea = All;
        }
        field("Car Taken By";Rec."Car Taken By")
        {
          ApplicationArea = All;
        }
      }
    }
  }
  var Settlement: record "Settlement Header";
  trigger OnAfterGetRecord()begin
    if not Settlement.get("Settlement ID")then clear(Settlement);
  end;
}
