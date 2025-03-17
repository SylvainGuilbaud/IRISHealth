Class IRISHealth.transfo.MDMtoPDF Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, IRISHealth.msg.pdf) ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='IRISHealth.msg.pdf' sourceDocType='2.5:MDM_T02' create='new' language='objectscript' >
<assign value='source.{OBXgrp(1).OBX:ObservationIdentifier.Identifier} _ "___" _ $tr($zdt($h,3)," :","__")' property='target.name' action='set' />
<code>
<![CDATA[  set doc = ##class(%Stream.TmpBinary).%New()
  do source.GetFieldStreamBase64(.doc,"OBXgrp(1).OBX:5.1")
]]></code>
<assign value='doc' property='target.doc' action='set' />
<code disabled='1' >
<![CDATA[ set doc = ##class(%Stream.TmpBinary).%New()
 set doc2 = ##class(%Stream.TmpBinary).%New()
 
 do source.GetFieldStreamBase64(.doc,"OBXgrp(1).OBX:5.1")
 //do doc.Write(source.GetValueAt("OBXgrp(1).OBX:5.1"))
 do doc.Rewind()
 set ^sgTRACE($i(^sgTRACE))=doc.SizeGet()
 While 'doc.AtEnd {
  set line=doc.ReadLine()
  set lineDecoded=$system.Encryption.Base64Decode(line)
  do doc2.Write(lineDecoded)
 }
 do doc2.Rewind()
 do target.doc.CopyFrom(doc2)
 ]]></code>
<code>
<![CDATA[ set ^sgTRACE($INCREMENT(^sgTRACE))=$lb($zdt($h,3),"size target.doc:" _ target.doc.SizeGet())
 //set ^sgTRACE($INCREMENT(^sgTRACE))=$lb($zdt($h,3),"size target.doc:" _ target.doc.Read())]]></code>
</transform>
}

}
