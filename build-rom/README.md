
# Infini-X Android GSI ROM Build

This directory contains scripts and configurations for building Android Generic System Images (GSI) for x86_64 devices.

## Overview
Building a GSI involves creating a minimal Linux root filesystem, installing Android system components into it, and then packaging it into a flashable `.img` file. This process is complex and requires specific tools and a deep understanding of Android's build system.

## Structure
- `make_gsi.sh`: Script to create the base Android GSI filesystem using `debootstrap`.
- `convert_to_img.sh`: Script to convert the built GSI filesystem into a flashable `.img` format using `e2fsprogs` and `lzip`.
- `deps.txt`: List of required tools and dependencies.
- `config/`: Directory for GSI build configuration files.
  - `config/gsi_build.conf`: Defines parameters like target architecture, Android version, and build type.
- `README.md`: This file.

## Dependencies
To run these scripts, you need the following tools installed on your system:

- `debootstrap`: Used to create a minimal Debian-based root filesystem.
- `e2fsprogs`: Utilities for the ext2/ext3/ext4 filesystem, used for creating and manipulating the GSI image.
- `lzip`: A data compressor, potentially used for compressing the final image.
- `android-gsi-tools`: A collection of tools specifically designed for GSI manipulation (e.g., `img2simg`, `simg2img`). These are often part of the Android SDK Platform Tools or available from AOSP.
- `sudo`: Required for `debootstrap` and mounting operations.
- `rsync`: For efficient copying of files.

## Usage

1.  **Configure Build**: Edit `config/gsi_build.conf` to set your desired `TARGET_ARCH`, `ANDROID_VERSION`, `BUILD_TYPE`, etc.

2.  **Install Dependencies**: Ensure all tools listed in `deps.txt` are installed on your system.

3.  **Build GSI Root Filesystem**: Execute `make_gsi.sh` to create the base GSI filesystem. This script will set up a chroot environment and conceptually prepare for the Android build.
    ```bash
    ./make_gsi.sh
    ```

4.  **Convert to Image**: Execute `convert_to_img.sh` to package the GSI into a flashable `.img` file.
    ```bash
    ./convert_to_img.sh
    ```

## `make_gsi.sh` Details
This script performs the following conceptual steps:
1.  Creates a chroot environment using `debootstrap` with the specified `TARGET_ARCH` and `DEBIAN_RELEASE`.
2.  Installs basic build tools within the chroot.
3.  **Crucially, this script *conceptually* outlines where you would integrate the actual AOSP build process.** A full AOSP build involves syncing the source code, configuring the build environment, and running `make` commands to generate the `system.img`. This part is left as a placeholder for the user to integrate their specific AOSP build steps.

## `convert_to_img.sh` Details
This script performs the following steps:
1.  Calculates an appropriate size for the GSI image based on the created root filesystem.
2.  Creates a raw image file using `dd`.
3.  Formats the raw image as an `ext4` filesystem using `mkfs.ext4`.
4.  Mounts the formatted image and copies the contents of the GSI root filesystem into it using `rsync`.
5.  Optionally converts the image to an Android sparse image format using `img2simg` if the tool is available. This reduces the image size for flashing.

## Further Development
- **Full AOSP Integration**: Replace the conceptual AOSP build steps in `make_gsi.sh` with actual commands to clone, configure, and build AOSP.
- **Automated Dependency Installation**: Add a script to automatically install all required dependencies.
- **Error Handling and Logging**: Implement more robust error handling and detailed logging for better debugging.
- **Support for Different Architectures/Versions**: Extend the scripts to easily support different Android versions and device architectures.
- **Testing**: Develop automated tests for the GSI build process.
