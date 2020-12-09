page 50036 "CM Offer Subform"
{
  Caption = 'CM Offer Subform';
  PageType = ListPart;
  SourceTable = "CM Accident Offer";
  AutoSplitKey = true;
  DelayedInsert = true;
  LinksAllowed = false;
  MultipleNewLines = true;

  layout
  {
    area(content)
    {
      repeater(General)
      {
        field("Entry No.";Rec."Entry No.")
        {
          ApplicationArea = All;
          Visible = false;
        }
        field("Offer Letter Date";Rec."Offer Letter Date")
        {
          ApplicationArea = All;
        }
        field("Offer Amount";Rec."Offer Amount")
        {
          ApplicationArea = All;
        }
        field("Appeal Date";Rec."Appeal Date")
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
