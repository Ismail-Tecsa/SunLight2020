page 50029 "Case Management Card"
{
  Caption = 'Case Management';
  PageType = Card;
  SourceTable = Case;
  Editable = true;

  layout
  {
    area(content)
    {
      group(General)
      {
        field("Case ID";Rec."Case ID")
        {
          ApplicationArea = All;
        }
        field(Type;Rec.Type)
        {
          ApplicationArea = All;

          trigger OnValidate()begin
            CurrPage.Update();
          end;
        }
        field("Contract No.";Rec."Contract No.")
        {
          ApplicationArea = All;
        }
        field("Taxi ID";Rec."Taxi ID")
        {
          ApplicationArea = All;
        }
        field("Owner ID";Rec."Owner ID")
        {
          ApplicationArea = All;
        }
        field("Permit ID";Rec."Permit ID")
        {
          ApplicationArea = All;
        }
        field(Status;Rec.Status)
        {
          ApplicationArea = All;
        }
        field("Case Settled";"Case Settled")
        {
          ApplicationArea = all;
        }
        field("Search Description";Rec."Search Description")
        {
          ApplicationArea = All;
        }
        field("Raised by";Rec."Raised by")
        {
          ApplicationArea = All;
        }
        field("Case Created by";Rec."Case Created by")
        {
          ApplicationArea = All;
          Editable = false;
        }
        field("Case Created";Rec."Case Created")
        {
          ApplicationArea = All;
          Editable = false;
        }
      }
      part("Case Details1";"CM Lost Document Card")
      {
        ApplicationArea = all;
        Caption = 'Case Details';
        SubPageLink = "Case ID"=FIELD("Case ID");
        UpdatePropagation = Both;
        Visible = Type = type::"Lost Document";
      }
      part("Case Details2";"CM Endorse Engine")
      {
        ApplicationArea = all;
        Caption = 'Case Details';
        SubPageLink = "Case ID"=FIELD("Case ID");
        UpdatePropagation = Both;
        Visible = Type = type::"Endorse Engine";
      }
      part("Case Details3";"CM Pass Card")
      {
        ApplicationArea = all;
        Caption = 'Case Details';
        SubPageLink = "Case ID"=FIELD("Case ID");
        UpdatePropagation = Both;
        Visible = Type = type::"Pass Card";
      }
      part("Case Details4";"CM Summon Card")
      {
        ApplicationArea = all;
        Caption = 'Case Details';
        SubPageLink = "Case ID"=FIELD("Case ID");
        UpdatePropagation = Both;
        Visible = Type = type::"summon";
      }
      part("Case Details5";"CM Accident")
      {
        ApplicationArea = all;
        Caption = 'Case Details';
        SubPageLink = "Case ID"=FIELD("Case ID");
        UpdatePropagation = Both;
        Visible = Type = type::Accident;
      }
      part("Offer Letters";"CM Offer Subform")
      {
        ApplicationArea = all;
        Caption = 'Offer Letters';
        SubPageLink = "Case ID"=FIELD("Case ID");
        UpdatePropagation = Both;
        Visible = type = type::Accident;
      }
      part("PG10";"CM PG10")
      {
        ApplicationArea = all;
        Caption = 'PG10';
        SubPageLink = "Case ID"=FIELD("Case ID");
        UpdatePropagation = Both;
        Visible = type = type::PG10;
      }
      part(Dismantle;"CM Dismantle")
      {
        ApplicationArea = all;
        Caption = 'Dismantle';
        SubPageLink = "Case ID"=FIELD("Case ID");
        UpdatePropagation = Both;
        Visible = type = type::Dismantle;
      }
      part(Repo;"CM repo")
      {
        ApplicationArea = all;
        Caption = 'Repo';
        SubPageLink = "Case ID"=FIELD("Case ID");
        UpdatePropagation = Both;
        Visible = type = type::repo;
      }
      part(Spoils;"CM Spoil Subform")
      {
        ApplicationArea = all;
        Caption = 'Spoil / Unauthorized Dismantle Parts & Taxi Condition.';
        SubPageLink = "Case ID"=FIELD("Case ID");
        UpdatePropagation = Both;
        Visible = type = type::repo;
      }
    }
    area(factboxes)
    {
      part(DriverFactbox;"Owner Details FactBox")
      {
        ApplicationArea = Basic, Suite;
        SubPageLink = "Taxi ID"=FIELD("Taxi ID");
        Visible = true;
      }
      part("Taxi Details";"Taxi Details FactBox")
      {
        ApplicationArea = all;
        SubPageLink = "Taxi ID"=field("Taxi ID");
      }
      part("Attached Documents";"Document Attachment Factbox")
      {
        ApplicationArea = All;
        Caption = 'Attachments';
        SubPageLink = "Table ID"=CONST(50015), "No."=FIELD("Case ID");
      }
      systempart(Control1900383207;Links)
      {
        ApplicationArea = RecordLinks;
      }
      systempart(Control1905767507;Notes)
      {
        ApplicationArea = Notes;
      }
    }
  }
}
