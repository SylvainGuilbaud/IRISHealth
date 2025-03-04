/// 
Class LORAH.HL7router.rules Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="LORAH.production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="HL7v2 to SDA" disabled="false">
<constraint name="source" value="source HL7 FILE"></constraint>
<when condition="1" comment="">
<send transform="" target=",HL7v2toSDA"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
