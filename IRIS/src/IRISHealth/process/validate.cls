/// 
Class IRISHealth.process.validate Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' response='EnsLib.HL7.Message' height='2000' width='2000' layout='manual' >
<context>
<property name='genderRequest' type='HTTP.msg.genderRequest' instantiate='0' />
<property name='genderResponse' type='HTTP.msg.genderResponse' instantiate='0' />
<property name='genderStored' type='IRISHealth.msg.iris' instantiate='0' />
<property name='HL7Msg' type='EnsLib.HL7.Message' instantiate='0' />
<property name='HTTPError' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='2500' />
</parameters>
</property>
<property name='workflowResponse' type='EnsLib.Workflow.TaskResponse' instantiate='0' />
</context>
<sequence xpos='200' ypos='150' xend='200' yend='1750' >
<assign name="init response" property="response" value="request" action="set" languageOverride="" xpos='200' ypos='250' />
<transform name='get FirstName' class='IRISHealth.transfo.getFirstName' source='request' target='context.genderRequest' xpos='200' ypos='350' >
<annotation><![CDATA[retrieve firstname in HL7 PID]]></annotation>
</transform>
<trace name='first name' value='context.genderRequest.firstName' xpos='200' ypos='450' />
<scope xpos='200' ypos='550' xend='200' yend='900' >
<call name='check gender' target='get gender' async='0' xpos='200' ypos='650' >
<request type='HTTP.msg.genderRequest' >
<assign property="callrequest" value="context.genderRequest" action="set" languageOverride="" />
</request>
<response type='HTTP.msg.genderResponse' >
<assign property="context.genderResponse" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<faulthandlers>
<catchall xpos='200' ypos='750' xend='200' yend='1300' >
<trace name='LastError' value='"%LastError "_$System.Status.GetErrorCodes(..%Context.%LastError)_" : "_$System.Status.GetOneStatusText(..%Context.%LastError)' xpos='200' ypos='250' />
<assign name="HTTP Error" property="context.HTTPError" value="$System.Status.GetOneStatusText(..%Context.%LastError)" action="set" languageOverride="" xpos='200' ypos='350' />
<switch name='HTTP Errors' xpos='200' ypos='450' xend='200' yend='1200' >
<case condition='context.HTTPError[429' name='HTTP/1.1 429 Too Many Requests' >
<trace name='Too Many Requests' value='"HTTP/1.1 429 Too Many Requests"' xpos='470' ypos='600' />
<call name='retrieve gender' target='retrieve gender' async='0' xpos='470' ypos='700' >
<request type='HTTP.msg.genderRequest' >
<assign property="callrequest" value="context.genderRequest" action="set" languageOverride="" />
</request>
<response type='Ens.StringResponse' >
<assign property="context.genderResponse.gender" value="callresponse.StringValue" action="set" languageOverride="" />
</response>
</call>
<transform name='set gender' class='IRISHealth.transfo.setGender' source='request' target='context.HL7Msg' xpos='470' ypos='800' />
<assign name="response" property="response" value="context.HL7Msg" action="set" languageOverride="" xpos='470' ypos='900' />
</case>
<case condition='context.HTTPError[404' name='HTTP/1.1 404 Not Found' >
<trace name='Not Found' value='"HTTP/1.1 404 Not Found"' xpos='740' ypos='600' />
<call name='cellule identito-vigilance' target='cellule identito-vigilance' async='1' xpos='740' ypos='700' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="&quot;male,female&quot;" action="set" languageOverride="" />
<assign property="callrequest.%Subject" value="&quot;valider genre de &quot;_context.genderRequest.firstName" action="set" languageOverride="" />
<assign property="callrequest.%UserName" value="&quot;Virgile&quot;" action="set" languageOverride="" />
</request>
<response type='EnsLib.Workflow.TaskResponse' >
<assign property="context.workflowResponse" value="callresponse" action="set" languageOverride="" />
<assign property="context.genderResponse.gender" value="callresponse.%Action" action="set" languageOverride="" />
</response>
</call>
<sync name='cellule identito-vigilance' calls='cellule identito-vigilance' type='all' xpos='740' ypos='800' />
<call name='enregistre gender' target='store gender' async='0' xpos='740' ypos='900' >
<request type='IRISHealth.msg.gender' >
<assign property="callrequest.firstname" value="context.genderRequest.firstName" action="set" languageOverride="" />
<assign property="callrequest.value" value="context.genderResponse.gender" action="set" languageOverride="" />
</request>
<response type='IRISHealth.msg.iris' >
<assign property="context.genderStored" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<transform name='set gender' class='IRISHealth.transfo.setGender' source='request' target='context.HL7Msg' xpos='740' ypos='1000' />
<assign name="response" property="response" value="context.HL7Msg" action="set" languageOverride="" xpos='740' ypos='1100' />
</case>
<default name='default' >
<trace name='Other' value='context.HTTPError' xpos='200' ypos='600' />
</default>
</switch>
</catchall>
</faulthandlers>
</scope>
<trace name='gender' value='context.genderResponse.gender' xpos='200' ypos='1000' />
<if name='high probability' condition='context.genderResponse.probability&gt;0.9' xpos='200' ypos='1100' xend='200' yend='1550' >
<true>
<trace name='high probability' value='"high probability"' xpos='665' ypos='1251' >
<annotation><![CDATA[store results in database]]></annotation>
</trace>
<call name='store gender' target='store gender' async='0' xpos='665' ypos='1353' >
<request type='IRISHealth.msg.gender' >
<assign property="callrequest.firstname" value="context.genderRequest.firstName" action="set" languageOverride="" />
<assign property="callrequest.value" value="context.genderResponse.gender" action="set" languageOverride="" />
</request>
<response type='IRISHealth.msg.iris' >
<assign property="context.genderStored" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<transform name='set gender' class='IRISHealth.transfo.setGender' source='request' target='context.HL7Msg' xpos='665' ypos='1459' >
<annotation><![CDATA[overwrite the gender in HL7 PID ]]></annotation>
</transform>
</true>
<false>
<trace name='low probability' value='"low probability"' xpos='200' ypos='1250' >
<annotation><![CDATA[nothing to do]]></annotation>
</trace>
</false>
</if>
<call name='SIU Router' target='HL7 SIU router' async='1' xpos='200' ypos='1650' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.HL7Msg" action="set" languageOverride="" />
</request>
<response type='Ens.Response' />
</call>
</sequence>
</process>
}

}
