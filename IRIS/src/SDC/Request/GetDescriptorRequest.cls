Class SDC.Request.GetDescriptorRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.GetDescriptorResponse";

Property Extension As SDC.ns.ExtensionType;

Property HandleRef As list Of SDC.ns1.HandleRef;

Storage Default
{
<Data name="GetDescriptorRequestDefaultData">
<Subscript>"GetDescriptorRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>HandleRef</Value>
</Value>
</Data>
<DefaultData>GetDescriptorRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
