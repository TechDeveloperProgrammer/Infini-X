
# Infini-X Core - AI Service Interface

This directory defines the interface and implementation for interacting with the offline AI models within the Infini-X system. It provides a standardized way for other core services or applications to leverage AI functionalities like speech-to-text, text-to-speech, and voice conversion.

## Purpose
- **Abstraction**: Provides a clean abstraction layer over the underlying AI model scripts and executables.
- **Modularity**: Decouples AI model implementation details from the services that consume them.
- **Extensibility**: Allows for easy integration of new AI models or changes to existing ones without affecting consuming services.

## Structure (Conceptual)
- `ai.go`: Defines the `AIService` interface and its `OfflineAIService` implementation, which interacts with the AI scripts in `assistant/`.
- `models.go`: Data structures for AI requests and responses.

## Usage
Other core services (e.g., `service/users`, `service/devices`) or external applications (e.g., `web/`) can use the `AIService` interface to perform AI operations. The `OfflineAIService` implementation handles the execution of the actual AI scripts.

## Further Development
- Implement more robust error handling and progress reporting for AI operations.
- Add support for streaming audio input/output for real-time AI interactions.
- Integrate with a message queue for asynchronous AI task processing.
- Develop a mechanism for dynamically loading and managing AI models.
- Explore using gRPC for communication between Go services and Python AI scripts.
