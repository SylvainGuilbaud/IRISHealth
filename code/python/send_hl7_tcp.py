import tkinter as tk
from tkinter import messagebox
from PIL import Image, ImageTk  
import socket
from datetime import datetime
from tkcalendar import DateEntry
from tkinter import ttk
import logging
from datetime import date
import re
import random
import string

# --- TCP client configuration ---
SERVER_IP = '127.0.0.1'
SERVER_PORT = 2575

# Encodage MLLP
START_BLOCK = '\x0b'
END_BLOCK = '\x1c'
CARRIAGE_RETURN = '\x0d'


def generate_random_hl7_message():
    patient_id = entry_patient_id.get()
    first_name = entry_first_name.get()
    last_name = entry_last_name.get()
    dob = entry_dob.get()
    selected_label = gender_var.get()  # exemple: "femme"
    gender = gender_code_dict[current_language][selected_label]

    if not all([patient_id, first_name, last_name, dob, gender]):
        messagebox.showwarning("", translations[current_language]["error_fields"])
        return

    try:
        dob_formatted = datetime.strptime(dob, "%d/%m/%Y").strftime("%Y%m%d")
    except ValueError:
        messagebox.showerror("", translations[current_language]["error_date"])
        return

    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    # Génération des données aléatoires   
    poids = round(random.uniform(50, 100), 1)
    taille = random.randint(150, 200)
    pas = random.randint(110, 180)
    pad = random.randint(60, 100)
    glucose = round(random.uniform(4.0, 8.0), 1)
    glucose_flag = "H" if glucose > 5.7 else "N"

    # Construction du message HL7
    hl7_message = f"""MSH|^~\\&|REGADT|MCM|IFENG||{timestamp}||ADT^A01|000001|P|2.5.1|1||
EVN|A01|{timestamp}|{timestamp}|1
PID|||{patient_id}^^^HOPITAL^MRN~FR{random.randint(100000,999999)}^^^DLNUM^DL|253763|{last_name}^{first_name}||{dob_formatted}|{gender}|||77 Rue de Varenne^^PARIS^75^75007^||(01)554437765|(06)098866543|FRENCH|S|C|10199925|1641202898334566
NK1|1|DUPONT^MARIE^|EPOUSE||||PERSONNE A PREVENIR||
PV1|1|H|CARDIO^CHAMBRE201^LIT1||||004777^MARTIN^SOPHIE^DR|||CARDIO|||||ADM|A0|
PV2|||^Chirurgie Programmée||||||||||||||||||||||||||||||||||||||20240712
OBX|1|NM|21612-7^POIDS CORPOREL||{poids}|kg|||||F
OBX|2|NM|8302-2^TAILLE||{taille}|cm|||||F
OBX|3|NM|8480-6^PRESSION ARTERIELLE SYSTOLIQUE||{pas}|mm[Hg]|||||F
OBX|4|NM|8462-4^PRESSION ARTERIELLE DIASTOLIQUE||{pad}|mm[Hg]|||||F
OBX|5|NM|2339-0^GLUCOSE SANGUIN||{glucose}|mmol/L|3.5-5.7|{glucose_flag}|||F
AL1|1||^AMOXICILLINE||URTICAIRE|
AL1|2||^ASPIRINE||OEDEME DE QUINCKE|
AL1|3||^ARACHIDES||CHOC ANAPHYLACTIQUE|
DG1|1|CIM10|I21.0^Infarctus transmural aigu du myocarde, de la paroi antérieure|Infarctus du myocarde||A
DG1|2|CIM10|I10^Hypertension essentielle (primitive)|Hypertension artérielle||C
DG1|3|CIM10|E11.9^Diabète sucré de type 2 sans complication|Diabète de type 2||C
PR1|1|CCAM|DDQH001^Coronarographie|Coronarographie||{timestamp}
GT1|1|8291|DUPONT^JEAN^MARC^JR^M||123 RUE PRINCIPALE^^PARIS^^75001^FRA|(01)23456789||19610615|M|P/F|SLF|1234567890123||||
IN1|1|SECURITE SOCIALE|1|CPAM|||||||||||||||||||||||||||||||||||||||||||"""

    
    return hl7_message


