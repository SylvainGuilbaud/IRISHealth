# InterSystems IRIS for Health
## à des fins de démonstration uniquement

## Démarrage / arrêt

* [start.sh](./start.sh) - démarre tous les conteneurs via docker-compose et
    invoque iris/configure.sh dans les conteneurs IRIS
* [stop.sh](./stop.sh) - supprime tous les conteneurs

## configure.sh
* [iris/configure.sh](./iris/configure.sh) - configure le CSPConfigName du conteneur IRIS

## Portail de gestion IRIS

Avec ce pod, l'utilisateur peut accéder immédiatement au portail de gestion de chaque instance sans passer par le serveur web privé. En local, utilisez ces URL :
* [Portail de gestion IRIS](http://localhost:28000/csp/sys/UtilHome.csp)

## API IRIS

Avec ce pod, l'utilisateur peut accéder immédiatement aux API de chaque instance sans passer par le serveur web privé. En local, utilisez ces URL :
### API Atelier
* [IRIS API Atelier](http://localhost:28000/api/atelier/)
### API Management
* [IRIS API Management](http://localhost:28000/api/mgmnt/)
### Métriques de supervision IRIS
* [IRIS EM METRICS](http://localhost:28000/api/monitor/metrics)
### Licences
* [Clé de licence EM](http://localhost:28000/csp/sys/mgr/%25CSP.UI.Portal.License.Key.zen)

# Envoi de messages HL7 en TCP
Vous pouvez envoyer des messages HL7 en TCP avec le script Python `send_hl7_tcp.py`.
Ce script ouvre une connexion TCP vers le serveur et le port indiqués, construit un message HL7 et l'envoie sur cette connexion.

```python
cd ./code/python
python3 send_hl7_tcp.py 
```

## Services (docker-compose)

| Service | Conteneur | Port(s) | Rôle |
|---|---|---|---|
| `iris` | `${CONTAINER_NAME}` | `$IRIS_MGR_PORT`→1972, `$IRIS_WEB_PORT`→52773, 24040→8080, 2575 (HL7 TCP), 19000-19100 | InterSystems IRIS for Health |
| `notebook` | `${CONTAINER_NAME}-notebook` | `$NOTEBOOK_PORT`→8888 | Notebook Jupyter data science (`./notebook/Notebooks`) |
| `angular` | `${CONTAINER_NAME}-workflow-ui` | 28002→4200 | Interface de workflow ([workflow-ui](./workflow-ui)) |
| `fhirhl7v2ui` | – | 4201→4200 | Interface FHIR / HL7 v2 ([fhirhl7ui](./fhirhl7ui)) |
| `ftp_server` | `${CONTAINER_NAME}-ftp` | 28021→21 | Serveur FTP (fichiers dans [data/ftp](./data/ftp)) |
| `prometheus` | `prometheus-demo` | 19990→9090 | Collecte des métriques |
| `grafana` | `grafana-demo` | 13000→3000 | Tableaux de bord |
| `loki` / `promtail` | `loki-demo` / `promtail-demo` | 13100→3100 | Agrégation des logs |
| `lorah` | `${CONTAINER_NAME}-lorah` | – | Voir [lorah](./lorah) |
| `oscar` | `${CONTAINER_NAME}-oscar` | – | Voir [oscar](./oscar) |
| `anonymizer` | `${CONTAINER_NAME}-anonymizer` | – | Anonymisation de données ([anonymizer](./anonymizer)) |
| `mssql` | `mssql-pre-prod` | – | Azure SQL Edge (base de pré-production) |
| `viewer` | `fhir-viewer-demo` | 3002→80 | Visionneuse FHIR |

Les services Kafka et PostgreSQL sont présents dans `docker-compose.yml` mais commentés.

## Organisation du dépôt

* [code/python](./code/python) – exemples Python (envoi HL7 en TCP, tests de connexion IRIS : DB-API, API Native, embarqué)
* [code/FHIR](./code/FHIR) – ressources et scripts FHIR d'exemple
* [data](./data) – données d'exemple (HL7, HPRIM, ASTM, GDT, FHIR, CSV, FTP, …)
* [config](./config) – configuration de Prometheus, Grafana, Alertmanager et Nginx
* [analytics](./analytics) – sources de données d'analyse générées
* [postman](./postman) – collections Postman
* [docs](./docs) – documentation complémentaire

## Scripts utilitaires

* [reset.sh](./reset.sh), [update.sh](./update.sh), [docker-pull.sh](./docker-pull.sh) – réinitialisation/mise à jour de l'environnement et téléchargement des images
* [showLog.sh](./showLog.sh), [terminal.sh](./terminal.sh) – affichage des logs IRIS / ouverture d'un terminal dans le conteneur
* [POSTHL7v2.sh](./POSTHL7v2.sh), [add-Patient-to-FHIR-repo.sh](./add-Patient-to-FHIR-repo.sh), [generatePatient.py](./generatePatient.py) – envoi de messages HL7 v2 / création de patients FHIR
* [cleanIRIS_lck.sh](./cleanIRIS_lck.sh), [cleanDS_Store.sh](./cleanDS_Store.sh) – scripts de nettoyage
