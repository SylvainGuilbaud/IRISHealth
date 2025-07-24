# appel_hl7_parallel_mp.py
import subprocess
import argparse
import random
from multiprocessing import Pool, cpu_count

firstnames_male = ["Homer", "Jean", "Pierre", "Luc", "Thomas", "Nicolas", "Antoine"]
firstnames_female = ["Lisa", "Marie", "Claire", "Julie", "Anne", "Aline", "Camille"]
lastnames = ["SIMPSON", "DUPONT", "MARTIN", "LEROY", "MOREAU", "GARNIER", "LEGRAND"]

def generate_random_identity():
    sex = random.choice(['M', 'F'])
    firstname = random.choice(firstnames_male if sex == 'M' else firstnames_female)
    lastname = random.choice(lastnames)
    return lastname, firstname, sex

def send_request(index):
    lastname, firstname, sex = generate_random_identity()
    print(f"[Process {index}] Envoi : {lastname} {firstname} ({sex})")

    cmd = [
        "python3", "tcp_hl7v2_message.py",
        "--lastname", lastname,
        "--firstname", firstname,
        "--sex", sex
    ]
    try:
        subprocess.run(cmd, check=True)
    except subprocess.CalledProcessError as e:
        print(f"[Process {index}] Erreur lors de l'envoi : {e}")

def run_batch_requests_parallel(num_requests, max_procs):
    with Pool(processes=max_procs) as pool:
        pool.map(send_request, range(1, num_requests + 1))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Envoi multi-process de requêtes HL7")
    parser.add_argument("--requests", type=int, default=10, help="Nombre d'appels HL7 (défaut: 10)")
    parser.add_argument("--procs", type=int, default=cpu_count(), help="Nombre de processus (défaut: nb cœurs CPU)")
    args = parser.parse_args()

    run_batch_requests_parallel(args.requests, args.procs)
