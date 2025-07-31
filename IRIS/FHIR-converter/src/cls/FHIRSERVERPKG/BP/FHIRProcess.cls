Class FHIRSERVERPKG.BP.FHIRProcess Extends Ens.BusinessProcess
{

Method OnRequest(
	request As HS.FHIRServer.Interop.Request,
	Output response As HS.FHIRServer.Interop.Response) As %Status
{
    Set tSC = $$$OK
    
    set requestOscar = request.%ConstructClone(1)

    // copy the quickstream otherwise it will be deleted
    if request.QuickStreamId '= "" {
        set quickStreamId = request.QuickStreamId

        // Make a copy of this quickstream
        set quickStream = ##class(HS.SDA3.QuickStream).%OpenId(quickStreamId)
        set quickStreamOscar = ##class(HS.SDA3.QuickStream).%New()
        // copy the quickstream
        $$$ThrowOnError(quickStreamOscar.CopyFromAndSave(quickStream))
        // set the quickstream to the request
        set requestOscar.QuickStreamId = quickStreamOscar.Id
    }

    set request.Request.SessionApplication = "/lorah"

    // send it to the FHIRServer
    Set tSC = ..SendRequestSync("HS.FHIRServer.Interop.Operation",request, .response)

    set whatever = 1

    if whatever {
        Do ..SendRequestAsync("HS.FHIRServer.Interop.HTTPOperation",requestOscar)
    }

    // send async
    Quit tSC
}

Method OnResponse(
	request As HS.FHIRServer.Interop.Request,
	response As HS.FHIRServer.Interop.Response) As %Status
{
    Quit $$$OK
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
