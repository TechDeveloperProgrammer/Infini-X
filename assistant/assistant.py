#!/usr/bin/env python3

import os
import sys

def main():
    print("Infini-X Assistant - Local AI Integration")
    print("This script provides an interface to the local AI capabilities of Infini-X OS.")
    print("Available AI modules:")
    print("  - Speech-to-Text (Whisper): `python assistant/whisper_runner.py <audio_file>`")
    print("  - Text-to-Speech (Piper): `./assistant/piper_speak.sh "Your text"`")
    print("  - Voice Modulation (RVC): `python assistant/rvc_modulator.py <input_audio> <output_audio> <model_path>`")
    print("  - Voice Conversion (So-VITS): `./assistant/so-vits-infer.sh <input_audio> <output_audio> <model_config>`")
    print("Ensure necessary models are downloaded and placed in appropriate directories.")

if __name__ == "__main__":
    main()