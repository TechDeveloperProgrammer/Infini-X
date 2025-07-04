
# Infini-X Dotfiles

This directory contains the configuration files (dotfiles) for various applications used in the Infini-X project, primarily focusing on the Hyprland Wayland compositor and Waybar status bar.

## Structure
- `hyprland.conf`: Main configuration for Hyprland.
- `waybar.conf`: Configuration for Waybar.
- `install.sh`: A script to symlink these dotfiles to their appropriate locations.
- `deps.txt`: List of recommended packages for these dotfiles to function correctly.
- `scripts/`: Directory containing various utility scripts.

## Installation
To install these dotfiles, simply run the `install.sh` script:

```bash
./install.sh
```

This script will create symbolic links from this directory to the standard configuration locations (e.g., `~/.config/hypr/hyprland.conf`).

## Dependencies
For the Hyprland and Waybar configurations to work as intended, ensure you have the following packages installed:

- `hyprland` (0.48.0 or newer)
- `waybar`
- `wofi` (application launcher)
- `kitty` (terminal emulator)
- `thunar` (file manager)
- `pavucontrol` (PulseAudio/PipeWire volume control)
- `grim` (screenshot tool)
- `slurp` (region selection for grim)
- `wl-clipboard` (Wayland clipboard utilities)
- `pipewire`
- `wireplumber`

## Customization
Feel free to modify these dotfiles to suit your preferences. Remember to reload Hyprland (`$mod + R`) or Waybar (`killall waybar && waybar &`) after making changes.
