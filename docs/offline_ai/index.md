
# Offline AI Overview

This section provides an overview of the offline AI capabilities integrated into Infini-X. Our focus is on providing local, privacy-preserving AI functionalities that run directly on your system, reducing reliance on cloud services and ensuring data sovereignty.

## Philosophy

-   **Privacy**: All AI processing happens locally on your machine, ensuring your data never leaves your control.
-   **Performance**: Optimized for local execution, leveraging your system's hardware (CPU, GPU) for efficient processing.
-   **Accessibility**: Designed to be easy to use and integrate into your workflow, even without an internet connection.
-   **Modularity**: Each AI component is a distinct module, allowing you to use only what you need and easily extend capabilities.

## Integrated AI Components

Infini-X currently integrates the following cutting-edge offline AI models:

1.  **Whisper (Speech-to-Text)**:
    -   **Purpose**: Converts spoken audio into written text.
    -   **Model**: Utilizes OpenAI's Whisper model (specifically, the version from June 25, 2025, or later compatible versions).
    -   **Use Cases**: Transcription of meetings, voice notes, dictation, and more.
    -   [Learn more about Whisper integration](offline_ai/whisper.md)

2.  **Piper (Text-to-Speech)**:
    -   **Purpose**: Synthesizes natural-sounding speech from text.
    -   **Model**: Employs the Piper (Rust) engine (version 0.11+), known for its high-quality and efficient speech generation.
    -   **Use Cases**: Generating voiceovers, audiobooks, system notifications, and assistive technologies.
    -   [Learn more about Piper integration](offline_ai/piper.md)

3.  **RVC (Retrieval-based Voice Conversion)**:
    -   **Purpose**: Transforms the voice in an audio recording to sound like a target voice, while preserving the original speech content.
    -   **Model**: Integrates with the latest RVC models, leveraging PyTorch for inference.
    -   **Use Cases**: Voice dubbing, character voice generation, and creative audio production.
    -   [Learn more about RVC integration](offline_ai/rvc.md)

4.  **So-VITS SVC (Singing Voice Synthesis)**:
    -   **Purpose**: Converts spoken or sung input into a singing voice, allowing for the creation of new vocal performances from existing audio.
    -   **Model**: Compatible with PyTorch 2.x, enabling advanced singing voice synthesis.
    -   **Use Cases**: Music production, vocal experimentation, and creating unique singing voices.
    -   [Learn more about So-VITS integration](offline_ai/so_vits.md)

## Model Management

AI models are conceptually stored in the `assistant/models/` directory. While some models (like Whisper) can be downloaded automatically by their respective libraries, others (like Piper, RVC, So-VITS) may require manual download and placement. The documentation for each AI component provides specific instructions on model acquisition and placement.

## Interaction

These offline AI capabilities can be interacted with through:

-   **CLI Scripts**: Direct execution of scripts in `assistant/` for specific AI tasks.
-   **Core Services**: The `core/service/ai` module provides a Go interface to these AI functionalities, allowing other parts of the Infini-X system (e.g., the web interface) to leverage them.
-   **Web Interface**: The `web/` application includes a conceptual interface for interacting with the AI models.

## Further Development

-   **Automated Model Downloads**: Develop utilities to simplify the process of acquiring and organizing AI models.
-   **Unified AI API**: Refine the `core/service/ai` interface to provide a more abstract and consistent API for all AI functionalities.
-   **Performance Optimization**: Explore further optimizations for GPU acceleration and efficient resource utilization.
-   **New AI Integrations**: Continuously evaluate and integrate new cutting-edge offline AI models as they become available.
