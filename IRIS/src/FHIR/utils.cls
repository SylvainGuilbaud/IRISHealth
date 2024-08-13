Class FHIR.utils
{

Parameter FHIRENDPOINT = "http://host.docker.internal:18881/lorah/fhir/r4";

ClassMethod install(NAMESPACE As %String = "FHIRDEMO") As %Status
{
    set sc = $$$OK
    set ns = $NAMESPACE
    zn "HSLIB"
    #; Set appKey = "/"_$zcvt(NAMESPACE,"l")_"/fhir/r4"
    Set appKey = "/fhir/r4"
    Set strategyClass = "HS.FHIRServer.Storage.Json.InteractionsStrategy"
    Set metadataConfigKey = "HL7v40"

    //Install a Foundation namespace and change to it
    // https://docs.intersystems.com/irisforhealthlatest/csp/documatic/%25CSP.Documatic.cls?LIBRARY=HSSYS&CLASSNAME=HS.Util.Installer.Foundation#Install
    Do ##class(HS.Util.Installer.Foundation).Install(NAMESPACE)

    zn NAMESPACE

    // Install elements that are required for a FHIR-enabled namespace
    // https://docs.intersystems.com/irisforhealthlatest/csp/documatic/%25CSP.Documatic.cls?LIBRARY=HSSYS&CLASSNAME=HS.FHIRServer.Installer#InstallNamespace
    Do ##class(HS.FHIRServer.Installer).InstallNamespace()

    // Install an instance of a FHIR Service into the current namespace
    // https://docs.intersystems.com/irisforhealthlatest/csp/documatic/%25CSP.Documatic.cls?LIBRARY=HSSYS&CLASSNAME=HS.FHIRServer.Installer#InstallInstance
    Do ##class(HS.FHIRServer.Installer).InstallInstance(appKey, strategyClass, metadataConfigKey)
    #; do ##class(Ens.Director).StopProduction()

    #; zw $classmethod("Ens.Director", "SetAutoStart", NAMESPACE_"PKG.FoundationProduction", 0)

    set cspConfig = ##class(HS.Util.RESTCSPConfig).URLIndexOpen(appKey)
    set cspConfig.ServiceConfigName = "HS.FHIRServer.Interop.Service"
    set cspConfig.AllowUnauthenticatedAccess = 1
    do cspConfig.%Save()

    set strategy = ##class(HS.FHIRServer.API.InteractionsStrategy).GetStrategyForEndpoint(appKey)
    set config = strategy.GetServiceConfigData()
    set config.DebugMode = 4
    do strategy.SaveServiceConfigData(config)
    
    zn ns
    return sc
}

ClassMethod uninstall(NAMESPACE As %String = "FHIRDEMO") As %Status
{
    set sc = $$$OK
    set ns = $NAMESPACE
    
    zn "HSLIB"
    #; set appKey = "/"_$zcvt(NAMESPACE,"l")_"/fhir/r4"
    Set appKey = "/fhir/r4"

    //Uninstall a Foundation namespace and change to it
    /// https://docs.intersystems.com/irisforhealthlatest/csp/documatic/%25CSP.Documatic.cls?LIBRARY=HSSYS&CLASSNAME=HS.Util.Installer.Foundation#UnInstall
    Do ##class(HS.Util.Installer.Foundation).UnInstall(NAMESPACE)

    zn NAMESPACE

    #; // Uninstall an instance of a FHIR Service into the current namespace
    Do ##class(HS.FHIRServer.Installer).UninstallInstance(appKey)

    zn ns
    return sc
}

/// Delete all resources from the FHIR Server
ClassMethod purge(pServiceName As %String = "/fhir/r4") As %Status
{
    Try {
        set sc = $$$OK
        set strategy = ##class(HS.FHIRServer.API.InteractionsStrategy).GetStrategyForEndpoint(pServiceName)
        set options("deleteDataOnly") = 1
        do strategy.Delete(.options)
    }
    Catch ex {
        set sc=ex.AsStatus()
    }
        
    return sc
}

/// Load resources in the FHIR Server
ClassMethod load(pInputDirectory As %String = "/IRIS/data/fhir/", pServiceType As %String = "FHIRServer", pServiceName As %String = "/fhir/r4", pDisplayProgress As %Boolean = 1) As %Status
{
    Try {
        set sc = $$$OK
        set sc = ##class(HS.FHIRServer.Tools.DataLoader).SubmitResourceFiles(pInputDirectory, pServiceType, pServiceName, pDisplayProgress)
    }
    Catch ex {
        set tSC=ex.AsStatus()
    }
    return sc
}

ClassMethod UpdateBundle(pBundle As %DynamicObject, verbose As %Boolean = 0) As %DynamicObject
{
    Set tBundle = pBundle

    // Obtenir un itérateur pour les entrées
    Set entry = tBundle.entry.%GetIterator()
    Set entryKey = "", entryValue = "" 

    // Utiliser l'itérateur pour parcourir les entrées
    While entry.%GetNext(.entryKey, .entryValue) {
        If entryValue.request.method = "POST" {
            // Générer la requête de recherche

            Set tSearchUrl = ..#FHIRENDPOINT _ "/" _ entryValue.resource.resourceType _ "?identifier=" _ entryValue.resource.identifier.%Get(0).value
            write:verbose tSearchUrl,!
		    // Effectuer la requête de recherche
            set request = ##class(%Net.HttpRequest).%New()
            set request.ContentType = "application/fhir+json; charset=UTF-8"
            do request.SetHeader("Accept","*/*")
            set sc = request.Get(tSearchUrl)
            set response = {}.%FromJSON(request.HttpResponse.Data)
            write:verbose request.HttpResponse.StatusCode,!
            write:verbose response.%ToJSON(),!
			Set entryValue.request.method = "PUT"
			Set entryValue.resource.id=$System.Util.CreateGUID()
            // Si la ressource existe déjà, récupérer son id
            If request.HttpResponse.StatusCode = 200 {
                write:verbose "entry:" _ response.%IsDefined("entry"),!
                if response.%IsDefined("entry") {
                    if response.entry.%Get(0).resource.resourceType = entryValue.resource.resourceType {
                        // Récupérer l'ID de la ressource existante                       
                        write:verbose "<<<RESOURCE EXISTS>>>:",!,response.entry.%Get(0).%ToJSON(),!
                        if response.entry.%Get(0).resource.id '= "" {
                            Set entryValue.resource.id = response.entry.%Get(0).resource.id
                        }
                    }  else {
                        write:verbose "<<<NO EXISTING RESOURCE>>>:",!
                    }
                } 
			}
			set entryValue.request.url = entryValue.resource.resourceType _ "/" _ entryValue.resource.id
			if (entryValue.resource.resourceType'="Organization") 
			&& (entryValue.resource.resourceType'="Encounter")
			&& (entryValue.resource.resourceType'="Location")
			&& (entryValue.resource.resourceType'="Practitioner") {
                Set entryValue.fullUrl = entryValue.resource.resourceType _ "/" _ entryValue.resource.id
			}
            write:verbose entryValue.resource.id,!!
        }
    }
    
    Return tBundle
}

ClassMethod Test(verbose As %Boolean = 1) As %Status
{
    Set tBundle = {
            "resourceType": "Bundle",
            "type": "transaction",
            "entry": [
                {
                "request": { "method": "POST", "url": "Organization" },
                "fullUrl": "urn:uuid:258c90b9-58bb-11ef-9136-0242ac110002",
                "resource": {
                    "resourceType": "Organization",
                    "identifier": [{ "value": "HM" }]
                }
                },
                {
                "request": { "method": "PUT", "url": "Patient/2416003" },
                "fullUrl": "Patient/2416003",
                "resource": {
                    "resourceType": "Patient",
                    "address": [
                    {
                        "city": "MARSEILLE 06",
                        "country": "100",
                        "line": ["1 rue dupont"],
                        "postalCode": "13006"
                    }
                    ],
                    "birthDate": "2000-08-01",
                    "deceasedBoolean": false,
                    "extension": [
                    {
                        "url": "http://intersystems.com/fhir/extn/sda3/lib/patient-entered-by",
                        "valueCodeableConcept": {
                        "coding": [
                            {
                            "code": "mouriauxn",
                            "display": "Mouriaux Nicolas",
                            "extension": [
                                {
                                "url": "http://intersystems.com/fhir/extn/sda3/lib/code-table-detail-s-d-a-coding-standard",
                                "valueString": "HM"
                                }
                            ]
                            }
                        ]
                        }
                    }
                    ],
                    "gender": "male",
                    "identifier": [
                    {
                        "assigner": {
                        "reference": "urn:uuid:258c90b9-58bb-11ef-9136-0242ac110002"
                        },
                        "extension": [
                        {
                            "url": "http://intersystems.com/fhir/extn/sda3/lib/patient-number-i-s-o-assigning-authority",
                            "valueString": "HM"
                        }
                        ],
                        "type": {
                        "coding": [
                            {
                            "code": "MR",
                            "system": "http://terminology.hl7.org/CodeSystem/v2-0203"
                            }
                        ],
                        "text": "MRN"
                        },
                        "value": "2416003"
                    }
                    ],
                    "managingOrganization": {
                    "reference": "urn:uuid:258c90b9-58bb-11ef-9136-0242ac110002"
                    },
                    "multipleBirthInteger": 1,
                    "name": [
                    {
                        "family": "DTN",
                        "given": ["EDS1", "EDS1"],
                        "prefix": ["MR"],
                        "text": "MR EDS1 EDS1 DTN",
                        "use": "official"
                    }
                    ],
                    "telecom": [
                    {
                        "system": "phone",
                        "use": "home",
                        "value": "0901020304;09.01.02.03.04"
                    }
                    ],
                    "id": "2416003"
                }
                },
                {
                "request": { "method": "POST", "url": "Organization" },
                "fullUrl": "urn:uuid:258ce6f2-58bb-11ef-9136-0242ac110002",
                "resource": {
                    "resourceType": "Organization",
                    "identifier": [{ "value": "HM" }],
                    "name": "HM"
                }
                },
                {
                "request": { "method": "POST", "url": "Location" },
                "fullUrl": "urn:uuid:258cf98b-58bb-11ef-9136-0242ac110002",
                "resource": {
                    "resourceType": "Location",
                    "identifier": [{ "value": "0012" }],
                    "managingOrganization": {
                    "reference": "urn:uuid:258ce6f2-58bb-11ef-9136-0242ac110002"
                    },
                    "name": "0012",
                    "physicalType": {
                    "coding": [
                        {
                        "code": "wa",
                        "display": "Ward",
                        "system": "http://terminology.hl7.org/CodeSystem/location-physical-type"
                        }
                    ]
                    }
                }
                },
                {
                "request": { "method": "POST", "url": "Location" },
                "fullUrl": "urn:uuid:258d0fbd-58bb-11ef-9136-0242ac110002",
                "resource": {
                    "resourceType": "Location",
                    "identifier": [{ "value": "130001647&amp;130001647&amp;N" }],
                    "managingOrganization": {
                    "reference": "urn:uuid:258ce6f2-58bb-11ef-9136-0242ac110002"
                    },
                    "name": "130001647&amp;130001647&amp;N",
                    "physicalType": {
                    "coding": [
                        {
                        "code": "si",
                        "display": "Site",
                        "system": "http://terminology.hl7.org/CodeSystem/location-physical-type"
                        }
                    ]
                    }
                }
                },
                {
                "request": { "method": "POST", "url": "Practitioner" },
                "fullUrl": "urn:uuid:258d21cd-58bb-11ef-9136-0242ac110002",
                "resource": {
                    "resourceType": "Practitioner",
                    "extension": [
                    {
                        "url": "http://intersystems.com/fhir/extn/sda3/lib/code-table-detail-care-provider-description",
                        "valueString": "AURRAN-SCHLEINITZ, ThÃ©rÃ¨se"
                    },
                    {
                        "url": "http://intersystems.com/fhir/extn/sda3/lib/code-table-detail-care-provider-name-type-code",
                        "valueString": "D"
                    }
                    ],
                    "identifier": [
                    { "type": { "coding": [{ "code": "HM" }] }, "value": "3496" }
                    ],
                    "name": [
                    {
                        "family": "AURRAN-SCHLEINITZ",
                        "given": ["ThÃ©rÃ¨se"],
                        "text": "ThÃ©rÃ¨se AURRAN-SCHLEINITZ"
                    }
                    ]
                }
                },
                {
                "request": { "method": "POST", "url": "Practitioner" },
                "fullUrl": "urn:uuid:258d3409-58bb-11ef-9136-0242ac110002",
                "resource": {
                    "resourceType": "Practitioner",
                    "extension": [
                    {
                        "url": "http://intersystems.com/fhir/extn/sda3/lib/code-table-detail-care-provider-description",
                        "valueString": "AURRAN-SCHLEINITZ, ThÃ©rÃ¨se"
                    },
                    {
                        "url": "http://intersystems.com/fhir/extn/sda3/lib/code-table-detail-care-provider-name-type-code",
                        "valueString": "D"
                    }
                    ],
                    "identifier": [
                    {
                        "type": {
                        "coding": [
                            { "code": "ASIP-SANTE-PS&amp;1.2.250.1.71.4.2.1&amp;ISO" }
                        ]
                        },
                        "value": "130001647"
                    }
                    ],
                    "name": [
                    {
                        "family": "AURRAN-SCHLEINITZ",
                        "given": ["ThÃ©rÃ¨se"],
                        "text": "ThÃ©rÃ¨se AURRAN-SCHLEINITZ"
                    }
                    ]
                }
                },
                {
                "request": { "method": "POST", "url": "Practitioner" },
                "fullUrl": "urn:uuid:258d4550-58bb-11ef-9136-0242ac110002",
                "resource": {
                    "resourceType": "Practitioner",
                    "extension": [
                    {
                        "url": "http://intersystems.com/fhir/extn/sda3/lib/code-table-detail-care-provider-description",
                        "valueString": "AURRAN-SCHLEINITZ, ThÃ©rÃ¨se"
                    },
                    {
                        "url": "http://intersystems.com/fhir/extn/sda3/lib/code-table-detail-care-provider-name-type-code",
                        "valueString": "D"
                    }
                    ],
                    "identifier": [
                    {
                        "type": {
                        "coding": [
                            { "code": "ASIP-SANTE-PS&amp;1.2.250.1.71.4.2.1&amp;ISO" }
                        ]
                        },
                        "value": "10003416665"
                    }
                    ],
                    "name": [
                    {
                        "family": "AURRAN-SCHLEINITZ",
                        "given": ["ThÃ©rÃ¨se"],
                        "text": "ThÃ©rÃ¨se AURRAN-SCHLEINITZ"
                    }
                    ]
                }
                },
                {
                "request": { "method": "POST", "url": "Encounter" },
                "fullUrl": "urn:uuid:258d804e-58bb-11ef-9136-0242ac110002",
                "resource": {
                    "resourceType": "Encounter",
                    "class": {
                    "code": "IMP",
                    "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode"
                    },
                    "extension": [
                    {
                        "url": "http://intersystems.com/fhir/extn/sda3/lib/encounter-account-number",
                        "valueString": "724254801"
                    },
                    {
                        "url": "http://intersystems.com/fhir/extn/sda3/lib/encounter-encounter-type",
                        "valueString": "I"
                    },
                    {
                        "url": "http://intersystems.com/fhir/extn/sda3/lib/encounter-entered-at",
                        "valueReference": {
                        "reference": "urn:uuid:258c90b9-58bb-11ef-9136-0242ac110002"
                        }
                    },
                    {
                        "url": "http://intersystems.com/fhir/extn/sda3/lib/encounter-entered-by",
                        "valueCodeableConcept": {
                        "coding": [
                            {
                            "code": "mouriauxn",
                            "display": "Mouriaux Nicolas",
                            "extension": [
                                {
                                "url": "http://intersystems.com/fhir/extn/sda3/lib/code-table-detail-s-d-a-coding-standard",
                                "valueString": "HM"
                                }
                            ]
                            }
                        ]
                        }
                    },
                    {
                        "url": "http://intersystems.com/fhir/extn/sda3/lib/encounter-entered-on",
                        "valueDateTime": "2024-08-01T15:49:00+02:00"
                    },
                    {
                        "url": "http://intersystems.com/fhir/extn/sda3/lib/encounter-to-time",
                        "valueDateTime": "2024-08-01T16:10:00+02:00"
                    }
                    ],
                    "hospitalization": {
                    "extension": [
                        {
                        "url": "http://intersystems.com/fhir/extn/sda3/lib/encounter-assigned-ward",
                        "valueString": "0012"
                        }
                    ]
                    },
                    "identifier": [
                    {
                        "system": "http://www.intersystems.com/fhir/extn/sda3/lib/undefinedAA",
                        "type": { "text": "EncounterNumber" },
                        "use": "official",
                        "value": "724254801"
                    }
                    ],
                    "location": [
                    {
                        "location": {
                        "reference": "urn:uuid:258cf98b-58bb-11ef-9136-0242ac110002"
                        }
                    },
                    {
                        "location": {
                        "reference": "urn:uuid:258d0fbd-58bb-11ef-9136-0242ac110002"
                        }
                    }
                    ],
                    "participant": [
                    {
                        "individual": {
                        "reference": "urn:uuid:258d21cd-58bb-11ef-9136-0242ac110002"
                        },
                        "type": [
                        {
                            "coding": [
                            {
                                "code": "ATND",
                                "display": "attender",
                                "system": "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
                            }
                            ]
                        }
                        ]
                    },
                    {
                        "individual": {
                        "reference": "urn:uuid:258d3409-58bb-11ef-9136-0242ac110002"
                        },
                        "type": [
                        {
                            "coding": [
                            {
                                "code": "ATND",
                                "display": "attender",
                                "system": "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
                            }
                            ]
                        }
                        ]
                    },
                    {
                        "individual": {
                        "reference": "urn:uuid:258d4550-58bb-11ef-9136-0242ac110002"
                        },
                        "type": [
                        {
                            "coding": [
                            {
                                "code": "ATND",
                                "display": "attender",
                                "system": "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
                            }
                            ]
                        }
                        ]
                    }
                    ],
                    "period": { "start": "2024-08-01T15:49:00+02:00" },
                    "status": "unknown",
                    "subject": { "reference": "Patient/2416003" }
                }
                }
            ]
    }

    Set tUpdatedBundle = ..UpdateBundle(tBundle,verbose)

    Write !!!,tUpdatedBundle.%ToJSON(),!

    return $$$OK
}

/// Description
ClassMethod a() As %Status
{
    Set sc = $$$OK

    set json = {
            "fullUrl": "http://host.docker.internal:18881/lorah/fhir/r4/Organization/1",
            "resource": {
                "resourceType": "Organization",
                "identifier": [{ "value": "HM" }],
                "id": "1",
                "meta": { "lastUpdated": "2024-08-12T14:57:07Z", "versionId": "1" }
            },
            "search": { "mode": "match" }
    }

    write "%IsDefined(identifier):"_json.resource.%IsDefined("identifier"),!
        write "%IsDefined(identifier):"_json.resource.identifier.%Get(0).value,!

    write json.fullUrl,!
    write json.resource.resourceType,!

    Return sc
}

}
