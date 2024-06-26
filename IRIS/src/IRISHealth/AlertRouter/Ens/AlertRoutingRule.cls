/// 
Class IRISHealth.AlertRouter.Ens.AlertRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="IRISHealth.production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="planning astreintes">
<constraint name="msgClass" value="Ens.AlertRequest"></constraint>
<when condition="Document.AlertText[&quot;error&quot;" comment="">
<send transform="" target=",planningastreintes"></send>
</when>
</rule>
<rule name="NO FIRST NAME" disabled="false">
<constraint name="source" value="validate"></constraint>
<when condition="1" comment="">
<send transform="" target=",planningastreintes"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
