import subprocess
import argparse
import random
import threading

# Données simulées pour noms et prénoms
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
    print(f"[Thread {index}] Envoi : {lastname} {firstname} ({sex})")

    cmd = [
        "python3", "tcp_hl7v2_message.py",
        "--lastname", lastname,
        "--firstname", firstname,
        "--sex", sex
    ]
    try:
        subprocess.run(cmd, check=True)
    except subprocess.CalledProcessError as e:
        print(f"[Thread {index}] Erreur lors de l'envoi : {e}")

def run_batch_requests_parallel(num_requests, max_threads):
    threads = []
    for i in range(num_requests):
        t = threading.Thread(target=send_request, args=(i+1,))
        threads.append(t)
        t.start()

        # Si trop de threads, attendre que certains finissent
        if len(threads) >= max_threads:
            for t in threads:
                t.join()
            threads = []

    # Attendre les derniers threads si encore en cours
    for t in threads:
        t.join()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Exécute plusieurs requêtes HL7 aléatoires en parallèle")
    parser.add_argument("--requests", type=int, default=10, help="Nombre d'appels HL7 à exécuter (défaut: 10)")
    parser.add_argument("--threads", type=int, default=5, help="Nombre maximum de threads en parallèle (défaut: 5)")
    args = parser.parse_args()

    run_batch_requests_parallel(args.requests, args.threads)
