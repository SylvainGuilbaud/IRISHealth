Class SDC.Request.SetValueRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.SetValueResponse";

Property Extension As SDC.ns.ExtensionType;

Property OperationHandleRef As SDC.ns1.HandleRef;

Property RequestedNumericValue As %Numeric;

Storage Default
{
<Data name="SetValueRequestDefaultData">
<Subscript>"SetValueRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>OperationHandleRef</Value>
</Value>
<Value name="3">
<Value>RequestedNumericValue</Value>
</Value>
</Data>
<DefaultData>SetValueRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
