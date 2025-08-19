from bo import FhirHttpOperation
from bp import FhirAnonymizerProcess

CLASSES = {
    'Python.FhirAnonymizerProcess': FhirAnonymizerProcess,
    'Python.FhirHttpOperation': FhirHttpOperation
}

PRODUCTIONS = [{
    "FHIRSERVERPKG.FoundationProduction": {
        "@Name": "FHIRSERVERPKG.FoundationProduction",
        "@LogGeneralTraceEvents": "false",
        "Description": "",
        "ActorPoolSize": "1",
        "Item": [
            {
                "@Name": "InteropService",
                "@Category": "",
                "@ClassName": "HS.FHIRServer.Interop.Service",
                "@PoolSize": "0",
                "@Enabled": "true",
                "@Foreground": "false",
                "@Comment": "",
                "@LogTraceEvents": "false",
                "@Schedule": "",
                "Setting": [
                    {
                        "@Target": "Host",
                        "@Name": "TargetConfigName",
                        "#text": "Python.FhirAnonymizerProcess"
                    },
                    {
                        "@Target": "Host",
                        "@Name": "TraceOperations",
                        "#text": "*FULL*"
                    }
                ]
            },
            {
                "@Name": "Python.FhirAnonymizerProcess",
                "@Category": "",
                "@ClassName": "Python.FhirAnonymizerProcess",
                "@PoolSize": "1",
                "@Enabled": "true",
                "@Foreground": "false",
                "@Comment": "",
                "@LogTraceEvents": "false",
                "@Schedule": ""
            },
            {
                "@Name": "HS.FHIRServer.Interop.Operation",
                "@Category": "",
                "@ClassName": "HS.FHIRServer.Interop.Operation",
                "@PoolSize": "1",
                "@Enabled": "true",
                "@Foreground": "false",
                "@Comment": "",
                "@LogTraceEvents": "false",
                "@Schedule": "",
                "Setting": {
                    "@Target": "Host",
                    "@Name": "TraceOperations",
                    "#text": "*FULL*"
                }
            },
            {
                "@Name": "HS.Util.Trace.Operations",
                "@Category": "",
                "@ClassName": "HS.Util.Trace.Operations",
                "@PoolSize": "1",
                "@Enabled": "true",
                "@Foreground": "false",
                "@Comment": "",
                "@LogTraceEvents": "false",
                "@Schedule": ""
            },
            {
                "@Name": "Python.FhirHttpOperation",
                "@Category": "",
                "@ClassName": "Python.FhirHttpOperation",
                "@PoolSize": "1",
                "@Enabled": "true",
                "@Foreground": "false",
                "@Comment": "",
                "@LogTraceEvents": "false",
                "@Schedule": ""
            }
        ]
    }
}]
