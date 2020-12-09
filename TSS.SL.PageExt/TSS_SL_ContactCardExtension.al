pageextension 50001 "Contact Card Extension" extends "Contact Card"
{
  layout
  {
    addafter("Salutation Code")
    {
      field(NRIC;Rec.NRIC)
      {
        ApplicationArea = All;
      }
      field("Employed by";Rec."Employed by")
      {
        ApplicationArea = All;
      }
      field(Position;Rec.Position)
      {
        ApplicationArea = All;
      }
      field("Years of Service";Rec."Years of Service")
      {
        ApplicationArea = All;
      }
      field("Monthly Income";Rec."Monthly Income")
      {
        ApplicationArea = All;
      }
      field("No. of Children";Rec."No. of Children")
      {
        ApplicationArea = All;
      }
      field(Relationship;Rec.Relationship)
      {
        ApplicationArea = All;
      }
    }
  }
}
