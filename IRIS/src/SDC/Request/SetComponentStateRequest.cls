Class SDC.Request.SetComponentStateRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.SetComponentStateResponse";

Property Extension As SDC.ns.ExtensionType;

Property OperationHandleRef As SDC.ns1.HandleRef;

Property ProposedComponentState As list Of SDC.ns1.AbstractDeviceComponentState;

Storage Default
{
<Data name="SetComponentStateRequestDefaultData">
<Subscript>"SetComponentStateRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>OperationHandleRef</Value>
</Value>
<Value name="3">
<Value>ProposedComponentState</Value>
</Value>
</Data>
<DefaultData>SetComponentStateRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
