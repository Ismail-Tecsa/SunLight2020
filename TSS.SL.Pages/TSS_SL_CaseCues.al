page 50037 "Case Cues"
{
  Caption = 'Case Cues';
  PageType = CardPart;
  RefreshOnActivate = true;
  SourceTable = "case Cue";

  layout
  {
    area(content)
    {
      cuegroup("Case Management")
      {
        field("Pending Cases";Rec."Pending Cases")
        {
          ApplicationArea = All;
          DrillDownPageId = "Case List";
        }
        field(Accidents;Rec.Accidents)
        {
          ApplicationArea = All;
          DrillDownPageId = "Case List";
        }
        field("Lost Doc";Rec."Lost Doc")
        {
          ApplicationArea = All;
          DrillDownPageId = "Case List";
        }
        field("Pass Card";Rec."Pass Card")
        {
          ApplicationArea = All;
          DrillDownPageId = "Case List";
        }
        field(Summons;Rec.Summons)
        {
          ApplicationArea = All;
          DrillDownPageId = "Case List";
        }
        field("PG 10";Rec.PG10)
        {
          ApplicationArea = All;
          DrillDownPageId = "Case List";
        }
        field("Reposession";repo)
        {
          ApplicationArea = All;
          DrillDownPageId = "Case List";
        }
        field(Dismantle;Rec.Dismantle)
        {
          ApplicationArea = All;
          DrillDownPageId = "Case List";
        }
        field("Endorse Engine";Rec."Endorse Engine")
        {
          ApplicationArea = All;
          DrillDownPageId = "Case List";
        }
        field("Closed Cases";Rec."Closed Cases")
        {
          ApplicationArea = All;
          DrillDownPageId = "Case List";
        }
        field("Closed Cases2";"Closed Cases2")
        {
          ApplicationArea = all;
          DrillDownPageId = "Case list";
        }
      }
    }
  }
  trigger OnOpenPage()var begin
    if not get(CompanyName)then begin
      clear(rec);
      "Primary Key":=CompanyName;
      insert;
    end;
  end;
}
