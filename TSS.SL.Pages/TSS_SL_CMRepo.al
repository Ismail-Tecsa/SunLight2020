page 50048 "CM Repo"
{
  Caption = 'CM Repo';
  PageType = CardPart;
  SourceTable = "CM Repo";

  layout
  {
    area(content)
    {
      group(General)
      {
        field(Version;Rec.Version)
        {
          ApplicationArea = All;
          Editable = false;
        }
        field("Repo Status";Rec."Repo Status")
        {
          ApplicationArea = All;
        }
        field(Repossessor;Rec.Repossessor)
        {
          ApplicationArea = All;
        }
        field("Reposessor Name";Rec."Reposessor Name")
        {
          ApplicationArea = All;
        }
        field("Reposessor Phone";Rec."Reposessor Phone")
        {
          ApplicationArea = All;
        }
        field("Branch ID";Rec."Branch ID")
        {
          ApplicationArea = All;
        }
        field("Issue Date";Rec."Issue Date")
        {
          ApplicationArea = All;
        }
        field("Expiry Date";Rec."Expiry Date")
        {
          ApplicationArea = All;
        }
        field("Repo Item No.";Rec."Repo Item No.")
        {
          ApplicationArea = All;
        }
        field("Repo Fee";Rec."Repo Fee")
        {
          ApplicationArea = All;
        }
      }
      group("Check List")
      {
        field("Time In";Rec."Time In")
        {
          ApplicationArea = All;
        }
        field("Date In";Rec."Date In")
        {
          ApplicationArea = All;
        }
        field("Date Out";Rec."Date Out")
        {
          ApplicationArea = All;
        }
        field("Surrender Type";Rec."Surrender Type")
        {
          ApplicationArea = All;
        }
        field(Location;Rec.Location)
        {
          ApplicationArea = All;
        }
        field("Account Closed Date";Rec."Account Closed Date")
        {
          ApplicationArea = All;
        }
        field("Original Permit";Rec."Original Permit")
        {
          ApplicationArea = All;
        }
        field("Original Meter Letter";Rec."Original Meter Letter")
        {
          ApplicationArea = All;
        }
        field("Original Sticker Puspakom";Rec."Original Sticker Puspakom")
        {
          ApplicationArea = All;
        }
        field("Original Road Tax";Rec."Original Road Tax")
        {
          ApplicationArea = All;
        }
        field("Cassette/Radio/Speakers";Rec."Cassette/Radio/Speakers")
        {
          ApplicationArea = All;
        }
        field("GPS Set";Rec."GPS Set")
        {
          ApplicationArea = All;
        }
        field("Meter Set";Rec."Meter Set")
        {
          ApplicationArea = All;
        }
        field("NGV ";Rec."NGV ")
        {
          ApplicationArea = All;
        }
        field("Radio Call Set";Rec."Radio Call Set")
        {
          ApplicationArea = All;
        }
        field("Spare Tyre";Rec."Spare Tyre")
        {
          ApplicationArea = All;
        }
        field("Tools and Jack";Rec."Tools and Jack")
        {
          ApplicationArea = All;
        }
        field("Fire Extinguisher";Rec."Fire Extinguisher")
        {
          ApplicationArea = All;
        }
        field("Car Key / Alarm";Rec."Car Key / Alarm")
        {
          ApplicationArea = All;
        }
        field("Other Item 1";Rec."Other Item 1")
        {
          ApplicationArea = All;
        }
        field("Other Item 2";Rec."Other Item 2")
        {
          ApplicationArea = All;
        }
      }
    }
  }
  actions
  {
    area(Processing)
    {
      action("New Version")
      {
        Promoted = true;
        PromotedIsBig = true;
        ApplicationArea = ALL;

        trigger OnAction()var Repo: Record "CM Repo";
        begin
          TestField("Repo Status", "Repo status"::Pending);
          if confirm('Do you wish to create a new version of this REPO case?')then begin
            repo:=rec;
            repo."Expiry Date":=0D;
            repo."Issue Date":=0D;
            repo.Version+=1;
            repo.insert;
            findlast;
          end;
        end;
      }
      action("Previous Version")
      {
        Promoted = true;
        PromotedIsBig = true;
        ApplicationArea = all;

        trigger OnAction()begin
          if next(-1) = 0 then findfirst;
        end;
      }
      action("Last Version")
      {
        Promoted = true;
        PromotedIsBig = true;
        ApplicationArea = all;

        trigger OnAction()begin
          findlast;
        end;
      }
    }
  }
  trigger OnOpenPage()begin
    if not findlast()then;
  end;
}
