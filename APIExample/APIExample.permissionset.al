permissionset 99000 APIExample
{
    Assignable = true;
    Permissions = tabledata MyHeader = RIMD,
        tabledata MyLine = RIMD,
        table MyHeader = X,
        table MyLine = X,
        codeunit ExampleOutboundAPI = X,
        page MyAPILines = X,
        page MyHeaderAPI = X,
        query ItemInventoryLocation = X;
}