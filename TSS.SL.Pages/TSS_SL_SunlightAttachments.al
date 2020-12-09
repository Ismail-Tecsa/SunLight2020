page 50021 "Sunlight Attachments Factbox"
{
  Caption = 'Documents Attached';
  PageType = CardPart;
  SourceTable = "Document Attachment";

  layout
  {
    area(content)
    {
      group(Control2)
      {
        ShowCaption = false;

        field(Documents;NumberOfRecords)
        {
          ApplicationArea = All;
          Caption = 'Documents';
          StyleExpr = TRUE;
          ToolTip = 'Specifies the number of attachments.';

          trigger OnDrillDown()var Taxi: record taxis;
          permit: record Permit;
          /* 
                        Customer: Record Customer;
                        Vendor: Record Vendor;
                        Item: Record Item;
                        Employee: Record Employee;
                        FixedAsset: Record "Fixed Asset";
                        Resource: Record Resource;
                        SalesHeader: Record "Sales Header";
                        PurchaseHeader: Record "Purchase Header";
                        Job: Record Job;
                        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                        SalesInvoiceHeader: Record "Sales Invoice Header";
                        PurchInvHeader: Record "Purch. Inv. Header";
                        PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; */
          DocumentAttachmentDetails: Page "Document Attachment Details";
          RecRef: RecordRef;
          begin
            case "Table ID" of 0: exit;
            DATABASE::Taxis: begin
              RecRef.Open(DATABASE::Taxis);
              if taxi.Get("No.")then RecRef.GetTable(Taxi);
            end;
            DATABASE::Permit: begin
              RecRef.Open(DATABASE::Permit);
              if permit.Get("No.")then RecRef.GetTable(permit);
            end;
            else
              OnBeforeDrillDownSunlight(Rec, RecRef);
            end;
            DocumentAttachmentDetails.OpenForRecRef(RecRef);
            DocumentAttachmentDetails.RunModal;
          end;
        }
      }
    }
  }
  actions
  {
  }
  [IntegrationEvent(false, false)]
  local procedure OnBeforeDrillDownSunlight(DocumentAttachment: Record "Document Attachment";
  var RecRef: RecordRef)begin
  end;
  trigger OnAfterGetCurrRecord()var currentFilterGroup: Integer;
  begin
    currentFilterGroup:=FilterGroup;
    FilterGroup:=4;
    NumberOfRecords:=0;
    if GetFilters() <> '' then NumberOfRecords:=Count;
    FilterGroup:=currentFilterGroup;
  end;
  var NumberOfRecords: Integer;
}
