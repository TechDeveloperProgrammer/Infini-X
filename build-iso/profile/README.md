
# Infini-X ArchISO Profile

This directory defines the ArchISO profile for building the Infini-X custom Arch Linux ISO. It specifies the packages to be included, the filesystem layout, and post-installation customization scripts.

## Structure
- `profiledef.sh`: Defines the ArchISO profile, including architecture, profile name, and various hooks.
- `packages.x86_64`: List of packages to be installed on the ISO during the initial `pacstrap` phase.
- `packages.x86_64.add`: List of additional packages to be installed *after* the base system, typically within `customize_airootfs.sh`.
- `pacman.conf`: Pacman configuration for the ISO build environment.
- `airootfs/`: The root filesystem of the live environment and the installed system.
  - `airootfs/root/customize_airootfs.sh`: Script executed within the chroot environment to customize the installed system (e.g., user creation, service enabling, dotfile setup).
  - `airootfs/etc/skel/`: Files copied to new user's home directory.
  - `airootfs/usr/local/bin/install-dotfiles.sh`: A script to be run by the installed system to set up dotfiles.
- `README.md`: This file.

## `profiledef.sh`
This script is the core of the ArchISO profile. It sets up the build environment, defines the ISO name, and specifies pre/post-build hooks. It ensures that the `customize_airootfs.sh` script is executed correctly.

## `customize_airootfs.sh`
This script is executed inside the chroot environment of the target system after the base packages are installed. It's crucial for:
- Setting root password.
- Creating default users and setting their passwords.
- Enabling necessary systemd services (e.g., NetworkManager, Calamares).
- Copying dotfiles and other configurations to the installed system.
- Performing any other post-installation tasks.

## `packages.x86_64` vs `packages.x86_64.add`
- `packages.x86_64`: Contains essential packages for the live environment and the initial base system installation. These are installed via `pacstrap`.
- `packages.x86_64.add`: Contains additional packages that might be installed later in the `customize_airootfs.sh` script. This is useful for packages that depend on a fully configured system or for those that are part of a specific desktop environment setup.

## Customization
- **Packages**: Modify `packages.x86_64` and `packages.x86_64.add` to include or exclude software.
- **Post-install**: Edit `customize_airootfs.sh` to tailor the installed system's configuration.
- **User Setup**: Adjust user creation and dotfile copying in `customize_airootfs.sh`.

## Building the ISO
Refer to the main `../README.md` in the `build-iso/` directory for instructions on how to build the ISO using `mkarchiso`.
