Class IRISHealth.transfo.HL7v2ADTcheckFirstName Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.8.2:ADT_A01' targetDocType='2.8.2:ADT_A01' create='new' language='objectscript' >
<if condition='source.{MSH:Security}=&apos;&apos;' >
<true>
<if condition='$ISOBJECT(aux.security)' >
<true>
<assign value='aux.security' property='target.{MSH:Security}' action='set' />
</true>
<false>
<assign value='"undefined"' property='target.{MSH:Security}' action='set' />
</false>
</if>
</true>
</if>
</transform>
}

}
