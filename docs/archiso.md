# ArchISO

This section provides detailed instructions and insights into building a custom Arch Linux ISO for Infini-X. Our custom ISO integrates the Calamares installer and pre-configures the system with Infini-X's dotfiles and essential software, providing a seamless installation experience.

## Overview

Building a custom ArchISO involves defining a profile that specifies the packages, filesystem layout, and post-installation scripts. We use `mkarchiso`, the official Arch Linux tool for creating bootable ISO images.

## Build Process

1.  **Profile Definition (`build-iso/profile/profiledef.sh`)**:
    This script is the heart of the ArchISO profile. It defines:
    -   **Architecture**: `x86_64`.
    -   **ISO Name and Labels**: `infini-x`.
    -   **Boot Modes**: BIOS and UEFI.
    -   **Kernel Parameters**: Essential boot parameters.
    -   **Packages**: A list of base packages to be installed during the initial `pacstrap` phase.
    -   **Hooks**: Custom scripts (`airootfs_install_hook`, `airootfs_install_hook_after_pacstrap`) that run at different stages of the ISO build process. These hooks are crucial for:
        -   Copying `customize_airootfs.sh` to the target root filesystem.
        -   Copying the `install-dotfiles.sh` script and the dotfiles themselves to a temporary location on the ISO.
        -   Copying Calamares configuration files.
        -   Setting up the default user skeleton (`/etc/skel`).
        -   Copying default wallpaper and Hyprland/Waybar configurations for the live environment.

2.  **Package Lists (`build-iso/profile/packages.x86_64`, `build-iso/profile/packages.x86_64.add`)**:
    -   `packages.x86_64`: Contains essential packages for the live environment and the initial base system installation (e.g., `base`, `linux`, `grub`, `networkmanager`, `calamares`).
    -   `packages.x86_64.add`: Lists additional packages (e.g., `hyprland`, `waybar`, `wofi`, `dunst`, `swww`, `sddm`) that are installed later by `customize_airootfs.sh`.

3.  **Pacman Configuration (`build-iso/profile/pacman.conf`)**:
    Defines the Pacman configuration for the ISO build environment, including `SigLevel` and repository inclusions.

4.  **Root Filesystem Customization (`build-iso/profile/airootfs/root/customize_airootfs.sh`)**:
    This script is executed *inside the chroot environment* of the target system after the base packages are installed. It performs critical post-installation tasks:
    -   Sets the root password.
    -   Creates a default user (`infini`) and sets their password.
    -   Enables `sudo` for the `wheel` group.
    -   Installs additional packages listed in `packages.x86_64.add`.
    -   Enables essential system services (e.g., `NetworkManager`, `sddm`, `calamares-live.service`).
    -   Copies dotfiles to the new user's home directory.
    -   Runs the `install-dotfiles.sh` script for the new user.
    -   Cleans up Pacman cache and temporary files.

5.  **Dotfiles Installation Script (`build-iso/profile/airootfs/usr/local/bin/install-dotfiles.sh`)**:
    A simplified version of the main `dotfiles/install.sh` that runs on the installed system to symlink the dotfiles from the user's home directory to their correct locations.

6.  **Skeleton Files (`build-iso/profile/airootfs/etc/skel/`)**:
    Contains default `.bashrc` and `.zshrc` files that are copied to new user home directories.

## Building the ISO

To build the Infini-X ISO, ensure you have `archiso` installed on your system. Then, navigate to the `build-iso/` directory and execute:

```bash
sudo mkarchiso -v -o output profile
```

This command will:
-   Use the `profile/` directory as the source for the ISO definition.
-   Output the generated ISO image into the `output/` directory.
-   Provide verbose output (`-v`) during the build process.

## Calamares Integration

The Calamares installer is seamlessly integrated into the ISO. The `profiledef.sh` ensures that the Calamares configuration from `calamares-config/` is copied to the live environment. The `customize_airootfs.sh` script enables the `calamares-live.service`, which automatically launches the installer when the live environment boots.

For details on customizing the Calamares installer itself, refer to the [Calamares Configuration](calamares_config.md) documentation.