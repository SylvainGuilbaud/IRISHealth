Class SC.DataLoader
{

ClassMethod LoadData(filedir As %String) As %Status
{
    Set st = ##class(SC.DataLoader).LoadLocation(filedir)
    Set st = ##class(SC.DataLoader).LoadCarrier(filedir)
    Set st = ##class(SC.DataLoader).LoadProduct(filedir)
    //Set st = ##class(SC.DataLoader).LoadBOM(filedir)
    //Set st = ##class(SC.DataLoader).LoadSLA(filedir)
    Set st = ##class(SC.DataLoader).LoadCustomer(filedir)
    Set st = ##class(SC.DataLoader).LoadSupplier(filedir)
    //Set st = ##class(SC.DataLoader).LoadProductSupplier(filedir)
    Set st = ##class(SC.DataLoader).LoadInventoryThreshold(filedir)
    //Set st = ##class(SC.DataLoader).LoadProductInventory(filedir)
    Set st = ##class(SC.DataLoader).LoadSalesOrder(filedir)
    Set st = ##class(SC.DataLoader).LoadSalesOrderLine(filedir)
    Set st = ##class(SC.DataLoader).LoadSalesShipment(filedir)
    Set st = ##class(SC.DataLoader).LoadSalesShipmentLine(filedir)
    Set st = ##class(SC.DataLoader).LoadPurchaseOrder(filedir)
    Set st = ##class(SC.DataLoader).LoadPurchaseOrderLine(filedir)
    Set st = ##class(SC.DataLoader).LoadSupplyShipment(filedir)
    Set st = ##class(SC.DataLoader).LoadSupplyShipmentLine(filedir)  
    return st
}

/// Description
ClassMethod LoadLocation(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"locations.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.Location(uid,name,type,status,street,city,stateProvince,country,postalCode,coordinates) VALUES (ID,Name,Type,Status,Street,City,State,Country,Zip,Coordinates) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Locations Loaded."
    Return sc
}

ClassMethod LoadCarrier(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"carriers.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.Carrier(uid,name,type,status) VALUES (ID,Name,Type,Status) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Carriers Loaded."
    Return sc
}

ClassMethod LoadProduct(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"products.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.Product(uid,name,type,productBrand,productCategory,productFamily) VALUES (ID,Name,Type,Brand,Category,Family) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Products Loaded."
    Return sc
}

// depends on product

ClassMethod LoadBOM(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"bom.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.BOM(uid,productId,itemId,parentItemId,quantity,unitOfMeasure,isAlternate,substituteFor) VALUES (bomid,ProductId,ItemId,ParentItemId,Quantity,UnitofMeasure,IsAlternate,SubstituteFor) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"BOM Loaded."
    Return sc
}

// depends on product

ClassMethod LoadSLA(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"sla.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.SLA(uid,type,productId,cycleTime,cycleTimeUnit) VALUES (slaid,Type,ProductID,CycleTime,TimeUnit) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"SLA Loaded."
    Return sc
}

// depends on location

ClassMethod LoadCustomer(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"customers.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.Customer(uid,name,type,status,primaryLocationId) VALUES (ID,Name,Type,Status,Primarylocation) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Customers Loaded."
    Return sc
}

// depends on location

ClassMethod LoadSupplier(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"suppliers.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.Supplier(uid,name,type,status,primaryLocationId) VALUES (ID,Name,Type,Status,Primarylocation) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Suppliers Loaded."
    Return sc
}

// depends on supplier and product

ClassMethod LoadProductSupplier(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"partsupplier.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.ProductSupplier(uid,productId,supplierId) VALUES (UID,PartID,SupplierID) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Product Supplier Loaded."
    Return sc
}

// depends on location & product

ClassMethod LoadInventoryThreshold(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"inventoryThresholds.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.InventoryThreshold(uid,siteLocationId,productId,quantityUpperThreshold,quantityLowerThreshold) VALUES (id,LocationId,ProductId,UpperThreshold,LowerThreshold) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Inventory Threshold Loaded."
    Return sc
}

// depends on location & product

ClassMethod LoadProductInventory(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"partinventory.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.ProductInventory(uid,productId,siteLocationId,quantity,quantityUom,quantityReserved) VALUES (uid,ProductID,LocationID,Quantity,UnitOfMeasure,QuantityReserved) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Product Inventory Loaded."
    Return sc
}

// depends on customer

ClassMethod LoadSalesOrder(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"salesOrders.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.SalesOrder(uid,customerId,orderStatus,orderPlacedDate,shipToLocationId,orderValue,orderCurrency,requestedShipDate,requestedDeliveryDate,committedShipDate,committedDeliveryDate) VALUES (ID,CustomerId,Status,PlacedDate,ShipTo,OrderValue,ValueCurrency,RequestShipDate,RequestedDeliveryDate,CommittedShipDate,CommittedDeliveryDate) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Sales Orders Loaded."
    Return sc
}

// depends on sales order and product

ClassMethod LoadSalesOrderLine(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"salesOrderLines.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.SalesOrderLine(uid,salesOrderId,lineNumber,productId,quantity,unitOfMeasure,status,value,valueCurrency) VALUES (ID,OrderId,lineNumber,ProductId,Quantity,UoM,Stutus,Value,Currency) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Sales Order Lines Loaded."
    Return sc
}

// depends on customer and location

ClassMethod LoadSalesShipment(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"salesShipments.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.SalesShipment(uid,customerID,status,carrierId,originLocationId,destinationLocationId,actualShipDate,estimatedTimeOfArrival,actualTimeOfArrival) VALUES (ID,CustomerId,Status,CarrierID,OriginId,DestinationId,ShipDate,ETA,DeliveryDate) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Sales Shipments Loaded."
    Return sc
}

// depends on sales order, sales order line, sales shipment, product

ClassMethod LoadSalesShipmentLine(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"salesShipmentLines.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.SalesShipmentLine(uid,salesShipmentId,lineNumber,salesOrderLineId,salesOrderId,salesOrderLineNumber,productId,quantityShipped,unitOfMeasure) VALUES (ID,ShipmentId,lineNumber,OrderLineId,OrderId,OrderLineNumber,ProductId,Quantity,UoM) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Sales Shipment Lines Loaded."
    Return sc
}

// depends on supplier

ClassMethod LoadPurchaseOrder(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"purchaseOrders.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.PurchaseOrder(uid,supplierId,orderStatus,orderPlacedDate,shipToLocationId,orderValue,orderCurrency,requestedShipDate,requestedDeliveryDate) VALUES (ID,SupplierId,Status,PlacedDate,ShipTo,OrderValue,ValueCurrency,RequestShipDate,RequestedDeliveryDate) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Purchase Orders Loaded."
    Return sc
}

// depends on purchase order and product

ClassMethod LoadPurchaseOrderLine(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"purchaseOrderLines.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.PurchaseOrderLine(uid,purchaseOrderId,lineNumber,productId,quantity,unitOfMeasure,status,value,valueCurrency) VALUES (ID,OrderId,lineNumber,ProductId,Quantity,UoM,Stutus,Value,Currency) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Purchase Order Lines Loaded."
    Return sc
}

// depends on supplier and location

ClassMethod LoadSupplyShipment(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"supplyShipments.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.SupplyShipment(uid,supplierId,status,carrierId,originLocationId,destinationLocationId,actualShipDate,estimatedTimeOfArrival,actualTimeOfArrival) VALUES (ID,SupplierId,Status,CarrierID,OriginId,DestinationId,ShipDate,ETA,DeliveryDate) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Supply Shipments Loaded."
    Return sc
}

// depends on purchase order, purchase order line, supply shipment, product

ClassMethod LoadSupplyShipmentLine(filedir As %String) As %Status
{
    Set sc = $$$OK
    Set filepath = filedir_"supplyShipmentLines.csv"
    SET myquery = "LOAD DATA FROM FILE '"_filepath_"' INTO SC_Data.SupplyShipmentLine(uid,supplyShipmentId,lineNumber,purchaseOrderLineId,purchaseOrderId,purchaseOrderLineNumber,productId,quantityShipped,unitOfMeasure) VALUES (ID,ShipmentId,lineNumber,OrderLineId,OrderId,OrderLineNumber,ProductId,Quantity,UoM) USING {""from"":{""file"":{""header"":""1""}}}"
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WRITE !
    DO rset.%Display()
    WRITE !,"Supply Shipment Lines Loaded."
    Return sc
}

ClassMethod DeleteAll() As %Status
{
    Set sc = $$$OK
    &sql(DELETE FROM SC_Data.SupplyShipmentLine)
    &sql(DELETE FROM SC_Data.SupplyShipment)
    &sql(DELETE FROM SC_Data.PurchaseOrderLine)
    &sql(DELETE FROM SC_Data.PurchaseOrder)
    &sql(DELETE FROM SC_Data.SalesShipmentLine)
    &sql(DELETE FROM SC_Data.SalesShipment)
    &sql(DELETE FROM SC_Data.SalesOrderLine)
    &sql(DELETE FROM SC_Data.SalesOrder)
    &sql(DELETE FROM SC_Data.ProductInventory)
    &sql(DELETE FROM SC_Data.InventoryThreshold)
    &sql(DELETE FROM SC_Data.ProductSupplier)
    &sql(DELETE FROM SC_Data.Supplier)
    &sql(DELETE FROM SC_Data.Customer)
    &sql(DELETE FROM SC_Data.SLA)
    &sql(DELETE FROM SC_Data.BOM)
    &sql(DELETE FROM SC_Data.Product)
    &sql(DELETE FROM SC_Data.Carrier)
    &sql(DELETE FROM SC_Data.Location)
    Return sc
}

/// Description
ClassMethod PurgeClassIndices() As %Status
{
    Set sc = $$$OK
    do ##class("SC.Data.BOM").%PurgeIndices()    
    do ##class("SC.Data.Carrier").%PurgeIndices()  
    do ##class("SC.Data.Customer").%PurgeIndices()  
    do ##class("SC.Data.DemandPlan").%PurgeIndices()  
    do ##class("SC.Data.InventoryThreshold").%PurgeIndices()  
    do ##class("SC.Data.Location").%PurgeIndices()    
    do ##class("SC.Data.MfgOrder").%PurgeIndices()  
    do ##class("SC.Data.Milestone").%PurgeIndices()  
    do ##class("SC.Data.Product").%PurgeIndices()  
    do ##class("SC.Data.ProductInventory").%PurgeIndices()  
    do ##class("SC.Data.ProductSupplier").%PurgeIndices()    
    do ##class("SC.Data.PurchaseOrder").%PurgeIndices()  
    do ##class("SC.Data.PurchaseOrderLine").%PurgeIndices()  
    do ##class("SC.Data.SalesOrder").%PurgeIndices()  
    do ##class("SC.Data.SalesOrderLine").%PurgeIndices()  
    do ##class("SC.Data.SalesShipment").%PurgeIndices()  
    do ##class("SC.Data.SalesShipmentLine").%PurgeIndices()  
    do ##class("SC.Data.SLA").%PurgeIndices()    
    do ##class("SC.Data.Supplier").%PurgeIndices()  
    do ##class("SC.Data.SupplyPlan").%PurgeIndices()  
    do ##class("SC.Data.SupplyShipment").%PurgeIndices()  
    do ##class("SC.Data.SupplyShipmentLine").%PurgeIndices()  
    Return sc
}

}
