Class SDC.Request.GetMdDescriptionRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.GetMdDescriptionResponse";

Property Extension As SDC.ns.ExtensionType;

Property HandleRef As list Of SDC.ns1.HandleRef;

Storage Default
{
<Data name="GetMdDescriptionRequestDefaultData">
<Subscript>"GetMdDescriptionRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>HandleRef</Value>
</Value>
</Data>
<DefaultData>GetMdDescriptionRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