# Logger configuration
logging.basicConfig(
    filename='send_hl7_tcp.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)

def generate_random_patient_id():
    return ''.join(random.choices(string.digits, k=8))

def generate_random_first_name():
    # renvoyer des prénoms internationaux parmi une liste de 500
    first_names = ["Alice", "Bob", "Charlie", "David", "Eva", "Frank", "Grace", "Hannah", "Ian", "Julia"]
    return random.choice(first_names)

def generate_random_last_name():
    last_names = ["Dupont", "Martin", "Bernard", "Thomas", "Petit", "Durand", "Leroy", "Moreau", "Simon", "Michel"]
    return random.choice(last_names)

def generate_random_dob():
    year = random.randint(1950, 2024)
    month = random.randint(1, 12)
    day = random.randint(1, 28)  # Pour simplifier, on limite à 28 jours
    return f"{day:02d}/{month:02d}/{year}"

def generate_random_gender():
    return random.choice(["homme", "femme"])

def on_generate_data():
    new_patient_id = generate_random_patient_id()
    entry_patient_id.delete(0, tk.END)
    entry_patient_id.insert(0, new_patient_id)
    entry_first_name.delete(0, tk.END)
    entry_first_name.insert(0, generate_random_first_name())
    entry_last_name.delete(0, tk.END)
    entry_last_name.insert(0, generate_random_last_name())
    entry_dob.delete(0, tk.END)
    entry_dob.insert(0, generate_random_dob())
    entry_gender.delete(0, tk.END)
    entry_gender.insert(0, generate_random_gender())

def highlight_lines_with(keyword, tag="highlight"):
    log_text.configure(state="normal")
    log_text.tag_remove(tag, "1.0", tk.END)  # nettoyer les anciens surlignages
    start = "1.0"
    while True:
        pos = log_text.search(keyword, start, stopindex=tk.END)
        if not pos:
            break
        end = f"{pos} lineend"
        log_text.tag_add(tag, pos, end)
        start = end
    log_text.configure(state="disabled")
    
def highlight_log_keywords():
    log_text.configure(state="normal")
    log_text.tag_remove("error", "1.0", tk.END)
    log_text.tag_remove("ack", "1.0", tk.END)
    log_text.tag_remove("message", "1.0", tk.END)

    keywords = {
        "Erreur": "error",
        "ACK": "ack",
        "Message HL7 généré": "message"
    }

    for keyword, tag in keywords.items():
        start = "1.0"
        while True:
            pos = log_text.search(keyword, start, stopindex=tk.END)
            if not pos:
                break
            end = f"{pos} lineend"
            log_text.tag_add(tag, pos, end)
            start = end

    log_text.configure(state="disabled")

def highlight_pid_segment():
    log_text.configure(state="normal")
    log_text.tag_remove("pid_segment", "1.0", tk.END)
    log_text.tag_remove("important_value", "1.0", tk.END)

    start = "1.0"
    while True:
        pos = log_text.search("PID|", start, stopindex=tk.END)
        if not pos:
            break
        end = f"{pos} lineend"
        log_text.tag_add("pid_segment", pos, end)

        line_content = log_text.get(pos, end)
        fields = line_content.split("|")

        # Construire un index caractère → champ
        field_start_indices = []
        cursor = 0
        for field in fields:
            field_start_indices.append(cursor)
            cursor += len(field) + 1  # +1 pour le séparateur "|"

        # Marquer le champ 3 : PID
        if len(fields) > 3:
            pid_field = fields[3]
            subfields = pid_field.split("^")
            # marque le premier sous-champ uniquement
            if subfields:
                log_text.tag_add("important_value", f"{pos}+{field_start_indices[3]}c", f"{pos}+{field_start_indices[3]+len(subfields[0])}c")

        # Marquer le champ 5 : Nom^Prénom
        if len(fields) > 5:
            name_field = fields[5]
            subfields = name_field.split("^")
            if subfields:
                field_start = field_start_indices[5]
                current_offset = 0
                for part in subfields:
                    if part:
                        part_start = field_start + current_offset
                        part_end = part_start + len(part)
                        tag_start = f"{pos}+{part_start}c"
                        tag_end = f"{pos}+{part_end}c"
                        log_text.tag_add("important_value", tag_start, tag_end)
                    current_offset += len(part) + 1  # +1 for the "^"

        # Marquer le champ 7 : Date de naissance
        if len(fields) > 7 and fields[7]:
            dob_start = field_start_indices[7]
            dob_end = dob_start + len(fields[7])
            log_text.tag_add("important_value", f"{pos}+{dob_start}c", f"{pos}+{dob_end}c")

        # Marquer le champ 8 : Sexe
        if len(fields) > 8 and fields[8]:
            sex_start = field_start_indices[8]
            sex_end = sex_start + len(fields[8])
            log_text.tag_add("important_value", f"{pos}+{sex_start}c", f"{pos}+{sex_end}c")

        start = end

    log_text.configure(state="disabled")

    
def append_to_log_console(text):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    log_text.configure(state="normal")
    log_text.insert(tk.END, f"{timestamp} - {text}\n")
    log_text.see(tk.END)
    log_text.configure(state="disabled")
    highlight_log_keywords() 
    highlight_pid_segment()  

def check_port_open(host=SERVER_IP, port=SERVER_PORT, timeout=1):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(timeout)
    result = s.connect_ex((host, port))
    s.close()
    return result == 0

current_language = "fr"

translations = {
    "fr": {
        "title": "Formulaire Dossier Patient",
        "first_name": "Prénom",
        "last_name": "Nom",
        "dob": "Date de naissance (JJ/MM/AAAA)",
        "gender": "Sexe",
        "send": "Envoyer Message HL7",
        "error_fields": "Veuillez remplir tous les champs.",
        "error_date": "Format de date invalide. Utilisez JJ/MM/AAAA.",
        "success": "Message HL7 envoyé avec succès.",
        "network_error": "Erreur lors de l'envoi du message HL7 : ",
        "port_open": f"Le port {SERVER_PORT} sur {SERVER_IP} est ouvert et accessible.",
        "port_closed": f"Le port {SERVER_PORT} sur {SERVER_IP} est fermé ou non accessible.",
        "hl7_generated": "Message HL7 généré:",
        "send_error":"Erreur lors de l'envoi HL7 :",
        "response_received": "réponse reçue:",
        "patient_id": "Identifiant du patient"

    },
    "en": {
        "title": "Patient Record Form",
        "first_name": "First Name",
        "last_name": "Last Name",
        "dob": "Date of Birth (DD/MM/YYYY)",
        "gender": "Gender",
        "send": "Send HL7 Message",
        "error_fields": "Please fill in all fields.",
        "error_date": "Invalid date format. Use DD/MM/YYYY.",
        "success": "HL7 message sent successfully.",
        "network_error": "Error sending HL7 message: ",
        "port_open": f"Port {SERVER_PORT} on {SERVER_IP} is open and accessible.",
        "port_closed": f"Port {SERVER_PORT} on {SERVER_IP} is closed or not accessible.",
        "hl7_generated": "HL7 message generated:",
        "send_error":"Error sending HL7 :",
        "response_received": "response received:",
        "patient_id": "Patient ID"

    },
    "es": {
        "title": "Formulario de Registro de Paciente",
        "first_name": "Nombre",
        "last_name": "Apellido",
        "dob": "Fecha de nacimiento (DD/MM/AAAA)",
        "gender": "Género",
        "send": "Enviar mensaje HL7",
        "error_fields": "Por favor complete todos los campos.",
        "error_date": "Formato de fecha inválido. Use DD/MM/AAAA.",
        "success": "Mensaje HL7 enviado con éxito.",
        "network_error": "Error al enviar el mensaje HL7: ",
        "port_open": f"El puerto {SERVER_PORT} en {SERVER_IP} está abierto y accesible.",
        "port_closed": f"El puerto {SERVER_PORT} en {SERVER_IP} está cerrado o no es accesible.",
        "hl7_generated": "Mensaje HL7 generado:",
        "send_error":"Error al enviar HL7 :",
        "response_received": "respuesta recibida:",
        "patient_id": "Identificador del paciente"
    }
}

gender_options_dict = {
    "fr": ["homme", "femme", "autre"],
    "en": ["male", "female", "other"],
    "es": ["hombre", "mujer", "otro"]
}

gender_code_dict = {
    "fr": {
        "homme": "M",
        "femme": "F",
        "autre": "X"
    },
    "en": {
        "male": "M",
        "female": "F",
        "other": "X"
    },
    "es": {
    "hombre": "M",
    "mujer": "F",
    "otro": "X"
}
}
    
def send_hl7_message():
            
#     # Exemple de message HL7        
#     hl7_message = f"""MSH|^~\\&|REGADT|MCM|IFENG||{timestamp}||ADT^A01|000001|P|2.5.1|1||
# EVN|A01|199601061000|199601101400|1
# PID|||{patient_id}^^^HOPITAL^MRN~FR123456^^^DLNUM^DL|253763|{last_name}^{first_name}||{dob_formatted}|{gender}|||77 Rue de Varenne^^PARIS^75^75007^||(01)554437765|(06)098866543|FRENCH|S|C|10199925|1641202898334566
# NK1|1|DUPONT^MARIE^|EPOUSE||||ERSONNE A PREVENIR||
# PV1|1|H|CARDIO^CHAMBRE201^LIT1||||004777^MARTIN^SOPHIE^DR|||CARDIO|||||ADM|A0|
# PV2|||^Chirurgie Programmée||||||||||||||||||||||||||||||||||||||20240712
# OBX|1|NM|21612-7^POIDS CORPOREL||52|kg|||||F
# OBX|2|NM|8302-2^TAILLE||163|cm|||||F
# OBX|3|NM|8480-6^PRESSION ARTERIELLE SYSTOLIQUE||154|mm[Hg]|||||F
# OBX|4|NM|8462-4^PRESSION ARTERIELLE DIASTOLIQUE||87|mm[Hg]|||||F
# OBX|5|NM|2339-0^GLUCOSE SANGUIN||6.2|mmol/L|3.5-5.7|H|||F
# AL1|1||^AMOXICILLINE||URTICAIRE|
# AL1|2||^ASPIRINE||OEDEME DE QUINCKE|
# AL1|3||^ARACHIDES||CHOC ANAPHYLACTIQUE|
# DG1|1|CIM10|I21.0^Infarctus transmural aigu du myocarde, de la paroi antérieure|Infarctus du myocarde||A
# DG1|2|CIM10|I10^Hypertension essentielle (primitive)|Hypertension artérielle||C
# DG1|3|CIM10|E11.9^Diabète sucré de type 2 sans complication|Diabète de type 2||C
# PR1|1|CCAM|DDQH001^Coronarographie|Coronarographie||20240710103015
# GT1|1|8291|DUPONT^JEAN^MARC^JR^M||123 RUE PRINCIPALE^^PARIS^^75001^FRA|(01)23456789||19610615|M|P/F|SLF|1234567890123||||
# IN1|1|SECURITE SOCIALE|1|CPAM|||||||||||||||||||||||||||||||||||||||||||"""
    hl7_message = generate_random_hl7_message()
    hl7_message = hl7_message.replace("\n", "\r")
    hl7_message_wrapped = START_BLOCK.encode('utf-8') + hl7_message.encode('utf-8') + END_BLOCK.encode('utf-8') + CARRIAGE_RETURN.encode('utf-8')
    
    # hl7_wrapped = f'\x0b{hl7_message}\x1c\r'
    try:
        
        if check_port_open(SERVER_IP, SERVER_PORT):
            message = translations[current_language]["port_open"]

            logging.info(message)
            append_to_log_console(message)
        else:
            message = translations[current_language]["port_closed"]
            logging.info(message)
            append_to_log_console(message)
            exit(1)

        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                
            logging.info("%s:\n%s", translations[current_language]["hl7_generated"], hl7_message.replace("\r", "\n"))
            append_to_log_console(translations[current_language]["hl7_generated"] + hl7_message.replace("\r", "\n"))
            
            s.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, 1)
            s.connect((SERVER_IP, SERVER_PORT))
            s.sendall(hl7_message_wrapped)
            response = s.recv(1024).decode()
            response_clean = re.sub(r'[^\x20-\x7E\r\n\t]', '\n', response)
            # messagebox.showinfo("", f"{translations[current_language]['success']}\n{response}")
            
            logging.info("%s:\n%s", translations[current_language]["response_received"], response_clean.replace("\r", "\n"))
            append_to_log_console(translations[current_language]["response_received"] + response_clean.replace("\r", "\n"))

    except Exception as e:
        logging.error("%s:\n%s", translations[current_language]["send_error"], str(e))
        append_to_log_console(translations[current_language]["send_error"] + str(e))
        # messagebox.showerror("", translations[current_language]["network_error"] + str(e))

