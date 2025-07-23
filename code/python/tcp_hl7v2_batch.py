import subprocess
import argparse
import random

# Données simulées pour noms et prénoms
firstnames_male = ["Homer", "Jean", "Pierre", "Luc", "Thomas", "Nicolas", "Antoine"]
firstnames_female = ["Lisa", "Marie", "Claire", "Julie", "Anne", "Aline", "Camille"]
lastnames = ["SIMPSON", "DUPONT", "MARTIN", "LEROY", "MOREAU", "GARNIER", "LEGRAND"]

def generate_random_identity():
    sex = random.choice(['M', 'F'])
    firstname = random.choice(firstnames_male if sex == 'M' else firstnames_female)
    lastname = random.choice(lastnames)
    return lastname, firstname, sex

def run_batch_requests(num_requests):
    for i in range(num_requests):
        lastname, firstname, sex = generate_random_identity()
        print(f"Envoi #{i+1} : {lastname} {firstname} ({sex})")

        cmd = [
            "python3", "tcp_hl7v2_message.py",
            "--lastname", lastname,
            "--firstname", firstname,
            "--sex", sex
        ]
        try:
            subprocess.run(cmd, check=True)
        except subprocess.CalledProcessError as e:
            print(f"Erreur lors de l'envoi #{i+1} : {e}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Exécute plusieurs requêtes HL7 aléatoires")
    parser.add_argument("--requests", type=int, default=10, help="Nombre d'appels HL7 à exécuter (défaut: 10)")
    args = parser.parse_args()

    run_batch_requests(args.requests)
