Class SDC.Operation.ArchiveServiceBinding Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method GetDescriptorsFromArchive(pRequest As SDC.Request.GetDescriptorsFromArchiveRequest, Output pResponse As SDC.Response.GetDescriptorsFromArchiveResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.ArchiveServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("GetDescriptorsFromArchive",,.Extension,pRequest.DescriptorRevisions,pRequest.TimeFrame,pRequest.Handle,.MdibVersion,.SequenceId,.InstanceId,.Descriptor)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.Descriptor = $get(Descriptor)
 Quit $$$OK
}

Method GetStatesFromArchive(pRequest As SDC.Request.GetStatesFromArchiveRequest, Output pResponse As SDC.Response.GetStatesFromArchiveResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.ArchiveServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("GetStatesFromArchive",,.Extension,pRequest.DescriptorRevisions,pRequest.TimeFrame,pRequest.Handle,.MdibVersion,.SequenceId,.InstanceId,.Descriptor)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.Descriptor = $get(Descriptor)
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="SDC.Request.GetDescriptorsFromArchiveRequest">
		<Method>GetDescriptorsFromArchive</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.GetStatesFromArchiveRequest">
		<Method>GetStatesFromArchive</Method>
	</MapItem>
</MapItems>
}

}
