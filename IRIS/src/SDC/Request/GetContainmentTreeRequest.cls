Class SDC.Request.GetContainmentTreeRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.GetContainmentTreeResponse";

Property Extension As SDC.ns.ExtensionType;

Property HandleRef As list Of SDC.ns1.HandleRef;

Storage Default
{
<Data name="GetContainmentTreeRequestDefaultData">
<Subscript>"GetContainmentTreeRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>HandleRef</Value>
</Value>
</Data>
<DefaultData>GetContainmentTreeRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
