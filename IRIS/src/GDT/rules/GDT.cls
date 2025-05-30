/// 
Class GDT.rules.GDT Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="IRISHealth.production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="GDT">
<constraint name="source" value="source GDT"></constraint>
<when condition="1" comment="">
<send transform="" target="target GDT"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
