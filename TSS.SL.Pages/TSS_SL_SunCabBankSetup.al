page 50022 "SunCab Bank Setup"
{
  ApplicationArea = All;
  Caption = 'SunCab Bank Setup';
  PageType = List;
  SourceTable = "SunCab Bank Setup";
  UsageCategory = Administration;

  layout
  {
    area(content)
    {
      repeater(General)
      {
        field(Code;Rec.Code)
        {
          ApplicationArea = All;
        }
        field(Description;Rec.Description)
        {
          ApplicationArea = All;
        }
        field("Journal Template Name";Rec."Journal Template Name")
        {
          ApplicationArea = All;
        }
        field("Account Type";Rec."Account Type")
        {
          ApplicationArea = All;
        }
        field("Account No.";Rec."Account No.")
        {
          ApplicationArea = All;
        }
        field("SunCab Bank";Rec."SunCab Bank")
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
