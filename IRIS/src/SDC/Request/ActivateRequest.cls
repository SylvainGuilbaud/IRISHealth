Class SDC.Request.ActivateRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.ActivateResponse";

Property Extension As SDC.ns.ExtensionType;

Property OperationHandleRef As SDC.ns1.HandleRef;

Property Argument As list Of SDC.msg.Argument;

Storage Default
{
<Data name="ActivateRequestDefaultData">
<Subscript>"ActivateRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>OperationHandleRef</Value>
</Value>
<Value name="3">
<Value>Argument</Value>
</Value>
</Data>
<DefaultData>ActivateRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
