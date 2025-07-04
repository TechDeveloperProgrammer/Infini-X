#!/bin/bash

# customize_airootfs.sh
# This script runs inside the chroot environment after the base system is installed.
# It performs post-installation tasks for the Infini-X system.

set -e # Exit immediately if a command exits with a non-zero status.

echo "Running customize_airootfs.sh..."

# 1. Set root password
echo "Setting root password..."
echo "root:infinix" | chpasswd

# 2. Create a default user (e.g., 'infini')
echo "Creating default user 'infini'..."
useradd -m -g users -G wheel,storage,power,audio,video -s /bin/bash infini
echo "infini:infinix" | chpasswd

# 3. Enable sudo for wheel group
echo "Enabling sudo for wheel group..."
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/10-wheel

# 4. Install additional packages
echo "Installing additional packages..."
pacman -Syu --noconfirm --needed - < /tmp/packages.x86_64.add

# 5. Enable essential services
echo "Enabling essential system services..."
systemctl enable NetworkManager
systemctl enable sddm.service # Enable your chosen display manager

# 6. Copy dotfiles to the new user's home directory
echo "Copying dotfiles to /home/infini/..."
mkdir -p /home/infini/.config
cp -r /tmp/dotfiles/. /home/infini/.config/
chown -R infini:users /home/infini/.config

# 7. Run the dotfiles install script for the new user
echo "Running dotfiles install script for 'infini' user..."
su - infini -c "/usr/local/bin/install-dotfiles.sh"

# 8. Clean up pacman cache
echo "Cleaning up pacman cache..."
pacman -Scc --noconfirm

# 9. Remove temporary files from the installed system
echo "Removing temporary files..."
rm /root/customize_airootfs.sh
rm /tmp/packages.x86_64.add
rm -rf /tmp/dotfiles

echo "customize_airootfs.sh complete."