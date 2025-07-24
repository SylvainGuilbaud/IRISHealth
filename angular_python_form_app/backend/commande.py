import sys

prenom, nom, sex, dob = sys.argv[1:5]
print(f"Commande exécutée pour {prenom} {nom}, {sex}, né(e) le {dob}")