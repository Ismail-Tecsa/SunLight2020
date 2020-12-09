page 50042 "Settlement Line Template"
{
  ApplicationArea = All;
  Caption = 'Settlement Line Template';
  PageType = List;
  SourceTable = "Settlement Master";
  UsageCategory = Lists;
  Editable = true;
  PromotedActionCategories = 'New,Process';
  AutoSplitKey = true;
  DelayedInsert = true;
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
        field(Code;Rec.Code)
        {
          ApplicationArea = All;
        }
        field("Settlement Type";Rec."Settlement Type")
        {
          ApplicationArea = All;
        }
        field("Fixed Amount";Rec."Fixed Amount")
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
