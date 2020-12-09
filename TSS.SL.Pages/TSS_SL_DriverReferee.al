page 50010 "Driver Referee"
{
  ApplicationArea = All;
  Caption = 'Driver Referee';
  PageType = List;
  Editable = true;
  SourceTable = "Driver Referees";
  UsageCategory = Administration;

  layout
  {
    area(content)
    {
      repeater(General)
      {
        field("Contact No.";Rec."Contact No.")
        {
          ApplicationArea = All;
        }
        field("Driver No.";Rec."Driver No.")
        {
          ApplicationArea = All;
        }
        field("Line No.";Rec."Line No.")
        {
          ApplicationArea = All;
        }
        field("Referee Type";Rec."Referee Type")
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
