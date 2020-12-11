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
                        ContactMobileNo := Contact."Mobile Phone No."; //TSA_ISMAIL Added Contact Mobile No
                        ContactRelative := Contact.Relationship; //TSA_ISMAIL Added Contact Relationship
                    end;
                }
                field("Name"; ContactName)
                {
                    ApplicationArea = RelationshipMgmt;
                    Editable = false;
                }
                //TSA_ISMAIL Added Contact Mobile No field
                field("Mobile No"; ContactMobileNo)
                {
                    ApplicationArea = RelationshipMgmt;
                    Editable = false;
                }
                //TSA_ISMAIL Added Contact Relationship field
                field("RelationShip"; ContactRelative)
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
        ContactMobileNo := Contact."Mobile Phone No.";//TSA_ISMAIL Added Contact Mobile No
        ContactRelative := Contact.Relationship;
    end;

    var

        ContactName: Text[50];
        ContactRelative: Text[50];
        ContactMobileNo: Text[30];
        Contact: record Contact;
}
