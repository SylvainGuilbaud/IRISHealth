Class IRISHealth.transfo.setGenderORM Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.5:ORM_O01' targetDocType='2.5:ORM_O01' create='copy' language='objectscript' >
<assign value='source.{PIDgrp.PID:PatientName().GivenName}' property='firstname' action='set' />
<trace value='"firstname:"_firstname' />
<sql>
<![CDATA[select top 1 value 
into :gender
from data.gender
where firstname = :firstname
order by ts desc]]></sql>
<trace value='"gender:"_gender' />
<assign value='..Lookup("gender",gender)' property='gender' action='set' />
<if condition='gender&apos;=""' >
<true>
<assign value='gender' property='target.{PIDgrp.PID:AdministrativeSex}' action='set' />
</true>
</if>
</transform>
}

}
