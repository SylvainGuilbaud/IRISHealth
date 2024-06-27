Class SDC.Request.GetContextStatesRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.GetContextStatesResponse";

Property Extension As SDC.ns.ExtensionType;

Property HandleRef As list Of SDC.ns1.HandleRef;

Storage Default
{
<Data name="GetContextStatesRequestDefaultData">
<Subscript>"GetContextStatesRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>HandleRef</Value>
</Value>
</Data>
<DefaultData>GetContextStatesRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
