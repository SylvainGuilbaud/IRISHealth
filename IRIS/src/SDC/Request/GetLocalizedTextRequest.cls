Class SDC.Request.GetLocalizedTextRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.GetLocalizedTextResponse";

Property Extension As SDC.ns.ExtensionType;

Property Ref As list Of SDC.ns1.LocalizedTextRef;

Property Version As SDC.ns1.ReferencedVersion;

Property Lang As list Of %String;

Property TextWidth As list Of SDC.ns1.LocalizedTextWidth;

Property NumberOfLines As list Of %Integer;

Storage Default
{
<Data name="GetLocalizedTextRequestDefaultData">
<Subscript>"GetLocalizedTextRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Ref</Value>
</Value>
<Value name="3">
<Value>Version</Value>
</Value>
<Value name="4">
<Value>Lang</Value>
</Value>
<Value name="5">
<Value>TextWidth</Value>
</Value>
<Value name="6">
<Value>NumberOfLines</Value>
</Value>
</Data>
<DefaultData>GetLocalizedTextRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
