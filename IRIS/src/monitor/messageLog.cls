Class monitor.messageLog Extends Ens.BusinessOperation
{

// Parameter ADAPTER = "";

Method log(pRequest As Ens.AlertRequest, Output pResponse As %Persistent) As %Status
{
    set sc=$$$OK

    $$$TRACE("ALERT TEXT:" _ pRequest.AlertText)

    set sc = ##class(%SYS.System).WriteToConsoleLog(pRequest.AlertText,1)
    
	return sc
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="Ens.AlertRequest">
        <Method>log</Method>
    </MapItem>
</MapItems>
}

}
