page 99000 "MyHeaderAPI"
{
    PageType = API;
    SourceTable = "MyHeader";
    APIPublisher = 'bcDayES';
    APIGroup = 'web';
    APIVersion = 'v1.0';
    EntitySetName = 'headers';
    EntityName = 'header';
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    DeleteAllowed = true;
    ModifyAllowed = true;
    InsertAllowed = true;
    Permissions = tabledata "MyHeader" = ri;

    layout
    {
        area(Content)
        {
            field(id; Rec.SystemId)
            {
                ApplicationArea = All;
                Caption = 'id', Locked = true;
                Editable = false;
            }
            field(headerNo; Rec."No.")
            {
                ApplicationArea = All;
            }
            field(description; Rec.Description)
            {
                ApplicationArea = All;
            }
            field(registered; Rec.Registered)
            {
                ApplicationArea = All;
            }
            part(lines; MyAPILines)
            {
                EntitySetName = 'lines';
                EntityName = 'line';
                SubPageLink = "Header Id" = field(SystemId);
            }
        }
    }

    [ServiceEnabled]
    [Scope('Cloud')]
    procedure PostHeader(var ActionContext: WebServiceActionContext)
    begin
        Rec.Registered := true;
        Rec.Modify(false);
    end;
}