page 50008 "Referee Subform"
{
    AutoSplitKey = true;
    Caption = 'Referees';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Driver Referees";


    layout


    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("Referee Type";
                "Referee Type")
                {
                    ApplicationArea = RelationshipMgmt;
                }
                field("Contact No."; "Contact No.")
                {
                    ApplicationArea = RelationshipMgmt;
                    trigger OnValidate()
                    begin
                        if not contact.get("Contact No.") then clear(contact);
                        ContactName := contact.Name;
                    end;
                }
                field("Name"; ContactName)
                {
                    ApplicationArea = RelationshipMgmt;
                    Editable = false;
                }

            }
        }
    }

    actions
    {
    }

    trigger onaftergetrecord()
    var

    begin
        if not contact.get("Contact No.") then clear(contact);
        ContactName := contact.Name;
    end;

    var

        ContactName: Text[50];
        Contact: record Contact;
}

