tableextension 50010 "GL Setup Extension" extends "General Ledger Setup"
{
  fields
  {
    field(50000;"Case No. Series";Code[10])
    {
      Caption = 'Case No. Series';
      DataClassification = CustomerContent;
      AccessByPermission = TableData "Case"=R;
      TableRelation = "No. Series";
    }
    field(50001;"Settlement No. Series";Code[10])
    {
      Caption = 'Settlement No. Series';
      DataClassification = CustomerContent;
      TableRelation = "No. Series";
    }
  }
}
