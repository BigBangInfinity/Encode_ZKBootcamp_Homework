import os
import subprocess
from flaskcors import CORS
from flask import Flask, request, jsonify


app = Flask(name)
CORS(app)


@app.route('/generate-proof', methods=['POST'])
def generateproof():
    address = request.json.get('address')
    decimaladdress = int(address, 16)

    # Change directory to ZoKrates directory
    zokratesdir = '/home/moreira/Desktop/faculdade/TESE/initial-pilot/ZoKrates/parhmacy'

    os.chdir(zokrates_dir)

    # Execute zokrates compute-witness command
    compute_witness_command = ['zokrates', 'compute-witness', '-a', str(decimal_address), str(decimal_address), '22', '2312', '1234', '4444', '3333', '1234']
    process = subprocess.Popen(compute_witness_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()

    if process.returncode != 0:
        print(f"Error executing compute-witness command: {stderr.decode()}")
        return jsonify({'error': 'Error generating proof'}), 500

    # Execute zokrates generate-proof command
    generate_proof_command = ['zokrates', 'generate-proof']
    process = subprocess.Popen(generate_proof_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()

    if process.returncode != 0:
        print(f"Error executing generate-proof command: {stderr.decode()}")
        return jsonify({'error': 'Error generating proof'}), 500

    proof_file_path = os.path.join(zokrates_dir, 'proof.json')
    with open(proof_file_path, 'r') as proof_file:
        proof = proof_file.read()

    return jsonify({'proof': proof})


if __name == '__main':
    app.run(debug=True)