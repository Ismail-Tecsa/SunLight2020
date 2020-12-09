table 50034 "CM Repo"
{
  Caption = 'CM Repo';
  DataClassification = ToBeClassified;

  fields
  {
    field(1;"Case ID";Code[10])
    {
      Caption = 'Case ID';
      DataClassification = ToBeClassified;
    }
    field(2;"Repo Status";Option)
    {
      Caption = 'Repo Status';
      DataClassification = ToBeClassified;
      OptionMembers = "Pending", "Confirmed", "Cancelled", "Untraced";

      trigger OnValidate()var ContHead: record "Service Contract Header";
      CaseHead: record Case;
      begin
        if "repo status" <> xRec."repo status" then begin
          if("Repo Status" = "Repo Status"::Cancelled) or ("Repo Status" = "Repo Status"::Confirmed)then begin
            if confirm('Do you wish to unfreeze the contract')then begin
              casehead.get("Case ID");
              if ContHead.get(conthead."Contract Type"::Contract, casehead."Contract No.")then begin
                ContHead.Freeze:=false;
                ContHead.modify;
              end;
            end;
          end;
          if("Repo Status" = "Repo Status"::Pending) or ("Repo Status" = "Repo Status"::Untraced)then begin
            casehead.get("Case ID");
            if ContHead.get(conthead."Contract Type"::Contract, CaseHead."Contract No.")then begin
              if not ContHead.Freeze then begin
                if confirm('Do you wish to freeze the contract')then begin
                  ContHead.Freeze:=true;
                  ContHead.modify;
                end;
              end;
            end;
          end;
        end;
      end;
    }
    field(3;Version;Integer)
    {
      Caption = 'Version';
      DataClassification = ToBeClassified;
    }
    field(4;Repossessor;Code[10])
    {
      Caption = 'Repossessor';
      DataClassification = ToBeClassified;
      TableRelation = Vendor;
      ValidateTableRelation = true;

      trigger OnValidate()var vendor: Record Vendor;
      begin
        if vendor.get(Repossessor)then begin
          "Reposessor Name":=vendor.Name;
          "Reposessor Phone":=vendor."Phone No.";
          validate("Repo Item No.", vendor."Repo Fee Item No.");
        end
        else
        begin
          clear("Repo Fee");
          clear("Repo Item No.");
          clear("Reposessor Name");
          clear("Reposessor Phone");
        end;
      end;
    }
    field(5;"Reposessor Name";Text[50])
    {
      Caption = 'Reposessor Name';
      DataClassification = ToBeClassified;
      Editable = false;
    }
    field(6;"Reposessor Phone";Text[30])
    {
      Caption = 'Reposessor Phone';
      DataClassification = ToBeClassified;
    }
    field(7;"Repo Item No.";Code[20])
    {
      Caption = 'Repo Item No.';
      DataClassification = ToBeClassified;
      TableRelation = item where(type=const(Service));

      trigger OnValidate()var item: record item;
      begin
        if item.get("Repo Item No.")then begin
          "Repo Fee":=item."Unit Price";
        end;
      end;
    }
    field(8;"Repo Fee";Decimal)
    {
      Caption = 'Repo Fee';
      DataClassification = ToBeClassified;
    }
    field(9;"Issue Date";Date)
    {
      Caption = 'Issue Date';
      DataClassification = ToBeClassified;

      trigger OnValidate()begin
        "Expiry Date":=calcdate('7D', "Issue Date");
      end;
    }
    field(10;"Expiry Date";Date)
    {
      Caption = 'Expiry Date';
      DataClassification = ToBeClassified;
    }
    field(11;"Branch ID";Code[10])
    {
      Caption = 'Branch ID';
      DataClassification = ToBeClassified;
      TableRelation = "Responsibility Center";
    }
    field(12;"Time In";Time)
    {
      Caption = 'Time In';
      DataClassification = ToBeClassified;
    }
    field(13;"Date In";Date)
    {
      Caption = 'Date In';
      DataClassification = ToBeClassified;
    }
    field(14;"Date Out";Date)
    {
      Caption = 'Date Out';
      DataClassification = ToBeClassified;
    }
    field(15;"Surrender Type";Option)
    {
      Caption = 'Surrender Type';
      DataClassification = ToBeClassified;
      OptionMembers = "Normal", "Accident", "Special Case";
    }
    field(16;Location;Text[50])
    {
      Caption = 'Location';
      DataClassification = ToBeClassified;
    }
    field(17;"Account Closed Date";Date)
    {
      Caption = 'Account Closed Date';
      DataClassification = ToBeClassified;
    }
    field(18;"Original Permit";Boolean)
    {
      Caption = 'Original Permit';
      DataClassification = ToBeClassified;
    }
    field(19;"Original Meter Letter";Boolean)
    {
      Caption = 'Original Meter Letter';
      DataClassification = ToBeClassified;
    }
    field(20;"Original Sticker Puspakom";Boolean)
    {
      Caption = 'Original Sticker Puspakom';
      DataClassification = ToBeClassified;
    }
    field(21;"Original Road Tax";Boolean)
    {
      Caption = 'Original Road Tax';
      DataClassification = ToBeClassified;
    }
    field(22;"Radio Call Set";Boolean)
    {
      Caption = 'Radio Call Set';
      DataClassification = ToBeClassified;
    }
    field(23;"GPS Set";Boolean)
    {
      Caption = 'GPS Set';
      DataClassification = ToBeClassified;
    }
    field(24;"Meter Set";Boolean)
    {
      Caption = 'Meter Set';
      DataClassification = ToBeClassified;
    }
    field(25;"NGV ";Boolean)
    {
      Caption = 'NGV ';
      DataClassification = ToBeClassified;
    }
    field(26;"Cassette/Radio/Speakers";Boolean)
    {
      Caption = 'Cassette/Radio/Speakers';
      DataClassification = ToBeClassified;
    }
    field(27;"Spare Tyre";Boolean)
    {
      Caption = 'Spare Tyre';
      DataClassification = ToBeClassified;
    }
    field(28;"Tools and Jack";Boolean)
    {
      Caption = 'Tools and Jack';
      DataClassification = ToBeClassified;
    }
    field(29;"Fire Extinguisher";Boolean)
    {
      Caption = 'Fire Extinguisher';
      DataClassification = ToBeClassified;
    }
    field(30;"Car Key / Alarm";Boolean)
    {
      Caption = 'Car Key / Alarm';
      DataClassification = ToBeClassified;
    }
    field(31;"Other Item 1";Text[30])
    {
      Caption = 'Other Item 1';
      DataClassification = ToBeClassified;
    }
    field(32;"Other Item 2";Text[30])
    {
      Caption = 'Other Item 2';
      DataClassification = ToBeClassified;
    }
  }
  keys
  {
    key(PK;"Case ID", Version)
    {
      Clustered = true;
    }
  }
}
