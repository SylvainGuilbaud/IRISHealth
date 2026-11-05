# InterSystems IRIS for Health
## for demonstration only

## start/stop 

* [start.sh](./start.sh) - spins up all containers via docker-compose and 
    invokes iris/configure.sh in the iris containers
* [stop.sh](./stop.sh) - removes all containers

## configure.sh
* [iris/configure.sh](./iris/configure.sh) - configures the IRIS container's CSPConfigName

## IRIS Management Portal

With this pod, the user can access each instance's Management Portal immediately without relying on the private web server. If running on your local machine, use these URLs:
* [IRIS Management Portal](http://localhost:28000/csp/sys/UtilHome.csp)

## IRIS APIs

With this pod, the user can access each instance's Management Portal immediately without relying on the private web server. If running on your local machine, use these URLs:
### API Atelier
* [IRIS API Atelier](http://localhost:28000/api/atelier/)
### API Management
* [IRIS API Management](http://localhost:28000/api/mgmnt/)
### IRIS Monitor Metrics
* [IRIS EM METRICS](http://localhost:28000/api/monitor/metrics)
### LICENSES
* [License Key EM](http://localhost:28000/csp/sys/mgr/%25CSP.UI.Portal.License.Key.zen)

# Send TCP HL7 Messages
You can send TCP HL7 messages using the provided Python script `send_hl7_tcp.py`. 
This script establishes a TCP connection to the specified server and port, constructs an HL7 message, and sends it over the connection.

```python
cd ./code/python
python3 send_hl7_tcp.py 
```

## Services (docker-compose)

| Service | Container | Port(s) | Purpose |
|---|---|---|---|
| `iris` | `${CONTAINER_NAME}` | `$IRIS_MGR_PORT`→1972, `$IRIS_WEB_PORT`→52773, 24040→8080, 2575 (HL7 TCP), 19000-19100 | InterSystems IRIS for Health |
| `notebook` | `${CONTAINER_NAME}-notebook` | `$NOTEBOOK_PORT`→8888 | Jupyter data science notebook (`./notebook/Notebooks`) |
| `angular` | `${CONTAINER_NAME}-workflow-ui` | 28002→4200 | Workflow UI ([workflow-ui](./workflow-ui)) |
| `fhirhl7v2ui` | – | 4201→4200 | FHIR / HL7 v2 UI ([fhirhl7ui](./fhirhl7ui)) |
| `ftp_server` | `${CONTAINER_NAME}-ftp` | 28021→21 | FTP server (files under [data/ftp](./data/ftp)) |
| `prometheus` | `prometheus-demo` | 19990→9090 | Metrics collection |
| `grafana` | `grafana-demo` | 13000→3000 | Dashboards |
| `loki` / `promtail` | `loki-demo` / `promtail-demo` | 13100→3100 | Log aggregation |
| `lorah` | `${CONTAINER_NAME}-lorah` | – | See [lorah](./lorah) |
| `oscar` | `${CONTAINER_NAME}-oscar` | – | See [oscar](./oscar) |
| `anonymizer` | `${CONTAINER_NAME}-anonymizer` | – | Data anonymizer ([anonymizer](./anonymizer)) |
| `mssql` | `mssql-pre-prod` | – | Azure SQL Edge (pre-prod database) |
| `viewer` | `fhir-viewer-demo` | 3002→80 | FHIR viewer |

Kafka and PostgreSQL services are present in `docker-compose.yml` but commented out.

## Repository layout

* [code/python](./code/python) – Python samples (HL7 TCP senders, IRIS connection checks: DB-API, Native API, embedded)
* [code/FHIR](./code/FHIR) – FHIR sample resources and scripts
* [data](./data) – sample data (HL7, HPRIM, ASTM, GDT, FHIR, CSV, FTP, …)
* [config](./config) – Prometheus, Grafana, Alertmanager and Nginx configuration
* [analytics](./analytics) – generated analytics data sources
* [postman](./postman) – Postman collections
* [docs](./docs) – additional documentation

## Utility scripts

* [reset.sh](./reset.sh), [update.sh](./update.sh), [docker-pull.sh](./docker-pull.sh) – reset/update the environment and pull images
* [showLog.sh](./showLog.sh), [terminal.sh](./terminal.sh) – show IRIS logs / open a terminal in the container
* [POSTHL7v2.sh](./POSTHL7v2.sh), [add-Patient-to-FHIR-repo.sh](./add-Patient-to-FHIR-repo.sh), [generatePatient.py](./generatePatient.py) – send HL7 v2 messages / create FHIR patients
* [cleanIRIS_lck.sh](./cleanIRIS_lck.sh), [cleanDS_Store.sh](./cleanDS_Store.sh) – cleanup helpers
