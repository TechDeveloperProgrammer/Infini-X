#!/bin/bash

# Robust install script for Infini-X dotfiles

DOTFILES_DIR="$(dirname "$(realpath "$0")")"
CONFIG_DIR="$HOME/.config"
LOCAL_BIN_DIR="$HOME/.local/bin"

# Ensure .config and .local/bin directories exist
mkdir -p "$CONFIG_DIR/hypr/scripts"
mkdir -p "$CONFIG_DIR/waybar"
mkdir -p "$CONFIG_DIR/wallpapers"
mkdir -p "$LOCAL_BIN_DIR"

echo "Symlinking dotfiles..."

# Hyprland configs
ln -sf "$DOTFILES_DIR/hyprland.conf" "$CONFIG_DIR/hypr/hyprland.conf"
ln -sf "$DOTFILES_DIR/keybinds.conf" "$CONFIG_DIR/hypr/keybinds.conf"
ln -sf "$DOTFILES_DIR/windowrules.conf" "$CONFIG_DIR/hypr/windowrules.conf"
ln -sf "$DOTFILES_DIR/animations.conf" "$CONFIG_DIR/hypr/animations.conf"
ln -sf "$DOTFILES_DIR/decorations.conf" "$CONFIG_DIR/hypr/decorations.conf"
ln -sf "$DOTFILES_DIR/monitors.conf" "$CONFIG_DIR/hypr/monitors.conf"

# Waybar config
ln -sf "$DOTFILES_DIR/waybar.conf" "$CONFIG_DIR/waybar/config"

# Dotfiles scripts
ln -sf "$DOTFILES_DIR/scripts/screenshot.sh" "$CONFIG_DIR/hypr/scripts/screenshot.sh"
ln -sf "$DOTFILES_DIR/scripts/volume.sh" "$CONFIG_DIR/hypr/scripts/volume.sh"
ln -sf "$DOTFILES_DIR/scripts/brightness.sh" "$CONFIG_DIR/hypr/scripts/brightness.sh"

# General scripts (e.g., quickshell)
ln -sf "$DOTFILES_DIR/scripts/quickshell.sh" "$LOCAL_BIN_DIR/quickshell"

# Placeholder wallpaper
# You might want to copy a default wallpaper here or provide instructions for the user
# cp "$DOTFILES_DIR/wallpapers/default.jpg" "$CONFIG_DIR/wallpapers/default.jpg"

echo "Dotfiles installation complete!"
echo "Please ensure all dependencies listed in dotfiles/deps.txt are installed."
echo "Remember to set a default wallpaper in ~/.config/wallpapers/default.jpg and update hyprland.conf if needed."