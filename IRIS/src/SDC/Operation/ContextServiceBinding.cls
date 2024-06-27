Class SDC.Operation.ContextServiceBinding Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method EpisodicContextReport(pRequest As SDC.Request.EpisodicContextReportRequest, Output pResponse As SDC.Response.EpisodicContextReportResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.ContextServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("EpisodicContextReport",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.ReportPart)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ReportPart = $get(ReportPart)
 Quit $$$OK
}

Method GetContextStates(pRequest As SDC.Request.GetContextStatesRequest, Output pResponse As SDC.Response.GetContextStatesResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.ContextServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("GetContextStates",,.Extension,pRequest.HandleRef,.MdibVersion,.SequenceId,.InstanceId,.ContextState)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ContextState = $get(ContextState)
 Quit $$$OK
}

Method GetContextStatesByFilter(pRequest As SDC.Request.GetContextStatesByFilterRequest, Output pResponse As SDC.Response.GetContextStatesByFilterResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.ContextServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("GetContextStatesByFilter",,.Extension,pRequest.Filter,pRequest.ContextType,.MdibVersion,.SequenceId,.InstanceId,.ContextState)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ContextState = $get(ContextState)
 Quit $$$OK
}

Method GetContextStatesByIdentification(pRequest As SDC.Request.GetContextStatesByIdentificationRequest, Output pResponse As SDC.Response.GetContextStatesByIdentificationResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.ContextServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("GetContextStatesByIdentification",,.Extension,pRequest.Identification,pRequest.ContextType,.MdibVersion,.SequenceId,.InstanceId,.ContextState)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ContextState = $get(ContextState)
 Quit $$$OK
}

Method PeriodicContextReport(pRequest As SDC.Request.PeriodicContextReportRequest, Output pResponse As SDC.Response.PeriodicContextReportResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.ContextServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("PeriodicContextReport",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.ReportPart)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ReportPart = $get(ReportPart)
 Quit $$$OK
}

Method SetContextState(pRequest As SDC.Request.SetContextStateRequest, Output pResponse As SDC.Response.SetContextStateResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.ContextServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("SetContextState",,.Extension,pRequest.OperationHandleRef,pRequest.ProposedContextState,.InvocationInfo,.MdibVersion,.SequenceId,.InstanceId)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.InvocationInfo = $get(InvocationInfo),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId)
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="SDC.Request.EpisodicContextReportRequest">
		<Method>EpisodicContextReport</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.GetContextStatesRequest">
		<Method>GetContextStates</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.GetContextStatesByFilterRequest">
		<Method>GetContextStatesByFilter</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.GetContextStatesByIdentificationRequest">
		<Method>GetContextStatesByIdentification</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.PeriodicContextReportRequest">
		<Method>PeriodicContextReport</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.SetContextStateRequest">
		<Method>SetContextState</Method>
	</MapItem>
</MapItems>
}

}
