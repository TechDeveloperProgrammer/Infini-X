# Installation Guide

This guide will walk you through the process of installing Infini-X OS on your system.

## Prerequisites

-   A USB drive (at least 8GB) to create a bootable installer.
-   A computer with x86_64 architecture.
-   Internet connection (recommended for updates during installation).

## Steps

1.  **Download the ISO:** Obtain the latest Infini-X OS ISO image from the [official website](https://infini-x.org/downloads) or GitHub releases.

2.  **Create a Bootable USB:** Use a tool like Etcher or Rufus to write the ISO image to your USB drive.

    ```bash
    # Example using dd on Linux (replace /dev/sdX with your USB drive)
    sudo dd bs=4M if=/path/to/infini-x-os.iso of=/dev/sdX status=progress oflag=sync
    ```

3.  **Boot from USB:** Restart your computer and boot from the USB drive. You may need to adjust your BIOS/UEFI settings to prioritize booting from USB.

4.  **Launch Calamares Installer:** Once the live environment loads, you will find the Calamares installer icon on the desktop or in the application menu. Double-click it to start the installation wizard.

5.  **Follow the Wizard:** Calamares will guide you through the following steps:
    -   **Welcome:** Select your preferred language.
    -   **Location:** Set your timezone and region.
    -   **Keyboard:** Choose your keyboard layout.
    -   **Partitions:** Select how you want to partition your disk. You can choose to erase the entire disk, install alongside another OS, or manually partition.
    -   **Users:** Create your user account and set a password.
    -   **Summary:** Review your installation settings before proceeding.

6.  **Install:** Click "Install" to begin the installation process. This may take some time depending on your system specifications and internet speed.

7.  **Restart:** Once the installation is complete, you will be prompted to restart your computer. Remove the USB drive when prompted.

## Post-Installation

After a successful installation, you can log in to your new Infini-X OS system. Refer to other documentation sections for post-installation configurations and tips.
