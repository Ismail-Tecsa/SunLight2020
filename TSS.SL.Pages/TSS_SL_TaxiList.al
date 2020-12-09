page 50105 "Taxi List"
{
  PageType = List;
  ApplicationArea = All;
  UsageCategory = Lists;
  SourceTable = Taxis;
  Editable = false;
  CardPageId = "Taxis";

  layout
  {
    area(Content)
    {
      repeater(Taxis)
      {
        field(ID;"Taxi ID")
        {
          ApplicationArea = All;
        }
        field(TaxiPlate;"Taxi Plate")
        {
          ApplicationArea = All;
        }
        //field(PrivatePlate; "Private Plate")
        //{
        //    ApplicationArea = All;
        //}
        //field(Company; "Company")
        //{
        //    ApplicationArea = All;
        //}
        field(URL;"URL")
        {
          ApplicationArea = All;
        }
      }
    }
    area(Factboxes)
    {
    }
  }
  actions
  {
    area(Processing)
    {
      action(ActionName)
      {
        ApplicationArea = All;

        trigger OnAction();
        begin
        end;
      }
    }
  }
}
