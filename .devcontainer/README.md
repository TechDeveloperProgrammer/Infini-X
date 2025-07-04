
# Infini-X Development Container Configuration

This directory contains the configuration files for setting up a consistent development environment using Visual Studio Code Remote - Containers or GitHub Codespaces.

## Purpose
- **Consistency**: Ensures all developers work in the same environment, with the same tools and dependencies.
- **Isolation**: Keeps project dependencies separate from your local machine's global environment.
- **Reproducibility**: Makes it easy for new contributors to get started quickly without complex setup.

## Structure
- `devcontainer.json`: The main configuration file for the development container.
- `README.md`: This file.

## `devcontainer.json` Details
This file defines:
- The base Docker image to use (e.g., `mcr.microsoft.com/devcontainers/go:1.22`).
- Features to install (e.g., Node.js, Docker-in-Docker).
- VS Code extensions to recommend or install.
- Post-create commands to run after the container is built (e.g., installing Go modules, Python dependencies).
- Port forwarding settings.

## Getting Started

### With VS Code Remote - Containers
1.  Ensure you have Docker installed and running.
2.  Install the "Dev Containers" extension in VS Code.
3.  Open the `Infini-X` project in VS Code.
4.  VS Code will prompt you to "Reopen in Container". Click this button.

### With GitHub Codespaces
If enabled for the repository, you can simply create a new Codespace from your GitHub repository.

## Further Development
- Customize the `devcontainer.json` to include all necessary tools and configurations for specific project components (e.g., Calamares build tools, Android GSI tools).
- Add pre-built images for faster container creation.
- Implement more sophisticated post-create scripts for project setup.
