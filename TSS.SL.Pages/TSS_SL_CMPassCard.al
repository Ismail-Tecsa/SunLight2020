page 50033 "CM Pass Card"
{
  Caption = 'CM Pass Card';
  PageType = CardPart;
  SourceTable = "CM Pass Card";

  layout
  {
    area(content)
    {
      group("Pass Card")
      {
        field("Serial No.";Rec."Serial No.")
        {
          ApplicationArea = All;
        }
        field("Start Date";Rec."Start Date")
        {
          ApplicationArea = All;
        }
        field("End Date";Rec."End Date")
        {
          ApplicationArea = All;
        }
        field("Driver Status";Rec."Driver Status")
        {
          ApplicationArea = All;
        }
        field(Type;Rec.Type)
        {
          ApplicationArea = All;
        }
        field("Collected by Driver";Rec."Collected by Driver")
        {
          ApplicationArea = All;
        }
        field("Reason not Collected";Rec."Reason not Collected")
        {
          ApplicationArea = All;
        }
        field("Reason for Cant Renew";Rec."Reason for Cant Renew")
        {
          ApplicationArea = All;
        }
        field("Reason for Not Receiving";Rec."Reason for Not Receiving")
        {
          ApplicationArea = All;
        }
        field("Pass Card Renewal Date";Rec."Pass Card Renewal Date")
        {
          ApplicationArea = All;
        }
        field(Remark;Rec.Remark)
        {
          ApplicationArea = All;
        }
      }
      group(Documents)
      {
        field(Permit;Rec.Permit)
        {
          ApplicationArea = All;
        }
        field("Driver IC";Rec."Driver IC")
        {
          ApplicationArea = All;
        }
        field("Driver License";Rec."Driver License")
        {
          ApplicationArea = All;
        }
        field("Driver PSV";Rec."Driver PSV")
        {
          ApplicationArea = All;
        }
        field("Signatories IC";Rec."Signatories IC")
        {
          ApplicationArea = All;
        }
        field("Permit Company Auth. Letter";Rec."Permit Company Auth. Letter")
        {
          ApplicationArea = All;
        }
        field("Form APAD";Rec."Form APAD")
        {
          ApplicationArea = All;
        }
        field("Form APAD Date Received";Rec."Form APAD Date Received")
        {
          ApplicationArea = All;
        }
        field("Takeout Form";Rec."Takeout Form")
        {
          ApplicationArea = All;
        }
        field("Document on Hand Date";Rec."Document on Hand Date")
        {
          ApplicationArea = All;
        }
        field("Document From Driver";Rec."Document From Driver")
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
