# Infini-X General Scripts

This directory is intended for general-purpose utility scripts that support the Infini-X project but do not belong to a specific component (e.g., `build-rom/`, `assistant/`, `dotfiles/`). These scripts can be used for various tasks such as system maintenance, development workflows, or automation.

## Purpose
- **Automation**: Scripts to automate repetitive tasks.
- **Convenience**: Provide quick tools for common operations.
- **Cross-component Utilities**: Scripts that might be useful across different parts of the monorepo.

## Structure (Conceptual)
- `setup-env.sh`: Script to set up development environment dependencies.
- `clean-project.sh`: Script to clean various build artifacts across the monorepo.
- `update-all.sh`: Script to update all submodules, dependencies, etc.
- `system-info.sh`: Displays basic system information.
- `hyde-cli.sh`: A conceptual command-line interface for Infini-X management, inspired by HyDE-Project/HyDE.

## Usage
Scripts in this directory should be executable and ideally self-contained or have clearly documented dependencies. They can be run directly from the command line.

## Further Development
- Add more practical utility scripts as needed.
- Ensure scripts are robust, handle errors gracefully, and provide clear output.
- Document each script's purpose, usage, and dependencies.