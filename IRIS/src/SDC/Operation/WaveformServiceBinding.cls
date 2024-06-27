Class SDC.Operation.WaveformServiceBinding Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method ObservedValueStream(pRequest As SDC.Request.ObservedValueStreamRequest, Output pResponse As SDC.Response.ObservedValueStreamResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.WaveformServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("ObservedValueStream",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.Value)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.Value = $get(Value)
 Quit $$$OK
}

Method WaveformStream(pRequest As SDC.Request.WaveformStreamRequest, Output pResponse As SDC.Response.WaveformStreamResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "SDC.WaveformServiceBinding"
 Set tSC = ..Adapter.InvokeMethod("WaveformStream",,.Extension,.MdibVersion,.SequenceId,.InstanceId,.State)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.Extension = $get(Extension),pResponse.MdibVersion = $get(MdibVersion),pResponse.SequenceId = $get(SequenceId),pResponse.InstanceId = $get(InstanceId),pResponse.State = $get(State)
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="SDC.Request.ObservedValueStreamRequest">
		<Method>ObservedValueStream</Method>
	</MapItem>
	<MapItem MessageType="SDC.Request.WaveformStreamRequest">
		<Method>WaveformStream</Method>
	</MapItem>
</MapItems>
}

}
