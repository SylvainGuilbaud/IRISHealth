Class SDC.Operation.StateEventServiceBinding Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method EpisodicAlertReport(pRequest As SDC.Request.EpisodicAlertReportRequest, Output pResponse As SDC.Response.EpisodicAlertReportResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.StateEventServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("EpisodicAlertReport",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.ReportPart)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ReportPart = $get(ReportPart)
 Quit $$$OK
}

Method EpisodicComponentReport(pRequest As SDC.Request.EpisodicComponentReportRequest, Output pResponse As SDC.Response.EpisodicComponentReportResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.StateEventServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("EpisodicComponentReport",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.ReportPart)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ReportPart = $get(ReportPart)
 Quit $$$OK
}

Method EpisodicMetricReport(pRequest As SDC.Request.EpisodicMetricReportRequest, Output pResponse As SDC.Response.EpisodicMetricReportResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.StateEventServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("EpisodicMetricReport",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.ReportPart)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ReportPart = $get(ReportPart)
 Quit $$$OK
}

Method EpisodicOperationalStateReport(pRequest As SDC.Request.EpisodicOperationalStateReportRequest, Output pResponse As SDC.Response.EpisodicOperationalStateReportResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.StateEventServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("EpisodicOperationalStateReport",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.ReportPart)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ReportPart = $get(ReportPart)
 Quit $$$OK
}

Method PeriodicAlertReport(pRequest As SDC.Request.PeriodicAlertReportRequest, Output pResponse As SDC.Response.PeriodicAlertReportResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.StateEventServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("PeriodicAlertReport",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.ReportPart)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ReportPart = $get(ReportPart)
 Quit $$$OK
}

Method PeriodicComponentReport(pRequest As SDC.Request.PeriodicComponentReportRequest, Output pResponse As SDC.Response.PeriodicComponentReportResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.StateEventServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("PeriodicComponentReport",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.ReportPart)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ReportPart = $get(ReportPart)
 Quit $$$OK
}

Method PeriodicMetricReport(pRequest As SDC.Request.PeriodicMetricReportRequest, Output pResponse As SDC.Response.PeriodicMetricReportResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.StateEventServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("PeriodicMetricReport",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.ReportPart)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ReportPart = $get(ReportPart)
 Quit $$$OK
}

Method PeriodicOperationalStateReport(pRequest As SDC.Request.PeriodicOperationalStateReportRequest, Output pResponse As SDC.Response.PeriodicOperationalStateReportResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.StateEventServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("PeriodicOperationalStateReport",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.ReportPart)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ReportPart = $get(ReportPart)
 Quit $$$OK
}

Method SystemErrorReport(pRequest As SDC.Request.SystemErrorReportRequest, Output pResponse As SDC.Response.SystemErrorReportResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.StateEventServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("SystemErrorReport",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.ReportPart)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ReportPart = $get(ReportPart)
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="SDC.Request.EpisodicAlertReportRequest">
		<Method>EpisodicAlertReport</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.EpisodicComponentReportRequest">
		<Method>EpisodicComponentReport</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.EpisodicMetricReportRequest">
		<Method>EpisodicMetricReport</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.EpisodicOperationalStateReportRequest">
		<Method>EpisodicOperationalStateReport</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.PeriodicAlertReportRequest">
		<Method>PeriodicAlertReport</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.PeriodicComponentReportRequest">
		<Method>PeriodicComponentReport</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.PeriodicMetricReportRequest">
		<Method>PeriodicMetricReport</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.PeriodicOperationalStateReportRequest">
		<Method>PeriodicOperationalStateReport</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.SystemErrorReportRequest">
		<Method>SystemErrorReport</Method>
	</MapItem>
</MapItems>
}

}
