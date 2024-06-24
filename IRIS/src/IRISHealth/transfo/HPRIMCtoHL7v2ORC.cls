Class IRISHealth.transfo.HPRIMCtoHL7v2ORC Extends Ens.DataTransformDTL [ DependsOn = (HPRIM.EDI.E1238.Segment, EnsLib.HL7.Segment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HPRIM.EDI.E1238.Segment' targetClass='EnsLib.HL7.Segment' sourceDocType='HPRIM2.2Add:C' targetDocType='2.5.1:ORC' create='new' language='objectscript' >
<assign value='source.{SequenceNumber}' property='target.{PlacerOrderNumber}' action='set' />
<assign value='source.{CommentSource}' property='target.{Parent}' action='set' />
<assign value='source.{CommentType}' property='target.{OrderStatus}' action='set' />
</transform>
}

}
