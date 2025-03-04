Class LORAH.transform.demo Extends Ens.DataTransformDTL [ DependsOn = LORAH.demo.patient.Record ]
{

/// DTL Definition.
XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform targetClass='LORAH.demo.patient.Record' targetDocType='' sourceClass='LORAH.demo.patient.Record' sourceDocType='' create='new' language='objectscript'>
</transform>
}

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

}
