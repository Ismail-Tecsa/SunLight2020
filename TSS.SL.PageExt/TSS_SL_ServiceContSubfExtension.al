pageextension 50011 "Service Cont. Subf. Extension" extends "Service Contract Subform"
{
  layout
  {
    addafter("Service Item No.")
    {
      field("Taxi ID";"Taxi ID")
      {
        ApplicationArea = all;
      }
    }
  }
}
