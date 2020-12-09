page 50047 "Settlement Cues"
{
  Caption = 'Settlement Cues';
  PageType = CardPart;
  RefreshOnActivate = true;
  SourceTable = "settlement Cues";

  layout
  {
    area(content)
    {
      cuegroup("Settlement")
      {
        field(Open;Open)
        {
          ApplicationArea = All;
          DrillDownPageId = "Settlement List";
        }
        field("Pending Approval";"Pending Approval")
        {
          ApplicationArea = All;
          DrillDownPageId = "settlement List";
        }
        field("Pending Payment";"Pending Payment")
        {
          ApplicationArea = All;
          DrillDownPageId = "settlement List";
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
