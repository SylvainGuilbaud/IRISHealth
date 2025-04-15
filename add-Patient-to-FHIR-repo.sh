# while true
# do
curl http://localhost:28000/irisapp/fhir/r4/Patient \
    -H "Content-Type: application/fhir+json" \
    -X POST \
    -d '{
    "resourceType": "Patient",
    "deceasedBoolean": false,
    "gender": "female",
    "identifier": [
        {
            "type": {
                "coding": [
                    {
                        "code": "ssn",
                        "system": "http://hl7.org/fhir/sid/us-ssn"
                    }
                ],
                "text": "ssn"
            },
            "value": "121-62-6751"
        }
    ],
    "name": [
        {
            "family": "Xenia",
            "given": [
                "Juanita"
            ],
            "text": "Juanita Xenia",
            "use": "official"
        }
    ],
    "id": "139"
    }'
    # done