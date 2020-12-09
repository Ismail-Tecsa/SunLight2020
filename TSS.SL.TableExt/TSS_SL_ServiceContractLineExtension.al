tableextension 50008 "Service Cont. Line Extension" extends "Service Contract Line"
{
  fields
  {
    field(50000;"Taxi ID";code[20])
    {
      TableRelation = Taxis;

      trigger OnValidate()var taxis: record taxis;
      begin
        if "Taxi ID" <> '' then begin
          taxis.get("Taxi ID");
          if taxis."Active Contract" <> "Contract No." then begin
            taxis.TestField("Active Contract", '');
            taxis."Active Contract":="Contract No.";
            taxis.Modify();
          end;
        end;
        if "Service Item No." = '' then validate("Service Item No.", "Taxi ID");
        if evaluate("Service Period", '5Y')then;
      end;
    }
    modify("Service Item No.")
    {
    trigger OnAfterValidate()begin
      validate("Taxi ID", "Service Item No.");
    end;
    }
  }
  trigger OnAfterDelete()var taxis: record taxis;
  begin
    if taxis.get("Service Item No.")then begin
      taxis."Active Contract":='';
      taxis.Modify();
    end;
  end;
}
