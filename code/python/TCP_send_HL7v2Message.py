import socket
# --- TCP client configuration ---
SERVER_IP = '127.0.0.1'  # Change to your HL7 receiver IP
SERVER_PORT = 2575     # MLLP port

# Encodage MLLP (Minimal Lower Layer Protocol)
START_BLOCK = '\x0b'   # VT (vertical tab)
END_BLOCK = '\x1c'     # FS (file separator)
CARRIAGE_RETURN = '\x0d'

def check_port_open(host=SERVER_IP, port=SERVER_PORT, timeout=1):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(timeout)
    result = s.connect_ex((host, port))
    s.close()
    return result == 0

if check_port_open(SERVER_IP, SERVER_PORT):
    print(f"Le port {SERVER_PORT} sur {SERVER_IP} est ouvert et accessible.")
else:
    print(f"Le port {SERVER_PORT} sur {SERVER_IP} est fermé ou non accessible.")
    exit(1)
    
hl7_message = (
    "MSH|^~\\&|REGADT|MCM|IFENG||199601061253||ADT^A01|000001|P|2.5.1|1||\r"
    "EVN|A01|199601061000|199601101400|1\r"
    "PID|||24445670^^^HOPITAL^MRN~FR123456^^^DLNUM^DL|253763|GUILBAUD^Sylvain^A||19641208|F|||77 Rue de Varenne^^PARIS^75^75007^||(01)554437765|(06)098866543|FRENCH|S|C|10199925|1641202898334566\r"
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

# Encapsulate the HL7 message with MLLP framing
START_BLOCK = START_BLOCK.encode('utf-8')
END_BLOCK = END_BLOCK.encode('utf-8')
CARRIAGE_RETURN = CARRIAGE_RETURN.encode('utf-8')   

message = START_BLOCK + hl7_message.encode('utf-8') + END_BLOCK + CARRIAGE_RETURN

def send_hl7_message(host, port):
    try:
        # Create a TCP socket and connect to the HL7 server
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, 1)
        sock.settimeout(5)  # Set a timeout for the connection
        print(f"Envoi du message HL7 vers {host}:{port}...")
        # Connect to the server and send the message
        sock.connect((host, port))
        sock.sendall(message)
        print("Message HL7 envoyé avec succès")
        # Optionally wait for an ACK response
        response = sock.recv(4096)
        print("Réponse du serveur :", response.decode(errors='ignore'))
        # sock.close()
    except socket.error as e:
        print(f"Erreur de socket : {e}")
    except Exception as e:
        print(f"Erreur lors de l'envoi du message : {e}")

if __name__ == "__main__":
    send_hl7_message(SERVER_IP, SERVER_PORT)
