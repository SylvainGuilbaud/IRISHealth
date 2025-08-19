from .anonymizers import mask, hash_string, shift_time, peusdo , birth_date_shift

names = {
    '$.name[*].family': mask(),
    '$.name[*].given[*]': mask(),
    '$.name[*].extension[*].valueString': mask()
}

address = {
    '$.address[*].line[*]': mask(),
    '$.address[*].city': mask(),
    '$.address[*].state': mask(),
    '$.address[*].postalCode': mask(),
    '$.address[*].country': mask()
}


identifiers = {
    '$.identifier[*].value': hash_string()
}

dates = {
    '$.birthDate': birth_date_shift(),
    '$.period.start': shift_time(),
    '$.period.end': shift_time()
}

contact = {
    '$.telecom[*].value': mask()
}

patient_contact = {
    '$.contact[*].telecom[*].value': mask(),
    '$.contact[*].address[*].line[*]': mask(),
    '$.contact[*].address[*].city': mask(),
    '$.contact[*].address[*].state': mask(),
    '$.contact[*].address[*].postalCode': mask(),
    '$.contact[*].address[*].country': mask(),
    '$.contact[*].name[*].family': mask(),
    '$.contact[*].name[*].given[*]': mask(),
    '$.contact[*].name[*].extension[*].valueString': mask()
}



patient = [
    names,
    address,
    identifiers,
    dates,
    contact,
    patient_contact
]

related_person = [
    names,
    identifiers,
    contact
]

encounter = [
    dates,
    identifiers
]

practitioner = [
    names,
    identifiers,
    contact
]

rules = [
    dates,
    names,
    address,
    identifiers
]