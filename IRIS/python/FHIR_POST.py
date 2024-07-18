import requests
import json

# URL du serveur FHIR
fhir_server_url = "http://127.0.0.1:52773/irisapp/fhir/r4"

# Données du patient à créer
patient_data = {
    "resourceType": "Patient",
    "active": True,
    "name": [
        {
            "use": "official",
            "family": "Dupont",
            "given": ["Jean"]
        }
    ],
    "gender": "male",
    "birthDate": "1970-01-01"
}

# En-têtes de la requête
headers = {
    "Content-Type": "application/fhir+json",
    "Accept": "application/fhir+json"
}

# Effectuer la requête POST
response = requests.post(
    f"{fhir_server_url}/Patient", 
    headers=headers,
    data=json.dumps(patient_data)
)

# Vérifier la réponse
if response.status_code == 201:
    print("Patient créé avec succès")
else:
    print("Erreur lors de la création du patient")
print(response.status_code)
print(response.text)