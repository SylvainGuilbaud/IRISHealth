/// 
Class RecordMap.routeur Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="IRISHealth.production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<constraint name="source" value="source produits"></constraint>
<when condition="1" comment="">
<send transform="transfo.produits" target="target products"></send>
</when>
</rule>
<rule name="" disabled="false">
<constraint name="source" value="source produit"></constraint>
<when condition="1" comment="">
<send transform="transfo.produit" target="target products"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
