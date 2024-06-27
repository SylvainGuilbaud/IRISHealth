Class SDC.Operation.GetServiceBinding Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method GetMdDescription(pRequest As SDC.Request.GetMdDescriptionRequest, Output pResponse As SDC.Response.GetMdDescriptionResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.GetServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("GetMdDescription",,.Extension,pRequest.HandleRef,.MdibVersion,.SequenceId,.InstanceId,.MdDescription)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.MdDescription = $get(MdDescription)
 Quit $$$OK
}

Method GetMdState(pRequest As SDC.Request.GetMdStateRequest, Output pResponse As SDC.Response.GetMdStateResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.GetServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("GetMdState",,.Extension,pRequest.HandleRef,.MdibVersion,.SequenceId,.InstanceId,.MdState)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.MdState = $get(MdState)
 Quit $$$OK
}

Method GetMdib(pRequest As SDC.Request.GetMdibRequest, Output pResponse As SDC.Response.GetMdibResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.GetServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("GetMdib",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.Mdib)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.Mdib = $get(Mdib)
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="SDC.Request.GetMdDescriptionRequest">
		<Method>GetMdDescription</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.GetMdStateRequest">
		<Method>GetMdState</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.GetMdibRequest">
		<Method>GetMdib</Method>
	</MapItem>
</MapItems>
}

}
