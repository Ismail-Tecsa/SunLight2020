page 50030 "Case List"
{
  ApplicationArea = All;
  Caption = 'Case List';
  PageType = List;
  SourceTable = Case;
  UsageCategory = Lists;
  CardPageId = "Case Management Card";
  PromotedActionCategories = 'New,Process';

  layout
  {
    area(content)
    {
      repeater(General)
      {
        field("Case ID";Rec."Case ID")
        {
          ApplicationArea = All;
        }
        field(Type;Rec.Type)
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
        field("Contract No.";Rec."Contract No.")
        {
          ApplicationArea = All;
        }
        field("Taxi ID";Rec."Taxi ID")
        {
          ApplicationArea = All;
        }
        field("Owner ID";"Owner ID")
        {
          ApplicationArea = All;
        }
        field("Permit ID";Rec."Permit ID")
        {
          ApplicationArea = All;
        }
        field("Search Description";Rec."Search Description")
        {
          ApplicationArea = All;
        }
        field("Case Created";Rec."Case Created")
        {
          ApplicationArea = All;
        }
        field("Case Created by";Rec."Case Created by")
        {
          ApplicationArea = All;
        }
      }
    }
  }
  trigger OnOpenPage()begin
    SetRange("Case Company", CompanyName);
  end;
}
