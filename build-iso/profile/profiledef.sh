
#!/usr/bin/env bash
# profiledef.sh

# This file is part of Archiso project
# https://gitlab.archlinux.org/archlinux/archiso/-/blob/master/docs/profile-definition.rst

# Architecture
arch="x86_64"

# Profile name
iso_name="infini-x"

# ISO label
iso_label="INFINI_X_$(date +%Y%m%d%H%M)"

# Disk label
disk_label="INFINI_X_$(date +%Y%m%d%H%M)"

# Bootloader
bootmodes=("bios" "uefi")

# Kernel parameters
kernel_parameters=("quiet" "splash" "udev.log_priority=3" "systemd.show_status=false" "rd.udev.log_priority=3")

# Packages to install (base system and live environment)
packages=(
    base
    linux
    linux-firmware
    grub
    efibootmgr
    networkmanager
    wpa_supplicant
    dhcpcd
    mesa
    xorg-xwayland
    vulkan-intel
    vulkan-radeon
    terminus-font
    reflector
    htop
    neofetch
    calamares
    qt5-base
    qt5-declarative
    qt5-graphicaleffects
    qt5-quickcontrols
    qt5-quickcontrols2
    qt5-svg
    polkit-qt5
    python-pyqt5
    python-yaml
    git
    curl
    wget
    rsync
    # Add other essential packages here
)

# Hooks for customizing the airootfs
# These scripts are run inside the chroot environment
# The customize_airootfs.sh script will be copied to /root/customize_airootfs.sh
# and executed by the airootfs_install_hook.

airootfs_install_hook() {
    # Copy customize_airootfs.sh to the target rootfs
    cp "${script_path}/airootfs/root/customize_airootfs.sh" "${airootfs_path}/root/customize_airootfs.sh"
    chmod +x "${airootfs_path}/root/customize_airootfs.sh"

    # Copy dotfiles install script to a well-known location
    mkdir -p "${airootfs_path}/usr/local/bin"
    cp "${script_path}/airootfs/usr/local/bin/install-dotfiles.sh" "${airootfs_path}/usr/local/bin/install-dotfiles.sh"
    chmod +x "${airootfs_path}/usr/local/bin/install-dotfiles.sh"

    # Copy dotfiles themselves to a temporary location on the ISO
    # This allows customize_airootfs.sh to copy them to the user's home
    mkdir -p "${airootfs_path}/tmp/dotfiles"
    cp -r "${script_path}/../../dotfiles/." "${airootfs_path}/tmp/dotfiles/"
}

airootfs_install_hook_after_pacstrap() {
    # Execute customize_airootfs.sh after pacstrap completes
    chroot "${airootfs_path}" /root/customize_airootfs.sh
}

# Copy Calamares configuration to the airootfs
airootfs_install_hook_after_pacstrap() {
    # Ensure Calamares config directory exists
    mkdir -p "${airootfs_path}/etc/calamares"
    # Copy all Calamares config files
    cp -r "${script_path}/../../calamares-config/." "${airootfs_path}/etc/calamares/"
}

# Set up default user skeleton
airootfs_install_hook_after_pacstrap() {
    # Copy skeleton files to /etc/skel
    cp -r "${script_path}/airootfs/etc/skel/." "${airootfs_path}/etc/skel/"
}

# Set up default wallpaper
airootfs_install_hook_after_pacstrap() {
    mkdir -p "${airootfs_path}/usr/share/backgrounds/infini-x"
    cp "${script_path}/../../dotfiles/wallpapers/default.jpg" "${airootfs_path}/usr/share/backgrounds/infini-x/default.jpg"
}

# Set up default Hyprland config for live user
airootfs_install_hook_after_pacstrap() {
    mkdir -p "${airootfs_path}/etc/skel/.config/hypr"
    cp "${script_path}/../../dotfiles/hyprland.conf" "${airootfs_path}/etc/skel/.config/hypr/hyprland.conf"
    cp "${script_path}/../../dotfiles/keybinds.conf" "${airootfs_path}/etc/skel/.config/hypr/keybinds.conf"
    cp "${script_path}/../../dotfiles/windowrules.conf" "${airootfs_path}/etc/skel/.config/hypr/windowrules.conf"
    cp "${script_path}/../../dotfiles/animations.conf" "${airootfs_path}/etc/skel/.config/hypr/animations.conf"
    cp "${script_path}/../../dotfiles/decorations.conf" "${airootfs_path}/etc/skel/.config/hypr/decorations.conf"
    cp "${script_path}/../../dotfiles/monitors.conf" "${airootfs_path}/etc/skel/.config/hypr/monitors.conf"

    mkdir -p "${airootfs_path}/etc/skel/.config/hypr/scripts"
    cp "${script_path}/../../dotfiles/scripts/screenshot.sh" "${airootfs_path}/etc/skel/.config/hypr/scripts/screenshot.sh"
    cp "${script_path}/../../dotfiles/scripts/volume.sh" "${airootfs_path}/etc/skel/.config/hypr/scripts/volume.sh"
    cp "${script_path}/../../dotfiles/scripts/brightness.sh" "${airootfs_path}/etc/skel/.config/hypr/scripts/brightness.sh"

    mkdir -p "${airootfs_path}/etc/skel/.config/waybar"
    cp "${script_path}/../../dotfiles/waybar.conf" "${airootfs_path}/etc/skel/.config/waybar/config"
}

# Set up default .bashrc and .zshrc for live user
airootfs_install_hook_after_pacstrap() {
    cp "${script_path}/airootfs/etc/skel/.bashrc" "${airootfs_path}/etc/skel/.bashrc"
    cp "${script_path}/airootfs/etc/skel/.zshrc" "${airootfs_path}/etc/skel/.zshrc"
}

# Set up default user for live environment
airootfs_install_hook_after_pacstrap() {
    useradd -m -g users -G wheel,storage,power,audio,video -s /bin/bash infini
    echo "infini:live" | chpasswd
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > "${airootfs_path}/etc/sudoers.d/10-liveuser"
}

# Enable services for live environment
airootfs_install_hook_after_pacstrap() {
    chroot "${airootfs_path}" systemctl enable NetworkManager
    chroot "${airootfs_path}" systemctl enable sddm # Or your preferred display manager
    chroot "${airootfs_path}" systemctl enable calamares-live.service
}

# Clean up after installation
airootfs_install_hook_after_pacstrap() {
    rm "${airootfs_path}/root/customize_airootfs.sh"
    rm -rf "${airootfs_path}/tmp/dotfiles"
}
