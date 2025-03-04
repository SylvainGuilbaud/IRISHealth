/// 
Class LORAH.process.CSVtoFHIRPython Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='python' request='LORAH.RM.Patient.Record' response='Ens.StringContainer' height='2000' width='2000' >
<sequence xend='200' yend='1050' >
<code name='PUT' languageOverride='python' xpos='200' ypos='250' >
<![CDATA[import csv
import requests
import json
from datetime import datetime
from zoneinfo import ZoneInfo
paris_tz = ZoneInfo("Europe/Paris")
id = request.id
patient = {
                "resourceType": "Patient",
                "id": request.id,
                "identifier": [
                    {
                        "system": "http://hospital.smarthealthit.org",
                        "value": request.id
                    },
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                                    "code": "MR",
                                    "display": "Medical Record Number"
                                }
                            ],
                            "text": "Medical Record Number"
                        },
                        "system": "http://hospital.smarthealthit.org",
                        "value": request.id
                    },
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                                    "code": "SS",
                                    "display": "Social Security Number"
                                }
                            ],
                            "text": "Social Security Number"
                        },
                        "system": "http://hl7.org/fhir/sid/us-ssn",
                        "value": request.id
                    }
                ],
                "name": [
                {
                    "use": "official",
                    "family": request.nom,
                    "given": [
                        request.prenom
                    ]
                }
                ],
                "gender": request.sexe,
                "birthDate": request.datedenaissance
            }
headers = {
             'Content-Type': 'application/fhir+json'
            }
result = requests.put(f"http://host.docker.internal:18880/lorah/fhir/r4/Patient/{id}",json=patient,headers=headers)
now = datetime.now(paris_tz)
timestamp = now.strftime('%d/%m/%Y %H:%M:%S:%f %Z')
if result.status_code == 201:
  response.StringValue=timestamp + " Patient " + request.nom + request.prenom + " créé avec succès"
elif result.status_code == 200:
  response.StringValue=timestamp + " Patient " + request.nom + request.prenom + " mis à jour avec succès "
else:
  response.StringValue=timestamp + " Erreur lors de la création du patient " + request.nom + request.prenom + "status_code:" + result.status_code + " text:" + result.text


            
]]>
</code>
<trace name='response' languageOverride='objectscript' value='response.StringValue' xpos='200' ypos='350' />
<code name='patient id' languageOverride='python' xpos='200' ypos='450' disabled="true">
<![CDATA[id = request.id]]>
</code>
<code name='patient data' languageOverride='python' xpos='200' ypos='550' disabled="true">
<![CDATA[patient = {
                "resourceType": "Patient",
                "id": request.id,
                "identifier": [
                    {
                        "system": "http://hospital.smarthealthit.org",
                        "value": request.id
                    },
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                                    "code": "MR",
                                    "display": "Medical Record Number"
                                }
                            ],
                            "text": "Medical Record Number"
                        },
                        "system": "http://hospital.smarthealthit.org",
                        "value": request.id
                    },
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                                    "code": "SS",
                                    "display": "Social Security Number"
                                }
                            ],
                            "text": "Social Security Number"
                        },
                        "system": "http://hl7.org/fhir/sid/us-ssn",
                        "value": request.id
                    }
                ],
                "name": [
                {
                    "use": "official",
                    "family": request.nom,
                    "given": [
                        request.prenom
                    ]
                }
                ],
                "gender": request.sexe,
                "birthDate": request.datedenaissance
            }]]>
</code>
<code name='headers' languageOverride='python' xpos='200' ypos='650' disabled="true">
<![CDATA[headers = {
             'Content-Type': 'application/fhir+json'
            }]]>
</code>
<code name='PUT' languageOverride='python' xpos='200' ypos='750' disabled="true">
<![CDATA[response = requests.put(f"http://host.docker.internal:18880/lorah/fhir/r4/Patient/{id}",json=patient,headers=headers)]]>
</code>
<code name='now' languageOverride='python' xpos='200' ypos='850' disabled="true">
<![CDATA[now = datetime.now(paris_tz)
timestamp = now.strftime('%d/%m/%Y %H:%M:%S:%f %Z')
]]>
</code>
<code name='response' languageOverride='python' xpos='200' ypos='950' disabled="true">
<![CDATA[if response.status_code == 201:
  print(f"{timestamp} Patient {row['nom']} {row['prenom']} créé avec succès ")
elif response.status_code == 200:
  print(f"{timestamp} Patient {row['nom']} {row['prenom']} mis à jour avec succès ")
else:
  print(f"{timestamp} Erreur lors de la création du patient {row['nom']} {row['prenom']}: {response.status_code}")
  print(response.text)]]>
</code>
</sequence>
</process>
}

}
