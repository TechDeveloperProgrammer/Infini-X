# Android GSI

This section provides a detailed guide on how to build Android Generic System Images (GSI) for Infini-X. A GSI is a pure Android implementation with unmodified Android Open Source Project (AOSP) code, designed to run on a wide range of Android devices.

## Overview

Building a GSI involves creating a minimal Linux root filesystem, integrating Android system components, and then packaging it into a flashable `.img` file. While the process is complex, our scripts aim to streamline the initial setup and conversion.

## Build Process

Our GSI build process is orchestrated by two main scripts in the `build-rom/` directory:

1.  **`make_gsi.sh`**: This script is responsible for preparing the base Linux environment where the Android GSI will be built. It performs the following conceptual steps:
    -   **Configuration Loading**: Loads build parameters from `build-rom/config/gsi_build.conf`, including `TARGET_ARCH` (e.g., `x86_64`), `ANDROID_VERSION` (e.g., `14`), `BUILD_TYPE` (e.g., `userdebug`), `DEBIAN_RELEASE`, and `DEBOOTSTRAP_MIRROR`.
    -   **Debootstrap**: Uses `debootstrap` to create a minimal Debian-based root filesystem in a specified `gsi_rootfs` directory. This serves as the chroot environment for the Android build.
    -   **Chroot Setup**: Enters the newly created root filesystem via `chroot`.
    -   **Basic Build Tools Installation**: Installs essential tools like `build-essential`, `git`, `curl`, `wget`, `unzip`, `rsync`, and `sudo` within the chroot.
    -   **AOSP Integration (Conceptual)**: This is the most critical and complex part. The script provides a *conceptual outline* of where you would integrate the actual AOSP build process. In a real-world scenario, this would involve:
        -   Syncing the AOSP source code using `repo init` and `repo sync`.
        -   Setting up the Android build environment (`source build/envsetup.sh`).
        -   Selecting the target build configuration (`lunch aosp_${TARGET_ARCH}-${BUILD_TYPE}`).
        -   Building the `system.img` using `make -j$(nproc) systemimage`.
        -   Copying the generated `system.img` to a known location within the chroot.

2.  **`convert_to_img.sh`**: After `make_gsi.sh` has conceptually produced the Android system files, this script converts the prepared root filesystem into a flashable `.img` format. It performs:
    -   **Configuration Loading**: Loads build parameters from `build-rom/config/gsi_build.conf`.
    -   **Dependency Check**: Verifies the presence of `mkfs.ext4` (from `e2fsprogs`) and `rsync`.
    -   **Image Creation**: Calculates an appropriate size for the GSI image and creates a raw image file using `dd`.
    -   **Filesystem Formatting**: Formats the raw image as an `ext4` filesystem using `mkfs.ext4`.
    -   **Content Copying**: Mounts the formatted image and copies the contents of the GSI root filesystem into it using `rsync`.
    -   **Sparse Image Conversion (Optional)**: If `img2simg` (from `android-gsi-tools`) is available, it converts the image to an Android sparse image format, which is more efficient for flashing.

## Dependencies

To successfully build an Android GSI, ensure you have the following tools installed on your host system:

-   `debootstrap`: For creating the minimal Debian root filesystem.
-   `e2fsprogs`: Provides `mkfs.ext4` for formatting the image.
-   `lzip`: (Optional) For compression, though `img2simg` is more common for GSI.
-   `android-gsi-tools`: Essential tools like `img2simg` and `simg2img`, typically found in the Android SDK Platform Tools or AOSP build environment.
-   `sudo`: Required for `debootstrap` and mounting operations.
-   `rsync`: For efficient file synchronization.
-   **AOSP Build Environment**: A complete AOSP build environment (including `repo`, `git`, `openjdk`, etc.) is implicitly required for the conceptual AOSP integration step within `make_gsi.sh`.

## Usage

1.  **Configure Build**: Edit `build-rom/config/gsi_build.conf` to specify your desired target architecture, Android version, and build type.

2.  **Install Dependencies**: Ensure all tools listed above are installed on your system.

3.  **Build GSI Root Filesystem**: Execute `make_gsi.sh`:
    ```bash
    ./build-rom/make_gsi.sh
    ```
    *Remember to integrate your actual AOSP build steps into this script's chroot section.*

4.  **Convert to Image**: Execute `convert_to_img.sh`:
    ```bash
    ./build-rom/convert_to_img.sh
    ```

Upon successful completion, a flashable GSI image (`infini-x-gsi-<arch>-<version>-<build_type>.img`) will be created in the `build-rom/` directory.

## Further Development

-   **Full AOSP Integration**: Replace the conceptual AOSP build steps in `make_gsi.sh` with actual, automated commands to clone, configure, and build AOSP. This would involve significant scripting and potentially large downloads.
-   **Automated Dependency Installation**: Create a script to automatically install all required host system dependencies.
-   **Error Handling and Logging**: Implement more robust error handling and detailed logging for better debugging of the build process.
-   **Support for Different Architectures/Versions**: Extend the scripts to easily support different Android versions and device architectures by dynamically adjusting build commands and configurations.
-   **Testing**: Develop automated tests to verify the integrity and functionality of the built GSI.