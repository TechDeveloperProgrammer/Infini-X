# Building the Infini-X OS GSI ROM

This guide outlines the process of building a Generic System Image (GSI) ROM for Android devices from the Infini-X OS rootfs.

## Overview

The GSI ROM allows you to run a minimal Arch Linux environment with Hyprland on compatible Android devices. This is an advanced process and requires familiarity with Android development and flashing procedures.

## Prerequisites

-   A Linux environment (preferably Arch Linux).
-   Android SDK Platform-Tools (adb, fastboot) installed.
-   `make_gsi.sh` script and its dependencies (currently placeholders).
-   A compatible ARM64 Android device with an unlocked bootloader.

## Build Process (Conceptual)

1.  **Prepare the Arch Linux RootFS:**

    This is the most critical step. You need an Arch Linux root filesystem that is specifically tailored for Android. This involves:
    -   Installing necessary Android userspace binaries (e.g., `surfaceflinger`, `hwcomposer`).
    -   Configuring `systemd` or `init` to work within the Android environment.
    -   Ensuring Wayland and Hyprland can run on Android's graphics stack.

2.  **Navigate to Build Directory:**

    ```bash
    cd Infini-X/build-rom
    ```

3.  **Run the GSI Build Script:**

    ```bash
    ./make_gsi.sh
    ```

    **Note:** As mentioned in `build-rom/README.md`, `make_gsi.sh` is currently a placeholder. A fully functional script will involve complex steps like:
    -   Creating a sparse image from the rootfs.
    -   Signing the image.
    -   Generating `vbmeta.img`.

## Flashing the GSI

**Disclaimer:** Flashing custom ROMs can brick your device if not done correctly. Proceed with caution and at your own risk.

1.  **Boot into Fastboot Mode:** Power off your Android device and boot it into Fastboot mode (usually by holding Power + Volume Down).

2.  **Flash the GSI and VBMeta:**

    ```bash
    fastboot flash system infini-x-gsi.img
    fastboot flash vbmeta vbmeta.img --disable-verity --disable-verification
    ```

3.  **Reboot:**

    ```bash
    fastboot reboot
    ```

## Troubleshooting

-   **Bootloops:** If your device bootloops, try reflashing your stock ROM.
-   **Graphics issues:** Ensure your kernel and userspace components are compatible with your device's GPU.
-   **No touch input:** Verify that the necessary touch drivers are included in your kernel and that Wayland is configured correctly.
