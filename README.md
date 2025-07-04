
# Infini-X Monorepo

Welcome to the **Infini-X** monorepo! This project aims to provide a comprehensive and highly customizable ecosystem for **Arch Linux**, **Wayland**, **Android GSI**, **containers**, and **offline AI**.

Our vision is to empower users with cutting-edge tools and a seamless experience across various computing domains, from a polished desktop environment to advanced local AI capabilities and flexible containerization.

## Table of Contents
- [Features](#features)
- [Dependencies](#dependencies)
- [Getting Started](#getting-started)
- [Structure](#structure)
- [Contributing](#contributing)
- [License](#license)
- [Documentation](#documentation)

## Features
-   **Advanced Dotfiles**: Highly optimized Hyprland and Waybar configurations, inspired by `end-4/dots-hyprland`, offering a beautiful and efficient Wayland desktop experience.
-   **Custom ArchISO + Calamares**: A tailored Arch Linux ISO with the Calamares installer (v3.3.x, Qt5-base, custom branding), making Infini-X easy to install on any compatible x86_64 hardware.
-   **Android GSI ROM Building**: Robust tools (`make_gsi.sh`, `convert_to_img.sh`) for building Android Generic System Images using `debootstrap`, `e2fsprogs`, `lzip`, and `android-gsi-tools`.
-   **Offline AI Integration**: Local, privacy-focused AI functionalities including:
    -   **Whisper**: Speech-to-text transcription using `openai/whisper` (v20250625).
    -   **Piper**: Text-to-speech synthesis with `piper Rust` (v0.11+).
    -   **RVC**: Retrieval-based Voice Conversion with latest RVC models.
    -   **So-VITS SVC**: Singing Voice Synthesis compatible with PyTorch 2.x.
-   **Comprehensive Container Support**: Seamless integration and conceptual configurations for:
    -   **Docker Rootless**: Enhanced security for containerized applications.
    -   **Podman**: Daemonless container engine, Docker-compatible.
    -   **WayDroid**: Run a full Android OS in a container (v1.6+).
    -   **LXC**: Low-level container runtime for OS-level virtualization.
    -   **`android-platform-tools`**: Essential for WayDroid interaction.
-   **CI/CD Workflows**: Automated GitHub Actions for:
    -   `ci.yml`: Format, lint, test, build checks.
    -   `iso-release.yml`: ArchISO build and release using `coderadu/actions-mkarchiso`.
    -   `gsi-rom-release.yml`: Android GSI ROM build and release.
    -   `wiki-sync.yml`: MkDocs Material documentation synchronization.
-   **Unified CLI Tools**: A `hyde-cli` inspired command-line interface for managing Infini-X components and configurations.
-   **Extensive Theming**: A modular theming system with `hyde-themes` to customize the visual appearance of the entire ecosystem.
-   **Robust Development Environment**: Pre-configured Dev Containers (`.devcontainer/`) for consistent and reproducible development workflows.
-   **Go Core Logic**: Centralized Go modules (`core/`) for shared business logic, user management, device interaction, and AI interfaces.
-   **React Web Interface**: A modern web application (`web/`) for graphical management and interaction, built with React, Material UI, and Bootstrap.

## Dependencies
This project relies on the following key dependencies. More detailed dependency lists can be found in respective subdirectories.

| Component             | Version      | Notes                                                              |
|-----------------------|--------------|--------------------------------------------------------------------|
| Go                    | 1.24.4       |                                                                    |
| Hyprland              | 0.48.0       | Wayland compositor                                                 |
| Waybar                | Latest       | Status bar for Wayland                                             |
| PipeWire              | 1.0.x        | Audio and video server (with WirePlumber 0.4.x)                    |
| Calamares             | 3.3.x        | System installer                                                   |
| Whisper               | v20250625    | OpenAI's speech-to-text model                                      |
| Piper                 | Rust v0.11+  | Text-to-speech synthesis                                           |
| RVC / So-VITS         | Latest       | Voice conversion (requires PyTorch 2.x)                            |
| WayDroid              | 1.6+         | Android container                                                  |
| Android GSI Tools     | Latest       | Tools for building Android GSI                                     |
| MkDocs                | >=1.4        | Static site generator for documentation                            |
| MkDocs Material       | 10.x         | Material Design theme for MkDocs                                   |


## Getting Started

To begin your journey with Infini-X, please refer to the [Getting Started](docs/getting_started.md) guide in our documentation.

## Structure

For a detailed breakdown of the monorepo's directory structure and the purpose of each component, please see the [Monorepo Structure](docs/core_concepts/monorepo_structure.md) documentation.

## Contributing

We welcome contributions from the community! Please refer to our [Contributing Guide](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the [MIT License](LICENSE.md).

## Documentation

Comprehensive documentation for Infini-X is available [here](docs/index.md). You can also build and view the documentation locally:

```bash
make docs
```
