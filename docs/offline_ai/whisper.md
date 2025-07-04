
# Whisper (Speech-to-Text)

This document details the integration of OpenAI's Whisper model for offline speech-to-text transcription within Infini-X.

## Overview

Whisper is a general-purpose speech recognition model developed by OpenAI. It is trained on a large dataset of diverse audio and is capable of transcribing audio into text, identifying languages, and translating speech into English. Our integration focuses on leveraging Whisper for local, privacy-preserving transcription.

## `whisper_runner.py`

The primary script for interacting with Whisper is `assistant/whisper_runner.py`. This Python script utilizes the `openai-whisper` library to perform audio transcription.

### Dependencies

-   `openai-whisper` Python package (specified in `assistant/requirements.txt`).
-   `torch` (for PyTorch backend, also in `requirements.txt`).
-   `audioread`, `numpy`, `scipy`, `librosa`, `soundfile` (common audio processing libraries).

### Usage

To transcribe an audio file, run the script with the path to your audio file and optionally specify the Whisper model size:

```bash
python assistant/whisper_runner.py <audio_file.wav> --model <model_name>
```

-   `<audio_file.wav>`: The path to the audio file you want to transcribe. Supported formats typically include WAV, MP3, FLAC, etc.
-   `<model_name>`: (Optional) The size of the Whisper model to use. Options include `tiny`, `base`, `small`, `medium`, `large`, `large-v2`, `large-v3`. If not specified, `base` is used by default.

**Example:**

```bash
python assistant/whisper_runner.py my_meeting.wav --model medium
```

### Model Download

Whisper models are typically downloaded automatically by the `openai-whisper` library when `whisper.load_model()` is called for the first time. These models are usually cached in `~/.cache/whisper/`.

## Integration with Core Services

The `core/service/ai/ai.go` module provides a Go interface (`AIService`) that conceptually interacts with `whisper_runner.py`. This allows other Go-based services or the web interface to trigger audio transcriptions without directly calling the Python script.

## Further Development

-   **Real-time Transcription**: Explore options for real-time or near real-time audio transcription.
-   **Language Detection**: Integrate Whisper's language detection capabilities.
-   **Speaker Diarization**: Implement speaker diarization to identify different speakers in an audio recording.
-   **GPU Acceleration**: Ensure optimal utilization of GPU resources for faster transcription on compatible hardware.
-   **Error Handling**: Enhance error handling and provide more informative messages for common issues (e.g., missing audio file, model download failures).