languages = ["fr", "en", "es"]    
def switch_language():
    global current_language
    index = languages.index(current_language)
    current_language = languages[(index + 1) % len(languages)]
    update_labels()
    
def update_labels():
    window.title(translations[current_language]["title"])
    label_patient_id.config(text=translations[current_language]["patient_id"])
    label_first_name.config(text=translations[current_language]["first_name"])
    label_last_name.config(text=translations[current_language]["last_name"])
    label_dob.config(text=translations[current_language]["dob"])
    label_gender.config(text=translations[current_language]["gender"])
    btn_send.config(text=translations[current_language]["send"])

    # Mettre à jour le drapeau 🇫🇷 / 🇬🇧 / 🇪🇸
    flag_map = {"fr": "🇫🇷", "en": "🇬🇧", "es": "🇪🇸"}
    btn_lang.config(text=flag_map[current_language])

    # Mise à jour des options du genre
    entry_gender['values'] = gender_options_dict[current_language]
    gender_var.set(gender_options_dict[current_language][1])

# Fenêtre principale
window = tk.Tk()
window.geometry("1728x1117")
window.title(translations[current_language]["title"])

# Canvas pour le fond
canvas = tk.Canvas(window, width=1728, height=1117, bg="#70B8EA")
canvas.pack(fill="both", expand=True)

