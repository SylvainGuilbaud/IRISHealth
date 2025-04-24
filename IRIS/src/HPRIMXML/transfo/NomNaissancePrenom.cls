Class HPRIMXML.transfo.NomNaissancePrenom Extends Ens.DataTransformDTL [ DependsOn = EnsLib.EDI.XML.Document ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.EDI.XML.Document' targetClass='EnsLib.EDI.XML.Document' sourceDocType='msgAcquittementsServeurActes2_4:evenementsServeurActes' targetDocType='msgAcquittementsServeurActes2_4:evenementsServeurActes' create='copy' language='objectscript' >
</transform>
}

}
