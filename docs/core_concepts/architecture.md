
# Architecture

This section describes the overall architectural design of the Infini-X monorepo, focusing on how different components interact and the principles guiding their development.

## Core Principles

-   **Modularity**: Components are designed to be independent and loosely coupled, allowing for easier development, testing, and maintenance.
-   **Reusability**: Common functionalities are extracted into shared modules (e.g., `core/pkg/`) to avoid code duplication.
-   **Scalability**: The architecture aims to support future expansion and integration of new features or technologies.
-   **Offline-First**: Prioritizes local execution and data processing, especially for AI components, to enhance privacy and reduce reliance on external services.
-   **Customizability**: Provides extensive configuration options and theming capabilities to allow users to tailor the system to their needs.

## High-Level Overview

Infini-X can be conceptualized as a layered system:

1.  **Hardware Abstraction Layer (HAL)**: (Conceptual) This layer would interact directly with hardware components, providing a standardized interface for higher layers. This is implicitly handled by the Linux kernel and drivers.

2.  **Operating System Layer**: The base Arch Linux system, customized via ArchISO and managed with dotfiles.

3.  **Containerization Layer**: Provides various container runtimes (Docker, Podman, LXC, WayDroid) for isolating applications and services.

4.  **Core Services Layer (`core/`)**: Written in Go, this layer encapsulates the main business logic, including user management, device interaction, and an interface to AI services. It acts as the backbone for various applications.

5.  **AI Layer (`assistant/`)**: Integrates offline AI models (Whisper, Piper, RVC, So-VITS) through scripts and Python applications. These are consumed by the Core Services or directly by CLI tools.

6.  **User Interface Layer**: Provides different ways for users to interact with Infini-X:
    -   **Web Interface (`web/`)**: A React-based web application for graphical management and interaction.
    -   **CLI Tools (`scripts/`)**: Command-line utilities, including the `hyde-cli` for system management.
    -   **Desktop Environment**: Hyprland and Waybar, configured via dotfiles, providing the primary graphical user experience.

## Component Interaction

-   **CLI Tools** can directly call scripts in `scripts/` or interact with `core/` services.
-   **Web Interface** communicates with `core/` services (potentially via a REST API or gRPC).
-   **Core Services** interact with the `AI Layer` (by executing scripts or calling Python modules) and manage `Containerization`.
-   **Containerization** provides isolated environments for applications, including the Android GSI.
-   **ArchISO** builds the base operating system with all necessary components pre-installed.

## Data Flow (Conceptual)

-   **Configuration**: Managed centrally in `config/` and applied to various components.
-   **User Data**: Stored and managed by `core/service/users`.
-   **AI Models**: Stored locally in `assistant/models/`.
-   **Logs**: Centralized logging configured in `config/logging.yaml`.

## Future Considerations

-   **Microservices**: As the project grows, consider breaking down core services into smaller, independently deployable microservices.
-   **API Gateway**: Implement an API Gateway for unified access to backend services.
-   **Message Queues**: Introduce message queues for asynchronous communication between services.
-   **Observability**: Enhance logging, metrics, and tracing for better system monitoring.
