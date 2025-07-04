# Infini-X Offline AI Assistant

This directory contains scripts and configurations for integrating various offline AI capabilities into the Infini-X ecosystem. The goal is to provide local, privacy-focused AI functionalities without relying on cloud services.

## Components
- `whisper_runner.py`: Script for speech-to-text transcription using OpenAI's Whisper model.
- `piper_speak.sh`: Script for text-to-speech synthesis using the Piper (Rust) engine.
- `rvc_modulator.py`: Script for voice conversion using Retrieval-based Voice Conversion (RVC).
- `so-vits-infer.sh`: Script for singing voice synthesis using So-VITS SVC.
- `requirements.txt`: Python dependencies for the Python-based AI scripts.
- `models/`: Directory to conceptually store AI models.
- `README.md`: This file.

## Dependencies

### Python Dependencies
Install Python dependencies using pip:
```bash
pip install -r requirements.txt
```

### External Tools
- **Whisper**: Requires the `whisper` Python package and specific model files (e.g., `base.pt`, `large-v2.pt`). These models are typically downloaded automatically by the `whisper` library or can be placed in `~/.cache/whisper`.
- **Piper**: Requires the `piper` executable (Rust version 0.11+). You might need to build it from source or download a pre-compiled binary. Also requires `.onnx` model files and their corresponding `.json` config files.
- **RVC / So-VITS**: These typically require a PyTorch environment (version 2.x recommended) and specific model weights (`.pth` files) and index files (`.index` files). Setting them up can be complex and might involve cloning their respective repositories and following their installation instructions.

## Usage

### Whisper (Speech-to-Text)
```bash
python whisper_runner.py <audio_file.wav> --model <model_name>
```
Example:
```bash
python whisper_runner.py audio.wav --model base
```

### Piper (Text-to-Speech)
```bash
./piper_speak.sh "Your text here" <output_audio.wav> <model_name>
```
Example:
```bash
./piper_speak.sh "Hello, Infini-X!" output.wav en_US-lessac-medium
```

### RVC (Voice Conversion)
```bash
python rvc_modulator.py <input_audio.wav> <output_audio.wav> <model_name> [index_name]
```
Example:
```bash
python rvc_modulator.py input.wav output.wav my_rvc_model my_rvc_index
```

### So-VITS (Singing Voice Synthesis)
```bash
./so-vits-infer.sh <input_audio.wav> <output_audio.wav> <model_name> [config_name]
```
Example:
```bash
./so-vits-infer.sh singing.wav output_song.wav my_singsvc_model my_singsvc_config
```

## Model Management (`models/`)

The `models/` directory is intended to store the actual AI model files. For Whisper, models are usually downloaded automatically. For Piper, RVC, and So-VITS, you will need to manually download and place the `.onnx`, `.pth`, `.index`, and `.json` files in appropriate subdirectories within `models/`.

## Further Development
- Implement robust error handling and argument parsing in scripts.
- Provide clear instructions for downloading and setting up AI models.
- Containerize AI components for easier deployment.
- Integrate with a common API or interface for seamless interaction.
- Develop a model management utility to download and organize models automatically.