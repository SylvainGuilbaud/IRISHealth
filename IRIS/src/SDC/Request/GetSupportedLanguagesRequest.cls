Class SDC.Request.GetSupportedLanguagesRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.GetSupportedLanguagesResponse";

Property Extension As SDC.ns.ExtensionType;

Storage Default
{
<Data name="GetSupportedLanguagesRequestDefaultData">
<Subscript>"GetSupportedLanguagesRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
</Data>
<DefaultData>GetSupportedLanguagesRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
