import tkinter as tk
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
        "network_error": "Erreur lors de l'envoi du message HL7 : "
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
        "network_error": "Error sending HL7 message: "
    }
}

def send_hl7_message():
    print("Message envoyé")

def update_labels():
    # btn_send.config(text="Send HL7 Message")
    btn_send.config(text=translations[current_language]["send"])
    btn_lang.config(text="🇬🇧" if current_language == "fr" else "🇫🇷")

window = tk.Tk()
btn_send = tk.Button(window, text="", command=send_hl7_message)
btn_send.pack()
btn_lang = tk.Button(window, text="🇬🇧", command=update_labels)
   
btn_lang.pack()
update_labels()
window.mainloop()
