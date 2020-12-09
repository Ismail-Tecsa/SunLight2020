page 50041 "Settlement Code List"
{
  ApplicationArea = All;
  Caption = 'Settlement Code List';
  PageType = List;
  SourceTable = "Settlement Code";
  UsageCategory = Lists;
  Editable = true;
  PromotedActionCategories = 'New,Process';

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
      }
    }
  }
}
