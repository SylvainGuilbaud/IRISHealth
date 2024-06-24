Class IRISHealth.transfo.HPRIMtoHLVv2 Extends Ens.DataTransformDTL [ DependsOn = (HPRIM.EDI.E1238.Document, EnsLib.HL7.Message) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HPRIM.EDI.E1238.Document' targetClass='EnsLib.HL7.Message' sourceDocType='HPRIM2.2Add:P' targetDocType='2.5.1:ORU_R01' create='new' language='objectscript' >
<subtransform class='IRISHealth.transfo.HPRIMHtoHL7v2MSH' targetObj='target.{MSH}' sourceObj='source.{H}' />
<assign value='source.{A():AddendumContinuationPointer}' property='target.{MSH:ContinuationPointer}' action='set' />
<assign value='source.{Cgrp().C:SequenceNumber}' property='target.{MSH:SequenceNumber}' action='set' />
<foreach property='source.{Pgrp()}' key='k1' >
<subtransform class='IRISHealth.transfo.HPRIMPtoHL7v2PID' targetObj='target.{PIDgrpgrp(k1).PIDgrp.PID}' sourceObj='source.{Pgrp(k1).P}' />
<foreach property='source.{Pgrp(k1).Cgrp()}' key='k2' >
<subtransform class='IRISHealth.transfo.HPRIMCtoHL7v2ORC' targetObj='target.{PIDgrpgrp(k1).ORCgrp(k2)}' sourceObj='source.{Pgrp(k1).Cgrp(k2).C}' />
</foreach>
<foreach property='source.{Pgrp(k1).OBRgrp()}' key='k3' >
<subtransform class='IRISHealth.transfo.HPRIMCtoHL7v2ORC' targetObj='target.{PIDgrpgrp(k1).ORCgrp(k3).ORC}' sourceObj='source.{Pgrp(k1).OBRgrp(k3).Cgrp()}' />
<subtransform class='IRISHealth.transfo.HPRIMOBRtoHL7v2OBR' targetObj='target.{PIDgrpgrp(k1).ORCgrp(k3).OBR}' sourceObj='source.{Pgrp(k1).OBRgrp(k3).OBR}' />
<foreach property='source.{Pgrp(k1).OBRgrp(k3).OBXgrp()}' key='k4' >
<subtransform class='IRISHealth.transfo.HPRIMOBXtoHL7v2OBX' targetObj='target.{PIDgrpgrp(k1).ORCgrp(k3).OBXgrp(k4).OBX}' sourceObj='source.{Pgrp(k1).OBRgrp(k3).OBXgrp(k4).OBX}' />
</foreach>
</foreach>
</foreach>
</transform>
}

}
