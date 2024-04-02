table 99001 "MyLine"
{
    fields
    {
        field(1; "Header No."; Code[20])
        {
            TableRelation = "MyHeader"."No.";
        }
        field(2; "Line No."; Integer) { }
        field(3; "Header Id"; Guid)
        {
            TableRelation = "MyHeader".SystemId;
        }
        field(4; Description; Text[50])
        {
            trigger OnValidate()
            begin
                CheckHeaderStatus();
            end;
        }
    }
    keys
    {
        key(PK; "Header No.", "Line No.") { }
    }
    var
        MyHeader: Record "MyHeader";

    local procedure CheckHeaderStatus()
    begin
        GetHeader();
        // Do status check
    end;

    local procedure GetHeader()
    begin
        if MyHeader.SystemId <> "Header Id" then
            MyHeader.GetBySystemId("Header Id");
    end;
}