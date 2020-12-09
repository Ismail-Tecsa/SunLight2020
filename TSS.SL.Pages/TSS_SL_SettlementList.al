page 50039 "Settlement List"
{
  ApplicationArea = All;
  Caption = 'Settlement List';
  PageType = List;
  SourceTable = "Settlement Header";
  UsageCategory = Lists;
  CardPageId = Settlement;
  PromotedActionCategories = 'New,Process';

  layout
  {
    area(content)
    {
      repeater(General)
      {
        field("Settlement ID";Rec."Settlement ID")
        {
          ApplicationArea = All;
        }
        field("Settlement Type";Rec."Settlement Type")
        {
          ApplicationArea = All;
        }
        field(Status;Rec.Status)
        {
          ApplicationArea = All;
        }
        field("Taxi ID";Rec."Taxi ID")
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
