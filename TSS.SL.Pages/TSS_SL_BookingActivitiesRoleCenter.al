page 50007 "Booking Manager Activities"
{
  Caption = 'Booking Manager Activties';
  PageType = CardPart;
  SourceTable = "Service Cue";

  layout
  {
    area(Content)
    {
      cuegroup(Drivers)
      {
        Caption = 'Overdue Drivers';

        field("Service Contracts to Expire";"Service Contracts to Expire")
        {
          ApplicationArea = Basic, Suite;
          DrillDownPageId = "Service Contracts";
          ToolTip = 'Specifies the number of Drivers with overdue amounts.';
        }
      }
    }
  }
}
