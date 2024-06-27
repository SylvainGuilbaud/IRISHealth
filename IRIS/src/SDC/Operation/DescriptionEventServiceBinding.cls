Class SDC.Operation.DescriptionEventServiceBinding Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method DescriptionModificationReport(pRequest As SDC.Request.DescriptionModificationReportRequest, Output pResponse As SDC.Response.DescriptionModificationReportResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.DescriptionEventServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("DescriptionModificationReport",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.ReportPart)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ReportPart = $get(ReportPart)
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="SDC.Request.DescriptionModificationReportRequest">
		<Method>DescriptionModificationReport</Method>
	</MapItem>
</MapItems>
}

}
