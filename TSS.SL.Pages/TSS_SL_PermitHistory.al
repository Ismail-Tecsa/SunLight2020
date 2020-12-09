page 50051 "Permit History"
{
  Caption = 'Permit History';
  PageType = ListPart;
  SourceTable = "Permit History";
  Editable = false;
  InsertAllowed = false;
  DeleteAllowed = false;

  layout
  {
    area(content)
    {
      repeater(General)
      {
        field(Date;Rec.Date)
        {
          ApplicationArea = All;
        }
        field("Permit ID";Rec."Permit ID")
        {
          ApplicationArea = All;
        }
        field("Permit Ref. No.";Rec."Permit Ref. No.")
        {
          ApplicationArea = All;
        }
        field("Taxi No.";Rec."Taxi No.")
        {
          ApplicationArea = All;
        }
        field("Permit Status";Rec."Permit Status")
        {
          ApplicationArea = All;
        }
        field("License Class";Rec."License Class")
        {
          ApplicationArea = All;
        }
        field("Management Company";Rec."Management Company")
        {
          ApplicationArea = All;
        }
        field("Permit Company";Rec."Permit Company")
        {
          ApplicationArea = All;
        }
        field("Permit Condition";Rec."Permit Condition")
        {
          ApplicationArea = All;
        }
        field("Permit Start Date";Rec."Permit Start Date")
        {
          ApplicationArea = All;
        }
        field("Permit End Date";Rec."Permit End Date")
        {
          ApplicationArea = All;
        }
        field("Service Location";Rec."Service Location")
        {
          ApplicationArea = All;
        }
        field("Special Condition";Rec."Special Condition")
        {
          ApplicationArea = All;
        }
        field(Reserved;Rec.Reserved)
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
