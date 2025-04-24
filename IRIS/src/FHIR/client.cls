Class FHIR.client Extends Ens.BusinessOperation
{

Property FHIREndpoint As %String [ InitialExpression = "/irisapp/fhir/r4" ];

Parameter SETTINGS = "FHIREndpoint:FHIR";

Method get(pRequest As FHIR.request, Output pResponse As FHIR.response) As %Library.Status
{
    try{
	
		set sc = $$$OK
								
		set pResponse = ##class(FHIR.response).%New()
  
        set FHIRInstance = ##class(HS.FHIRServer.RestClient.FHIRService).CreateInstance(..FHIREndpoint)

        set FHIRRequest = FHIRInstance.MakeRequest("GET",,pRequest.RequestPath,pRequest.QueryString)

        set FHIRResponse = FHIRInstance.InvokeRequest(FHIRRequest)

        set pResponse.json = FHIRResponse.Json

        $$$TRACE("FHIR Response: " _ FHIRResponse.Json.%ToJSON())


	} catch exp{
		set sc = exp.AsStatus()
	}
	
 return sc
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="FHIR.request">
        <Method>get</Method>
    </MapItem>
</MapItems>
}

}
