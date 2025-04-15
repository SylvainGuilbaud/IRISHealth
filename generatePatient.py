import json
import orjson
from fhirgenerator.helpers.helpers import calculateAge, default
from fhirgenerator import generateResources

output_bundle = generateResources({"numberPatients":1,
                                   "genderMFOU":[47, 47, 1, 5],
                                  "ageMax":110,
                                   "ageMin":0,
                                   "startDate":"2024-01-01",
                                   "days":500,
                                   "usCorePatient":False,
                                   "resourceDetails":[{"fhirResource":"Observation",
                                                        "codes":[{
                                                                "system": "http://snomed.info/sct",
                                                                "code": "736686006"}],
                                                        "minOccurrencesPerCycle":1,
                                                        "maxOccurrencesPerCycle":3,
                                                        "cycleLengthInDays":30}]
                                  })

# print(output_bundle)

        
# with open("test_patient.json", "w") as fichier:
#     json.dump(output_bundle, fichier, indent=4)
    
with open('test_patient.json', 'wb') as outfile:
        outfile.write(orjson.dumps(output_bundle, default=default, option=orjson.OPT_NAIVE_UTC))
