page 50018 "Car Model"
{
  ApplicationArea = All;
  Caption = 'Car Model';
  PageType = List;
  SourceTable = "Car Model";
  UsageCategory = Lists;
  Editable = true;

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
        field(Description;Rec.Description)
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
