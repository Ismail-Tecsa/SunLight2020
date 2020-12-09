tableextension 50003 "Company Information Extension" extends "Company Information"
{
  fields
  {
    field(50000;"Taxi Company";Boolean)
    {
      Caption = 'Taxi Company';
      DataClassification = ToBeClassified;

      trigger OnValidate()var permitcue: record "Permit Cue";
      begin
        if "Taxi Company" then begin
          if not permitcue.get(CompanyName)then begin
            clear(permitcue);
            permitcue."Primary Key":=companyname;
            permitcue.insert;
          end;
        end
        else
        begin
          if permitcue.get(CompanyName)then permitcue.delete;
        end;
      end;
    }
  }
}
