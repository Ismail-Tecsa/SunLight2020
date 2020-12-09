pageextension 50006 "User Setup Extension" extends "User Setup"
{
  layout
  {
    addafter("Register Time")
    {
      field("TIP Permit Status Change";"TIP Permit Status Change")
      {
        ApplicationArea = all;
      }
      field("Supervisor Approver";Rec."Supervisor Approver")
      {
        ApplicationArea = All;
      }
      field("Management Approver";Rec."Management Approver")
      {
        ApplicationArea = All;
      }
    }
  }
}
