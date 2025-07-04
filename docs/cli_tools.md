
# CLI Tools

This section details the command-line interface (CLI) tools available within the Infini-X monorepo. These tools provide powerful ways to manage and interact with the system directly from the terminal, offering automation capabilities and direct access to core functionalities.

## Overview

Our CLI tools are designed to be efficient, scriptable, and provide a consistent user experience. They range from simple utility scripts to a more comprehensive management interface inspired by `HyDE-Project/HyDE`.

## Key CLI Tools

### 1. `hyde-cli` (`scripts/hyde-cli.sh`)

Inspired by `HyDE-Project/HyDE`, `hyde-cli` is a conceptual central command-line interface for Infini-X management. It aims to unify various system operations under a single, intuitive command.

**Purpose**:
-   **Theme Management**: Apply and list Infini-X themes.
-   **System Information**: Display key system details.
-   **Configuration Management**: Get or set Infini-X configuration values.
-   **Extensibility**: Designed to be easily extended with new commands for managing other Infini-X components (e.g., containers, AI models).

**Usage**:

```bash
./scripts/hyde-cli.sh <command> [options]
```

**Examples**:

```bash
./scripts/hyde-cli.sh theme apply dark-catppuccin
./scripts/hyde-cli.sh info
./scripts/hyde-cli.sh config wallpaper /path/to/new_wallpaper.jpg
./scripts/hyde-cli.sh help
```

### 2. General Utility Scripts (`scripts/`)

The `scripts/` directory also contains other general-purpose utility scripts that support the Infini-X project but are not part of the `hyde-cli` framework. These include:

-   **`system-info.sh`**: Displays basic system information (hostname, OS, kernel, CPU, memory, disk usage, uptime).

**Usage**:

```bash
./scripts/system-info.sh
```

### 3. Dotfiles-related Scripts (`dotfiles/scripts/`)

These scripts are specifically designed to work with the Hyprland and Waybar dotfiles:

-   **`screenshot.sh`**: For taking full-screen, area, or active window screenshots.
-   **`volume.sh`**: For controlling audio volume.
-   **`brightness.sh`**: For adjusting screen brightness.
-   **`quickshell.sh`**: A simple script for quick command execution or launching a terminal.

**Usage**:

```bash
~/.config/hypr/scripts/screenshot.sh full
~/.config/hypr/scripts/volume.sh up
~/.config/hypr/scripts/brightness.sh down
~/.local/bin/quickshell
```

### 4. AI-related Scripts (`assistant/`)

The `assistant/` directory contains scripts for interacting with the offline AI models:

-   **`whisper_runner.py`**: Speech-to-text transcription.
-   **`piper_speak.sh`**: Text-to-speech synthesis.
-   **`rvc_modulator.py`**: Voice conversion.
-   **`so-vits-infer.sh`**: Singing voice synthesis.

**Usage**:

```bash
python assistant/whisper_runner.py my_audio.wav --model base
./assistant/piper_speak.sh "Hello" output.wav en_US-lessac-medium
```

### 5. Build-related Scripts (`build-iso/`, `build-rom/`, `containers/`)

Various scripts are also present in build-related directories for specific tasks:

-   **`build-iso/profile/airootfs/root/customize_airootfs.sh`**: Post-installation customization for ArchISO.
-   **`build-iso/profile/airootfs/usr/local/bin/install-dotfiles.sh`**: Dotfile installation on the installed system.
-   **`build-rom/make_gsi.sh`**: Android GSI build process.
-   **`build-rom/convert_to_img.sh`**: GSI image conversion.
-   **`containers/waydroid/config.sh`**: WayDroid setup and management.

## Further Development

-   **Expand `hyde-cli`**: Add more commands and subcommands to `hyde-cli` to cover all aspects of Infini-X management.
-   **Error Handling**: Implement robust error handling and user-friendly messages in all scripts.
-   **Shell Completion**: Add shell completion for `hyde-cli` and other frequently used scripts.
-   **Cross-Platform Compatibility**: Where applicable, ensure scripts are compatible with different Linux distributions or even other operating systems.
