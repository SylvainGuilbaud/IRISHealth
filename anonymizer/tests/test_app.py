import pytest
from flask import json
from app import app, db, AnonymizedIdentifiable
import fixtures
from fhir_anonymizer import anonymizers

@pytest.fixture
def client():
    app.config['TESTING'] = True
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'
    with app.test_client() as client:
        with app.app_context():
            db.create_all()
        yield client
        with app.app_context():
            db.drop_all()

def test_anonymize_single_resource_patient(client):
    fhir_data = fixtures.generate_patient()
    response = client.post('/anonymize', json=fhir_data)
    assert response.status_code == 200
    data = json.loads(response.data)

    # assert the fields are anonymized
    assert data["name"][0]["family"] == anonymizers.mask()(fhir_data["name"][0]["family"], None, None)
    assert data["name"][0]["given"][0] == anonymizers.mask()(fhir_data["name"][0]["given"][0], None, None)
    assert data["address"][0]["line"][0] == anonymizers.mask()(fhir_data["address"][0]["line"][0], None, None)
    assert data["address"][0]["city"] == anonymizers.mask()(fhir_data["address"][0]["city"], None, None)
    assert data["address"][0]["state"] == anonymizers.mask()(fhir_data["address"][0]["state"], None, None)
    assert data["address"][0]["postalCode"] == anonymizers.mask()(fhir_data["address"][0]["postalCode"], None, None)
    assert data["address"][0]["country"] == anonymizers.mask()(fhir_data["address"][0]["country"], None, None)
    assert data["identifier"][0]["value"] == anonymizers.hash_string()(fhir_data["identifier"][0]["value"], None, None)
    assert data["birthDate"] == anonymizers.birth_date_shift()(fhir_data["birthDate"], None, None)
    assert data["telecom"][0]["value"] == anonymizers.mask()(fhir_data["telecom"][0]["value"], None, None)

def test_anonymize_single_resource_contact_in_patient(client):
    fhir_data = fixtures.generate_contact_in_patient()
    response = client.post('/anonymize', json=fhir_data)
    assert response.status_code == 200
    data = json.loads(response.data)

    # assert the fields are anonymized
    assert data["name"][0]["family"] == anonymizers.mask()(fhir_data["name"][0]["family"], None, None)
    assert data["name"][0]["given"][0] == anonymizers.mask()(fhir_data["name"][0]["given"][0], None, None)
    assert data["name"][0]["extension"][0]["valueString"] == anonymizers.mask()(fhir_data["name"][0]["extension"][0]["valueString"], None, None)
    assert data["address"][0]["line"][0] == anonymizers.mask()(fhir_data["address"][0]["line"][0], None, None)
    assert data["address"][0]["city"] == anonymizers.mask()(fhir_data["address"][0]["city"], None, None)
    assert data["address"][0]["state"] == anonymizers.mask()(fhir_data["address"][0]["state"], None, None)
    assert data["address"][0]["postalCode"] == anonymizers.mask()(fhir_data["address"][0]["postalCode"], None, None)
    assert data["address"][0]["country"] == anonymizers.mask()(fhir_data["address"][0]["country"], None, None)
    assert data["identifier"][0]["value"] == anonymizers.hash_string()(fhir_data["identifier"][0]["value"], None, None)
    assert data["birthDate"] == anonymizers.birth_date_shift()(fhir_data["birthDate"], None, None)
    assert data["telecom"][0]["value"] == anonymizers.mask()(fhir_data["telecom"][0]["value"], None, None)
    assert data["contact"][0]["name"][0]["family"] == anonymizers.mask()(fhir_data["contact"][0]["name"][0]["family"], None, None)
    assert data["contact"][0]["name"][0]["given"][0] == anonymizers.mask()(fhir_data["contact"][0]["name"][0]["given"][0], None, None)
    assert data["contact"][0]["name"][0]["extension"][0]["valueString"] == anonymizers.mask()(fhir_data["contact"][0]["name"][0]["extension"][0]["valueString"], None, None)
    assert data["contact"][0]["telecom"][0]["value"] == anonymizers.mask()(fhir_data["contact"][0]["telecom"][0]["value"], None, None)
    assert data["contact"][0]["address"][0]["line"][0] == anonymizers.mask()(fhir_data["contact"][0]["address"][0]["line"][0], None, None)
    assert data["contact"][0]["address"][0]["city"] == anonymizers.mask()(fhir_data["contact"][0]["address"][0]["city"], None, None)
    assert data["contact"][0]["address"][0]["state"] == anonymizers.mask()(fhir_data["contact"][0]["address"][0]["state"], None, None)
    assert data["contact"][0]["address"][0]["postalCode"] == anonymizers.mask()(fhir_data["contact"][0]["address"][0]["postalCode"], None, None)
    assert data["contact"][0]["address"][0]["country"] == anonymizers.mask()(fhir_data["contact"][0]["address"][0]["country"], None, None)