# Chargement images
bg_image = Image.open("hopital.jpg").resize((800, 600))
bg_photo = ImageTk.PhotoImage(bg_image)

logo_image = Image.open("IS_logo.jpg").resize((200, 64))

logo_photo = ImageTk.PhotoImage(logo_image)

# Ajout fond
canvas.create_image(928, 0, image=bg_photo, anchor="nw")

canvas.create_image(1525, 984, image=logo_photo, anchor="nw")

# Widgets sur canvas
entry = tk.Entry(window, font=("Avenir", 23))

label_patient_id = tk.Label(window, bg="#70B8EA", font=("Avenir", 23), text=translations[current_language]["patient_id"])
entry_patient_id = tk.Entry(window, bg="#03045C", font=("Avenir", 23))
entry_patient_id.insert(0, "24445670")
btn_generate_data = tk.Button(window, text="🎲", font=("Avenir", 15), bg="#03045C", command=on_generate_data)

label_first_name = tk.Label(window, bg="#70B8EA", font=("Avenir", 23))
entry_first_name = tk.Entry(window, bg="#03045C", font=("Avenir", 23))
entry_first_name.insert(0, "Alice")

label_last_name = tk.Label(window, bg="#70B8EA", font=("Avenir", 23))
entry_last_name = tk.Entry(window,bg="#03045C", font=("Avenir", 23))
entry_last_name.insert(0,"MUNRO")

