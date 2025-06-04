Class IRISHealth.transfo.HL7v2ADTcheckSecurity Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.8.2:ADT_A01' targetDocType='2.8.2:ADT_A01' create='copy' language='objectscript' >
<if condition='source.{MSH:Security}=""' >
<true>
<assign value='aux.RuleUserData' property='target.{MSH:Security}' action='set' />
<if condition='$ISOBJECT(aux.RuleUserData)' disabled='1' >
<true>
<assign value='aux.RuleUserData' property='target.{MSH:Security}' action='set' />
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
