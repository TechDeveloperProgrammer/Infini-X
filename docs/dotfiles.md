# Dotfiles

This section provides detailed information about the Infini-X dotfiles, which configure the Hyprland Wayland compositor, Waybar status bar, and other essential desktop components. These dotfiles are designed for a clean, efficient, and visually appealing user experience on Arch Linux.

## Overview

Our dotfiles are heavily inspired by `end-4/dots-hyprland`, adopting its modularity and focus on performance. They provide a solid foundation for a modern Wayland desktop, with sensible defaults and easy customization.

## Key Components

-   **Hyprland**: The primary Wayland compositor. Our configuration (`dotfiles/hyprland.conf`) includes:
    -   **Input**: Keyboard layouts, mouse sensitivity, touchpad gestures.
    -   **General**: Gaps, border sizes, active/inactive border colors.
    -   **Decoration**: Rounding, blur effects, drop shadows.
    -   **Animations**: Smooth window transitions and workspace switching.
    -   **Layouts**: Dwindle and Master layouts with pseudotiling.
    -   **Keybinds**: Comprehensive keybindings for window management, application launching, volume, brightness, and media control (defined in `dotfiles/keybinds.conf`).
    -   **Window Rules**: Specific rules for floating windows, sizing, and placement (defined in `dotfiles/windowrules.conf`).

-   **Waybar**: A highly customizable Wayland bar. Our configuration (`dotfiles/waybar.conf`) includes modules for:
    -   Workspaces
    -   Active window title
    -   Clock
    -   Pulseaudio/PipeWire volume control
    -   Network status (Wi-Fi, Ethernet)
    -   Battery status
    -   CPU and Memory usage
    -   System tray

-   **Utility Scripts (`dotfiles/scripts/`)**:
    -   `screenshot.sh`: For taking full-screen, area, or active window screenshots using `grim` and `slurp`.
    -   `volume.sh`: For controlling audio volume using `pactl`.
    -   `brightness.sh`: For adjusting screen brightness using `light`.
    -   `quickshell.sh`: A simple script for quick command execution or launching a terminal.

-   **Dependencies (`dotfiles/deps.txt`)**:
    A list of all recommended packages to ensure the dotfiles function correctly, including `swww` for wallpaper management, `dunst` for notifications, `playerctl` for media control, and `polkit-gnome` for authentication.

## Installation

To install these dotfiles, simply run the `install.sh` script located in the `dotfiles/` directory:

```bash
./dotfiles/install.sh
```

This script will:
1.  Create necessary configuration directories in `~/.config/`.
2.  Create `~/.local/bin/` for custom scripts.
3.  Create a `~/.config/wallpapers/` directory.
4.  Create symbolic links from the `dotfiles/` directory to the appropriate locations in `~/.config/` and `~/.local/bin/`.

**Important**: After installation, ensure all dependencies listed in `dotfiles/deps.txt` are installed on your system. You might also want to place your preferred wallpaper in `~/.config/wallpapers/default.jpg` or update the `exec-once = swww img ...` line in `hyprland.conf`.

## Customization

Feel free to modify these dotfiles to suit your preferences. After making changes:

-   **Hyprland**: Reload the configuration by pressing `$mainMod + R` (Super + R) or by running `hyprctl reload` in a terminal.
-   **Waybar**: Restart Waybar by running `killall waybar && waybar &`.

For more advanced theming, refer to the [Theming](theming.md) section, especially the `hyde-themes` approach.