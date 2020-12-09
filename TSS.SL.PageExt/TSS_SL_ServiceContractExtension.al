pageextension 50002 "Service Contract Extension" extends "Service Contract"
{
  layout
  {
    addafter("Starting Date")
    {
      field(Freeze;Freeze)
      {
        ApplicationArea = all;
      }
      field("Package Scheme";"Package Scheme")
      {
        ApplicationArea = All;
      }
      field("Festival Discount Scheme";"Festival Discount Scheme")
      {
        ApplicationArea = All;
      }
      field("Driver 1";Rec."Driver 1")
      {
        ApplicationArea = All;

        trigger OnValidate()begin
          driver1.get("Driver 1");
        end;
      }
      field("Driver 1 Name";driver1.name)
      {
        caption = 'Name';
        ApplicationArea = all;
        Editable = false;
      }
      field("Driver 2";Rec."Driver 2")
      {
        ApplicationArea = All;

        trigger OnValidate()begin
          driver2.get("Driver 2");
        end;
      }
      field("Driver 2 Name";driver2.name)
      {
        caption = 'Name';
        ApplicationArea = all;
        Editable = false;
      }
      field("Overdue Days";"Overdue Days")
      {
        ApplicationArea = all;
      }
      field("Overdue Amount";"Overdue Amount")
      {
        ApplicationArea = all;
      }
    }
    addbefore(Control1902018507)
    {
      part(DriverFactbox;"Owner Details FactBox")
      {
        ApplicationArea = Basic, Suite;
        Provider = ServContractLines;
        SubPageLink = "Taxi ID"=FIELD("Taxi ID");
        Visible = true;
      }
      part("Taxi Details";"Taxi Details FactBox")
      {
        ApplicationArea = all;
        Provider = ServContractLines;
        SubPageLink = "Taxi ID"=field("Taxi ID");
      }
    }
    modify(Control1902018507)
    {
    Visible = false;
    }
  }
  actions
  {
    addafter("Service &Hours")
    {
      action("Booking Entries")
      {
        ApplicationArea = Basic, Suite;
        Caption = 'Booking Entries';
        Image = Entries;
        Promoted = true;
        PromotedIsBig = true;
        RunObject = Page "booking entries";
        RunPageLink = "Contract No."=FIELD("Contract No.");
        ToolTip = 'View the booking entries';
      }
      action("Pass Card")
      {
        ApplicationArea = all;
        Caption = 'Pass Card';
        Image = Card;
        RunObject = page "Pass Card List";
        RunPageLink = "Contract No."=field("Contract No.");
      }
    }
  }
  var driver1: record customer;
  driver2: record customer;
  trigger OnAfterGetRecord()begin
    if not driver1.get("Driver 1")then clear(driver1);
    if not driver2.get("Driver 2")then clear(driver2);
    setfilter("Date Filter", '..%1', WorkDate());
    CalcFields("Overdue Amount", "Overdue Days");
  end;
}
