Class SDC.Request.SetAlertStateRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.SetAlertStateResponse";

Property Extension As SDC.ns.ExtensionType;

Property OperationHandleRef As SDC.ns1.HandleRef;

Property ProposedAlertState As SDC.ns1.AbstractAlertState;

Storage Default
{
<Data name="SetAlertStateRequestDefaultData">
<Subscript>"SetAlertStateRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>OperationHandleRef</Value>
</Value>
<Value name="3">
<Value>ProposedAlertState</Value>
</Value>
</Data>
<DefaultData>SetAlertStateRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
