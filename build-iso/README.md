# Infini-X ArchISO Build

This directory contains the necessary files to build a custom Arch Linux ISO with the Infini-X configurations and Calamares installer.

## Structure
- `profile/`: This directory holds the ArchISO profile, which defines the packages, scripts, and configurations to be included in the ISO.
  - `profile/profiledef.sh`: The main profile definition script for `mkarchiso`.
  - `profile/packages.x86_64`: List of base packages for the ISO.
  - `profile/packages.x86_64.add`: List of additional packages to be installed post-base system.
  - `profile/pacman.conf`: Pacman configuration for the ISO build.
  - `profile/airootfs/`: The root filesystem of the live environment and installed system.
    - `profile/airootfs/root/customize_airootfs.sh`: Script executed within the chroot environment to customize the installed system.
    - `profile/airootfs/usr/local/bin/install-dotfiles.sh`: Script to install dotfiles on the target system.
    - `profile/airootfs/etc/skel/`: Skeleton directory for new users.
- `README.md`: This file.

## Building the ISO

To build the ISO, you need `archiso` installed on your system. Then, navigate to the `build-iso` directory and run:

```bash
sudo mkarchiso -v -o output profile
```

This will create the ISO image in the `output/` directory.

## Customization

- **Profile Definition**: Modify `profile/profiledef.sh` to adjust ISO name, kernel parameters, and hooks.
- **Packages**: Edit `profile/packages.x86_64` and `profile/packages.x86_64.add` to add or remove software.
- **Pacman Configuration**: Modify `profile/pacman.conf` for custom repositories or settings.
- **Post-install Customization**: Add commands to `profile/airootfs/root/customize_airootfs.sh` to perform actions after the base system is installed (e.g., setting up dotfiles, installing Calamares).

## Calamares Integration

The Calamares installer will be integrated into the ISO. Ensure that Calamares and its dependencies are listed in `profile/packages.x86_64` and that the Calamares configuration in `../calamares-config` is correctly set up and copied to the airootfs (handled by `profiledef.sh`). The `customize_airootfs.sh` script should enable the `calamares-live.service` to automatically launch the installer in the live environment.