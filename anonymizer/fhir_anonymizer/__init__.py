from jsonpath_ng import parse

def anonymize_fhir_data(fhir_json, rules):
    """
    Anonymize FHIR data based on provided rules.
    """
    for (path,rule) in rules.items():
        jsonpath_expr = parse(path)
        jsonpath_expr.find(fhir_json)
        jsonpath_expr.update(fhir_json, rule)
    return fhir_json
