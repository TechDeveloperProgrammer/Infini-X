
# Monorepo Structure

This document details the directory structure of the Infini-X monorepo, explaining the purpose and contents of each top-level directory.

```
Infini-X/
├── .devcontainer/          # Development container configurations (VS Code, Codespaces)
├── .github/                # GitHub Actions workflows and other GitHub-specific configurations
│   └── workflows/
├── assistant/              # Offline AI components (Whisper, Piper, RVC, So-VITS)
│   ├── models/             # AI model files
│   └── scripts/            # AI-related scripts
├── build-iso/              # ArchISO build configurations
│   └── profile/            # ArchISO profile definition
├── build-rom/              # Android GSI ROM building scripts and configurations
│   └── config/             # GSI build configurations
├── calamares-config/       # Calamares installer configurations and branding
│   ├── branding/           # Calamares branding assets
│   └── modules/            # Calamares module configurations
├── config/                 # General project-wide configurations
├── containers/             # Containerization strategy and conceptual configurations
│   ├── docker/             # Docker (rootless) configurations
│   ├── lxc/                # LXC configurations
│   ├── podman/             # Podman configurations
│   └── waydroid/           # WayDroid configurations and scripts
├── core/                   # Core business logic and shared Go modules
│   ├── model/              # Data models
│   ├── pkg/                # Reusable Go packages (auth, config, logger, utils)
│   └── service/            # Core Go services (users, devices, AI interface)
├── docs/                   # Project documentation (MkDocs)
├── dotfiles/               # Hyprland, Waybar, and other desktop environment dotfiles
│   └── scripts/            # Dotfile-related utility scripts
├── platforms/              # Platform-specific configurations and code
│   ├── arm64/              # ARM64 specific configurations
│   ├── cloud/              # Cloud-specific configurations (AWS, GCP)
│   ├── edge/               # Edge device configurations (Raspberry Pi)
│   └── x86_64/             # x86_64 specific configurations
├── scripts/                # General-purpose utility scripts (e.g., hyde-cli)
├── themes/                 # Custom visual themes and styling assets
│   ├── desktop/            # Desktop environment themes (GTK, Qt)
│   └── hyde-themes/        # Themes managed by hyde-cli
├── web/                    # Web interface (React application)
│   ├── public/             # Static assets
│   ├── src/                # React source code
│   │   ├── components/     # Reusable React components
│   │   ├── context/        # React Context for global state
│   │   ├── pages/          # Application pages/views
│   │   └── services/       # Client-side API services
├── .gitignore              # Git ignore file
├── CODE_OF_CONDUCT.md      # Code of Conduct
├── CONTRIBUTING.md         # Contribution guidelines
├── GeminiProject.toml      # Gemini CLI project configuration
├── go.mod                  # Go module definition
├── go.sum                  # Go module checksums
├── go.work                 # Go workspace file
├── LICENSE.md              # Project license
├── Makefile                # Build automation script
├── manifest.json           # Project manifest (e.g., for npm workspaces)
├── mkdocs.yml              # MkDocs documentation configuration
└── README.md               # Main project README
```

## Directory Descriptions

-   **`.devcontainer/`**: Contains configurations for Visual Studio Code Dev Containers and GitHub Codespaces. This ensures a consistent and reproducible development environment across different machines and contributors.

-   **`.github/`**: Houses GitHub-specific configurations, primarily GitHub Actions workflows for Continuous Integration (CI), automated releases (ISO, GSI ROM), and documentation synchronization.

-   **`assistant/`**: Dedicated to offline AI components. This includes Python scripts for interacting with models like Whisper (speech-to-text), Piper (text-to-speech), RVC, and So-VITS (voice conversion/synthesis). It also contains a `models/` subdirectory for storing AI model files.

-   **`build-iso/`**: Contains all necessary files and scripts for building a custom Arch Linux ISO. This includes the `profile/` directory with `mkarchiso` configurations, package lists, and post-installation scripts.

-   **`build-rom/`**: Focuses on building Android Generic System Images (GSI). It includes scripts (`make_gsi.sh`, `convert_to_img.sh`) and configurations (`config/`) for creating flashable Android ROMs.

-   **`calamares-config/`**: Holds the complete configuration for the Calamares installer. This includes the main `settings.conf`, modular configurations for each installation step (`modules/`), and branding assets (`branding/`) for customizing the installer's appearance.

-   **`config/`**: A central location for general project-wide configurations that are not specific to any single component. This includes `common.yaml` for shared settings, `logging.yaml` for logging configurations, and `env.example` for environment variable templates.

-   **`containers/`**: Outlines the strategy and provides conceptual configurations for various container technologies. This includes Docker (rootless), Podman, WayDroid (Android container), and LXC, along with their respective configuration files and conceptual setup scripts.

-   **`core/`**: Contains the core business logic and shared Go modules. It's structured into `pkg/` for reusable libraries (authentication, configuration, logging, utilities), `service/` for core services (user management, device interaction, AI interface), and `model/` for data structures.

-   **`docs/`**: The home for all project documentation, built using MkDocs Material. It provides comprehensive guides on setup, usage, architecture, and individual components.

-   **`dotfiles/`**: Houses the configuration files (dotfiles) for the Hyprland Wayland compositor, Waybar status bar, and other desktop environment components. It includes an `install.sh` script for easy setup and a `scripts/` subdirectory for related utilities.

-   **`platforms/`**: Dedicated to platform-specific configurations and code. This allows for tailoring Infini-X to different CPU architectures (x86_64, ARM64), cloud environments (AWS, GCP), and edge devices (Raspberry Pi).

-   **`scripts/`**: Contains general-purpose utility scripts that support the Infini-X project but are not tied to a specific module. This includes the `hyde-cli` inspired command-line interface for system management.

-   **`themes/`**: Stores custom visual themes and styling assets. It includes `desktop/` themes for GTK/Qt and `hyde-themes/` which are designed to be managed by the `hyde-cli` for a unified theming experience.

-   **`web/`**: Contains the React-based web interface for graphical management and interaction with the Infini-X system. It's structured with components, pages, services, and context for state management.

This comprehensive structure aims to provide a well-organized, maintainable, and extensible foundation for the Infini-X project.
