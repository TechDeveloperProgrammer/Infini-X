
# Piper (Text-to-Speech)

This document details the integration of the Piper (Rust) engine for offline text-to-speech synthesis within Infini-X.

## Overview

Piper is a fast, high-quality, and lightweight text-to-speech (TTS) system developed by Mycroft AI. It is written in Rust and uses `onnx` for inference, making it highly efficient for local execution. Our integration leverages Piper to convert text into natural-sounding speech offline.

## `piper_speak.sh`

The primary script for interacting with Piper is `assistant/piper_speak.sh`. This Bash script calls the `piper` executable to synthesize speech from a given text.

### Dependencies

-   **`piper` executable**: The Rust version 0.11+ of the `piper` executable must be installed and available in your system's PATH. You might need to build it from source or download a pre-compiled binary from the [Piper GitHub releases](https://github.com/rhasspy/piper/releases).
-   **Piper Voice Models**: You need to download specific `.onnx` model files and their corresponding `.json` configuration files for the voices you wish to use. These should be placed in `assistant/models/piper/`.

### Usage

To synthesize speech, run the script with the text you want to convert, the output audio file path, and the model name:

```bash
./assistant/piper_speak.sh "<text_to_speak>" <output_audio.wav> <model_name>
```

-   `<text_to_speak>`: The text you want to convert to speech (enclosed in quotes).
-   `<output_audio.wav>`: The path where the generated audio file will be saved.
-   `<model_name>`: The name of the Piper voice model (e.g., `en_US-lessac-medium`). This corresponds to the base name of the `.onnx` and `.json` files in `assistant/models/piper/`.

**Example:**

```bash
./assistant/piper_speak.sh "Hello, Infini-X! This is a test of the text-to-speech system." output.wav en_US-lessac-medium
```

### Model Management

Piper voice models (`.onnx` and `.json` files) should be manually downloaded from the [Piper GitHub releases page](https://github.com/rhasspy/piper/releases) and placed into the `assistant/models/piper/` directory. Ensure that the `.onnx` model file and its corresponding `.json` configuration file have the same base name as the `<model_name>` you provide to the script.

## Integration with Core Services

The `core/service/ai/ai.go` module provides a Go interface (`AIService`) that conceptually interacts with `piper_speak.sh`. This allows other Go-based services or the web interface to trigger speech synthesis without directly calling the Bash script.

## Further Development

-   **Model Download Utility**: Create a script or tool to automate the download and organization of Piper voice models.
-   **Voice Selection**: Implement a more user-friendly way to select and manage available voices.
-   **Streaming Output**: Explore options for streaming audio output instead of saving to a file first.
-   **Error Handling**: Enhance error handling for cases like missing models or invalid text input.
