from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/api/envoi', methods=['POST'])
def envoi():
    data = request.json
    prenom = data['prenom']
    nom = data['nom']
    sex = data['sex']
    dob = data['dob']

    result = subprocess.run(
        ['python3', 'commande.py', prenom, nom, sex, dob],
        capture_output=True, text=True
    )
    return jsonify({'stdout': result.stdout, 'stderr': result.stderr})

if __name__ == '__main__':
    app.run(debug=True)