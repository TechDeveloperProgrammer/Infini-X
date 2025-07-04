#!/bin/bash

# install-audio-stack.sh - Script to install and configure the audio stack (PipeWire)

echo "Installing and configuring PipeWire audio stack..."

# Install PipeWire and related packages
sudo pacman -S --noconfirm pipewire pipewire-pulse wireplumber pipewire-alsa pipewire-jack

# Enable PipeWire services
systemctl --user enable pipewire.service
systemctl --user enable pipewire.socket
systemctl --user enable wireplumber.service

echo "PipeWire audio stack installed and configured."
