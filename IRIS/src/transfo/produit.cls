Class transfo.produit Extends Ens.DataTransformDTL [ DependsOn = (RecordMap.produit.Record, msg.product) ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='RecordMap.produit.Record' targetClass='msg.product' create='new' language='objectscript' >
<assign value='source.SKU' property='target.SKU' action='set' />
<assign value='source.Description' property='target.Description' action='set' />
<assign value='source.Categorie' property='target.Category' action='set' />
<assign value='source.Statut' property='target.Status' action='set' />
</transform>
}

}
