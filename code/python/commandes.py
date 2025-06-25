import pandas as pd
import requests
from requests.auth import HTTPBasicAuth

# Paramètres
CSV_FILE = '/data/commandes.csv'
API_URL = 'http://localhost:9092/api/scdata/v1/purchaseorders'
USERNAME = '_SYSTEM'
PASSWORD = 'SYS'

# 1. Lire le fichier CSV
df = pd.read_csv(CSV_FILE)

# 2. Conversion des dates au format ISO8601 si besoin
if 'OrderDate' in df.columns:
    df['OrderDate'] = pd.to_datetime(df['OrderDate']).dt.strftime('%Y-%m-%d')

# 3. Transformation en liste de dictionnaires (JSON)
commandes = df.to_dict(orient='records')

# 4. Envoi de chaque commande à l’API REST IRIS
headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}

for commande in commandes:
    payload = commande  # Adapter selon le schéma attendu par l’API
    response = requests.post(
        API_URL,
        json=payload,
        auth=HTTPBasicAuth(USERNAME, PASSWORD),
        headers=headers
    )
    if response.status_code == 201:
        print(f"Commande ajoutée : {response.json()}")
    else:
        print(f"Erreur ({response.status_code}) : {response.text}")
