page 50034 "CM Summon Card"
{
  Caption = 'CM Summon Card';
  PageType = CardPart;
  SourceTable = "CM Summon";

  layout
  {
    area(content)
    {
      group(Summon)
      {
        field(Type;Rec.Type)
        {
          ApplicationArea = All;
        }
        field("Internal Reference";Rec."Internal Reference")
        {
          ApplicationArea = All;
        }
        field("Offense Charge";Rec."Offense Charge")
        {
          ApplicationArea = All;
        }
        field("Offense Location";Rec."Offense Location")
        {
          ApplicationArea = All;
        }
        field("Inform Driver";Rec."Inform Driver")
        {
          ApplicationArea = All;
        }
        field("Inform Driver Date";Rec."Inform Driver Date")
        {
          ApplicationArea = All;
        }
        field("Driver Collect";Rec."Driver Collect")
        {
          ApplicationArea = All;
        }
        field("Driver Collect Date";Rec."Driver Collect Date")
        {
          ApplicationArea = All;
        }
        field("Investigation Progress";Rec."Investigation Progress")
        {
          ApplicationArea = All;
        }
        field("Investigation Date";Rec."Investigation Date")
        {
          ApplicationArea = All;
        }
        field("External Reference No.";Rec."External Reference No.")
        {
          ApplicationArea = All;
        }
        field("Investigation Result";Rec."Investigation Result")
        {
          ApplicationArea = All;
        }
        field("Investigation Venue";Rec."Investigation Venue")
        {
          ApplicationArea = All;
        }
        field("Investigator Name";Rec."Investigator Name")
        {
          ApplicationArea = All;
        }
      }
      group("Follow Up")
      {
        field("1st Follow Up";Rec."1st Follow Up")
        {
          ApplicationArea = All;
        }
        field("1st Follow Up Date";Rec."1st Follow Up Date")
        {
          ApplicationArea = All;
        }
        field("2nd Follow Up";Rec."2nd Follow Up")
        {
          ApplicationArea = All;
        }
        field("2nd Follow Up Date";Rec."2nd Follow Up Date")
        {
          ApplicationArea = All;
        }
        field("3rd Follow Up";Rec."3rd Follow Up")
        {
          ApplicationArea = All;
        }
        field("3rd Follow Up Date";Rec."3rd Follow Up Date")
        {
          ApplicationArea = All;
        }
        field("Attendance Letter";Rec."Attendance Letter")
        {
          ApplicationArea = All;
        }
        field("Attendance Letter Date";Rec."Attendance Letter Date")
        {
          ApplicationArea = All;
        }
        field("Result Received";Rec."Result Received")
        {
          ApplicationArea = All;
        }
        field("Result Received Date";Rec."Result Received Date")
        {
          ApplicationArea = All;
        }
        field("Result Status";Rec."Result Status")
        {
          ApplicationArea = All;
        }
        field("Summon Issue To";Rec."Summon Issue To")
        {
          ApplicationArea = All;
        }
        field("Summon Transferred";Rec."Summon Transferred")
        {
          ApplicationArea = All;
        }
        field("Date of Transfer";Rec."Date of Transfer")
        {
          ApplicationArea = All;
        }
        field("Summon Amount";Rec."Summon Amount")
        {
          ApplicationArea = All;
        }
        field("Runner Fee";Rec."Runner Fee")
        {
          ApplicationArea = All;
        }
        field("Total Summon Charge";Rec."Total Summon Charge")
        {
          ApplicationArea = All;
        }
        field("Payment Method";Rec."Payment Method")
        {
          ApplicationArea = All;
        }
      }
      group("Direct Pay To Institution")
      {
        field("Receipt Obtained";Rec."Receipt Obtained")
        {
          ApplicationArea = All;
        }
        field("Receipt Date";Rec."Receipt Date")
        {
          ApplicationArea = All;
        }
        field("Receipt No.";Rec."Receipt No.")
        {
          ApplicationArea = All;
        }
        field("Handled By";Rec."Handled By")
        {
          ApplicationArea = All;
        }
      }
      group("Pay via Company")
      {
        field("Driver Pay By";Rec."Driver Pay By")
        {
          ApplicationArea = All;
        }
        field("Total Summon Charge2";Rec."Total Summon Charge")
        {
          ApplicationArea = All;
        }
        field("Invoice Generated";Rec."Invoice Generated")
        {
          ApplicationArea = All;
        }
        field("Invoice Generated Date";Rec."Invoice Generated Date")
        {
          ApplicationArea = All;
        }
        field(GOR;Rec.GOR)
        {
          ApplicationArea = All;
        }
        field("GOR Date";Rec."GOR Date")
        {
          ApplicationArea = All;

          trigger OnValidate()begin
            paytoinst:=("GOR Date" <> 0D);
          end;
        }
        field("GOR Amount";Rec."GOR Amount")
        {
          ApplicationArea = All;
        }
        field("LTA No.";Rec."LTA No.")
        {
          ApplicationArea = All;
        }
        field("Commencement Date";Rec."Commencement Date")
        {
          ApplicationArea = All;
        }
        field("Loan Amount";Rec."Loan Amount")
        {
          ApplicationArea = All;
        }
      }
      group("Pay to Institution")
      {
        Enabled = PaytoInst;

        field("Claim Generated";Rec."Claim Generated")
        {
          ApplicationArea = All;
        }
        field("Claim Generated Date";Rec."Claim Generated Date")
        {
          ApplicationArea = All;
        }
        field("GPC No.";Rec."GPC No.")
        {
          ApplicationArea = All;
        }
        field("GPC Date";Rec."GPC Date")
        {
          ApplicationArea = All;
        }
        field("GPC Amount";Rec."GPC Amount")
        {
          ApplicationArea = All;
        }
        field("Runner Name";Rec."Runner Name")
        {
          ApplicationArea = All;
        }
        field("Pay Receipt Obtained";Rec."Pay Receipt Obtained")
        {
          ApplicationArea = All;
        }
        field("Pay Receipt Date";Rec."Pay Receipt Date")
        {
          ApplicationArea = All;
        }
        field("Pay Receipt No.";Rec."Pay Receipt No.")
        {
          ApplicationArea = All;
        }
        field("Pay Receipt Amount";Rec."Pay Receipt Amount")
        {
          ApplicationArea = All;
        }
        field("Outstanding Balance";Rec."Outstanding Balance")
        {
          ApplicationArea = All;

          trigger OnValidate()begin
            gpcb:=false;
            gorb:=false;
            if "Outstanding Balance" = "Outstanding Balance"::"Short Payment" then GORb:=true;
            if "Outstanding Balance" = "Outstanding Balance"::"Over Payment" then GPCb:=true;
            CurrPage.Update();
          end;
        }
        field("Balance Amount";Rec."Balance Amount")
        {
          ApplicationArea = All;
        }
      }
      group("Outstanding")
      {
        field("Outst. GOR No.";Rec."Outst. GOR No.")
        {
          ApplicationArea = All;
          //Visible = GORb;
          Editable = gorb;
        }
        field("Outst. GOR Date";Rec."Outst. GOR Date")
        {
          ApplicationArea = All;
          editable = gorb;
        }
        field("Outst. GOR Amount";Rec."Outst. GOR Amount")
        {
          ApplicationArea = All;
          editable = gorb;
        }
        field("Outst. GPC No.";Rec."Outst. GPC No.")
        {
          ApplicationArea = All;
          //Visible = gpcb;
          Editable = gpcb;
        }
        field("Outst. GPC Date";Rec."Outst. GPC Date")
        {
          ApplicationArea = All;
          editable = gpcb;
        }
        field("Outst. GPC Amount";Rec."Outst. GPC Amount")
        {
          ApplicationArea = All;
          editable = gpcb;
        }
      }
    }
  }
  var GPCb: Boolean;
  GORb: Boolean;
  paytoinst: Boolean;
  trigger OnAfterGetRecord()begin
    gpcb:=false;
    gorb:=false;
    if "Outstanding Balance" = "Outstanding Balance"::"Short Payment" then GORb:=true;
    if "Outstanding Balance" = "Outstanding Balance"::"Over Payment" then GPCb:=true;
    paytoinst:=("GOR Date" <> 0D);
  end;
}
