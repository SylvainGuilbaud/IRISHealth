import requests
import json

# URL du serveur FHIR
fhir_server_url = "http://localhost:28001/irisapp/fhir/r4"

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
    print("ID du patient:", response.json()["id"])
else:
    print("Erreur lors de la création du patient")
    print("Code d'erreur:", response.status_code)
    print("Message d'erreur:", response.text)