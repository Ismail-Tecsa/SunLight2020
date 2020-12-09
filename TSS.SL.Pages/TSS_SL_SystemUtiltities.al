page 50009 "System Utilities"
{
  ApplicationArea = All;
  Caption = 'System Utilities';
  PromotedActionCategories = 'Processing';
  PageType = List;
  SourceTable = "User Setup";
  UsageCategory = Administration;

  layout
  {
    area(content)
    {
      repeater(General)
      {
        field("User ID";Rec."User ID")
        {
          ApplicationArea = All;
        }
      }
    }
  }
  actions
  {
    area(Processing)
    {
      action("Delete Referees")
      {
        ApplicationArea = Service;
        Caption = 'Delete Referees';

        trigger OnAction()var referee: record "Driver Referees";
        begin
          referee.deleteall;
        end;
      }
      action("Driver Referee")
      {
        ApplicationArea = Service;
        Caption = 'Driver Referee';
        RunObject = page "Driver Referee";
      }
    }
  }
}
