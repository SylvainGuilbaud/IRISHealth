Class SDC.Request.GetMdStateRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.GetMdStateResponse";

Property Extension As SDC.ns.ExtensionType;

Property HandleRef As list Of SDC.ns1.HandleRef;

Storage Default
{
<Data name="GetMdStateRequestDefaultData">
<Subscript>"GetMdStateRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>HandleRef</Value>
</Value>
</Data>
<DefaultData>GetMdStateRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
