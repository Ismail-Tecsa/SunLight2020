page 50014 "Permit List"
{
  ApplicationArea = All;
  Caption = 'Permit List';
  PageType = List;
  SourceTable = Permit;
  UsageCategory = Lists;
  CardPageId = "Permit Card";
  PromotedActionCategories = 'New';

  layout
  {
    area(content)
    {
      repeater(General)
      {
        field("Permit ID";Rec."Permit ID")
        {
          ApplicationArea = All;
        }
        field(Locked;Locked)
        {
          ApplicationArea = all;
        }
        field(Reserved;Rec.Reserved)
        {
          ApplicationArea = All;
        }
        field("Set ID";"Set ID")
        {
          ApplicationArea = All;
        }
        field("Permit Ref. No.";"Permit Ref. No.")
        {
          ApplicationArea = all;
        }
        field("Permit Comany";Rec."Permit Company")
        {
          ApplicationArea = All;
        }
        field("Management Company";Rec."Management Company")
        {
          ApplicationArea = All;
        }
        field("Permit Status";Rec."Permit Status")
        {
          ApplicationArea = All;
        }
        field("Permit Condition";Rec."Permit Condition")
        {
          ApplicationArea = All;
        }
        field("License Class";Rec."License Class")
        {
          ApplicationArea = All;
        }
        field("Passenger No.";Rec."Passenger No.")
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
        field("Offer Letter Start Date";"Offer Letter Start Date")
        {
          ApplicationArea = All;
        }
        field("Offer Letter End Date";"Offer Letter End Date")
        {
          ApplicationArea = All;
        }
        field("Taxi No.";Rec."Taxi No.")
        {
          ApplicationArea = All;
        }
        field("Service Location";Rec."Service Location")
        {
          ApplicationArea = All;
        }
      }
    }
  }
  trigger OnOpenPage()begin
    //    if not get then insert;
    setrange("Permit Company", companyName);
  end;
}
