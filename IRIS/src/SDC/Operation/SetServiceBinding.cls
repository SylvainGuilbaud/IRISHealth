Class SDC.Operation.SetServiceBinding Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method Activate(pRequest As SDC.Request.ActivateRequest, Output pResponse As SDC.Response.ActivateResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.SetServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("Activate",,.Extension,pRequest.OperationHandleRef,pRequest.Argument,.InvocationInfo,.MdibVersion,.SequenceId,.InstanceId)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.InvocationInfo = $get(InvocationInfo),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId)
 Quit $$$OK
}

Method OperationInvokedReport(pRequest As SDC.Request.OperationInvokedReportRequest, Output pResponse As SDC.Response.OperationInvokedReportResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.SetServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("OperationInvokedReport",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.ReportPart)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ReportPart = $get(ReportPart)
 Quit $$$OK
}

Method SetAlertState(pRequest As SDC.Request.SetAlertStateRequest, Output pResponse As SDC.Response.SetAlertStateResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.SetServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("SetAlertState",,.Extension,pRequest.OperationHandleRef,pRequest.ProposedAlertState,.InvocationInfo,.MdibVersion,.SequenceId,.InstanceId)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.InvocationInfo = $get(InvocationInfo),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId)
 Quit $$$OK
}

Method SetComponentState(pRequest As SDC.Request.SetComponentStateRequest, Output pResponse As SDC.Response.SetComponentStateResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.SetServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("SetComponentState",,.Extension,pRequest.OperationHandleRef,pRequest.ProposedComponentState,.InvocationInfo,.MdibVersion,.SequenceId,.InstanceId)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.InvocationInfo = $get(InvocationInfo),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId)
 Quit $$$OK
}

Method SetMetricState(pRequest As SDC.Request.SetMetricStateRequest, Output pResponse As SDC.Response.SetMetricStateResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.SetServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("SetMetricState",,.Extension,pRequest.OperationHandleRef,pRequest.ProposedMetricState,.InvocationInfo,.MdibVersion,.SequenceId,.InstanceId)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.InvocationInfo = $get(InvocationInfo),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId)
 Quit $$$OK
}

Method SetString(pRequest As SDC.Request.SetStringRequest, Output pResponse As SDC.Response.SetStringResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.SetServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("SetString",,.Extension,pRequest.OperationHandleRef,pRequest.RequestedStringValue,.InvocationInfo,.MdibVersion,.SequenceId,.InstanceId)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.InvocationInfo = $get(InvocationInfo),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId)
 Quit $$$OK
}

Method SetValue(pRequest As SDC.Request.SetValueRequest, Output pResponse As SDC.Response.SetValueResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.SetServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("SetValue",,.Extension,pRequest.OperationHandleRef,pRequest.RequestedNumericValue,.InvocationInfo,.MdibVersion,.SequenceId,.InstanceId)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.InvocationInfo = $get(InvocationInfo),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId)
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="SDC.Request.ActivateRequest">
		<Method>Activate</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.OperationInvokedReportRequest">
		<Method>OperationInvokedReport</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.SetAlertStateRequest">
		<Method>SetAlertState</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.SetComponentStateRequest">
		<Method>SetComponentState</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.SetMetricStateRequest">
		<Method>SetMetricState</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.SetStringRequest">
		<Method>SetString</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.SetValueRequest">
		<Method>SetValue</Method>
	</MapItem>
</MapItems>
}

}
