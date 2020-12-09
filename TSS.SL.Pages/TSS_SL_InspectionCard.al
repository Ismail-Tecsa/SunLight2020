page 50027 "Inspection Card"
{
  Caption = 'Inspection Card';
  PageType = Card;
  SourceTable = "Inspections";

  layout
  {
    area(content)
    {
      group(General)
      {
        field("Taxi ID";Rec."Taxi ID")
        {
          ApplicationArea = All;
        }
        field("Inspection Type";Rec."Inspection Type")
        {
          ApplicationArea = All;
        }
        field("Inspection Date";Rec."Inspection Date")
        {
          ApplicationArea = All;
        }
        field("Inspection Expiry Date";Rec."Inspection Expiry Date")
        {
          ApplicationArea = All;
        }
        field("Puspakom Location";Rec."Puspakom Location")
        {
          ApplicationArea = All;
        }
        field("Inform Date";Rec."Inform Date")
        {
          ApplicationArea = All;
        }
        field("Original Grant";Rec."Original Grant")
        {
          ApplicationArea = All;
        }
        field(VR1;Rec.VR1)
        {
          ApplicationArea = All;
        }
        field("Surat Meter";Rec."Surat Meter")
        {
          ApplicationArea = All;
        }
        field("Sign out Date";Rec."Sign out Date")
        {
          ApplicationArea = All;
        }
        field("Sign Out By";Rec."Sign Out By")
        {
          ApplicationArea = All;
        }
        field("Sign In Date";Rec."Sign In Date")
        {
          ApplicationArea = All;
        }
        field("Entitle to Claim";Rec."Entitle to Claim")
        {
          ApplicationArea = All;
        }
        field(Amount;Rec.Amount)
        {
          ApplicationArea = All;
        }
        field("Entitled to Claim Date";Rec."Entitled to Claim Date")
        {
          ApplicationArea = All;
        }
      }
      group("E-Booking")
      {
        field("E-Booking Type";Rec."E-Booking Type")
        {
          ApplicationArea = All;
        }
        field("E-Booking Created";Rec."E-Booking Created")
        {
          ApplicationArea = All;
        }
        field("E-Booking Tracking No.";Rec."E-Booking Tracking No.")
        {
          ApplicationArea = All;
        }
        field("E-Booking Inspection Date";Rec."E-Booking Inspection Date")
        {
          ApplicationArea = All;
        }
        field("E-Booking Confirmation";Rec."E-Booking Confirmation")
        {
          ApplicationArea = All;
        }
        field("Open Date for Inspection";Rec."Open Date for Inspection")
        {
          ApplicationArea = All;
        }
        field("Close Date for Inspection";Rec."Close Date for Inspection")
        {
          ApplicationArea = All;
        }
        field(Reason;Rec.Reason)
        {
          ApplicationArea = All;
        }
      }
    }
    area(FactBoxes)
    {
      part("Package Details";"Taxi Details FactBox")
      {
        ApplicationArea = all;
        SubPageLink = "Taxi ID"=field("Taxi ID");
      }
      part("Owner Details";"Owner Details FactBox")
      {
        ApplicationArea = all;
        SubPageLink = "Taxi ID"=field("Taxi ID");
      }
      systempart(Control1905767507;Notes)
      {
        ApplicationArea = Notes;
      }
    }
  }
  var trigger OnAfterGetRecord()begin
  end;
}
