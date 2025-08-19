from datetime import datetime, timedelta

def generate_patient():
    return {
        'resourceType': 'Patient',
        'name': [
            {'family': 'Doe', 'given': ['John', 'A.'], 'extension': [{'valueString': 'John'}]}
        ],
        'address': [
            {'line': ['123 Main St'], 'city': 'Anytown', 'state': 'CA', 'postalCode': '12345', 'country': 'USA'}
        ],
        'identifier': [
            {'system': 'http://hospital.smarthealthit.org', 'value': 'hashed_identifier_value'}
        ],
        'birthDate': (datetime.now() - timedelta(days=365*30)).strftime('%Y-%m-%d'),  # 30 years ago
        'telecom': [
            {'system': 'phone', 'value': 'masked_telecom_value', 'use': 'home'}
        ]
    }

def generate_related_person():
    return {
        'resourceType': 'RelatedPerson',
        'name': [
            {'family': 'Doe', 'given': ['Jane', 'B.']}
        ],
        'identifier': [
            {'system': 'http://hospital.smarthealthit.org', 'value': 'hashed_identifier_value'}
        ],
        'telecom': [
            {'system': 'phone', 'value': 'masked_telecom_value', 'use': 'home'}
        ]
    }

def generate_encounter():
    return {
        'resourceType': 'Encounter',
        'period': {
            'start': (datetime.now() - timedelta(days=10)).strftime('%Y-%m-%d'),  # 10 days ago
            'end': datetime.now().strftime('%Y-%m-%d')  # now
        },
        'identifier': [
            {'system': 'http://hospital.smarthealthit.org', 'value': 'hashed_identifier_value'}
        ]
    }

def generate_practitioner():
    return {
        'resourceType': 'Practitioner',
        'name': [
            {'family': 'Smith', 'given': ['Alice', 'C.']}
        ],
        'identifier': [
            {'system': 'http://hospital.smarthealthit.org', 'value': 'hashed_identifier_value'}
        ],
        'telecom': [
            {'system': 'phone', 'value': 'masked_telecom_value', 'use': 'work'}
        ]
    }

def generate_other_resources():
    return {
        'resourceType': 'OtherResource',  # Replace with actual FHIR resource type if known
        'birthDate': (datetime.now() - timedelta(days=365*25)).strftime('%Y-%m-%d'),  # 25 years ago
        'name': [
            {'family': 'Brown', 'given': ['Charlie', 'D.']}
        ],
        'address': [
            {'line': ['456 Elm St'], 'city': 'Othertown', 'state': 'NY', 'postalCode': '67890', 'country': 'USA'}
        ],
        'identifier': [
            {'system': 'http://hospital.smarthealthit.org', 'value': 'hashed_identifier_value'}
        ]
    }

def generate_bundle():
    return {
        'resourceType': 'Bundle',
        'entry': [
            {'resource': generate_patient()},
            {'resource': generate_encounter()},
            {'resource': generate_other_resources()}
        ]
    }

def generate_contact_in_patient():
    return {
        'resourceType': 'Patient',
        'name': [
            {'family': 'Doe', 'given': ['John', 'A.'], 'extension': [{'valueString': 'John'}]}
        ],
        'address': [
            {'line': ['123 Main St'], 'city': 'Anytown', 'state': 'CA', 'postalCode': '12345', 'country': 'USA'}
        ],
        'identifier': [
            {'system': 'http://hospital.smarthealthit.org', 'value': 'hashed_identifier_value'}
        ],
        'birthDate': (datetime.now() - timedelta(days=365*30)).strftime('%Y-%m-%d'),  # 30 years ago
        'telecom': [
            {'system': 'phone', 'value': 'masked_telecom_value', 'use': 'home'}
        ],
        'contact': [
            {
                'relationship': [
                    {'coding': [{'code': 'C', 'display': 'Contact'}]}
                ],
                'name': [
                    {'family': 'Doe', 'given': ['Jane', 'B.'], 'extension': [{'valueString': 'Jane'}]}
                ],
                'telecom': [
                    {'system': 'phone', 'value': 'masked_telecom_value', 'use': 'home'}
                ],
                'address': [
                    {'line': ['123 Main St'], 'city': 'Anytown', 'state': 'CA', 'postalCode': '12345', 'country': 'USA'}
                ]
            }
        ]
    }

# Example usage
patient = generate_patient()
related_person = generate_related_person()
encounter = generate_encounter()
practitioner = generate_practitioner()
other_resources = generate_other_resources()