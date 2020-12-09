pageextension 50003 "Company Information Extension" extends "Company Information"
{
  layout
  {
    addafter(name)
    {
      field("Taxi Company";"Taxi Company")
      {
        Caption = 'Taxi Company';
        ToolTip = 'If true then will appear in Permit List';
        Importance = standard;
        ApplicationArea = all;
      }
    }
  }
}
