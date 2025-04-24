/// 
Class HPRIMXML.process.FHIRContentAugmentation Extends Ens.BusinessProcessBPL
{

/// Used ti determine if the FHIR Model should be used
/// 1 = use the FHIR Model
/// 0 = do not use the FHIR Model
Property FHIRModel As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "FHIRModel:FHIR";

Storage Default
{
<Data name="FHIRContentAugmentationDefaultData">
<Subscript>"FHIRContentAugmentation"</Subscript>
<Value name="1">
<Value>FHIRModel</Value>
</Value>
</Data>
<DefaultData>FHIRContentAugmentationDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.EDI.XML.Document' height='2400' width='2000' >
<context>
<property name='FHIRRequest' type='FHIR.request' instantiate='0' />
<property name='FHIRResponse' type='FHIR.response' instantiate='0' />
<property name='Patient' type='HS.FHIRModel.R4.Patient' instantiate='0' />
<property name='FHIRdata' type='FHIR.data' instantiate='0' />
<property name='HPRIMXML' type='EnsLib.EDI.XML.Document' instantiate='0' />
<property name='dateNaissance' type='%TimeStamp' instantiate='0' />
</context>
<sequence xend='200' yend='2150' >
<assign name="date naissance" property="context.dateNaissance" value="request.GetValueAt(&quot;choice.evenementServeurActe.patient.personnePhysique.dateNaissance.date&quot;)" action="set" languageOverride="" xpos='200' ypos='250' >
<annotation><![CDATA[récupération de la date de naissance du patient à partir du document HPRIM XML]]></annotation>
</assign>
<trace name='date Naissance' value='"date naissance:"_context.dateNaissance' xpos='200' ypos='350' >
<annotation><![CDATA[TRACE date naissance]]></annotation>
</trace>
<if name='date naissance' condition='context.dateNaissance=""' xpos='200' ypos='450' xend='200' yend='2050' >
<annotation><![CDATA[vérifie l'absence de date de naissance
pour déclencher une recherche FHIR
]]></annotation>
<true>
<assign name="HPRIM XML" property="context.HPRIMXML" value="request.%ConstructClone()" action="set" languageOverride="" xpos='470' ypos='600' >
<annotation><![CDATA[copie du document HPRIM XML
en vu de sa modification
par les données récupérées sur le seveur FHIR
]]></annotation>
</assign>
<transform name='FHIR Request' class='HPRIMXML.transfo.FHIRRequest' source='request' target='context.FHIRRequest' xpos='470' ypos='700' >
<annotation><![CDATA[récupération des identifiant et de l'autorité pour préparer une recherche sur le serveur FHIR]]></annotation>
</transform>
<call name='FHIR Server' target='FHIR GET /irisapp/fhir/r4' async='0' xpos='470' ypos='800' >
<annotation><![CDATA[requête sur le serveur FHIR
de type :
Patient?identifier=http://hospital.smarthealthit.org|925287F4-20A4-11F0-B7B4-EA3B43076670
]]></annotation>
<request type='FHIR.request' >
<assign property="callrequest" value="context.FHIRRequest" action="set" languageOverride="" />
</request>
<response type='FHIR.response' >
<assign property="context.FHIRResponse" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<trace name='FHIR' value='"JSON:"_context.FHIRResponse.json.%ToJSON()' xpos='470' ypos='900' >
<annotation><![CDATA[TRACE du résultat de la requête FHIR]]></annotation>
</trace>
<trace name='FHIR Model' value='"FHIRModel:"_process.FHIRModel' xpos='470' ypos='1000' />
<if name='use FHIRModel ?' condition='process.FHIRModel' xpos='470' ypos='1100' xend='470' yend='1750' >
<annotation><![CDATA[contrôle paramètre utilisation du FHIR Model]]></annotation>
<true>
<assign name="resource Patient" property="context.Patient" value="$CLASSMETHOD(&quot;HS.FHIRModel.R4.Patient&quot;,&quot;fromDao&quot;,context.FHIRResponse.json.entry.%Get(0).resource)" action="set" languageOverride="" xpos='740' ypos='1250' >
<annotation><![CDATA[Instanciation du JSON FHIR dans la ressource Patient du FHIR Model d'IRIS 
(étape facultative) ]]></annotation>
</assign>
<trace name='Patient Name' value='context.Patient.name.list.%Get(0).given.list.%Get(0) _ " " _context.Patient.name.list.%Get(0).family' xpos='740' ypos='1350' >
<annotation><![CDATA[TRACE du prénom et nom à partir de la classe HS.FHIRModel.R4.Patient ]]></annotation>
</trace>
<assign name="firstname" property="context.FHIRdata.firstname" value="context.Patient.name.list.%Get(0).given.list.%Get(0)" action="set" languageOverride="" xpos='740' ypos='1450' >
<annotation><![CDATA[récupération du prénom]]></annotation>
</assign>
<assign name="lastname" property="context.FHIRdata.lastname" value="context.Patient.name.list.%Get(0).family" action="set" languageOverride="" xpos='740' ypos='1550' >
<annotation><![CDATA[récupération du nom]]></annotation>
</assign>
<assign name="birthDate" property="context.FHIRdata.birthDate" value="context.Patient.birthDate" action="set" languageOverride="" xpos='740' ypos='1650' >
<annotation><![CDATA[récupération de la date de naissance]]></annotation>
</assign>
</true>
<false>
<assign name="firstname" property="context.FHIRdata.firstname" value="context.FHIRResponse.json.entry.%Get(0).resource.name.%Get(0).given.%Get(0)" action="set" languageOverride="" xpos='470' ypos='1250' />
<assign name="lastname" property="context.FHIRdata.lastname" value="context.FHIRResponse.json.entry.%Get(0).resource.name.%Get(0).family" action="set" languageOverride="" xpos='470' ypos='1350' />
<assign name="birthDate" property="context.FHIRdata.birthDate" value="context.FHIRResponse.json.entry.%Get(0).resource.birthDate" action="set" languageOverride="" xpos='470' ypos='1450' />
</false>
</if>
<code name='prénom et nom Naissance' xpos='470' ypos='1850' >
<annotation><![CDATA[modification du document HPRIM XML avec les noms, prénom et date naissance récupérées en FHIR]]></annotation>
<![CDATA[ do context.HPRIMXML.SetValueAt(context.FHIRdata.firstname,"choice.evenementServeurActe.patient.personnePhysique.prenoms")
 do context.HPRIMXML.SetValueAt(context.FHIRdata.lastname,"choice.evenementServeurActe.patient.personnePhysique.nomNaissance")
 do context.HPRIMXML.SetValueAt(context.FHIRdata.birthDate,"choice.evenementServeurActe.patient.personnePhysique.dateNaissance.date")]]>
</code>
<call name='HPRIM XML' target='target HPRIMXML 2.4' async='1' xpos='470' ypos='1950' >
<annotation><![CDATA[envoi du nouveau document HPRIM XML sur un fichier]]></annotation>
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="context.HPRIMXML" action="set" languageOverride="" />
</request>
</call>
</true>
<false>
<empty name='date naissance OK' xpos='200' ypos='600' />
</false>
</if>
</sequence>
</process>
}

}
