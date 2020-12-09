page 50001 "Package Category List"
{
  ApplicationArea = All;
  Caption = 'Package Category List';
  PageType = List;
  SourceTable = "Package Category";
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
        field("Discount Bonus Day";Rec."Discount Bonus Day")
        {
          ApplicationArea = All;
        }
        field(Penalty;Rec.Penalty)
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