def test_anonymize_single_resource_encounter(client):
    fhir_data = fixtures.generate_encounter()
    response = client.post('/anonymize', json=fhir_data)
    assert response.status_code == 200
    data = json.loads(response.data)

    # assert the fields are anonymized
    assert data["period"]["start"] == anonymizers.shift_time()(fhir_data["period"]["start"], None, None)
    assert data["period"]["end"] == anonymizers.shift_time()(fhir_data["period"]["end"], None, None)
    assert data["identifier"][0]["value"] == anonymizers.hash_string()(fhir_data["identifier"][0]["value"], None, None)

def test_anonymize_single_resource_practitioner(client):
    fhir_data = fixtures.generate_practitioner()
    response = client.post('/anonymize', json=fhir_data)
    assert response.status_code == 200
    data = json.loads(response.data)

    # assert the fields are anonymized
    assert data["name"][0]["family"] == anonymizers.mask()(fhir_data["name"][0]["family"], None, None)
    assert data["name"][0]["given"][0] == anonymizers.mask()(fhir_data["name"][0]["given"][0], None, None)
    assert data["identifier"][0]["value"] == anonymizers.hash_string()(fhir_data["identifier"][0]["value"], None, None)
    assert data["telecom"][0]["value"] == anonymizers.mask()(fhir_data["telecom"][0]["value"], None, None)

def test_anonymize_single_resource_related_person(client):
    fhir_data = fixtures.generate_related_person()
    response = client.post('/anonymize', json=fhir_data)
    assert response.status_code == 200
    data = json.loads(response.data)

    # assert the fields are anonymized
    assert data["name"][0]["family"] == anonymizers.mask()(fhir_data["name"][0]["family"], None, None)
    assert data["name"][0]["given"][0] == anonymizers.mask()(fhir_data["name"][0]["given"][0], None, None)
    assert data["identifier"][0]["value"] == anonymizers.hash_string()(fhir_data["identifier"][0]["value"], None, None)
    assert data["telecom"][0]["value"] == anonymizers.mask()(fhir_data["telecom"][0]["value"], None, None)

def test_anonymize_single_resource_other_resource(client):
    fhir_data = fixtures.generate_other_resources()
    response = client.post('/anonymize', json=fhir_data)
    assert response.status_code == 200
    data = json.loads(response.data)

    # assert the fields are anonymized
    assert data["birthDate"] == anonymizers.birth_date_shift()(fhir_data["birthDate"], None, None)
    assert data["name"][0]["family"] == anonymizers.mask()(fhir_data["name"][0]["family"], None, None)
    assert data["name"][0]["given"][0] == anonymizers.mask()(fhir_data["name"][0]["given"][0], None, None)
    assert data["address"][0]["line"][0] == anonymizers.mask()(fhir_data["address"][0]["line"][0], None, None)
    assert data["address"][0]["city"] == anonymizers.mask()(fhir_data["address"][0]["city"], None, None)
    assert data["address"][0]["state"] == anonymizers.mask()(fhir_data["address"][0]["state"], None, None)
    assert data["address"][0]["postalCode"] == anonymizers.mask()(fhir_data["address"][0]["postalCode"], None, None)
    assert data["address"][0]["country"] == anonymizers.mask()(fhir_data["address"][0]["country"], None, None)
    assert data["identifier"][0]["value"] == anonymizers.hash_string()(fhir_data["identifier"][0]["value"], None, None)

def test_anonymize_bundle(client):
    fhir_data = fixtures.generate_bundle()
    response = client.post('/anonymize', json=fhir_data)
    assert response.status_code == 200
    data = json.loads(response.data)
    assert "entry" in data
    for entry in data["entry"]:
        assert "resource" in entry
        resource = entry["resource"]
        assert "identifier" in resource
        assert resource["identifier"][0]["value"] != "12345"

def test_anonymized_identifiable_saved(client):
    fhir_data = {
        "resourceType": "Patient",
        "identifier": [{"value": "12345"}]
    }
    client.post('/anonymize', json=fhir_data)
    with app.app_context():
        anonymized = AnonymizedIdentifiable.query.filter_by(resource_id="12345").first()
        assert anonymized is not None
        assert anonymized.resource_id_anonymized is not None