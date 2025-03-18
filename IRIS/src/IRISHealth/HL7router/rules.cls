/// 
Class IRISHealth.HL7router.rules Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="IRISHealth.production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="HL7v2 to SDA" disabled="false">
<constraint name="source" value="validate"></constraint>
<when condition="1" comment="">
<send transform="" target=",HL7v2toSDA"></send>
</when>
</rule>
<rule name="HL7v2 to SDA" disabled="false">
<constraint name="source" value="source HL7 FILE"></constraint>
<when condition="1" comment="">
<send transform="" target=",HL7v2toSDA"></send>
</when>
</rule>
<rule name="SIU FILE">
<constraint name="docCategory" value="2.5.1"></constraint>
<constraint name="docName" value="SIU_S12,SIU_S13,SIU_S14,SIU_S15,SIU_S16,SIU_S17,SIU_S18,SIU_S19,SIU_S20,SIU_S21,SIU_S22,SIU_S23,SIU_S24,SIU_S26"></constraint>
<constraint name="source" value="source HL7 FILE"></constraint>
<when condition="1" comment="">
<send transform="" target=",target HL7 HTTP,target HL7 TCP"></send>
<send transform="IRISHealth.transfo.SIU" target=",target Kafka Producer"></send>
<return></return>
</when>
</rule>
<rule name="SIU ANY SOURCE" disabled="false">
<constraint name="source" value=""></constraint>
<constraint name="docCategory" value="2.5.1"></constraint>
<constraint name="docName" value="SIU_S12,SIU_S13,SIU_S14,SIU_S15,SIU_S16,SIU_S17,SIU_S18,SIU_S19,SIU_S20,SIU_S21,SIU_S22,SIU_S23,SIU_S24,SIU_S26"></constraint>
<when condition="1" comment="">
<send transform="IRISHealth.transfo.SIU" target=",target Kafka Producer"></send>
<return></return>
</when>
</rule>
<rule name="MDM" disabled="false">
<constraint name="source" value="source PHARMA FILE"></constraint>
<constraint name="docCategory" value="2.5"></constraint>
<constraint name="docName" value="MDM_T01,MDM_T02,MDM_T03,MDM_T04,MDM_T05,MDM_T06,MDM_T07,MDM_T08,MDM_T09,MDM_T10,MDM_T11"></constraint>
<when condition="(Length(HL7.{OBXgrp(1).OBX:5.1}))&gt;100" comment="">
<send transform="IRISHealth.transfo.MDMtoPDF" target="target CR PHARMA FILE"></send>
<trace value="&quot;Document:&quot;_HL7.{OBXgrp(1).OBX:5.1}"></trace>
</when>
<otherwise>
<trace value="&quot;Document missing:&quot;_HL7.{OBXgrp(1).OBX:5.1}"></trace>
</otherwise>
</rule>
</ruleSet>
</ruleDefinition>
}

}
