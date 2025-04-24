Class HTTP.FHIR.wget Extends EnsLib.REST.Operation
{

Parameter INVOCATION = "Queue";

/// Content-Type = "application/json"
Property ContentType As %String [ InitialExpression = "application/json+fhir", Required ];

Property DeleteTempFile As %Boolean [ InitialExpression = 1, Required ];

Parameter SETTINGS = "ContentType:FHIR,DeleteTempFile:FHIR";

Method get(pRequest As HTTP.FHIR.request, Output pResponse As HTTP.FHIR.response) As %Library.Status
{
    try{
	
		set sc = $$$OK
								
		set pResponse = ##class(HTTP.FHIR.response).%New()

        set URL="http://" _ ..Adapter.HTTPServer _ ":" _ ..Adapter.HTTPPort _ "/" _ ..Adapter.URL _ pRequest.URL
        
        set command="wget"

        set args(1)="-O"
        set args(2)="/data/"_$REPLACE(pRequest.URL,"/","_")_".json"
        set args(3)=URL

        set status = $zf(-100,"",command,.args)

        $$$TRACE("wget status: "_status)

        Set file=##class(%File).%New(args(2))
        If file.Open("RS") {
            While 'file.AtEnd {
                Set pResponse.json = pResponse.json _ file.Read()
            }
            Do file.Close()
        } Else {
            $$$LOGERROR("Impossible d'ouvrir le fichier " _ args(2))
        }

        do:..DeleteTempFile ##class(%File).Delete(args(2))


	} catch exp{
		set sc = exp.AsStatus()
	}
	
 return sc
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="HTTP.FHIR.request">
        <Method>get</Method>
    </MapItem>
</MapItems>
}

}
