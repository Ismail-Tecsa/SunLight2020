page 50023 "SunCab Gen Journal Line"
{
  ApplicationArea = All;
  Caption = 'SunCab Gen Journal Line';
  PageType = List;
  SourceTable = "SunCab Gen. Journal Line";
  Editable = true;
  DeleteAllowed = true;
  InsertAllowed = false;
  UsageCategory = Lists;

  layout
  {
    area(content)
    {
      repeater(General)
      {
        field("Entry No.";Rec."Entry No.")
        {
          ApplicationArea = All;
        }
        field(Processed;Rec.Processed)
        {
          ApplicationArea = All;
        }
        field("Posting Date";Rec."Posting Date")
        {
          ApplicationArea = All;
        }
        field("Account Type";Rec."Account Type")
        {
          ApplicationArea = All;
        }
        field("Account No.";Rec."Account No.")
        {
          ApplicationArea = All;
        }
        field("Bal. Account Type";Rec."Bal. Account Type")
        {
          ApplicationArea = All;
        }
        field("Bal. Account No.";Rec."Bal. Account No.")
        {
          ApplicationArea = All;
        }
        field(Amount;Rec.Amount)
        {
          ApplicationArea = All;
        }
        field(Description;Rec.Description)
        {
          ApplicationArea = All;
        }
        field("Document No.";Rec."Document No.")
        {
          ApplicationArea = All;
        }
        field("Shortcut Dimension 1 Code";Rec."Shortcut Dimension 1 Code")
        {
          ApplicationArea = All;
        }
        field("Shortcut Dimension 2 Code";Rec."Shortcut Dimension 2 Code")
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
