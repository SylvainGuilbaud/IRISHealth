Class IRISHealth.operations.PDF Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Method writeFile(pRequest As IRISHealth.msg.pdf, Output pResponse As %Persistent) As %Status
{
    set sc=$$$OK

    $$$TRACE("PDF size:" _ pRequest.doc.SizeGet())

	Quit:'$IsObject(pRequest.doc) $$$ERROR($$$EnsErrGeneral,"No Stream contained in request")

    do pRequest.doc.Rewind()
	set tFilename=..Adapter.CreateFilename(pRequest.name) _ ".pdf"
	set sc=..Adapter.PutStream(tFilename, pRequest.doc)
	do pRequest.%Save() ; re-save in case PutStream() optimization changed the Stream filename
	return sc
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="IRISHealth.msg.pdf">
        <Method>writeFile</Method>
    </MapItem>
</MapItems>
}

}
