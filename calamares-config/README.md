# Infini-X Calamares Configuration

This directory contains the configuration files for the Calamares installer, which will be used to install Infini-X to a hard drive.

## Structure
- `settings.conf`: The main Calamares configuration file, defining the overall flow and referencing other configuration files.
- `branding/`: Contains branding assets and configuration for the Calamares UI.
  - `branding/branding.desc`: Describes the branding elements (e.g., images, colors, text).
  - `branding/style.qss`: Custom Qt Style Sheet for the installer's appearance.
  - `branding/logo.png`, `branding/sidebar.png`, `branding/banner.png`: Placeholder image assets.
- `modules/`: Contains individual configuration files for each Calamares module.
  - `modules/locale.conf`: Locale settings.
  - `modules/keyboard.conf`: Keyboard layout settings.
  - `modules/partition.conf`: Partitioning configuration.
  - `modules/users.conf`: User creation settings.
  - `modules/packages.conf`: Package installation settings.
  - `modules/fstab.conf`: fstab generation settings.
  - `modules/bootloader.conf`: Bootloader installation settings.
  - `modules/summary.conf`: Summary screen configuration.
  - `modules/finished.conf`: Finished screen configuration.
- `post-install.conf`: Configuration for commands to run after installation.
- `README.md`: This file.

## Configuration Details

### `settings.conf`
This file orchestrates the Calamares installation process by defining the sequence of modules and referencing their individual configuration files. It also points to the branding directory.

### `branding/`
This directory allows for extensive customization of the Calamares installer's visual appearance. You can define product names, versions, logos, banners, and apply custom CSS styling.

### `modules/`
Each `.conf` file within this directory configures a specific step or aspect of the installation process. This modular approach makes it easier to manage and customize individual parts of the installer.

### `post-install.conf`
This file allows you to define shell commands or scripts that Calamares will execute on the target system after the main installation process is complete. This is useful for final system configurations, enabling services, or running custom setup scripts.

## Customization

- **Installation Flow**: Modify `settings.conf` to change the order or inclusion of modules.
- **Module Behavior**: Edit individual files within `modules/` to fine-tune the behavior of each installation step.
- **Branding**: Replace placeholder images in `branding/` and adjust `branding.desc` and `style.qss` to match your desired aesthetic.
- **Post-Installation**: Add commands to `post-install.conf` for any final system setup tasks.

## Integration with ArchISO

Ensure that Calamares and its dependencies are included in the `packages.x86_64` file of your ArchISO profile (`../build-iso/profile/packages.x86_64`). The `customize_airootfs.sh` script in the ArchISO profile should enable the `calamares-live.service` to automatically launch the installer in the live environment.