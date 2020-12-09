tableextension 50006 "User Setup Extension" extends "User Setup"
{
  fields
  {
    field(50000;"TIP Permit Status Change";Boolean)
    {
      Caption = 'TIP Permit Status Change';
      DataClassification = CustomerContent;
    }
    field(50001;"Supervisor Approver";Boolean)
    {
      DataClassification = CustomerContent;
    }
    field(50002;"Management Approver";Boolean)
    {
      DataClassification = CustomerContent;
    }
  }
}
