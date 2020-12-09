page 50028 Inspections
{
  ApplicationArea = All;
  Caption = 'Inspections';
  PageType = List;
  SourceTable = "Inspections";
  UsageCategory = Lists;
  cardpageid = "Inspection Card";

  layout
  {
    area(content)
    {
      repeater(General)
      {
        field("Taxi ID";Rec."Taxi ID")
        {
          ApplicationArea = All;
        }
        field("Inspection Date";Rec."Inspection Date")
        {
          ApplicationArea = All;
        }
        field("Inspection Expiry Date";Rec."Inspection Expiry Date")
        {
          ApplicationArea = All;
        }
        field("Inspection Type";Rec."Inspection Type")
        {
          ApplicationArea = All;
        }
        field("Open Date for Inspection";Rec."Open Date for Inspection")
        {
          ApplicationArea = All;
        }
        field("Close Date for Inspection";Rec."Close Date for Inspection")
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
