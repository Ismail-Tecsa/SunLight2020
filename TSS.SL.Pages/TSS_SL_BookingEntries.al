page 50012 "Booking Entries"
{
  ApplicationArea = All;
  Caption = 'Booking Entries';
  PageType = List;
  SourceTable = "Booking Entry";
  Editable = false;
  UsageCategory = Lists;

  layout
  {
    area(content)
    {
      repeater(General)
      {
        field("Entry No.";Rec."Entry No.")
        {
          ApplicationArea = All;
        }
        field("Driver No.";Rec."Driver No.")
        {
          ApplicationArea = All;
        }
        field("Posting Date";Rec."Posting Date")
        {
          ApplicationArea = All;
        }
        field("Taxi No.";Rec."Taxi No.")
        {
          ApplicationArea = All;
        }
        field("Contract No.";Rec."Contract No.")
        {
          ApplicationArea = All;
        }
        field("Amount Due";Rec."Amount Due")
        {
          ApplicationArea = All;
        }
        field("Amount Paid";Rec."Amount Paid")
        {
          ApplicationArea = All;
        }
        field(Amount;Rec.Amount)
        {
          ApplicationArea = All;
        }
        field(Type;Rec.Type)
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
