page 99001 "MyAPILines"
{
    PageType = API;
    APIGroup = 'web';
    APIPublisher = 'bcDayES';
    APIVersion = 'v1.0';
    DelayedInsert = true;
    EntityName = 'line';
    EntitySetName = 'lines';
    SourceTable = "MyLine";
    ODataKeyFields = SystemId;
    DeleteAllowed = true;
    ModifyAllowed = true;
    InsertAllowed = true;
    PopulateAllFields = true;
    Permissions = tabledata "MyLine" = ri;

    layout
    {
        area(Content)
        {
            repeater(lines)
            {
                field(id; Rec.SystemId)
                {
                    ApplicationArea = all;
                    Caption = 'id', Locked = true;
                    Editable = false;
                }
                field(headerNo; Rec."Header No.")
                {
                    ApplicationArea = all;
                }
                field(headerId; Rec."Header Id")
                {
                    ApplicationArea = all;
                    Caption = 'id', Locked = true;
                    Editable = false;
                }
                field(lineNo; Rec."Line No.")
                {
                    ApplicationArea = all;
                }
                field(description; Rec.Description)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    var
        IsDeepInsert: Boolean;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        MyHeader: Record "MyHeader";
        MyLine: Record "MyLine";
    begin
        //Esto es por que no esta enlazado con la cabecera en la inserción con el SystemId
        if IsDeepInsert then begin
            Clear(MyHeader);
            If MyHeader.Get(Rec."Header No.") then;
            Rec."Header Id" := MyHeader.SystemId;
            MyLine.SetRange("Header No.", Rec."Header No.");
            if MyLine.FindLast() then
                Rec."Line No." := MyLine."Line No." + 10000
            else
                Rec."Line No." := 10000;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        MyHeader: Record "MyHeader";
        MyLine: Record "MyLine";
    begin
        //Si el guid viene vacio es por que es inserción no enlazada con la cabecera
        IsDeepInsert := IsNullGuid(Rec."Header Id");
        //Si esta enlazado, entonces, traigo la info del header.
        if not IsDeepInsert then begin
            MyHeader.GetBySystemId(Rec."Header Id");
            Rec."Header No." := MyHeader."No.";
            MyLine.SetRange("Header No.", Rec."Header No.");
            if MyLine.FindLast() then
                Rec."Line No." := MyLine."Line No." + 10000
            else
                Rec."Line No." := 10000;
        end;
    end;
}