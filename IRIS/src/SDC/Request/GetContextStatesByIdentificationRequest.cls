Class SDC.Request.GetContextStatesByIdentificationRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.GetContextStatesByIdentificationResponse";

Property Extension As SDC.ns.ExtensionType;

Property Identification As list Of SDC.ns1.InstanceIdentifier;

Property ContextType As %String;

Storage Default
{
<Data name="GetContextStatesByIdentificationRequestDefaultData">
<Subscript>"GetContextStatesByIdentificationRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Identification</Value>
</Value>
<Value name="3">
<Value>ContextType</Value>
</Value>
</Data>
<DefaultData>GetContextStatesByIdentificationRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
