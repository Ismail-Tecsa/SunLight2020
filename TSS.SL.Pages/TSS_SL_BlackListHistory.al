page 50011 "Black List History"
{
  ApplicationArea = All;
  Caption = 'Black List History';
  PageType = List;
  SourceTable = "Black List History";
  UsageCategory = History;

  layout
  {
    area(content)
    {
      repeater(General)
      {
        field("Driver No.";Rec."Driver No.")
        {
          ApplicationArea = All;
        }
        field("Black List Date";Rec."Black List Date")
        {
          ApplicationArea = All;
        }
        field("Contract No.";Rec."Contract No.")
        {
          ApplicationArea = All;
        }
        field("Black List By";Rec."Black List By")
        {
          ApplicationArea = All;
        }
        field("Settlement Date";Rec."Settlement Date")
        {
          ApplicationArea = All;
        }
        field("Settlement ID";Rec."Settlement ID")
        {
          ApplicationArea = All;
        }
        field("Taxi No.";Rec."Taxi No.")
        {
          ApplicationArea = All;
        }
        field("Bad Debt Recovery Amount";Rec."Bad Debt Recovery Amount")
        {
          ApplicationArea = All;
        }
        field("Bad Debt Recovery Date";Rec."Bad Debt Recovery Date")
        {
          ApplicationArea = All;
        }
        field("Black List Amount";Rec."Black List Amount")
        {
          ApplicationArea = All;
        }
        field("Handled By";Rec."Handled By")
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
