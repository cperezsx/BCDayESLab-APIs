codeunit 99001 "ExampleOutboundAPI"
{
    procedure Ping(): Text
    begin
        exit('Pong');
    end;

    procedure ObtenerNombrePrimerCliente(): Text
    var
        Customer: Record Customer;
    begin
        Customer.FindFirst();
        exit(Customer.Name);
    end;

    procedure Mayusculas(input: Text): Text
    begin
        exit(input.ToUpper());
    end;

    procedure ExisteProducto(itemNo: Text): Boolean
    var
        Item: Record Item;
    begin
        Item.SetRange("No.", itemNo);
        exit(not item.IsEmpty());
    end;

    procedure ObtenerFechaYHora(): DateTime
    begin
        exit(CurrentDateTime());
    end;

    procedure ObtenerProductosJson() ReturnValue: Text
    var
        Item: Record Item;
        outJsonObject: JsonObject;
        outJsonArray: JsonArray;
    begin
        Item.Reset();
        if Item.FindSet(false) then
            repeat
                Clear(outJsonObject);
                outJsonObject.Add('itemId', Item.SystemId);
                outJsonObject.Add('itemNo', Item."No.");
                outJsonObject.Add('itemDescription', Item.Description);
                outJsonArray.Add(outJsonObject);
            until Item.Next() = 0;

        outJsonArray.WriteTo(ReturnValue);
        exit(ReturnValue);
    end;
}