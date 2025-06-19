Class operations.product Extends Ens.BusinessOperation
{

Method store(pRequest As msg.products, Output pResponse As %RegisteredObject) As %Status
{
    set sc=$$$OK

    Try {
        for i = 1:1:pRequest.products.Count() {

            set id=0,sku=pRequest.products.GetAt(i).SKU
            &sql(select id into :id from data.product where SKU = :sku )  
            if ##class(data.product).%ExistsId(id) {
                set p = ##class(data.product).%OpenId(id)
            } else {
                set p = ##class(data.product).%New()
            }
            
            set p.SKU = pRequest.products.GetAt(i).SKU
            set p.Description = pRequest.products.GetAt(i).Description
            set p.Status = pRequest.products.GetAt(i).Status
            set p.Category = pRequest.products.GetAt(i).Category
            set p.ts = pRequest.products.GetAt(i).ts

            set sc = p.%Save()
        }
        $$$LOGINFO("Stored " _ pRequest.products.Count() _ " products")

    }
    Catch ex {
        Set tSC=ex.AsStatus()

        $$$LOGERROR("ERROR:" _ $system.Status.GetErrorText(tSC))
        
    }

	return sc
}

Method storeOne(pRequest As msg.product, Output pResponse As %RegisteredObject) As %Status
{
    set sc=$$$OK

    Try {
        
        set id=0,sku=pRequest.SKU
        &sql(select id into :id from data.product where SKU = :sku )  
        if ##class(data.product).%ExistsId(id) {
            set p = ##class(data.product).%OpenId(id)
        } else {
            set p = ##class(data.product).%New()
        }
        
        set p.SKU = pRequest.SKU
        set p.Description = pRequest.Description
        set p.Status = pRequest.Status
        set p.Category = pRequest.Category
        set p.ts = pRequest.ts

        set sc = p.%Save()
        
        $$$LOGINFO("Stored 1 product with SKU: " _ pRequest.SKU)

    }
    Catch ex {
        Set tSC=ex.AsStatus()

        $$$LOGERROR("ERROR:" _ $system.Status.GetErrorText(tSC))
        
    }

	return sc
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.products">
        <Method>store</Method>
    </MapItem>
     <MapItem MessageType="msg.product">
        <Method>storeOne</Method>
    </MapItem>
</MapItems>
}

}
