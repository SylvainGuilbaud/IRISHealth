import socket
import argparse

# --- TCP client configuration ---
SERVER_IP = '127.0.0.1'
SERVER_PORT = 2575

# Encodage MLLP
START_BLOCK = '\x0b'
END_BLOCK = '\x1c'
CARRIAGE_RETURN = '\x0d'

def check_port_open(host=SERVER_IP, port=SERVER_PORT, timeout=1):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(timeout)
    result = s.connect_ex((host, port))
    s.close()
    return result == 0

def build_hl7_message(lastname, firstname, sex):
    return (
        "MSH|^~\\&|REGADT|MCM|IFENG||199601061253||ADT^A01|000001|P|2.5.1|1||\r"
        "EVN|A01|199601061000|199601101400|1\r"
        f"PID|||24445670^^^HOPITAL^MRN~FR123456^^^DLNUM^DL|253763|{lastname}^{firstname}^||19641208|{sex}|||77 Rue de Varenne^^PARIS^75^75007^||(01)554437765|(06)098866543|FRENCH|S|C|10199925|1641202898334566\r"
        "NK1|1|DUPONT^MARIE^|EPOUSE||||ERSONNE A PREVENIR||\r"
        "PV1|1|H|CARDIO^CHAMBRE201^LIT1||||004777^MARTIN^SOPHIE^DR|||CARDIO|||||ADM|A0|\r"
        "PV2|||^Chirurgie Programmée||||||||||||||||||||||||||||||||||||||20240712\r"
        "OBX|1|NM|21612-7^POIDS CORPOREL||52|kg|||||F\r"
        "OBX|2|NM|8302-2^TAILLE||163|cm|||||F\r"
        "OBX|3|NM|8480-6^PRESSION ARTERIELLE SYSTOLIQUE||154|mm[Hg]|||||F\r"
        "OBX|4|NM|8462-4^PRESSION ARTERIELLE DIASTOLIQUE||87|mm[Hg]|||||F\r"
        "OBX|5|NM|2339-0^GLUCOSE SANGUIN||6.2|mmol/L|3.5-5.7|H|||F\r"
        "AL1|1||^AMOXICILLINE||URTICAIRE|\r"
        "AL1|2||^ASPIRINE||OEDEME DE QUINCKE|\r"
        "AL1|3||^ARACHIDES||CHOC ANAPHYLACTIQUE|\r"
        "DG1|1|CIM10|I21.0^Infarctus transmural aigu du myocarde, de la paroi antérieure|Infarctus du myocarde||A\r"
        "DG1|2|CIM10|I10^Hypertension essentielle (primitive)|Hypertension artérielle||C\r"
        "DG1|3|CIM10|E11.9^Diabète sucré de type 2 sans complication|Diabète de type 2||C\r"
        "PR1|1|CCAM|DDQH001^Coronarographie|Coronarographie||20240710103015\r"
        "GT1|1|8291|DUPONT^JEAN^MARC^JR^M||123 RUE PRINCIPALE^^PARIS^^75001^FRA|(01)23456789||19610615|M|P/F|SLF|1234567890123||||\r"
        "IN1|1|SECURITE SOCIALE|1|CPAM|||||||||||||||||||||||||||||||||||||||||||\r"
    )

def send_hl7_message(host, port, hl7_message):
    message = START_BLOCK.encode('utf-8') + hl7_message.encode('utf-8') + END_BLOCK.encode('utf-8') + CARRIAGE_RETURN.encode('utf-8')
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, 1)
        sock.settimeout(5)
        print(f"Envoi du message HL7 vers {host}:{port}...")
        sock.connect((host, port))
        sock.sendall(message)
        print("Message HL7 envoyé avec succès")
        response = sock.recv(4096)
        print("Réponse du serveur :", response.decode(errors='ignore'))
    except socket.error as e:
        print(f"Erreur de socket : {e}")
    except Exception as e:
        print(f"Erreur lors de l'envoi du message : {e}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Client HL7 avec paramètres PID")
    parser.add_argument("--lastname", required=True, help="Nom du patient")
    parser.add_argument("--firstname", required=True, help="Prénom du patient")
    parser.add_argument("--sex", required=True, help="Sexe du patient (M/F)")

    args = parser.parse_args()

    if check_port_open(SERVER_IP, SERVER_PORT):
        print(f"Le port {SERVER_PORT} sur {SERVER_IP} est ouvert et accessible.")
        hl7_msg = build_hl7_message(args.lastname.upper(), args.firstname.capitalize(), args.sex.upper())
        send_hl7_message(SERVER_IP, SERVER_PORT, hl7_msg)
    else:
        print(f"Le port {SERVER_PORT} sur {SERVER_IP} est fermé ou non accessible.")
        exit(1)
