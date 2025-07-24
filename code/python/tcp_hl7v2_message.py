# tcp_hl7v2_message.py
import argparse
import time

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--lastname", required=True)
    parser.add_argument("--firstname", required=True)
    parser.add_argument("--sex", required=True)
    args = parser.parse_args()

    # Simuler un traitement HL7
    print(f"[tcp_hl7v2_message.py] Traitement : {args.lastname} {args.firstname} ({args.sex})")
    time.sleep(1)  # Simule un envoi TCP HL7

if __name__ == "__main__":
    main()
