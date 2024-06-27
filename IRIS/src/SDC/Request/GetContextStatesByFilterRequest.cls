Class SDC.Request.GetContextStatesByFilterRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.GetContextStatesByFilterResponse";

Property Extension As SDC.ns.ExtensionType;

Property Filter As list Of %String;

Property ContextType As %String;

Storage Default
{
<Data name="GetContextStatesByFilterRequestDefaultData">
<Subscript>"GetContextStatesByFilterRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Filter</Value>
</Value>
<Value name="3">
<Value>ContextType</Value>
</Value>
</Data>
<DefaultData>GetContextStatesByFilterRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
