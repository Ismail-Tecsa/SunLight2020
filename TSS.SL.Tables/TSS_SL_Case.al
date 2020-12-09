table 50015 Case
{
  Caption = 'Case';
  DataClassification = ToBeClassified;
  LookupPageId = "Case List";
  DataPerCompany = false;

  fields
  {
    field(1;"Case ID";Code[10])
    {
      Caption = 'Case ID';
      DataClassification = CustomerContent;

      trigger OnValidate()begin
        if "Case ID" <> xRec."Case ID" then begin
          GLSetup.Get();
          NoSeriesMgt.TestManual(GLSetup."Case No. Series");
        end;
      end;
    }
    field(12;"Case Company";Text[30])
    {
      Caption = 'Case Company';
      DataClassification = CustomerContent;
      TableRelation = Company;
    }
    field(3;Status;Option)
    {
      Caption = 'Status';
      OptionMembers = "Pending", "Closed";
    }
    field(4;"Taxi ID";Code[10])
    {
      Caption = 'Taxi ID';
      DataClassification = CustomerContent;
      TableRelation = taxis;

      trigger OnValidate()var taxis: record taxis;
      CMAcc: record "CM Accident";
      Insurance: Record Insurance;
      ServContLine: record "Service Contract Line";
      ServContHead: record "Service Contract Header";
      begin
        if taxis.get("Taxi ID")then begin
          if taxis."Permit ID" <> '' then validate("Permit ID", taxis."Permit ID");
          if Type = type::Accident then begin
            Insurance.reset;
            Insurance.setrange("Taxi No.", "Taxi ID");
            if Insurance.FindLast()then begin
              cmacc.get("Case ID");
              cmacc."Insurance Category":=Insurance."Insurance Type";
            end;
          end;
          if CurrFieldNo = FieldNo("Taxi ID")then begin
            ServContLine.reset;
            ServContLine.setrange("Taxi ID", "Taxi ID");
            if ServContLine.findlast()then begin
              ServContHead.get(ServContLine."Contract Type", ServContLine."Contract No.");
              validate("Owner ID", ServContHead."Customer No.");
              Validate("Contract No.", ServContHead."Contract No.");
            end;
          end;
        end;
      end;
    }
    field(5;"Owner ID";Code[10])
    {
      Caption = 'Driver ID';
      TableRelation = customer;
      DataClassification = CustomerContent;
    }
    field(6;"Permit ID";Code[20])
    {
      Caption = 'Permit ID';
      TableRelation = Permit;
      DataClassification = ToBeClassified;
    }
    field(7;"Contract No.";code[10])
    {
      Caption = 'Contract No.';
      TableRelation = "Service Contract Header"."Contract No." where("Contract Type"=const(Contract));

      trigger OnValidate()var taxis: record taxis;
      ContractHead: record "Service Contract Header";
      ContractLine: Record "Service Contract Line";
      permit: record Permit;
      begin
        if ContractHead.get(ContractHead."Contract Type"::Contract, "Contract No.")then begin
          ContractLine.reset;
          ContractLine.setrange("Contract No.", ContractHead."Contract No.");
          contractline.findfirst;
          if CurrFieldNo = FieldNo("Contract No.")then begin
            if "Taxi ID" = '' then validate("Taxi ID", ContractLine."Taxi ID");
            validate("Owner ID", ContractHead."Customer No.");
          end;
          if Type = type::Repo then begin
            if ContractHead.Freeze = false then begin
              if confirm('Do you wish to freeze the contract')then begin
                ContractHead.Freeze:=true;
                ContractHead.modify;
              end;
            end;
          end;
        end;
      end;
    }
    field(2;Type;Option)
    {
      Caption = 'Type';
      OptionMembers = " ", "Lost Document", "Endorse Engine", "Pass Card", "Summon", "Accident", "Dismantle", "Repo", "PG10";
      DataClassification = CustomerContent;

      trigger OnValidate()var CMLostDoc: record "CM Lost Document";
      CMEndEng: Record "CM Endorse Engine";
      CMPassCard: record "CM Pass Card";
      CMSummon: record "CM Summon";
      CMAccident: record "CM Accident";
      CMAccOffer: Record "CM Accident Offer";
      CMPG10: Record "CM PG10";
      CMDismantle: record "CM Dismantle";
      CMRepo: Record "CM Repo";
      CMRepoSpoil: Record "CM Repo Spoil";
      begin
        case xRec.type of xrec.type::"Lost Document": begin
          if CMLostDoc.get("Case ID")then if Confirm('Are you sure you want to delete the existing type details?')then begin
              CMLostDoc.delete;
            end;
        end;
        xrec.type::"Endorse Engine": begin
          if CMEndEng.get("Case ID")then if Confirm('Are you sure you want to delete the existing type details?')then begin
              CMEndEng.delete;
            end;
        end;
        xrec.type::"Pass Card": begin
          if CMPassCard.get("Case ID")then if Confirm('Are you sure you want to delete the existing type details?')then begin
              CMPassCard.delete;
            end;
        end;
        xrec.type::"summon": begin
          if CMSummon.get("Case ID")then if Confirm('Are you sure you want to delete the existing type details?')then begin
              CMsummon.delete;
            end;
        end;
        xrec.type::Accident: begin
          if CMAccident.get("Case ID")then if Confirm('Are you sure you want to delete the existing type details?')then begin
              CMAccident.delete;
              CMAccOffer.reset;
              CMAccOffer.setrange("Case ID", "Case ID");
              if CMAccOffer.findset()then cmaccoffer.Deleteall();
            end;
        end;
        xrec.type::PG10: begin
          if CMPG10.get("Case ID")then if Confirm('Are you sure you want to delete the existing type details?')then begin
              CMPG10.delete;
            end;
        end;
        xrec.type::Dismantle: begin
          if CMDismantle.get("Case ID")then if Confirm('Are you sure you want to delete the existing type details?')then begin
              CMDismantle.delete;
            end;
        end;
        xrec.type::Repo: begin
          cmrepo.reset;
          cmrepo.setrange("Case ID", "Case ID");
          if CMRepo.findset()then if Confirm('Are you sure you want to delete the existing type details?')then begin
              CMDismantle.deleteall;
            end;
          CMRepoSpoil.reset;
          CMRepoSpoil.setrange("Case ID", "Case ID");
          if CMRepoSpoil.FindSet()then CMRepoSpoil.deleteall;
        end;
        end;
        case type of type::"Lost Document": begin
          if not CMLostDoc.get("Case ID")then begin
            clear(CMLostDoc);
            CMLostDoc."Case ID":="Case ID";
            CMLostDoc.insert;
          end;
        end;
        type::"Endorse Engine": begin
          if not CMEndEng.get("Case ID")then begin
            clear(CMendeng);
            CMEndEng."Case ID":="Case ID";
            CMendeng.insert;
          end;
        end;
        type::"Pass Card": begin
          if not CMPassCard.get("Case ID")then begin
            clear(CMPassCard);
            CMPassCard."Case ID":="Case ID";
            CMPassCard.insert;
          end;
        end;
        type::"Summon": begin
          if not CMSummon.get("Case ID")then begin
            clear(CMSummon);
            CMSummon."Case ID":="Case ID";
            CMSummon.insert;
          end;
        end;
        type::Accident: begin
          if not CMAccident.get("Case ID")then begin
            clear(CMAccident);
            CMAccident."Case ID":="Case ID";
            CMAccident.insert;
          end;
        end;
        type::PG10: begin
          if not CMpg10.get("Case ID")then begin
            clear(CMPG10);
            CMPG10."Case ID":="Case ID";
            CMPG10.insert;
          end;
        end;
        type::Dismantle: begin
          if not CMDismantle.get("Case ID")then begin
            clear(CMDismantle);
            CMDismantle."Case ID":="Case ID";
            CMDismantle.insert;
          end;
        end;
        type::repo: begin
          //repo has versions, always start with version 1.
          if not CMRepo.get("Case ID", 1)then begin
            clear(CMRepo);
            CMRepo."Case ID":="Case ID";
            cmrepo.Version:=1;
            CMRepo.insert;
          end;
        end;
        end;
      end;
    }
    field(8;"Search Description";Code[50])
    {
      Caption = 'Search Description';
      DataClassification = CustomerContent;
    }
    field(9;"Case Created";Date)
    {
      Caption = 'Case Created';
      DataClassification = CustomerContent;
    }
    field(10;"Case Created by";code[50])
    {
      DataClassification = CustomerContent;
      TableRelation = "User Setup";
    }
    field(11;"Raised by";option)
    {
      DataClassification = CustomerContent;
      OptionMembers = "Company", "Driver";
    }
    field(13;"Case Settled";Boolean)
    {
      DataClassification = CustomerContent;
    }
  }
  keys
  {
    key(PK;"Case ID")
    {
      Clustered = true;
    }
  }
  trigger OnDelete()begin
  //delete related tables
  end;
  trigger OnInsert()begin
    if "Case ID" = '' then begin
      GLSetup.Get();
      GLSetup.TestField("Case No. Series");
      NoSeriesMgt.InitSeries(GLSetup."Case No. Series", GLSetup."Case No. Series", 0D, "Case ID", GLSetup."Case No. Series");
    end;
    "Case Created":=today;
    "Case Created by":=UserId;
    "Case Company":=CompanyName;
  end;
  trigger OnModify()begin
  end;
  trigger OnRename()begin
  end;
  var GLSetup: record "General Ledger Setup";
  NoSeriesMgt: Codeunit NoSeriesManagement;
}
