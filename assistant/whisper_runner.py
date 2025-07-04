
#!/usr/bin/env python3

# whisper_runner.py - Speech-to-Text using OpenAI Whisper

import argparse
import os
import sys

try:
    import whisper
except ImportError:
    print("Error: OpenAI Whisper library not found. Please install it: pip install openai-whisper")
    sys.exit(1)

def transcribe_audio(audio_path, model_name="base"):
    """Transcribes an audio file using the specified Whisper model."""
    if not os.path.exists(audio_path):
        print(f"Error: Audio file not found at {audio_path}")
        sys.exit(1)

    print(f"Loading Whisper model: {model_name}...")
    try:
        model = whisper.load_model(model_name)
    except Exception as e:
        print(f"Error loading Whisper model: {e}")
        print("Please ensure the model name is correct and it's downloaded.")
        sys.exit(1)

    print(f"Transcribing audio: {audio_path}...")
    try:
        result = model.transcribe(audio_path)
    except Exception as e:
        print(f"Error during transcription: {e}")
        sys.exit(1)

    return result["text"]

def main():
    parser = argparse.ArgumentParser(description="Transcribe audio using OpenAI Whisper.")
    parser.add_argument("audio_file", help="Path to the audio file to transcribe.")
    parser.add_argument("--model", default="base", help="Whisper model to use (e.g., tiny, base, small, medium, large). Models are downloaded to ~/.cache/whisper.")

    args = parser.parse_args()

    transcribed_text = transcribe_audio(args.audio_file, args.model)
    print("\n--- Transcribed Text ---")
    print(transcribed_text)
    print("------------------------")

if __name__ == "__main__":
    main()
