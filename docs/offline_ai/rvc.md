
# RVC (Retrieval-based Voice Conversion)

This document details the integration of Retrieval-based Voice Conversion (RVC) within Infini-X for offline voice transformation.

## Overview

RVC is a powerful voice conversion technique that allows you to change the timbre of a voice in an audio recording to sound like a target voice, while preserving the original speech content and intonation. It leverages deep learning models, often built with PyTorch, to achieve high-quality voice transformations.

## `rvc_modulator.py`

The primary script for interacting with RVC is `assistant/rvc_modulator.py`. This Python script provides a conceptual interface for performing voice conversion.

### Dependencies

-   **PyTorch**: Version 2.x or newer (specified in `assistant/requirements.txt`).
-   **RVC Library/Framework**: The actual RVC implementation (e.g., a specific Python library or a cloned RVC repository) is implicitly required. This script acts as a wrapper around that underlying implementation.
-   `audioread`, `numpy`, `scipy`, `librosa`, `soundfile` (common audio processing libraries).

### Usage

To perform voice conversion, run the script with the input audio file, desired output path, the RVC model name, and optionally an index file name:

```bash
python assistant/rvc_modulator.py <input_audio.wav> <output_audio.wav> <model_name> [--index_name <index_name>]
```

-   `<input_audio.wav>`: The path to the audio file containing the source voice.
-   `<output_audio.wav>`: The path where the converted audio file will be saved.
-   `<model_name>`: The name of the RVC model (e.g., `my_rvc_model`). This corresponds to the base name of the `.pth` model file in `assistant/models/rvc/`.
-   `--index_name <index_name>`: (Optional) The name of the RVC index file (e.g., `my_rvc_index`). This corresponds to the base name of the `.index` file in `assistant/models/rvc/`. Index files are used for faster retrieval in some RVC implementations.

**Example:**

```bash
python assistant/rvc_modulator.py original_voice.wav converted_voice.wav celebrity_voice --index_name celebrity_index
```

### Model Management

RVC models (`.pth` files) and optional index files (`.index` files) should be manually acquired and placed into the `assistant/models/rvc/` directory. The specific models you use will depend on your desired target voices. Ensure that the model and index files have the same base name as the `<model_name>` and `<index_name>` you provide to the script.

## Integration with Core Services

The `core/service/ai/ai.go` module provides a Go interface (`AIService`) that conceptually interacts with `rvc_modulator.py`. This allows other Go-based services or the web interface to trigger voice conversion tasks.

## Further Development

-   **Full RVC Integration**: Replace the conceptual RVC inference logic with actual calls to a robust RVC Python library or a cloned RVC project.
-   **Model Training**: Provide guidance or tools for training custom RVC models.
-   **Parameter Tuning**: Expose more RVC-specific parameters (e.g., pitch shift, feature index ratio) through the script's arguments.
-   **GPU Acceleration**: Ensure optimal utilization of GPU resources for faster voice conversion.
-   **Error Handling**: Enhance error handling for cases like missing models, invalid audio files, or inference failures.
