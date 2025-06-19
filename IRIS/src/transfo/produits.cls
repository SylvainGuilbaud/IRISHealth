Class transfo.produits Extends Ens.DataTransformDTL [ DependsOn = (RecordMap.produit.Batch, msg.products) ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='RecordMap.produit.Batch' targetClass='msg.products' create='new' language='objectscript' >
<foreach property='source.Records()' key='k1' >
<subtransform class='transfo.produit' targetObj='target.products.(k1)' sourceObj='source.Records.(k1)' />
</foreach>
</transform>
}

}
