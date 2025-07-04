#!/usr/bin/env bash
# profiledef.sh

# Archiso profile for Infini-X OS

iso_name="Infini-X-OS"
iso_label="INFINIX_$(date +%Y%m%d%H%M)"
iso_publisher="Infini-X OS <https://infini-x.org>"
iso_application="Infini-X OS Live/Installation Medium"
iso_version="$(date +%Y.%m.%d)"

arch="x86_64"
hook_name="archiso"

# Packages to install on the ISO
packages=(
    base
    linux
    linux-firmware
    # Bootloader
    grub
    efibootmgr
    # Network
    networkmanager
    iwd
    # Display Server
    wayland
    xorg-xwayland
    # Hyprland
    hyprland
    hyprpaper
    mako
    swaybg
    # Essential utilities
    git
    vim
    htop
    neofetch
    # Calamares dependencies
    calamares
    qt5-base
    qt5-declarative
    qt5-graphicaleffects
    qt5-quickcontrols2
    qt5-svg
    kpmcore # Calamares dependency
    # Audio
    pipewire
    pipewire-pulse
    wireplumber
    pipewire-alsa
    pipewire-jack
    alsa-utils
    # Fonts
    ttf-dejavu
    # File system tools
    dosfstools
    e2fsprogs
    f2fs-tools
    xfsprogs
    # Other
    sudo
    terminus-font
    # Waybar dependencies
    waybar
    jsoncpp # libjsoncpp
    libgtop # libgtop
    # Containerization and Android emulation
    waydroid
    lxc
)

# Additional packages for airootfs (live environment)
afs_packages=(
    # Desktop environment components
    rofi
    kitty
    thunar
    # Web browser
    firefox
    # Text editor
    neovim
    # Terminal
    alacritty
    # Utilities
    brightnessctl
    pavucontrol
    # Calamares
    calamares
)

buildmodes=(
    'iso'
)

# Copy dotfiles and other configurations to airootfs
# This will be handled by a separate script or during the build process
# For now, just ensure the directories exist

# Set root password for live environment (optional, for testing)
# root_password="arch"

# Enable services in live environment
enable_services=(
    NetworkManager.service
    iwd.service
    # Display Manager (e.g., SDDM if installed)
    # sddm.service
    # PipeWire
    pipewire.service
    pipewire.socket
    wireplumber.service
)

# Copy custom files to airootfs
# This is where you'd copy your dotfiles, scripts, etc.
# For example:
# cp -r "${SCRIPT_DIR}/airootfs/root/.config" "${SCRIPT_DIR}/airootfs/root/"

# You can also add custom commands to run inside the chroot environment
# during the build process. For example, to enable a service:
# chroot_cmd=(
#     "systemctl enable NetworkManager"
# )