label_dob = tk.Label(window, bg="#70B8EA", font=("Avenir", 23))
# entry_dob = tk.Entry(window,bg="#03045C", font=("Avenir", 23))

entry_dob = DateEntry(window, date_pattern='dd/mm/yyyy', locale='fr_FR', font=("Avenir", 23), width=12)
entry_dob.set_date(date(1931, 7, 10))
entry_dob.configure(showweeknumbers=False, state="normal")
entry_dob._top_cal.overrideredirect(True)  # empêche l'ouverture du calendrier (non documenté)

label_gender = tk.Label(window, bg="#70B8EA", font=("Avenir", 23))

gender_var = tk.StringVar()
entry_gender = ttk.Combobox(window, textvariable=gender_var, state="readonly", font=("Avenir", 23))
entry_gender.set(gender_options_dict[current_language][1]) 

btn_send = tk.Button(window, bg="#03045C", text="", command=send_hl7_message, font=("Avenir", 15))
btn_lang = tk.Button(window, bg="#03045C",text="🇬🇧", command=switch_language, font=("Avenir", 23))

label_patient_id.place(x=50, y=50)
entry_patient_id.place(x=550, y=50, width=200)
btn_generate_data.place(x=745, y=50, height=43)

label_first_name.place(x=50, y=100)
entry_first_name.place(x=550, y=100, width=200)

label_last_name.place(x=50, y=150)
entry_last_name.place(x=550, y=150, width=200)

label_dob.place(x=50, y=200)
entry_dob.place(x=550, y=200, width=200)

label_gender.place(x=50, y=250)
entry_gender.place(x=550, y=250, width=200)

btn_send.place(x=550, y=310, width=200)
btn_lang.place(x=0, y=0, width=50)

# Zone de log affichée dans l'interface
log_text = tk.Text(window, height=30, width=212, bg="#190554", font=("Monaco", 11))

# Style pour le segment PID
log_text.tag_config(
    "pid_segment",
    background="#f8f4e6",               # beige clair
    foreground="#003366",               # bleu foncé
    font=("Monaco", 12, "bold")         # police fixe + gras
)

# Style pour les champs importants (nom, prénom, etc.)
log_text.tag_config("important_value", underline=True, foreground="red")

# Définir des styles de surlignage
log_text.tag_config("error", background="misty rose", foreground="red")
log_text.tag_config("ack", background="light green", foreground="dark green")

log_text.place(x=20, y=600)
# log_text.configure(state="disabled")  # lecture seule

log_text.tag_config("highlight", background="yellow", foreground="black")

# log_text.tag_add("highlight", "1.0", "1.20")  # surligne les 20 premiers caractères de la ligne 3

highlight_lines_with("PID")

update_labels()
window.mainloop()
