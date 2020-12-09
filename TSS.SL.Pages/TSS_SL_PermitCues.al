page 50015 "Permit Cues"
{
  Caption = 'Permit Cues';
  PageType = CardPart;
  RefreshOnActivate = true;
  SourceTable = "Permit Cue";

  layout
  {
    area(content)
    {
      cuegroup("Permits")
      {
        field("Total Permits";Rec."Total Permits")
        {
          drilldownpageid = "Permit List";
          ApplicationArea = All;
        }
        field("Active Permits";Rec."Active Permits")
        {
          drilldownpageid = "Permit List";
          ApplicationArea = All;
        }
        field("New Permits";Rec."New Permits")
        {
          drilldownpageid = "Permit List";
          ApplicationArea = All;
        }
        field("PG10 Permits";Rec."PG10 Permits")
        {
          drilldownpageid = "Permit List";
          ApplicationArea = All;
        }
        field("SK-Used Permits";Rec."SK-Used Permits")
        {
          drilldownpageid = "Permit List";
          ApplicationArea = All;
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
