page 50049 "CM Spoil Subform"
{
  Caption = 'CM Spoil Subform';
  PageType = ListPart;
  SourceTable = "CM Repo Spoil";
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
        field("Line No.";Rec."Line No.")
        {
          ApplicationArea = All;
        }
        field(Description;Rec.Description)
        {
          ApplicationArea = All;
        }
        field(Estimate;Rec.Estimate)
        {
          ApplicationArea = All;
        }
        field(Remark;Rec.Remark)
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
