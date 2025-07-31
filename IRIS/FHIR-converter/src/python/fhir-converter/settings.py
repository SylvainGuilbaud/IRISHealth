import os

from bo import FhirConverterOperation, FhirHttpOperation
from bp import FhirConverterProcess
from bs import Hl7v2FileService

CLASSES = {
    'Python.FhirConverterOperation': FhirConverterOperation,
    'Python.FhirConverterProcess': FhirConverterProcess,
    'Python.Hl7v2FileService': Hl7v2FileService,
    'Python.FhirHttpOperation': FhirHttpOperation

}

PRODUCTIONS = [{
    "Python.Production": {
        "@Name": "Python.Production",
        "@TestingEnabled": "true",
        "@LogGeneralTraceEvents": "false",
        "Description": "",
        "ActorPoolSize": "2",
        "Item": [
            {
                "@Name": "Python.FhirHttpOperation",
                "@Category": "",
                "@ClassName": "Python.FhirHttpOperation",
                "@PoolSize": "4",
                "@Enabled": "true",
                "@Foreground": "false",
                "@Comment": "",
                "@LogTraceEvents": "false",
                "@Schedule": "",
                "Setting": {
                    "@Target": "Host",
                    "@Name": "%settings",
                    "#text": "url=https://default/fhir/r4"
                }
            },
            {
                "@Name": "Python.Hl7v2FileService",
                "@Category": "",
                "@ClassName": "Python.Hl7v2FileService",
                "@PoolSize": "1",
                "@Enabled": "false",
                "@Foreground": "false",
                "@Comment": "",
                "@LogTraceEvents": "false",
                "@Schedule": ""
            },
            {
                "@Name": "Python.FhirConverterProcess",
                "@Category": "",
                "@ClassName": "Python.FhirConverterProcess",
                "@PoolSize": "1", 
                "@Enabled": "true",
                "@Foreground": "false",
                "@Comment": "",
                "@LogTraceEvents": "false",
                "@Schedule": ""
            },
            {
                "@Name": "Python.FhirConverterOperation",
                "@Category": "",
                "@ClassName": "Python.FhirConverterOperation",
                "@PoolSize": "4",
                "@Enabled": "true",
                "@Foreground": "false",
                "@Comment": "",
                "@LogTraceEvents": "false",
                "@Schedule": "",
                "Setting": {
                    "@Target": "Host",
                    "@Name": "%settings",
                    "#text": f"template_path={os.getenv('TEMPLATE_PATH', '/irisdev/app/templates')}"
                }
            },
            {
                "@Name": "IRIS.Hl7v2FileService",
                "@Category": "",
                "@ClassName": "EnsLib.HL7.Service.FileService",
                "@PoolSize": "1",
                "@Enabled": "true",
                "@Foreground": "false",
                "@Comment": "",
                "@LogTraceEvents": "false",
                "@Schedule": "",
                "Setting": [
                    {
                        "@Target": "Host",
                        "@Name": "MessageSchemaCategory",
                        "#text": "2.8"
                    },
                    {
                        "@Target": "Host",
                        "@Name": "TargetConfigNames",
                        "#text": "Python.FhirConverterProcess"
                    },
                    {
                        "@Target": "Adapter",
                        "@Name": "FilePath",
                        "#text": "/irisdev/app/data/input/"
                    },
                    {
                        "@Target": "Adapter",
                        "@Name": "ArchivePath",
                        "#text": "/irisdev/app/data/archive"
                    },
                    {
                        "@Target": "Adapter",
                        "@Name": "FileSpec",
                        "#text": "*.hl7"
                    }
                ]
            }
        ]
    }
}]
