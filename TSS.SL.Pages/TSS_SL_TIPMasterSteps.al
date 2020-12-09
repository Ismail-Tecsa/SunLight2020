page 50017 "TIP Master Steps"
{
  ApplicationArea = All;
  Caption = 'TIP Master Steps';
  PageType = List;
  SourceTable = "TIP Master Setup";
  UsageCategory = Administration;
  editable = true;

  layout
  {
    area(content)
    {
      repeater(General)
      {
        field("Step No.";Rec."Step No.")
        {
          ApplicationArea = All;
        }
        field(Description;Rec.Description)
        {
          ApplicationArea = All;
        }
        field("Permit Change Locked";Rec."Permit Change Locked")
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
