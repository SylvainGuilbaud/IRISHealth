Class SDC.Operation.ContainmentTreeServiceBinding Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method GetContainmentTree(pRequest As SDC.Request.GetContainmentTreeRequest, Output pResponse As SDC.Response.GetContainmentTreeResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.ContainmentTreeServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("GetContainmentTree",,.Extension,pRequest.HandleRef,.MdibVersion,.SequenceId,.InstanceId,.ContainmentTree)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.ContainmentTree = $get(ContainmentTree)
 Quit $$$OK
}

Method GetDescriptor(pRequest As SDC.Request.GetDescriptorRequest, Output pResponse As SDC.Response.GetDescriptorResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.ContainmentTreeServiceBinding"
 Set Extension=pRequest.Extension
 Set tSC = ..Adapter.InvokeMethod("GetDescriptor",,.Extension,pRequest.HandleRef,.MdibVersion,.SequenceId,.InstanceId,.Descriptor)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.Descriptor = $get(Descriptor)
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="SDC.Request.GetContainmentTreeRequest">
		<Method>GetContainmentTree</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.GetDescriptorRequest">
		<Method>GetDescriptor</Method>
	</MapItem>
</MapItems>
}

}
