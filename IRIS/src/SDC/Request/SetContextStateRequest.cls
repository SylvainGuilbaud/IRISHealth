Class SDC.Request.SetContextStateRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.SetContextStateResponse";

Property Extension As SDC.ns.ExtensionType;

Property OperationHandleRef As SDC.ns1.HandleRef;

Property ProposedContextState As list Of SDC.ns1.AbstractContextState;

Storage Default
{
<Data name="SetContextStateRequestDefaultData">
<Subscript>"SetContextStateRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>OperationHandleRef</Value>
</Value>
<Value name="3">
<Value>ProposedContextState</Value>
</Value>
</Data>
<DefaultData>SetContextStateRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
