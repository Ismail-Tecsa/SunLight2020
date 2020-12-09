page 50019 "Car Make"
{
  ApplicationArea = All;
  Caption = 'Car Make';
  PageType = List;
  SourceTable = "Car Make";
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
