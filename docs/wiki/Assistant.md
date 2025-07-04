# Infini-X Local AI Assistant

Infini-X OS integrates powerful local AI capabilities, allowing you to perform Speech-to-Text (STT), Text-to-Speech (TTS), and voice modulation entirely offline.

## Components

The AI assistant is built around the following open-source projects:

-   **Whisper (STT):** Developed by OpenAI, Whisper is a robust speech recognition model that can transcribe audio into text.
-   **Piper (TTS):** A fast and high-quality neural text-to-speech system.
-   **RVC (Retrieval-based Voice Conversion):** A voice conversion tool that can change the timbre of a voice while preserving the intonation.
-   **So-VITS-SVC (SoftVC VITS Singing Voice Conversion):** Another voice conversion tool, often used for singing voice synthesis.

## Usage

### Speech-to-Text (Whisper)

To transcribe an audio file:

```bash
python assistant/whisper_runner.py <path_to_audio_file>
```

### Text-to-Speech (Piper)

To convert text to speech:

```bash
./assistant/piper_speak.sh "Your text here to be spoken."
```

### Voice Modulation (RVC)

To modulate an audio file using an RVC model:

```bash
python assistant/rvc_modulator.py <input_audio.wav> <output_audio.wav> <path_to_rvc_model>
```

### Voice Conversion (So-VITS-SVC)

To perform voice conversion using a So-VITS model:

```bash
./assistant/so-vits-infer.sh <input_audio.wav> <output_audio.wav> <path_to_model_config>
```

## Model Management

AI models (for Whisper, Piper, RVC, So-VITS) are typically large files. Infini-X OS will provide tools and documentation for managing these models, including:

-   **Downloading:** Scripts or utilities to download pre-trained models.
-   **Storage:** Recommendations for storing models efficiently.
-   **Switching:** Easy ways to switch between different models for various tasks.

## Offline Operation

A key advantage of Infini-X OS's AI integration is its ability to function completely offline. Once the models are downloaded, no internet connection is required for STT, TTS, or voice modulation.
