query 99002 ItemInventoryLocation
{
    QueryType = API;
    APIGroup = 'web';
    APIPublisher = 'bcDayES';
    APIVersion = 'v1.0';
    EntityName = 'itemInventoryQuantity';
    EntitySetName = 'itemInventoryQuantities';
    DataAccessIntent = ReadOnly;
    OrderBy = ascending(locationCode), ascending(ItemNo);


    elements
    {
        dataitem(ItemLedger; "Item Ledger Entry")

        {
            DataItemTableFilter = Open = filter(true);
            column(itemNo; "Item No.")
            {
                Caption = 'itemNo', Locked = true;
            }
            column(locationCode; "Location Code")
            {
                Caption = 'LocationCode', Locked = true;
            }

            column(quantity; "Quantity")
            {
                Caption = 'Quantity', Locked = true;
                Method = Sum;
            }
        }

    }

    trigger OnBeforeOpen()
    begin
    end;

}