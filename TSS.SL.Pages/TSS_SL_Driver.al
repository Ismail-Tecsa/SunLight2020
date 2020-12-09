page 50000 "Driver Card"
{
  Caption = 'Driver Card';
  PageType = Card;
  PromotedActionCategories = 'New,Process,Report,New Document,Approve,Request Approval,Prices and Discounts,Navigate,Customer';
  RefreshOnActivate = true;
  SourceTable = Customer;

  layout
  {
    area(content)
    {
      group(General)
      {
        Caption = 'General';

        field("No.";"No.")
        {
          ApplicationArea = All;
          Importance = Standard;
          ToolTip = 'Specifies the number of the driver. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
          Visible = NoFieldVisible;

          trigger OnAssistEdit()begin
            if AssistEdit(xRec)then CurrPage.Update;
          end;
        }
        field(Name;Name)
        {
          ApplicationArea = All;
          Importance = Promoted;
          ShowMandatory = true;
          ToolTip = 'Specifies the customer''s name. This name will appear on all sales documents for the customer.';

          trigger OnValidate()begin
            CurrPage.SaveRecord;
          end;
        }
        field("Name 2";"Name 2")
        {
          ApplicationArea = All;
          Importance = Additional;
          ToolTip = 'Specifies an additional part of the name.';
          Visible = false;
        }
        field("Date of Birth";"Date of Birth")
        {
          ApplicationArea = all;
          Importance = Promoted;

          trigger OnValidate()begin
            calcage;
          end;
        }
        field(age;Age)
        {
          Editable = false;
          ApplicationArea = all;
          Importance = Promoted;
        }
        field(Gender;Gender)
        {
          ApplicationArea = all;
        }
        field(Race;Race)
        {
          ApplicationArea = all;
        }
        field("IC Partner Code";"IC Partner Code")
        {
          ApplicationArea = Intercompany;
          Importance = Additional;
          ToolTip = 'Specifies the customer''s intercompany partner code.';
        }
        field(Contract;Contract)
        {
          ApplicationArea = all;
          LookupPageId = "Service Contract";
        }
        field(NRIC;NRIC)
        {
          ApplicationArea = Basic, Suite;
          Importance = Standard;
          ToolTip = 'Specifies the Drivers NRIC No.';
        }
        field(Blocked;Blocked)
        {
          ApplicationArea = Basic, Suite;
          ToolTip = 'Specifies which transactions with the customer that cannot be blocked, for example, because the customer is insolvent.';
        }
        field("Privacy Blocked";"Privacy Blocked")
        {
          ApplicationArea = Basic, Suite;
          Importance = Additional;
          ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
        }
        field("Salesperson Code";"Salesperson Code")
        {
          ApplicationArea = Suite;
          Importance = Additional;
          ToolTip = 'Specifies a code for the salesperson who normally handles this customer''s account.';
        }
        field("Responsibility Center";"Responsibility Center")
        {
          ApplicationArea = Suite;
          Importance = Additional;
          ToolTip = 'Specifies the code for the responsibility center that will administer this customer by default.';
        }
        field("Last Date Modified";"Last Date Modified")
        {
          ApplicationArea = Basic, Suite;
          Importance = Additional;
          ToolTip = 'Specifies when the customer card was last modified.';
        }
      }
      group("Address & Contact")
      {
        Caption = 'Address & Contact';

        group(AddressDetails)
        {
          Caption = 'Address';

          field(Address;Address)
          {
            ApplicationArea = Basic, Suite;
            ToolTip = 'Specifies the customer''s address. This address will appear on all sales documents for the customer.';
          }
          field("Address 2";"Address 2")
          {
            ApplicationArea = Basic, Suite;
            ToolTip = 'Specifies additional address information.';
          }
          field("Country/Region Code";"Country/Region Code")
          {
            ApplicationArea = Basic, Suite;
            ToolTip = 'Specifies the country/region of the address.';

            trigger OnValidate()begin
              IsCountyVisible:=FormatAddress.UseCounty("Country/Region Code");
            end;
          }
          field(City;City)
          {
            ApplicationArea = Basic, Suite;
            ToolTip = 'Specifies the customer''s city.';
          }
          group(Control10)
          {
            ShowCaption = false;
            Visible = IsCountyVisible;

            field(County;County)
            {
              ApplicationArea = Basic, Suite;
              ToolTip = 'Specifies the state, province or county as a part of the address.';
            }
          }
          field("Post Code";"Post Code")
          {
            ApplicationArea = Basic, Suite;
            Importance = Promoted;
            ToolTip = 'Specifies the postal code.';
          }
          field(ShowMap;ShowMapLbl)
          {
            ApplicationArea = Basic, Suite;
            Editable = false;
            ShowCaption = false;
            Style = StrongAccent;
            StyleExpr = TRUE;
            ToolTip = 'Specifies the customer''s address on your preferred map website.';

            trigger OnDrillDown()begin
              CurrPage.Update(true);
              DisplayMap;
            end;
          }
        }
      }
      group("Driver Details")
      {
        Caption = 'Driver Details';

        field("Date joined";"Date joined")
        {
          caption = 'Date joined';
          ApplicationArea = Basic, Suite;
        }
        field("Black Listed";"Black Listed")
        {
          ApplicationArea = Basic, Suite;
          ToolTip = 'Black Listed';
        }
        field("Driver Status";"Driver Status")
        {
          caption = 'Driver Status';
          ApplicationArea = Basic, Suite;
        }
        field("Original IC sighted";"Original IC sighted")
        {
          Caption = 'Original IC sighted';
          ApplicationArea = Basic, Suite;
        }
        field("Place of Birth";"Place of Birth")
        {
          caption = 'Place of Birth';
          ApplicationArea = Basic, Suite;
        }
        field("Staying Period";"Staying Period")
        {
          Caption = 'Current Address Staying Period.';
          ApplicationArea = Basic, Suite;
        }
        field("Home Town";"Home Town")
        {
          caption = 'Home Town';
          ApplicationArea = Basic, Suite;
        }
        field("Driving License No.";"Driving License No.")
        {
          caption = 'Driving License No.';
          ApplicationArea = Basic, Suite;
        }
        field("Driving License Expiry";"Driving License Expiry")
        {
          caption = 'Driving License Expiry Date.';
          ApplicationArea = Basic, Suite;
        }
        field("PSV License No.";"PSV License No.")
        {
          caption = 'PSV License No.';
          ApplicationArea = Basic, Suite;
        }
        field("PSV License Expiry";"PSV License Expiry")
        {
          caption = 'PSV License Expiry Date.';
          ApplicationArea = Basic, Suite;
        }
        field("Utility Bill received";"Utility Bill received")
        {
          Caption = 'Utility Bill received';
          ApplicationArea = Basic, Suite;
        }
        field("Quit Rent";"Quit Rent")
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Quit Rent';
        }
        field("Bank Statement";"Bank Statement")
        {
          Caption = 'Bank Statement';
          ApplicationArea = Basic, Suite;
        }
        field("Original License Sighted";"Original License Sighted")
        {
          Caption = 'Original License Sighted';
          ApplicationArea = Basic, Suite;
        }
        field("Original PSV Sighted";"Original PSV Sighted")
        {
          Caption = 'Original PSV Sighted';
          ApplicationArea = Basic, Suite;
        }
        group(ContactDetails)
        {
          Caption = 'Contact';

          field("Primary Contact No.";"Primary Contact No.")
          {
            ApplicationArea = Basic, Suite;
            Caption = 'Contact Code';
            Importance = Additional;
            ToolTip = 'Specifies the contact number for the customer.';
          }
          field(ContactName;Contact)
          {
            ApplicationArea = Basic, Suite;
            Caption = 'Contact Name';
            Editable = ContactEditable;
            Importance = Promoted;
            ToolTip = 'Specifies the name of the person you regularly contact when you do business with this customer.';

            trigger OnValidate()begin
              ContactOnAfterValidate;
            end;
          }
          field("Phone No.";"Phone No.")
          {
            ApplicationArea = Basic, Suite;
            ToolTip = 'Specifies the customer''s telephone number.';
          }
          field(MobilePhoneNo;"Mobile Phone No.")
          {
            Caption = 'Mobile Phone No.';
            ApplicationArea = Basic, Suite;
            ExtendedDatatype = PhoneNo;
            ToolTip = 'Specifies the customer''s mobile telephone number.';
          }
          field("E-Mail";"E-Mail")
          {
            ApplicationArea = Basic, Suite;
            ExtendedDatatype = EMail;
            Importance = Promoted;
            ToolTip = 'Specifies the customer''s email address.';
          }
        }
      }
      group(Invoicing)
      {
        Caption = 'Invoicing';

        field("Bill-to Customer No.";"Bill-to Customer No.")
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Bill-to Customer';
          Importance = Standard;
          ToolTip = 'Specifies a different customer who will be invoiced for products that you sell to the customer in the Name field on the customer card.';
        }
        field("Overdue Days";"Overdue Days")
        {
          applicationarea = basic, suite;
          caption = 'Overdue Days';
          Importance = Standard;
        }
        field("Overdue Amount";"Overdue Amount")
        {
          applicationarea = basic, suite;
          caption = 'Overdue Amount';
          Importance = Standard;
        }
      }
      group(PostingDetails)
      {
        Caption = 'Posting Details';

        field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
        {
          ApplicationArea = Basic, Suite;
          Importance = Promoted;
          ShowMandatory = true;
          ToolTip = 'Specifies the customer''s trade type to link transactions made for this customer with the appropriate general ledger account according to the general posting setup.';
        }
        field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
        {
          ApplicationArea = Basic, Suite;
          Importance = Additional;
          ToolTip = 'Specifies the customer''s VAT specification to link transactions made for this customer to.';
        }
        field("Customer Posting Group";"Customer Posting Group")
        {
          ApplicationArea = Basic, Suite;
          Importance = Promoted;
          ShowMandatory = true;
          ToolTip = 'Specifies the customer''s market type to link business transactions to.';
        }
      }
      group(Payments)
      {
        Caption = 'Payments';

        field("Application Method";"Application Method")
        {
          ApplicationArea = Basic, Suite;
          Importance = Additional;
          ToolTip = 'Specifies how to apply payments to entries for this customer.';
        }
        field("Payment Terms Code";"Payment Terms Code")
        {
          ApplicationArea = Basic, Suite;
          Importance = Promoted;
          ShowMandatory = true;
          ToolTip = 'Specifies a code that indicates the payment terms that you require of the customer.';
        }
        field("Payment Method Code";"Payment Method Code")
        {
          ApplicationArea = Basic, Suite;
          Importance = Additional;
          ToolTip = 'Specifies how the customer usually submits payment, such as bank transfer or check.';
        }
      }
      group(Shipping)
      {
        Caption = 'Shipping';

        field("Base Calendar Code";"Base Calendar Code")
        {
          ApplicationArea = Basic, Suite;
          DrillDown = false;
          ToolTip = 'Specifies a customizable calendar for shipment planning that holds the customer''s working days and holidays.';
        }
        field("Customized Calendar";format(CalendarMgmt.CustomizedChangesExist(Rec)))
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Customized Calendar';
          Editable = false;
          ToolTip = 'Specifies that you have set up a customized version of a base calendar.';

          trigger OnDrillDown()begin
            CurrPage.SaveRecord;
            TestField("Base Calendar Code");
            CalendarMgmt.ShowCustomizedCalendar(Rec);
          end;
        }
      }
      group(Statistics)
      {
        Caption = 'Statistics';
        Editable = false;
        Visible = FoundationOnly;

        group(Balance)
        {
          Caption = 'Balance';

          field("Balance (LCY)2";"Balance (LCY)")
          {
            ApplicationArea = Basic, Suite;
            Caption = 'Money Owed - Current';
            ToolTip = 'Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.';

            trigger OnDrillDown()begin
              OpenCustomerLedgerEntries(false);
            end;
          }
          field(ExpectedCustMoneyOwed;ExpectedMoneyOwed)
          {
            ApplicationArea = Basic, Suite;
            Caption = 'Money Owed - Expected';
            Editable = false;
            Importance = Additional;
            ToolTip = 'Specifies the payment amount that the customer will owe when ongoing sales invoices and credit memos are completed. The value is calculated asynchronously so there might be a delay in updating this field.';

            trigger OnDrillDown()begin
              CustomerMgt.DrillDownMoneyOwedExpected("No.");
            end;
          }
          field(TotalMoneyOwed;TotalMoneyOwed)
          {
            ApplicationArea = Basic, Suite;
            Caption = 'Money Owed - Total';
            Style = Strong;
            StyleExpr = TRUE;
            ToolTip = 'Specifies the payment amount that the customer owes for completed sales plus sales that are still ongoing. The value is calculated asynchronously so there might be a delay in updating this field.';
          }
        }
        group(Control108)
        {
          Caption = 'Payments';

          field("Balance Due";CalcOverdueBalance)
          {
            ApplicationArea = Basic, Suite;
            CaptionClass = Format(StrSubstNo(OverduePaymentsMsg, Format(WorkDate)));
            ToolTip = 'Specifies the sum of outstanding payments from the customer.';

            trigger OnDrillDown()var DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
            CustLedgEntry: Record "Cust. Ledger Entry";
            begin
              DtldCustLedgEntry.SetFilter("Customer No.", "No.");
              CopyFilter("Global Dimension 1 Filter", DtldCustLedgEntry."Initial Entry Global Dim. 1");
              CopyFilter("Global Dimension 2 Filter", DtldCustLedgEntry."Initial Entry Global Dim. 2");
              CopyFilter("Currency Filter", DtldCustLedgEntry."Currency Code");
              CustLedgEntry.DrillDownOnOverdueEntries(DtldCustLedgEntry);
            end;
          }
          field("Payments (LCY)";"Payments (LCY)")
          {
            ApplicationArea = Basic, Suite;
            Caption = 'Payments This Year';
            ToolTip = 'Specifies the sum of payments received from the customer in the current fiscal year.';
          }
          field("CustomerMgt.AvgDaysToPay(""No."")";AvgDaysToPay)
          {
            ApplicationArea = Basic, Suite;
            Caption = 'Average Collection Period (Days)';
            DecimalPlaces = 0: 1;
            Importance = Additional;
            ToolTip = 'Specifies how long the customer typically takes to pay invoices in the current fiscal year. The value is calculated asynchronously so there might be a delay in updating this field.';
          }
          field(DaysPaidPastDueDate;DaysPastDueDate)
          {
            ApplicationArea = Basic, Suite;
            Caption = 'Average Late Payments (Days)';
            DecimalPlaces = 0: 1;
            Importance = Additional;
            Style = Attention;
            StyleExpr = AttentionToPaidDay;
            ToolTip = 'Specifies the average number of days the customer is late with payments. The value is calculated asynchronously so there might be a delay in updating this field.';
          }
        }
      }
      part("Referees";"Referee Subform")
      {
        ApplicationArea = RelationshipMgmt;
        Caption = 'Referees';
        SubPageLink = "Driver No."=FIELD("No.");
        UpdatePropagation = Both;
      }
      part("Profile Questionnaire";"Contact Card Subform")
      {
        ApplicationArea = RelationshipMgmt;
        Caption = 'Profile Questionnaire';
        SubPageLink = "Contact No."=FIELD("primary contact No.");
      }
    }
    area(factboxes)
    {
      part(Control149;"Customer Picture")
      {
        ApplicationArea = Basic, Suite;
        SubPageLink = "No."=FIELD("No.");
        Visible = NOT IsOfficeAddin;
      }
      part("Attached Documents";"Document Attachment Factbox")
      {
        ApplicationArea = All;
        Caption = 'Attachments';
        SubPageLink = "Table ID"=CONST(18), "No."=FIELD("No.");
        Visible = NOT IsOfficeAddin;
      }
      part(Details;"Office Customer Details")
      {
        ApplicationArea = All;
        Caption = 'Details';
        SubPageLink = "No."=FIELD("No.");
        Visible = IsOfficeAddin;
      }
      part(DriverFactbox;"Driver Details FactBox")
      {
        ApplicationArea = Basic, Suite;
        SubPageLink = "No."=FIELD("No.");
        Visible = true;
      }
      part(CustomerStatisticsFactBox;"Customer Statistics FactBox")
      {
        ApplicationArea = Basic, Suite;
        SubPageLink = "No."=FIELD("No."), "Currency Filter"=FIELD("Currency Filter"), "Date Filter"=FIELD("Date Filter"), "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
      }
      part(Control1905532107;"Dimensions FactBox")
      {
        ApplicationArea = Basic, Suite;
        SubPageLink = "Table ID"=CONST(18), "No."=FIELD("No.");
      }
      part(Control1907829707;"Service Hist. Sell-to FactBox")
      {
        ApplicationArea = Basic, Suite;
        SubPageLink = "No."=FIELD("No."), "Currency Filter"=FIELD("Currency Filter"), "Date Filter"=FIELD("Date Filter"), "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
        Visible = false;
      }
      part(Control1902613707;"Service Hist. Bill-to FactBox")
      {
        ApplicationArea = Basic, Suite;
        SubPageLink = "No."=FIELD("No."), "Currency Filter"=FIELD("Currency Filter"), "Date Filter"=FIELD("Date Filter"), "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
        Visible = false;
      }
      part(WorkflowStatus;"Workflow Status FactBox")
      {
        ApplicationArea = Suite;
        Editable = false;
        Enabled = false;
        ShowFilter = false;
        Visible = ShowWorkflowStatus;
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
  actions
  {
    area(navigation)
    {
      group("&Customer")
      {
        Caption = '&Customer';
        Image = Customer;

        action(Dimensions)
        {
          ApplicationArea = Dimensions;
          Caption = 'Dimensions';
          Image = Dimensions;
          Promoted = true;
          PromotedCategory = Category9;
          PromotedIsBig = true;
          RunObject = Page "Default Dimensions";
          RunPageLink = "Table ID"=CONST(18), "No."=FIELD("No.");
          ShortCutKey = 'Alt+D';
          ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
        }
        action(Contact)
        {
          AccessByPermission = TableData Contact=R;
          ApplicationArea = Basic, Suite;
          Caption = 'C&ontact';
          Image = ContactPerson;
          Promoted = true;
          PromotedCategory = Category8;
          ToolTip = 'View or edit detailed information about the contact person at the customer.';

          trigger OnAction()begin
            ShowContact;
          end;
        }
        action("Pro&files")
        {
          ApplicationArea = RelationshipMgmt;
          Caption = 'Pro&files';
          Image = Answers;
          ToolTip = 'Open the Profile Questionnaires window.';

          trigger OnAction()var ProfileManagement: Codeunit ProfileManagement;
          contact: record contact;
          begin
            if contact.get("Primary Contact No.")then ProfileManagement.ShowContactQuestionnaireCard(contact, '', 0);
          end;
        }
        action("Pass Card")
        {
          ApplicationArea = all;
          Caption = 'Pass Card';
          Image = Card;
          RunObject = page "Pass Card List";
          RunPageLink = "Driver No."=field("No.");
        }
        action("Co&mments")
        {
          ApplicationArea = Comments;
          Caption = 'Co&mments';
          Image = ViewComments;
          Promoted = true;
          PromotedCategory = Category9;
          RunObject = Page "Comment Sheet";
          RunPageLink = "Table Name"=CONST(Customer), "No."=FIELD("No.");
          ToolTip = 'View or add comments for the record.';
        }
        action(ApprovalEntries)
        {
          AccessByPermission = TableData "Approval Entry"=R;
          ApplicationArea = Suite;
          Caption = 'Approvals';
          Image = Approvals;
          Promoted = true;
          PromotedCategory = Category9;
          ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

          trigger OnAction()begin
            ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
          end;
        }
        action(Attachments)
        {
          ApplicationArea = All;
          Caption = 'Attachments';
          Image = Attach;
          Promoted = true;
          PromotedCategory = Category9;
          ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

          trigger OnAction()var DocumentAttachmentDetails: Page "Document Attachment Details";
          RecRef: RecordRef;
          begin
            RecRef.GetTable(Rec);
            DocumentAttachmentDetails.OpenForRecRef(RecRef);
            DocumentAttachmentDetails.RunModal;
          end;
        }
      }
      group(History)
      {
        Caption = 'History';
        Image = History;

        action("Black List History")
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Black List History';
          Image = Stop;
          Promoted = true;
          PromotedCategory = Category9;
          PromotedIsBig = true;
          RunObject = Page "Black List History";
          RunPageLink = "Driver No."=FIELD("No.");
          RunPageView = SORTING("Driver No.")ORDER(Descending);
          ToolTip = 'View the black list history';
        }
        action("Ledger E&ntries")
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Ledger E&ntries';
          Image = CustomerLedger;
          Promoted = true;
          PromotedCategory = Category9;
          PromotedIsBig = true;
          RunObject = Page "Customer Ledger Entries";
          RunPageLink = "Customer No."=FIELD("No.");
          RunPageView = SORTING("Customer No.")ORDER(Descending);
          ShortCutKey = 'Ctrl+F7';
          ToolTip = 'View the history of transactions that have been posted for the selected record.';
        }
        action(Action76)
        {
          ApplicationArea = Suite;
          Caption = 'Statistics';
          Image = Statistics;
          Promoted = true;
          PromotedCategory = Category9;
          PromotedIsBig = true;
          RunObject = Page "Customer Statistics";
          RunPageLink = "No."=FIELD("No."), "Date Filter"=FIELD("Date Filter"), "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
          ShortCutKey = 'F7';
          ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
        }
        action("S&ales")
        {
          ApplicationArea = Basic, Suite;
          Caption = 'S&ales';
          Image = Sales;
          Promoted = true;
          PromotedCategory = Category8;
          RunObject = Page "Customer Sales";
          RunPageLink = "No."=FIELD("No."), "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
          ToolTip = 'View a summary of customer ledger entries. You select the time interval in the View by field. The Period column on the left contains a series of dates that are determined by the time interval you have selected.';
        }
        action("Entry Statistics")
        {
          ApplicationArea = Suite;
          Caption = 'Entry Statistics';
          Image = EntryStatistics;
          RunObject = Page "Customer Entry Statistics";
          RunPageLink = "No."=FIELD("No."), "Date Filter"=FIELD("Date Filter"), "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
          ToolTip = 'View entry statistics for the record.';
        }
        separator(Action140)
        {
        }
      }
      group("Prices and Discounts")
      {
        Caption = 'Prices and Discounts';

        action("Invoice &Discounts")
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Invoice &Discounts';
          Image = CalculateInvoiceDiscount;
          //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
          //PromotedCategory = Category7;
          RunObject = Page "Cust. Invoice Discounts";
          RunPageLink = Code=FIELD("Invoice Disc. Code");
          ToolTip = 'Set up different discounts that are applied to invoices for the customer. An invoice discount is automatically granted to the customer when the total on a sales invoice exceeds a certain amount.';
        }
        action(PriceLists)
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Price Lists (Prices)';
          Image = Price;
          Visible = ExtendedPriceEnabled;
          ToolTip = 'View or set up different prices for products that you sell to the customer. A product price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';

          trigger OnAction()var PriceUXManagement: Codeunit "Price UX Management";
          AmountType: Enum "Price Amount Type";
          begin
            PriceUXManagement.ShowPriceLists(Rec, AmountType::Price);
          end;
        }
        action(PriceListsDiscounts)
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Price Lists (Discounts)';
          Image = LineDiscount;
          Visible = ExtendedPriceEnabled;
          ToolTip = 'View or set up different discounts for products that you sell to the customer. A product line discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';

          trigger OnAction()var PriceUXManagement: Codeunit "Price UX Management";
          AmountType: Enum "Price Amount Type";
          begin
            PriceUXManagement.ShowPriceLists(Rec, AmountType::Discount);
          end;
        }
        action(Prices)
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Prices';
          Image = Price;
          Visible = not ExtendedPriceEnabled;
          ToolTip = 'View or set up different prices for items that you sell to the customer. An item price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
          ObsoleteState = Pending;
          ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
          ObsoleteTag = '17.0';

          trigger OnAction()var SalesPrice: Record "Sales Price";
          begin
            SalesPrice.SetCurrentKey("Sales Type", "Sales Code");
            SalesPrice.SetRange("Sales Type", SalesPrice."Sales Type"::Customer);
            SalesPrice.SetRange("Sales Code", "No.");
            Page.Run(Page::"Sales Prices", SalesPrice);
          end;
        }
        action("Line Discounts")
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Line Discounts';
          Image = LineDiscount;
          Visible = not ExtendedPriceEnabled;
          ToolTip = 'View or set up different discounts for items that you sell to the customer. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
          ObsoleteState = Pending;
          ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
          ObsoleteTag = '17.0';

          trigger OnAction()var SalesLineDiscount: Record "Sales Line Discount";
          begin
            SalesLineDiscount.SetCurrentKey("Sales Type", "Sales Code");
            SalesLineDiscount.SetRange("Sales Type", SalesLineDiscount."Sales Type"::Customer);
            SalesLineDiscount.SetRange("Sales Code", "No.");
            Page.Run(Page::"Sales Line Discounts", SalesLineDiscount);
          end;
        }
        action("Prices and Discounts Overview")
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Special Prices & Discounts Overview';
          Image = PriceWorksheet;
          Visible = not ExtendedPriceEnabled;
          ToolTip = 'View all the special prices and line discounts that you grant for this customer when certain criteria are met, such as quantity, or ending date.';
          ObsoleteState = Pending;
          ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
          ObsoleteTag = '17.0';

          trigger OnAction()var SalesPriceAndLineDiscounts: Page "Sales Price and Line Discounts";
          begin
            SalesPriceAndLineDiscounts.InitPage(false);
            SalesPriceAndLineDiscounts.LoadCustomer(Rec);
            SalesPriceAndLineDiscounts.RunModal;
          end;
        }
      }
      group(Documents)
      {
        Caption = 'Documents';
        Image = Documents;

        action(Quotes)
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Quotes';
          Image = Quote;
          Promoted = true;
          PromotedCategory = Category8;
          RunObject = Page "Sales Quotes";
          RunPageLink = "Sell-to Customer No."=FIELD("No.");
          RunPageView = SORTING("Document Type", "Sell-to Customer No.");
          ToolTip = 'View a list of ongoing sales quotes for the customer.';
        }
        action(Invoices)
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Invoices';
          Image = Invoice;
          Promoted = true;
          PromotedCategory = Category8;
          RunObject = Page "Sales Invoice List";
          RunPageLink = "Sell-to Customer No."=FIELD("No.");
          RunPageView = SORTING("Document Type", "Sell-to Customer No.");
          ToolTip = 'View a list of ongoing sales invoices for the customer.';
        }
        action(Orders)
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Orders';
          Image = Document;
          Promoted = true;
          PromotedCategory = Category8;
          RunObject = Page "Sales Order List";
          RunPageLink = "Sell-to Customer No."=FIELD("No.");
          RunPageView = SORTING("Document Type", "Sell-to Customer No.");
          ToolTip = 'View a list of ongoing sales orders for the customer.';
        }
        action("Return Orders")
        {
          ApplicationArea = SalesReturnOrder;
          Caption = 'Return Orders';
          Image = ReturnOrder;
          Promoted = true;
          PromotedCategory = Category8;
          RunObject = Page "Sales Return Order List";
          RunPageLink = "Sell-to Customer No."=FIELD("No.");
          RunPageView = SORTING("Document Type", "Sell-to Customer No.");
          ToolTip = 'Open the list of ongoing return orders.';
        }
        group("Issued Documents")
        {
          Caption = 'Issued Documents';
          Image = Documents;

          action("Issued &Reminders")
          {
            ApplicationArea = Suite;
            Caption = 'Issued &Reminders';
            Image = OrderReminder;
            RunObject = Page "Issued Reminder List";
            RunPageLink = "Customer No."=FIELD("No.");
            RunPageView = SORTING("Customer No.", "Posting Date");
            ToolTip = 'View the reminders that you have sent to the customer.';
          }
          action("Issued &Finance Charge Memos")
          {
            ApplicationArea = Suite;
            Caption = 'Issued &Finance Charge Memos';
            Image = FinChargeMemo;
            RunObject = Page "Issued Fin. Charge Memo List";
            RunPageLink = "Customer No."=FIELD("No.");
            RunPageView = SORTING("Customer No.", "Posting Date");
            ToolTip = 'View the finance charge memos that you have sent to the customer.';
          }
        }
        action("Blanket Orders")
        {
          ApplicationArea = Suite;
          Caption = 'Blanket Orders';
          Image = BlanketOrder;
          RunObject = Page "Blanket Sales Orders";
          RunPageLink = "Sell-to Customer No."=FIELD("No.");
          RunPageView = SORTING("Document Type", "Sell-to Customer No.");
          ToolTip = 'Open the list of ongoing blanket orders.';
        }
        action("&Jobs")
        {
          ApplicationArea = Jobs;
          Caption = '&Jobs';
          Image = Job;
          Promoted = true;
          PromotedCategory = Category8;
          RunObject = Page "Job List";
          RunPageLink = "Bill-to Customer No."=FIELD("No.");
          RunPageView = SORTING("Bill-to Customer No.");
          ToolTip = 'Open the list of ongoing jobs.';
        }
      }
      group(Service)
      {
        Caption = 'Service';
        Image = ServiceItem;

        action("Service Orders")
        {
          ApplicationArea = Service;
          Caption = 'Service Orders';
          Image = Document;
          RunObject = Page "Service Orders";
          RunPageLink = "Customer No."=FIELD("No.");
          RunPageView = SORTING("Document Type", "Customer No.");
          ToolTip = 'Open the list of ongoing service orders.';
        }
        action("Ser&vice Contracts")
        {
          ApplicationArea = Service;
          Caption = 'Ser&vice Contracts';
          Image = ServiceAgreement;
          RunObject = Page "Customer Service Contracts";
          RunPageLink = "Customer No."=FIELD("No.");
          RunPageView = SORTING("Customer No.", "Ship-to Code");
          ToolTip = 'Open the list of ongoing service contracts.';
        }
        action("Service &Items")
        {
          ApplicationArea = Service;
          Caption = 'Service &Items';
          Image = ServiceItem;
          RunObject = Page "Service Items";
          RunPageLink = "Customer No."=FIELD("No.");
          RunPageView = SORTING("Customer No.", "Ship-to Code", "Item No.", "Serial No.");
          ToolTip = 'View or edit the service items that are registered for the customer.';
        }
      }
    }
    area(creation)
    {
      action(NewSalesInvoice)
      {
        AccessByPermission = TableData "Sales Header"=RIM;
        ApplicationArea = Basic, Suite;
        Caption = 'Sales Invoice';
        Image = NewSalesInvoice;
        Promoted = true;
        PromotedCategory = Category4;
        RunObject = Page "Sales Invoice";
        RunPageLink = "Sell-to Customer No."=FIELD("No.");
        RunPageMode = Create;
        ToolTip = 'Create a sales invoice for the customer.';
        Visible = NOT IsOfficeAddin;
      }
      action(NewSalesOrder)
      {
        AccessByPermission = TableData "Sales Header"=RIM;
        ApplicationArea = Basic, Suite;
        Caption = 'Sales Order';
        Image = Document;
        Promoted = true;
        PromotedCategory = Category4;
        RunObject = Page "Sales Order";
        RunPageLink = "Sell-to Customer No."=FIELD("No.");
        RunPageMode = Create;
        ToolTip = 'Create a sales order for the customer.';
        Visible = NOT IsOfficeAddin;
      }
      action(NewSalesCreditMemo)
      {
        AccessByPermission = TableData "Sales Header"=RIM;
        ApplicationArea = Basic, Suite;
        Caption = 'Sales Credit Memo';
        Image = CreditMemo;
        Promoted = true;
        PromotedCategory = Category4;
        RunObject = Page "Sales Credit Memo";
        RunPageLink = "Sell-to Customer No."=FIELD("No.");
        RunPageMode = Create;
        ToolTip = 'Create a new sales credit memo to revert a posted sales invoice.';
        Visible = NOT IsOfficeAddin;
      }
      action(NewServiceQuote)
      {
        AccessByPermission = TableData "Service Header"=RIM;
        ApplicationArea = Service;
        Caption = 'Service Quote';
        Image = Quote;
        Promoted = false;
        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
        //PromotedCategory = Category4;
        RunObject = Page "Service Quote";
        RunPageLink = "Customer No."=FIELD("No.");
        RunPageMode = Create;
        ToolTip = 'Create a new service quote for the customer.';
      }
      action(NewServiceInvoice)
      {
        AccessByPermission = TableData "Service Header"=RIM;
        ApplicationArea = Service;
        Caption = 'Service Invoice';
        Image = Invoice;
        Promoted = false;
        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
        //PromotedCategory = Category4;
        RunObject = Page "Service Invoice";
        RunPageLink = "Customer No."=FIELD("No.");
        RunPageMode = Create;
        ToolTip = 'Create a new service invoice for the customer.';
      }
      action(NewServiceOrder)
      {
        AccessByPermission = TableData "Service Header"=RIM;
        ApplicationArea = Service;
        Caption = 'Service Order';
        Image = Document;
        Promoted = false;
        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
        //PromotedCategory = Category4;
        RunObject = Page "Service Order";
        RunPageLink = "Customer No."=FIELD("No.");
        RunPageMode = Create;
        ToolTip = 'Create a new service order for the customer.';
      }
      action(NewServiceCreditMemo)
      {
        AccessByPermission = TableData "Service Header"=RIM;
        ApplicationArea = Service;
        Caption = 'Service Credit Memo';
        Image = CreditMemo;
        Promoted = false;
        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
        //PromotedCategory = Category4;
        RunObject = Page "Service Credit Memo";
        RunPageLink = "Customer No."=FIELD("No.");
        RunPageMode = Create;
        ToolTip = 'Create a new service credit memo for the customer.';
      }
      action(NewReminder)
      {
        AccessByPermission = TableData "Reminder Header"=RIM;
        ApplicationArea = Suite;
        Caption = 'Reminder';
        Image = Reminder;
        Promoted = true;
        PromotedCategory = Category4;
        RunObject = Page Reminder;
        RunPageLink = "Customer No."=FIELD("No.");
        RunPageMode = Create;
        ToolTip = 'Create a new reminder for the customer.';
      }
      action(NewFinanceChargeMemo)
      {
        AccessByPermission = TableData "Finance Charge Memo Header"=RIM;
        ApplicationArea = Suite;
        Caption = 'Finance Charge Memo';
        Image = FinChargeMemo;
        Promoted = false;
        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
        //PromotedCategory = Category4;
        RunObject = Page "Finance Charge Memo";
        RunPageLink = "Customer No."=FIELD("No.");
        RunPageMode = Create;
        ToolTip = 'Create a new finance charge memo.';
      }
    }
    area(processing)
    {
      group(Approval)
      {
        Caption = 'Approval';
        Visible = OpenApprovalEntriesExistCurrUser;

        action(Approve)
        {
          ApplicationArea = All;
          Caption = 'Approve';
          Image = Approve;
          Promoted = true;
          PromotedCategory = Category5;
          PromotedIsBig = true;
          PromotedOnly = true;
          ToolTip = 'Approve the requested changes.';
          Visible = OpenApprovalEntriesExistCurrUser;

          trigger OnAction()var ApprovalsMgmt: Codeunit "Approvals Mgmt.";
          begin
            ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
          end;
        }
        action(Reject)
        {
          ApplicationArea = All;
          Caption = 'Reject';
          Image = Reject;
          Promoted = true;
          PromotedCategory = Category5;
          PromotedIsBig = true;
          PromotedOnly = true;
          ToolTip = 'Reject the approval request.';
          Visible = OpenApprovalEntriesExistCurrUser;

          trigger OnAction()var ApprovalsMgmt: Codeunit "Approvals Mgmt.";
          begin
            ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
          end;
        }
        action(Delegate)
        {
          ApplicationArea = All;
          Caption = 'Delegate';
          Image = Delegate;
          Promoted = true;
          PromotedCategory = Category5;
          PromotedOnly = true;
          ToolTip = 'Delegate the approval to a substitute approver.';
          Visible = OpenApprovalEntriesExistCurrUser;

          trigger OnAction()var ApprovalsMgmt: Codeunit "Approvals Mgmt.";
          begin
            ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
          end;
        }
        action(Comment)
        {
          ApplicationArea = All;
          Caption = 'Comments';
          Image = ViewComments;
          Promoted = true;
          PromotedCategory = Category5;
          PromotedOnly = true;
          ToolTip = 'View or add comments for the record.';
          Visible = OpenApprovalEntriesExistCurrUser;

          trigger OnAction()var ApprovalsMgmt: Codeunit "Approvals Mgmt.";
          begin
            ApprovalsMgmt.GetApprovalComment(Rec);
          end;
        }
      }
      group("Request Approval")
      {
        Caption = 'Request Approval';
        Image = SendApprovalRequest;

        action(SendApprovalRequest)
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Send A&pproval Request';
          Enabled = (NOT OpenApprovalEntriesExist) AND EnabledApprovalWorkflowsExist AND CanRequestApprovalForFlow;
          Image = SendApprovalRequest;
          Promoted = true;
          PromotedCategory = Category6;
          PromotedIsBig = true;
          ToolTip = 'Request approval to change the record.';

          trigger OnAction()var ApprovalsMgmt: Codeunit "Approvals Mgmt.";
          begin
            if ApprovalsMgmt.CheckCustomerApprovalsWorkflowEnabled(Rec)then ApprovalsMgmt.OnSendCustomerForApproval(Rec);
          end;
        }
        action(CancelApprovalRequest)
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Cancel Approval Re&quest';
          Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
          Image = CancelApprovalRequest;
          Promoted = true;
          PromotedCategory = Category6;
          ToolTip = 'Cancel the approval request.';

          trigger OnAction()var ApprovalsMgmt: Codeunit "Approvals Mgmt.";
          WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
          begin
            ApprovalsMgmt.OnCancelCustomerApprovalRequest(Rec);
            WorkflowWebhookManagement.FindAndCancel(RecordId);
          end;
        }
        group(Flow)
        {
          Caption = 'Flow';

          action(CreateFlow)
          {
            ApplicationArea = Basic, Suite;
            Caption = 'Create a Flow';
            Image = Flow;
            Promoted = true;
            PromotedCategory = Category6;
            ToolTip = 'Create a new flow in Power Automate from a list of relevant flow templates.';
            Visible = IsSaaS;

            trigger OnAction()var FlowServiceManagement: Codeunit "Flow Service Management";
            FlowTemplateSelector: Page "Flow Template Selector";
            begin
              // Opens page 6400 where the user can use filtered templates to create new flows.
              FlowTemplateSelector.SetSearchText(FlowServiceManagement.GetCustomerTemplateFilter);
              FlowTemplateSelector.Run;
            end;
          }
          action(SeeFlows)
          {
            ApplicationArea = Basic, Suite;
            Caption = 'See my Flows';
            Image = Flow;
            Promoted = true;
            PromotedCategory = Category6;
            RunObject = Page "Flow Selector";
            ToolTip = 'View and configure Power Automate flows that you created.';
          }
        }
      }
      group(Workflow)
      {
        Caption = 'Workflow';

        action(CreateApprovalWorkflow)
        {
          ApplicationArea = Suite;
          Caption = 'Create Approval Workflow';
          Enabled = NOT EnabledApprovalWorkflowsExist;
          Image = CreateWorkflow;
          ToolTip = 'Set up an approval workflow for creating or changing customers, by going through a few pages that will guide you.';

          trigger OnAction()begin
            PAGE.RunModal(PAGE::"Cust. Approval WF Setup Wizard");
          end;
        }
        action(ManageApprovalWorkflows)
        {
          ApplicationArea = Suite;
          Caption = 'Manage Approval Workflows';
          Enabled = EnabledApprovalWorkflowsExist;
          Image = WorkflowSetup;
          ToolTip = 'View or edit existing approval workflows for creating or changing customers.';

          trigger OnAction()var WorkflowManagement: Codeunit "Workflow Management";
          begin
            WorkflowManagement.NavigateToWorkflows(DATABASE::Customer, EventFilter);
          end;
        }
      }
      group("F&unctions")
      {
        Caption = 'F&unctions';
        Image = "Action";

        action(Templates)
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Templates';
          Image = Template;
          //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
          //PromotedIsBig = true;
          RunObject = Page "Config Templates";
          RunPageLink = "Table ID"=CONST(18);
          ToolTip = 'View or edit customer templates.';
        }
        action(ApplyTemplate)
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Apply Template';
          Ellipsis = true;
          Image = ApplyTemplate;
          //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
          //PromotedCategory = Process;
          ToolTip = 'Apply a template to update the entity with your standard settings for a certain type of entity.';
          ObsoleteState = Pending;
          ObsoleteReason = 'This functionality will be replaced by other templates.';
          ObsoleteTag = '16.0';

          trigger OnAction()var MiniCustomerTemplate: Record "Mini Customer Template";
          begin
            MiniCustomerTemplate.UpdateCustomerFromTemplate(Rec);
          end;
        }
        action(SaveAsTemplate)
        {
          ApplicationArea = Basic, Suite;
          Caption = 'Save as Template';
          Ellipsis = true;
          Image = Save;
          //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
          //PromotedCategory = Process;
          //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
          //PromotedIsBig = true;
          ToolTip = 'Save the customer card as a template that can be reused to create new customer cards. Customer templates contain preset information to help you fill fields on customer cards.';
          ObsoleteState = Pending;
          ObsoleteReason = 'This functionality will be replaced by other templates.';
          ObsoleteTag = '16.0';

          trigger OnAction()var TempMiniCustomerTemplate: Record "Mini Customer Template" temporary;
          begin
            TempMiniCustomerTemplate.SaveAsTemplate(Rec);
          end;
        }
        action(MergeDuplicate)
        {
          AccessByPermission = TableData "Merge Duplicates Buffer"=RIMD;
          ApplicationArea = Basic, Suite;
          Caption = 'Merge With';
          Ellipsis = true;
          Image = ItemSubstitution;
          ToolTip = 'Merge two customer records into one. Before merging, review which field values you want to keep or override. The merge action cannot be undone.';

          trigger OnAction()var TempMergeDuplicatesBuffer: Record "Merge Duplicates Buffer" temporary;
          begin
            TempMergeDuplicatesBuffer.Show(DATABASE::Customer, "No.");
          end;
        }
      }
      action("Post Cash Receipts")
      {
        ApplicationArea = Basic, Suite;
        Caption = 'Post Cash Receipts';
        Ellipsis = true;
        Image = CashReceiptJournal;
        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
        //PromotedCategory = Process;
        RunObject = Page "Cash Receipt Journal";
        ToolTip = 'Create a cash receipt journal line for the customer, for example, to post a payment receipt.';
      }
      action("Sales Journal")
      {
        ApplicationArea = Basic, Suite;
        Caption = 'Sales Journal';
        Image = Journals;
        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
        //PromotedCategory = Process;
        RunObject = Page "Sales Journal";
        ToolTip = 'Post any sales transaction for the customer.';
      }
      action(PaymentRegistration)
      {
        ApplicationArea = Basic, Suite;
        Caption = 'Register Customer Payments';
        Image = Payment;
        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
        //PromotedCategory = Process;
        RunObject = Page "Payment Registration";
        RunPageLink = "Source No."=FIELD("No.");
        ToolTip = 'Process your customer payments by matching amounts received on your bank account with the related unpaid sales invoices, and then post the payments.';
      }
    }
    area(reporting)
    {
      action("Report Customer Detailed Aging")
      {
        ApplicationArea = Basic, Suite;
        Caption = 'Customer Detailed Aging';
        Image = "Report";
        Promoted = false;
        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
        //PromotedCategory = "Report";
        ToolTip = 'View a detailed list of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.';

        trigger OnAction()begin
          RunReport(REPORT::"Customer Detailed Aging", "No.");
        end;
      }
      action("Report Customer - Labels")
      {
        ApplicationArea = Basic, Suite;
        Caption = 'Customer - Labels';
        Image = "Report";
        Promoted = false;
        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
        //PromotedCategory = Category9;
        ToolTip = 'View mailing labels with the customers'' names and addresses.';

        trigger OnAction()begin
          RunReport(REPORT::"Customer - Labels", "No.");
        end;
      }
      action("Report Customer - Balance to Date")
      {
        ApplicationArea = Basic, Suite;
        Caption = 'Customer - Balance to Date';
        Image = "Report";
        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
        //PromotedCategory = Category9;
        ToolTip = 'View a list with customers'' payment history up until a certain date. You can use the report to extract your total sales income at the close of an accounting period or fiscal year.';

        trigger OnAction()begin
          RunReport(REPORT::"Customer - Balance to Date", "No.");
        end;
      }
    }
  }
  trigger OnAfterGetCurrRecord()var WorkflowStepInstance: Record "Workflow Step Instance";
  CRMCouplingManagement: Codeunit "CRM Coupling Management";
  WorkflowManagement: Codeunit "Workflow Management";
  WorkflowEventHandling: Codeunit "Workflow Event Handling";
  WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
  CustomerCardCalculation: Codeunit "Customer Card Calculations";
  Args: Dictionary of[Text, Text];
  begin
    CreateCustomerFromTemplate;
    ActivateFields;
    CalcAge();
    StyleTxt:=SetStyle;
    WorkflowStepInstance.SetRange("Record ID", RecordId);
    ShowWorkflowStatus:=not WorkflowStepInstance.IsEmpty();
    if ShowWorkflowStatus then CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RecordId);
    if CRMIntegrationEnabled or CDSIntegrationEnabled then begin
      CRMIsCoupledToRecord:=CRMCouplingManagement.IsRecordCoupledToCRM(RecordId);
      if "No." <> xRec."No." then CRMIntegrationManagement.SendResultNotification(Rec);
    end;
    OpenApprovalEntriesExistCurrUser:=ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
    OpenApprovalEntriesExist:=ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    CanCancelApprovalForRecord:=ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);
    EventFilter:=WorkflowEventHandling.RunWorkflowOnSendCustomerForApprovalCode + '|' + WorkflowEventHandling.RunWorkflowOnCustomerChangedCode;
    EnabledApprovalWorkflowsExist:=WorkflowManagement.EnabledWorkflowExist(DATABASE::Customer, EventFilter);
    WorkflowWebhookManagement.GetCanRequestAndCanCancel(RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
  end;
  trigger OnInit()var ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
  begin
    FoundationOnly:=ApplicationAreaMgmtFacade.IsFoundationEnabled;
    ContactEditable:=true;
    OpenApprovalEntriesExistCurrUser:=true;
    CaptionTxt:=CurrPage.Caption;
    CurrPage.Caption(CaptionTxt);
  end;
  trigger OnNewRecord(BelowxRec: Boolean)var DocumentNoVisibility: Codeunit DocumentNoVisibility;
  begin
    if GuiAllowed then if "No." = '' then if DocumentNoVisibility.CustomerNoSeriesIsDefault then NewMode:=true;
  end;
  trigger OnOpenPage()var IntegrationTableMapping: Record "Integration Table Mapping";
  EnvironmentInfo: Codeunit "Environment Information";
  ItemReferenceMgt: Codeunit "Item Reference Management";
  PriceCalculationMgt: Codeunit "Price Calculation Mgt.";
  begin
    CRMIntegrationEnabled:=CRMIntegrationManagement.IsCRMIntegrationEnabled();
    CDSIntegrationEnabled:=CRMIntegrationManagement.IsCDSIntegrationEnabled();
    if CRMIntegrationEnabled or CDSIntegrationEnabled then if IntegrationTableMapping.Get('CUSTOMER')then BlockedFilterApplied:=IntegrationTableMapping.GetTableFilter().Contains('Field39=1(0)');
    ExtendedPriceEnabled:=PriceCalculationMgt.IsExtendedPriceCalculationEnabled();
    SetNoFieldVisible();
    IsSaaS:=EnvironmentInfo.IsSaaS();
    ItemReferenceVisible:=ItemReferenceMgt.IsEnabled();
    setfilter("Date Filter", '..%1', today);
  end;
  var Age: Integer;
  CalendarMgmt: Codeunit "Calendar Management";
  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
  CRMIntegrationManagement: Codeunit "CRM Integration Management";
  CustomerMgt: Codeunit "Customer Mgt.";
  FormatAddress: Codeunit "Format Address";
  StyleTxt: Text;
  [InDataSet]
  ContactEditable: Boolean;
  [InDataSet]
  SocialListeningSetupVisible: Boolean;
  [InDataSet]
  SocialListeningVisible: Boolean;
  [InDataSet]
  ShowCharts: Boolean;
  CRMIntegrationEnabled: Boolean;
  CDSIntegrationEnabled: Boolean;
  BlockedFilterApplied: Boolean;
  ExtendedPriceEnabled: Boolean;
  CRMIsCoupledToRecord: Boolean;
  OpenApprovalEntriesExistCurrUser: Boolean;
  OpenApprovalEntriesExist: Boolean;
  ShowWorkflowStatus: Boolean;
  NoFieldVisible: Boolean;
  BalanceExhausted: Boolean;
  AttentionToPaidDay: Boolean;
  IsOfficeAddin: Boolean;
  NoPostedInvoices: Integer;
  NoPostedCrMemos: Integer;
  NoOutstandingInvoices: Integer;
  NoOutstandingCrMemos: Integer;
  Totals: Decimal;
  AmountOnPostedInvoices: Decimal;
  AmountOnPostedCrMemos: Decimal;
  AmountOnOutstandingInvoices: Decimal;
  AmountOnOutstandingCrMemos: Decimal;
  AdjmtCostLCY: Decimal;
  AdjCustProfit: Decimal;
  CustProfit: Decimal;
  AdjProfitPct: Decimal;
  CustInvDiscAmountLCY: Decimal;
  CustPaymentsLCY: Decimal;
  CustSalesLCY: Decimal;
  OverduePaymentsMsg: Label 'Overdue Payments as of %1', Comment='Overdue Payments as of 27-02-2012';
  DaysPastDueDate: Decimal;
  PostedInvoicesMsg: Label 'Posted Invoices (%1)', Comment='Invoices (5)';
  CreditMemosMsg: Label 'Posted Credit Memos (%1)', Comment='Credit Memos (3)';
  OutstandingInvoicesMsg: Label 'Ongoing Invoices (%1)', Comment='Ongoing Invoices (4)';
  OutstandingCrMemosMsg: Label 'Ongoing Credit Memos (%1)', Comment='Ongoing Credit Memos (4)';
  ShowMapLbl: Label 'Show on Map';
  CustomerCardServiceCategoryTxt: Label 'Customer Card', Locked=true;
  PageBckGrndTaskStartedTxt: Label 'Page Background Task to calculate customer statistics for customer %1 started.', Locked=true, Comment='%1 = Customer No.';
  PageBckGrndTaskCompletedTxt: Label 'Page Background Task to calculate customer statistics completed successfully.', Locked=true;
  ExpectedMoneyOwed: Decimal;
  TotalMoneyOwed: Decimal;
  AvgDaysToPay: Decimal;
  FoundationOnly: Boolean;
  CanCancelApprovalForRecord: Boolean;
  EnabledApprovalWorkflowsExist: Boolean;
  NewMode: Boolean;
  EventFilter: Text;
  CaptionTxt: Text;
  CanRequestApprovalForFlow: Boolean;
  CanCancelApprovalForFlow: Boolean;
  IsSaaS: Boolean;
  IsCountyVisible: Boolean;
  [InDataSet]
  ItemReferenceVisible: Boolean;
  StatementFileNameTxt: Label 'Statement', Comment='Shortened form of ''Customer Statement''';
  LoadOnDemand: Boolean;
  BackgroundTaskId: Integer;
  [TryFunction]
  local procedure TryGetDictionaryValueFromKey(var DictionaryToLookIn: Dictionary of[Text, Text];
  KeyToSearchFor: Text;
  var ReturnValue: Text)begin
    ReturnValue:=DictionaryToLookIn.Get(KeyToSearchFor);
  end;
  local procedure CalcAge()var month: Integer;
  begin
    if "Date of Birth" <> 0D then begin
      age:=Date2DMY(Today, 3) - Date2DMY("Date of Birth", 3);
      if Date2DMY(today, 2) < Date2DMY("date of birth", 2)then age-=1;
    end;
  end;
  local procedure GetTotalSales(): Decimal begin
    NoPostedInvoices:=0;
    NoPostedCrMemos:=0;
    NoOutstandingInvoices:=0;
    NoOutstandingCrMemos:=0;
    Totals:=0;
    AmountOnPostedInvoices:=CustomerMgt.CalcAmountsOnPostedInvoices("No.", NoPostedInvoices);
    AmountOnPostedCrMemos:=CustomerMgt.CalcAmountsOnPostedCrMemos("No.", NoPostedCrMemos);
    AmountOnOutstandingInvoices:=CustomerMgt.CalculateAmountsOnUnpostedInvoices("No.", NoOutstandingInvoices);
    AmountOnOutstandingCrMemos:=CustomerMgt.CalculateAmountsOnUnpostedCrMemos("No.", NoOutstandingCrMemos);
    Totals:=AmountOnPostedInvoices + AmountOnPostedCrMemos + AmountOnOutstandingInvoices + AmountOnOutstandingCrMemos;
    CustomerMgt.CalculateStatistic(Rec, AdjmtCostLCY, AdjCustProfit, AdjProfitPct, CustInvDiscAmountLCY, CustPaymentsLCY, CustSalesLCY, CustProfit);
    exit(Totals)end;
  local procedure GetAmountOnPostedInvoices(): Decimal begin
    exit(AmountOnPostedInvoices)end;
  local procedure GetAmountOnCrMemo(): Decimal begin
    exit(AmountOnPostedCrMemos)end;
  local procedure GetAmountOnOutstandingInvoices(): Decimal begin
    exit(AmountOnOutstandingInvoices)end;
  local procedure GetAmountOnOutstandingCrMemos(): Decimal begin
    exit(AmountOnOutstandingCrMemos)end;
  local procedure ActivateFields()var OfficeManagement: Codeunit "Office Management";
  begin
    ContactEditable:="Primary Contact No." = '';
    IsCountyVisible:=FormatAddress.UseCounty("Country/Region Code");
    ShowCharts:="No." <> '';
    IsOfficeAddin:=OfficeManagement.IsAvailable;
  end;
  local procedure ContactOnAfterValidate()begin
    ActivateFields;
  end;
  local procedure SetNoFieldVisible()var DocumentNoVisibility: Codeunit DocumentNoVisibility;
  begin
    NoFieldVisible:=DocumentNoVisibility.CustomerNoIsVisible;
  end;
  procedure RunReport(ReportNumber: Integer;
  CustomerNumber: Code[20])var Customer: Record Customer;
  begin
    Customer.SetRange("No.", CustomerNumber);
    REPORT.RunModal(ReportNumber, true, true, Customer);
  end;
  local procedure CreateCustomerFromTemplate()var Customer: Record Customer;
  CustomerTemplMgt: Codeunit "Customer Templ. Mgt.";
  begin
    OnBeforeCreateCustomerFromTemplate(NewMode, Customer);
    if not NewMode then exit;
    NewMode:=false;
    if CustomerTemplMgt.InsertCustomerFromTemplate(Customer)then begin
      VerifyVatRegNo(Customer);
      Copy(Customer);
      CurrPage.Update;
    end
    else if CustomerTemplMgt.TemplatesAreNotEmpty()then CurrPage.Close;
  end;
  local procedure VerifyVatRegNo(var Customer: Record Customer)var VATRegNoSrvConfig: Record "VAT Reg. No. Srv Config";
  EUVATRegistrationNoCheck: Page "EU VAT Registration No Check";
  CustomerRecRef: RecordRef;
  begin
    if VATRegNoSrvConfig.VATRegNoSrvIsEnabled then if Customer."Validate EU Vat Reg. No." then begin
        EUVATRegistrationNoCheck.SetRecordRef(Customer);
        Commit();
        EUVATRegistrationNoCheck.RunModal;
        EUVATRegistrationNoCheck.GetRecordRef(CustomerRecRef);
        CustomerRecRef.SetTable(Customer);
      end;
  end;
  [IntegrationEvent(false, false)]
  [Scope('OnPrem')]
  procedure SetCaption(var InText: Text)begin
  end;
  [IntegrationEvent(false, false)]
  local procedure OnBeforeCreateCustomerFromTemplate(var NewMode: Boolean;
  var Customer: Record Customer)begin
  end;
  [IntegrationEvent(false, false)]
  local procedure OnBeforeGetSalesPricesAndSalesLineDisc(var LoadOnDemand: Boolean)begin
  end;
}
