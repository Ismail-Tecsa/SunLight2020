table 50010 "TIP Entry"
{
  Caption = 'TIP Entry';
  DataClassification = ToBeClassified;

  fields
  {
    field(1;"Taxi ID";Code[20])
    {
      Caption = 'Taxi ID';
      DataClassification = CustomerContent;
      TableRelation = Taxis;
    }
    field(2;Step;Integer)
    {
      Caption = 'Step';
      DataClassification = ToBeClassified;
      TableRelation = "TIP Master Setup";

      trigger onvalidate()var TIPMaster: record "TIP Master Setup";
      begin
        if tipmaster.get(step)then begin
          Description:=TIPMaster.Description;
        end;
      end;
    }
    field(3;Description;Text[50])
    {
      Caption = 'Description';
      DataClassification = ToBeClassified;
    }
    field(4;"Date Started";Date)
    {
      Caption = 'Date Started';
      DataClassification = ToBeClassified;
    }
    field(5;"Date Finished";Date)
    {
      Caption = 'Date Finished';
      DataClassification = ToBeClassified;
    }
    field(6;Status;Option)
    {
      Caption = 'Status';
      DataClassification = ToBeClassified;
      OptionMembers = "Open", "In Progress", "Pending", "Closed";
    }
    field(7;Remark;Text[50])
    {
      Caption = 'Remark';
      DataClassification = ToBeClassified;
    }
    field(8;"Amount Paid";Decimal)
    {
      Caption = 'Amount Paid';
      FieldClass = FlowField;
      CalcFormula = sum("G/L Entry"."Credit Amount" where("Taxi No."=field("Taxi ID"), "TIP Step"=field(Step)));
    //flowfield
    }
  }
  keys
  {
    key(PK;"Taxi ID", Step)
    {
      Clustered = true;
    }
  }
}
