table 99000 "MyHeader"
{
    fields
    {
        field(1; "No."; Code[10]) { }
        field(2; Description; Text[50]) { }
        field(3; Registered; Boolean) { }
    }
    keys
    {
        key(PK; "No.") { }
    }
    trigger OnInsert()
    var
        MyHeader: Record "MyHeader";
    begin
        if "No." = '' then
            if MyHeader.FindLast() then
                "No." := IncStr(MyHeader."No.")
            else
                "No." := 'HEADER001';
    end;
}