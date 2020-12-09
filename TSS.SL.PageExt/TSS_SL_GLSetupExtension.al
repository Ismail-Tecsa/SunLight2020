pageextension 50012 "GL Setup Extension" extends "General Ledger Setup"
{
  layout
  {
    addafter("Bank Account Nos.")
    {
      field("Case No. Series";"Case No. Series")
      {
        ApplicationArea = all;
      }
      field("Settlement No. Series";Rec."Settlement No. Series")
      {
        ApplicationArea = All;
      }
    }
  }
}
