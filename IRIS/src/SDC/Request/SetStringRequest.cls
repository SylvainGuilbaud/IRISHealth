Class SDC.Request.SetStringRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.SetStringResponse";

Property Extension As SDC.ns.ExtensionType;

Property OperationHandleRef As SDC.ns1.HandleRef;

Property RequestedStringValue As %String;

Storage Default
{
<Data name="SetStringRequestDefaultData">
<Subscript>"SetStringRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>OperationHandleRef</Value>
</Value>
<Value name="3">
<Value>RequestedStringValue</Value>
</Value>
</Data>
<DefaultData>SetStringRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
