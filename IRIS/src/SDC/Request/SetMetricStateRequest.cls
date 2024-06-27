Class SDC.Request.SetMetricStateRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.SetMetricStateResponse";

Property Extension As SDC.ns.ExtensionType;

Property OperationHandleRef As SDC.ns1.HandleRef;

Property ProposedMetricState As list Of SDC.ns1.AbstractMetricState;

Storage Default
{
<Data name="SetMetricStateRequestDefaultData">
<Subscript>"SetMetricStateRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>OperationHandleRef</Value>
</Value>
<Value name="3">
<Value>ProposedMetricState</Value>
</Value>
</Data>
<DefaultData>SetMetricStateRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
