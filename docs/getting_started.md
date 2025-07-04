# Getting Started with Infini-X

This guide will help you set up your development environment and get started with the Infini-X monorepo.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

-   **Git**: For cloning the repository.
-   **Docker**: Required for using Dev Containers and for container-related development.
-   **Go**: Version 1.24.4 or newer.
-   **Python**: Version 3.10 or newer, along with `pip`.
-   **Node.js and npm/yarn**: For web development.
-   **`mkarchiso`**: If you plan to build custom Arch Linux ISOs.
-   **`debootstrap`, `e2fsprogs`, `lzip`, `android-gsi-tools`**: If you plan to build Android GSI ROMs.

## Cloning the Repository

First, clone the Infini-X monorepo to your local machine:

```bash
git clone https://github.com/Infini-X/Infini-X.git
cd Infini-X
```

## Setting up the Development Environment

### Option 1: Using Dev Containers (Recommended)

If you are using Visual Studio Code, the easiest way to set up your development environment is by using Dev Containers. This ensures a consistent and reproducible environment for all developers.

1.  **Install VS Code**: If you don't have it, download and install [Visual Studio Code](https://code.visualstudio.com/).
2.  **Install Dev Containers Extension**: Open VS Code, go to the Extensions view (`Ctrl+Shift+X`), and search for "Dev Containers" (publisher: Microsoft). Install it.
3.  **Reopen in Container**: Open the `Infini-X` project folder in VS Code. You will see a prompt asking "Folder contains a Dev Container configuration file. Reopen to develop in a container." Click "Reopen in Container".

VS Code will then build the Docker image (this might take some time on the first run) and open the project inside the container. All necessary tools and dependencies will be pre-installed.

### Option 2: Local Setup

If you prefer to set up your environment locally, you will need to manually install all the prerequisites listed above. After cloning the repository, you can run the following commands to install project-specific dependencies:

```bash
# Install Go module dependencies
go work tidy

# Install Python dependencies for AI components
pip install -r assistant/requirements.txt

# Install Node.js dependencies for the web interface
npm install --prefix web

# Make scripts executable
chmod +x scripts/*.sh
chmod +x build-rom/*.sh
chmod +x containers/waydroid/config.sh
```

## Building the Project

To build the entire monorepo, you can use the `Makefile`:

```bash
make build
```

This will build all Go modules. Refer to the `Makefile` for other targets like `fmt`, `lint`, `test`, `docs`, `build-iso`, and `build-rom`.

## Next Steps

Now that your environment is set up, you can explore different parts of the Infini-X project:

-   [Dotfiles](dotfiles.md): Customize your Hyprland and Waybar setup.
-   [Web Interface](web_interface.md): Explore the web-based management UI.
-   [Offline AI](offline_ai/index.md): Experiment with local AI capabilities.
-   [Android GSI](android_gsi.md): Learn how to build custom Android ROMs.

Enjoy your Infini-X experience!