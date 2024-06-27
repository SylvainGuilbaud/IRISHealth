Class SDC.Operation.LocalizationServiceBinding Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method GetLocalizedText(pRequest As SDC.Request.GetLocalizedTextRequest, Output pResponse As SDC.Response.GetLocalizedTextResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.LocalizationServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("GetLocalizedText",,.Extension,pRequest.Ref,pRequest.Version,pRequest.Lang,pRequest.TextWidth,pRequest.NumberOfLines,.MdibVersion,.SequenceId,.InstanceId,.Text)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.Text = $get(Text)
 Quit $$$OK
}

Method GetSupportedLanguages(pRequest As SDC.Request.GetSupportedLanguagesRequest, Output pResponse As SDC.Response.GetSupportedLanguagesResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.LocalizationServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("GetSupportedLanguages",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.Lang)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.Lang = $get(Lang)
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="SDC.Request.GetLocalizedTextRequest">
		<Method>GetLocalizedText</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.GetSupportedLanguagesRequest">
		<Method>GetSupportedLanguages</Method>
	</MapItem>
</MapItems>
}

}
