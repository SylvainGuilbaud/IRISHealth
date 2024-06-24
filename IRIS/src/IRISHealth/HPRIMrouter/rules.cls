/// 
Class IRISHealth.HPRIMrouter.rules Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="IRISHealth.production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="HPRIM TCP" disabled="false">
<constraint name="source" value="source HPRIM FILE"></constraint>
<when condition="1" comment="">
<send transform="HPRIM.transfo.H.Upper" target=",target HPRIM FTP,HPRIMtoHL7v2"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
