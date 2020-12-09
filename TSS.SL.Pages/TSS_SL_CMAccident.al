page 50035 "CM Accident"
{
  Caption = 'CM Accident';
  PageType = CardPart;
  SourceTable = "CM Accident";

  layout
  {
    area(content)
    {
      group(Accident)
      {
        field(Type;Rec.Type)
        {
          ApplicationArea = All;
        }
        field("Raised By";Rec."Raised By")
        {
          ApplicationArea = All;
        }
        field("Accident Date";Rec."Accident Date")
        {
          ApplicationArea = All;
        }
        field("Accident Venue";Rec."Accident Venue")
        {
          ApplicationArea = All;
        }
        field("Police Report Obtained";Rec."Police Report Obtained")
        {
          ApplicationArea = All;
        }
        field("Police Report Obtained Date";Rec."Police Report Obtained Date")
        {
          ApplicationArea = All;
        }
        field("Insurance Category";Rec."Insurance Category")
        {
          ApplicationArea = All;
        }
        field("Opposing Party";Rec."Opposing Party")
        {
          ApplicationArea = All;
        }
        field("Penalty Charge";Rec."Penalty Charge")
        {
          ApplicationArea = All;
        }
        field("Penalty Amount";Rec."Penalty Amount")
        {
          ApplicationArea = All;
        }
        field(LTA;Rec.LTA)
        {
          ApplicationArea = All;
        }
        field("LTA Amount";Rec."LTA Amount")
        {
          ApplicationArea = All;
        }
        field("Receipt No.";Rec."Receipt No.")
        {
          ApplicationArea = All;
        }
        field("Receipt Amount";Rec."Receipt Amount")
        {
          ApplicationArea = All;
        }
      }
      group("Police Investigation")
      {
        field("Report Reference No.";Rec."Report Reference No.")
        {
          ApplicationArea = All;
        }
        field("Sargeant Name";Rec."Sargeant Name")
        {
          ApplicationArea = All;
        }
        field("Police Station Name";Rec."Police Station Name")
        {
          ApplicationArea = All;
        }
        field("Investigation Date";Rec."Investigation Date")
        {
          ApplicationArea = All;
        }
        field("Inform Driver";Rec."Inform Driver")
        {
          ApplicationArea = All;
        }
        field("Investigation Result";Rec."Investigation Result")
        {
          ApplicationArea = All;
        }
      }
      group("Insurance Notification")
      {
        field("Insurance Ref. No.";Rec."Insurance Ref. No.")
        {
          ApplicationArea = All;
        }
        field("Submission Date";Rec."Submission Date")
        {
          ApplicationArea = All;
        }
      }
      group("Lawyer")
      {
        field("Lawyer Letter Ref. No.";Rec."Lawyer Letter Ref. No.")
        {
          ApplicationArea = All;
        }
        field("3rd Party Lawyer Firm Name";Rec."3rd Party Lawyer Firm Name")
        {
          ApplicationArea = All;
        }
        field("Company Lawyer Firm Name";Rec."Company Lawyer Firm Name")
        {
          ApplicationArea = All;
        }
        field("Telephone No.";Rec."Telephone No.")
        {
          ApplicationArea = All;
        }
        field("Plaintiff Name";Rec."Plaintiff Name")
        {
          ApplicationArea = All;
        }
        field("Court Hearing Date";Rec."Court Hearing Date")
        {
          ApplicationArea = All;
        }
      }
      group("Repair Info")
      {
        field(Workshop;Rec.Workshop)
        {
          ApplicationArea = All;
        }
      }
      group("Internal")
      {
        Enabled = (Workshop = Workshop::Internal);

        field("Car In Date";Rec."Car In Date")
        {
          ApplicationArea = All;
        }
        field("Car Out Date";Rec."Car Out Date")
        {
          ApplicationArea = All;
        }
        field("Repair Start Date";Rec."Repair Start Date")
        {
          ApplicationArea = All;
        }
        field("Repair Finish Date";Rec."Repair Finish Date")
        {
          ApplicationArea = All;
        }
      }
      group("External")
      {
        Enabled = (Workshop = Workshop::External);

        field("Cost of Repair";Rec."Cost of Repair")
        {
          ApplicationArea = All;
        }
        field("Workshop Name";Rec."Workshop Name")
        {
          ApplicationArea = All;
        }
        field("Workshop Telephone No.";Rec."Workshop Telephone No.")
        {
          ApplicationArea = All;
        }
        field("Workshop Picture";Rec."Workshop Picture")
        {
          ApplicationArea = All;
        }
        field("Security Deposit OR No.";Rec."Security Deposit OR No.")
        {
          ApplicationArea = All;
        }
        field("Security Depost OR Date";Rec."Security Depost OR Date")
        {
          ApplicationArea = All;
        }
        field("Security Depost OR Amount";Rec."Security Depost OR Amount")
        {
          ApplicationArea = All;
        }
        field("Document Handover";Rec."Document Handover")
        {
          ApplicationArea = All;
        }
        field("Doc. Handover Date";Rec."Doc. Handover Date")
        {
          ApplicationArea = All;
        }
        field("Refund Sec. Deposit GPC No.";Rec."Refund Sec. Deposit GPC No.")
        {
          ApplicationArea = All;
        }
        field("Refund Sec. Deposit Date";Rec."Refund Sec. Deposit Date")
        {
          ApplicationArea = All;
        }
        field("Refund Sec. Deposit Amount";Rec."Refund Sec. Deposit Amount")
        {
          ApplicationArea = All;
        }
      }
      group("Claim Info")
      {
        field("File No.";Rec."File No.")
        {
          ApplicationArea = All;
        }
        field("Repair Amount";Rec."Repair Amount")
        {
          ApplicationArea = All;
        }
        field("3rd Party Vehicle No.";Rec."3rd Party Vehicle No.")
        {
          ApplicationArea = All;
        }
        field("Police Inv. Result Date";Rec."Police Inv. Result Date")
        {
          ApplicationArea = All;
        }
        field("Police Inv. Result Amount";Rec."Police Inv. Result Amount")
        {
          ApplicationArea = All;
        }
        field("Police Photo Amount";Rec."Police Photo Amount")
        {
          ApplicationArea = All;
        }
        field("JPJ Search (3rd Party Ins.)";Rec."JPJ Search (3rd Party Ins.)")
        {
          ApplicationArea = All;
        }
        field("JPJ Search Amount";Rec."JPJ Search Amount")
        {
          ApplicationArea = All;
        }
        field("Submit to Merimen Date";Rec."Submit to Merimen Date")
        {
          ApplicationArea = All;
        }
        field("Merimen Amount";Rec."Merimen Amount")
        {
          ApplicationArea = All;
        }
        field("Adjusted Report Date";Rec."Adjusted Report Date")
        {
          ApplicationArea = All;
        }
        field("Adjuster Amount";Rec."Adjuster Amount")
        {
          ApplicationArea = All;
        }
        field("Total Cost";Rec."Total Cost")
        {
          ApplicationArea = All;
        }
        field("Estimated Repair Cost";Rec."Estimated Repair Cost")
        {
          ApplicationArea = All;
        }
        field("Submit To Ins. Date";Rec."Submit To Ins. Date")
        {
          ApplicationArea = All;
        }
        field("Submit to Ins .Amount";Rec."Submit to Ins .Amount")
        {
          ApplicationArea = All;
        }
        field("LoU Adjuster Amount";Rec."LoU Adjuster Amount")
        {
          ApplicationArea = All;
        }
        field("LoU By our Workshop";Rec."LoU By our Workshop")
        {
          ApplicationArea = All;
        }
        field("LoU By Insurance Amount";Rec."LoU By Insurance Amount")
        {
          ApplicationArea = All;
        }
        field("LoU Paid to Driver Amount";Rec."LoU Paid to Driver Amount")
        {
          ApplicationArea = All;
        }
        field("LoU Paid to Driver Date";Rec."LoU Paid to Driver Date")
        {
          ApplicationArea = All;
        }
        field("LoU Voucher No.";Rec."LoU Voucher No.")
        {
          ApplicationArea = All;
        }
        field("LoU Voucher Date";Rec."LoU Voucher Date")
        {
          ApplicationArea = All;
        }
        field("LoU GPC No.";Rec."LoU GPC No.")
        {
          ApplicationArea = All;
        }
        field("LoU GPC Date";Rec."LoU GPC Date")
        {
          ApplicationArea = All;
        }
        field("Claim Status";Rec."Claim Status")
        {
          ApplicationArea = All;
        }
        field("Discharge Voucher Amount";Rec."Discharge Voucher Amount")
        {
          ApplicationArea = All;
        }
        field("Insurance Payment Amount";Rec."Insurance Payment Amount")
        {
          ApplicationArea = All;
        }
        field("Insurance Payment Date";Rec."Insurance Payment Date")
        {
          ApplicationArea = All;
        }
        field("External Repair Fee Refund";Rec."External Repair Fee Refund")
        {
          ApplicationArea = All;
        }
        field("Refund Driver Amount";Rec."Refund Driver Amount")
        {
          ApplicationArea = All;
        }
        field("Refund Driver Date";Rec."Refund Driver Date")
        {
          ApplicationArea = All;
        }
        field("Check Date";Rec."Check Date")
        {
          ApplicationArea = All;
        }
        field("Check No.";Rec."Check No.")
        {
          ApplicationArea = All;
        }
        field("Staff Commission Amount";Rec."Staff Commission Amount")
        {
          ApplicationArea = All;
        }
        field("Nett Profit Amount";Rec."Nett Profit Amount")
        {
          ApplicationArea = All;
        }
        field("Case Status";Rec."Case Status")
        {
          ApplicationArea = All;
        }
      }
    }
  }
}
