page 50004 "Festival Discount Schemes"
{
  ApplicationArea = All;
  Caption = 'Festival Discount Schemes';
  PageType = List;
  SourceTable = "Fesitval Discount Scheme";
  UsageCategory = Tasks;

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
        field(Festival;Rec.Festival)
        {
          ApplicationArea = All;
        }
        field("Date From";Rec."Date From")
        {
          ApplicationArea = All;
        }
        field("Date To";Rec."Date To")
        {
          ApplicationArea = All;
        }
        field("Discount Days";Rec."Discount Days")
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
