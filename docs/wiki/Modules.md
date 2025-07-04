# Infini-X OS Modules

Infini-X OS is designed with modularity in mind, allowing for easy extension and customization. This section details the various modules and their functionalities.

## Core Modules

-   **`core/cmd/infini/`:** The main Infini-X Command Line Interface (CLI) tool. Provides user-facing commands for system management, updates, and interactions.
-   **`core/internal/infinid/`:** The Infini-X Daemon. A background service responsible for managing system-level tasks, potentially exposing an API for other modules.
-   **`core/internal/infini-sync/`:** The Infini-X Sync Service. Handles data synchronization, dotfile management, and potentially AI model updates.

## AI Modules

-   **`assistant/`:** Contains scripts and configurations for local AI integration, including Whisper (STT), Piper (TTS), RVC, and So-VITS.

## Build Modules

-   **`build-iso/`:** Contains the `archiso` profile and scripts for building the custom Infini-X OS ISO image.
-   **`build-rom/`:** Houses the scripts and configurations for generating the Android GSI (Generic System Image) ROM.

## Configuration Modules

-   **`calamares-config/`:** Stores the configuration files for the Calamares installer, allowing customization of the installation process.
-   **`config/`:** Global configuration files, including `commands.toml` for defining system-wide commands and variables.
-   **`dotfiles/`:** Contains the Hyprland, Waybar, Rofi, Kitty, and other dotfiles that define the aesthetic and user experience of Infini-X OS.

## Platform-Specific Modules

-   **`platforms/android/`:** Specific configurations and scripts for Android targets.
-   **`platforms/arm64/`:** Configurations and optimizations for ARM64 devices (e.g., Raspberry Pi).
-   **`platforms/docker/`:** Dockerfile and related configurations for containerized environments.
-   **`platforms/pinephone/`:** Specific configurations and optimizations for PinePhone devices.
-   **`platforms/x86_64/`:** Configurations and optimizations for x86_64 desktop and laptop systems.

## Utility Modules

-   **`scripts/`:** A collection of utility scripts for various system tasks, such as updates, theme switching, and audio stack management.
-   **`themes/`:** Contains the aesthetic themes for Hyprland and Waybar, allowing users to easily switch between different visual styles.

## Web Interface

-   **`web/`:** Placeholder for a potential web-based interface for managing Infini-X OS settings and features.
