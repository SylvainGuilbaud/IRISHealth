# send_hl7_tcp.py
import tkinter as tk
from tkinter import messagebox
from PIL import Image, ImageTk
import socket
from datetime import datetime, date
from tkcalendar import DateEntry
from tkinter import ttk
import logging
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

# Logger configuration
logging.basicConfig(
    filename='send_hl7_tcp.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)

def generate_random_patient_id():
    return ''.join(random.choices(string.digits, k=8))

def on_generate_id():
    new_id = generate_random_patient_id()
    entry_patient_id.delete(0, tk.END)
    entry_patient_id.insert(0, new_id)

def check_port_open(host=SERVER_IP, port=SERVER_PORT, timeout=1):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(timeout)
    result = s.connect_ex((host, port))
    s.close()
    return result == 0

def send_hl7_message():
    patient_id = entry_patient_id.get()
    first_name = entry_first_name.get()
    last_name = entry_last_name.get()
    dob = entry_dob.get()
    selected_label = gender_var.get()
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

    hl7_message = f"""MSH|^~\\&|REGADT|MCM|IFENG||{timestamp}||ADT^A01|000001|P|2.5.1|1||
EVN|A01|199601061000|199601101400|1
PID|||{patient_id}^^^HOPITAL^MRN~FR123456^^^DLNUM^DL|253763|{last_name}^{first_name}||{dob_formatted}|{gender}|||
NK1|1|DUPONT^MARIE^|EPOUSE||||ERSONNE A PREVENIR||
PV1|1|H|CARDIO^CHAMBRE201^LIT1||||004777^MARTIN^SOPHIE^DR|||CARDIO|||||ADM|A0|
PV2|||^Chirurgie Programmée||||||||||||||||||||||||||||||||||||||20240712
OBX|1|NM|21612-7^POIDS CORPOREL||52|kg|||||F
OBX|2|NM|8302-2^TAILLE||163|cm|||||F
OBX|3|NM|8480-6^PRESSION ARTERIELLE SYSTOLIQUE||154|mm[Hg]|||||F
OBX|4|NM|8462-4^PRESSION ARTERIELLE DIASTOLIQUE||87|mm[Hg]|||||F
OBX|5|NM|2339-0^GLUCOSE SANGUIN||6.2|mmol/L|3.5-5.7|H|||F
AL1|1||^AMOXICILLINE||URTICAIRE|
AL1|2||^ASPIRINE||OEDEME DE QUINCKE|
AL1|3||^ARACHIDES||CHOC ANAPHYLACTIQUE|
DG1|1|CIM10|I21.0^Infarctus transmural aigu du myocarde, de la paroi antérieure|Infarctus du myocarde||A
DG1|2|CIM10|I10^Hypertension essentielle (primitive)|Hypertension artérielle||C
DG1|3|CIM10|E11.9^Diabète sucré de type 2 sans complication|Diabète de type 2||C
PR1|1|CCAM|DDQH001^Coronarographie|Coronarographie||20240710103015
GT1|1|8291|DUPONT^JEAN^MARC^JR^M||123 RUE PRINCIPALE^^PARIS^^75001^FRA|(01)23456789||19610615|M|P/F|SLF|1234567890123||||
IN1|1|SECURITE SOCIALE|1|CPAM|||||||||||||||||||||||||||||||||||||||||||"""

    hl7_message = hl7_message.replace("\n", "\r")
    hl7_message_wrapped = START_BLOCK.encode('utf-8') + hl7_message.encode('utf-8') + END_BLOCK.encode('utf-8') + CARRIAGE_RETURN.encode('utf-8')

    try:
        if check_port_open(SERVER_IP, SERVER_PORT):
            print("Port is open")
        else:
            print("Port is closed")
            return

        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, 1)
            s.connect((SERVER_IP, SERVER_PORT))
            s.sendall(hl7_message_wrapped)
            response = s.recv(1024).decode()
            response_clean = re.sub(r'[^\x20-\x7E\r\n\t]', '\n', response)
            print(response_clean)
    except Exception as e:
        print("Erreur :", e)

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
        "generate_id": "Générer"
    }
}

gender_options_dict = {"fr": ["homme", "femme", "autre"]}
gender_code_dict = {"fr": {"homme": "M", "femme": "F", "autre": "X"}}

current_language = "fr"

window = tk.Tk()
window.geometry("1024x600")
window.title(translations[current_language]["title"])

label_patient_id = tk.Label(window, bg="#70B8EA", font=("Avenir", 23), text=translations[current_language]["generate_id"])
entry_patient_id = tk.Entry(window, bg="#03045C", font=("Avenir", 23))
entry_patient_id.insert(0, "24445670")
btn_generate_id = tk.Button(window, text="🎲 " + translations[current_language]["generate_id"], font=("Avenir", 15), bg="#03045C", command=on_generate_id)

label_first_name = tk.Label(window, bg="#70B8EA", font=("Avenir", 23), text=translations[current_language]["first_name"])
entry_first_name = tk.Entry(window, bg="#03045C", font=("Avenir", 23))
entry_first_name.insert(0, "Alice")

label_last_name = tk.Label(window, bg="#70B8EA", font=("Avenir", 23), text=translations[current_language]["last_name"])
entry_last_name = tk.Entry(window,bg="#03045C", font=("Avenir", 23))
entry_last_name.insert(0,"MUNRO")

label_dob = tk.Label(window, bg="#70B8EA", font=("Avenir", 23), text=translations[current_language]["dob"])
entry_dob = DateEntry(window, date_pattern='dd/mm/yyyy', locale='fr_FR', font=("Avenir", 23), width=12)
entry_dob.set_date(date(1931, 7, 10))
entry_dob.configure(showweeknumbers=False, state="normal")

label_gender = tk.Label(window, bg="#70B8EA", font=("Avenir", 23), text=translations[current_language]["gender"])
gender_var = tk.StringVar()
entry_gender = ttk.Combobox(window, textvariable=gender_var, state="readonly", font=("Avenir", 23))
entry_gender['values'] = gender_options_dict[current_language]
gender_var.set(gender_options_dict[current_language][1])

btn_send = tk.Button(window, bg="#03045C", text=translations[current_language]["send"], command=send_hl7_message, font=("Avenir", 15))

# Placement
label_patient_id.place(x=50, y=50)
entry_patient_id.place(x=350, y=50, width=200)
btn_generate_id.place(x=570, y=50, width=120)

label_first_name.place(x=50, y=100)
entry_first_name.place(x=350, y=100, width=200)

label_last_name.place(x=50, y=150)
entry_last_name.place(x=350, y=150, width=200)

label_dob.place(x=50, y=200)
entry_dob.place(x=350, y=200, width=200)

label_gender.place(x=50, y=250)
entry_gender.place(x=350, y=250, width=200)

btn_send.place(x=350, y=310, width=200)

window.mainloop()
