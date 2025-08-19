from flask import Flask, request, jsonify
from flask_alembic import Alembic

from fhir_anonymizer import anonymizers, rules, anonymize_fhir_data
from jsonpath_ng import parse

from model import AnonymizedIdentifiable, db

alembic = Alembic(
    metadatas={
        "default": AnonymizedIdentifiable.metadata,
    },
)

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'iris+emb://IRISAPP'
app.app_context().push()

db.init_app(app)
alembic.init_app(app)
alembic.upgrade()

id_json_exp = parse('$.identifier[*].value')

@app.route('/anonymize', methods=['POST'])
def anonymize():
    fhir_data = request.json

    if "entry" not in fhir_data:
        process_resource(fhir_data)
    else:
        for entry in fhir_data["entry"]:
            ressource = entry["resource"]
            process_resource(ressource)
            entry["resource"] = ressource

    return jsonify(fhir_data)

def process_resource(resource):
    resource_id_list = id_json_exp.find(resource)

    # get resource type
    resource_type = resource.get('resourceType')

    _rules = rules.rules
    # select rules for the resource type
    if resource_type == 'Patient':
        _rules = rules.patient
    elif resource_type == 'RelatedPerson':
        _rules = rules.related_person
    elif resource_type == 'Encounter':
        _rules = rules.encounter
    elif resource_type == 'Practitioner':
        _rules = rules.practitioner

    for rule in _rules:
        anonymize_fhir_data(resource, rule)

    for resource_id in resource_id_list:
        anonymized_identifiable = AnonymizedIdentifiable(
            resource_type=resource.get('resourceType'),
            resource_id=resource_id.value,
            resource_id_anonymized=anonymizers.hash_string()(resource_id.value, None, None)
        )

        with db.session() as session:
            if session.query(AnonymizedIdentifiable).filter_by(resource_id=anonymized_identifiable.resource_id, resource_type = resource.get('resourceType')).first() is None:
                session.add(anonymized_identifiable)
            else:
                session.query(AnonymizedIdentifiable).filter_by(resource_id=anonymized_identifiable.resource_id, resource_type = resource.get('resourceType')).update({'resource_id_anonymized': anonymized_identifiable.resource_id_anonymized})
            session.commit()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)