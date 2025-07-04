
# So-VITS SVC (Singing Voice Synthesis)

This document details the integration of So-VITS SVC (Singing Voice Conversion) within Infini-X for offline singing voice synthesis.

## Overview

So-VITS SVC is a powerful tool for singing voice synthesis and conversion. It can take spoken or sung input and transform it into a singing voice, often allowing for the creation of new vocal performances from existing audio, or even generating singing from text (if combined with a TTS system). It leverages advanced deep learning techniques, typically built with PyTorch.

## `so-vits-infer.sh`

The primary script for interacting with So-VITS SVC is `assistant/so-vits-infer.sh`. This Bash script provides a conceptual interface for performing singing voice synthesis or conversion.

### Dependencies

-   **PyTorch**: Version 2.x or newer (specified in `assistant/requirements.txt`).
-   **So-VITS SVC Project**: The actual So-VITS SVC implementation (typically a cloned GitHub repository) is implicitly required. This script acts as a wrapper around that underlying implementation.
-   `python3` and necessary Python packages (specified in `assistant/requirements.txt`).

### Usage

To perform singing voice synthesis/conversion, run the script with the input audio file, desired output path, the So-VITS SVC model name, and optionally a configuration file name:

```bash
./assistant/so-vits-infer.sh <input_audio.wav> <output_audio.wav> <model_name> [config_name]
```

-   `<input_audio.wav>`: The path to the audio file containing the source voice (can be spoken or sung).
-   `<output_audio.wav>`: The path where the generated singing voice audio file will be saved.
-   `<model_name>`: The name of the So-VITS SVC model (e.g., `my_singsvc_model`). This corresponds to the base name of the `.pth` model file in `assistant/models/so-vits-svc/`.
-   `[config_name]`: (Optional) The name of the So-VITS SVC configuration file (e.g., `my_singsvc_config`). This corresponds to the base name of the `.json` config file in `assistant/models/so-vits-svc/`.

**Example:**

```bash
./assistant/so-vits-infer.sh spoken_lyrics.wav generated_song.wav pop_singer_model pop_singer_config
```

### Model Management

So-VITS SVC models (`.pth` files) and their corresponding configuration files (`.json` files) should be manually acquired and placed into the `assistant/models/so-vits-svc/` directory. The specific models you use will depend on your desired singing voice characteristics. Ensure that the model and config files have the same base name as the `<model_name>` and `[config_name]` you provide to the script.

## Integration with Core Services

The `core/service/ai/ai.go` module provides a Go interface (`AIService`) that conceptually interacts with `so-vits-infer.sh`. This allows other Go-based services or the web interface to trigger singing voice synthesis tasks.

## Further Development

-   **Full So-VITS SVC Integration**: Replace the conceptual inference logic with actual calls to a robust So-VITS SVC Python project.
-   **Model Training**: Provide guidance or tools for training custom So-VITS SVC models.
-   **Parameter Tuning**: Expose more So-VITS SVC-specific parameters (e.g., pitch, timbre, emotion) through the script's arguments.
-   **GPU Acceleration**: Ensure optimal utilization of GPU resources for faster synthesis.
-   **Error Handling**: Enhance error handling for cases like missing models, invalid audio files, or inference failures.
