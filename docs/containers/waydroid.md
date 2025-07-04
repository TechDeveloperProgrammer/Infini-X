
# WayDroid

This document details the integration and conceptual setup of WayDroid within the Infini-X ecosystem, enabling you to run a full Android operating system in a container on your Linux desktop.

## Overview

WayDroid is a lightweight container solution that allows you to run a complete Android system on a Linux device. It leverages Linux namespaces (like `cgroups` and `namespaces`) for isolation and uses Wayland for display, providing a near-native Android experience. This is particularly useful for Android app development, testing, or simply running Android-only applications on your Linux machine.

## Conceptual Setup

1.  **Install WayDroid**: On Arch Linux, WayDroid can typically be installed from the AUR (Arch User Repository). Ensure you have an AUR helper like `yay` or `paru`.

    ```bash
yay -S waydroid
    ```

2.  **Initialize WayDroid**: After installation, you need to initialize the WayDroid container. This downloads the necessary Android images.

    ```bash
sudo waydroid init
    ```

3.  **Start WayDroid**: You can start the WayDroid UI, which will launch the Android environment in a window on your Wayland desktop.

    ```bash
waydroid show-full-ui
    ```

### `containers/waydroid/config.sh`

This script provides a conceptual framework for automating WayDroid setup and management. It includes commands for:

-   `init`: Initializes the WayDroid container.
-   `start`: Starts the WayDroid UI.
-   `stop`: Stops the WayDroid session.
-   `install <apk_path>`: Installs an APK file into the WayDroid container using `adb`.
-   `shell`: Opens an `adb` shell into the WayDroid container.

### Example Usage of `config.sh`:

```bash
./containers/waydroid/config.sh init
./containers/waydroid/config.sh start
./containers/waydroid/config.sh install /path/to/your/app.apk
./containers/waydroid/config.sh shell
```

## Integration with `android-platform-tools`

`android-platform-tools` (which includes `adb` and `fastboot`) is crucial for interacting with the WayDroid container. `adb` (Android Debug Bridge) allows you to:

-   Install APKs (`adb install <apk_file>`)
-   Access the Android shell (`adb shell`)
-   Push and pull files (`adb push`, `adb pull`)
-   Debug applications

Ensure `android-platform-tools` is installed and `adb` is in your system's PATH.

## Further Development

-   **Automated Setup**: Create a more robust script to fully automate WayDroid installation, initialization, and configuration, including handling dependencies.
-   **WayDroid Session Management**: Implement more advanced session management (e.g., starting WayDroid as a background service, managing multiple WayDroid instances).
-   **Integration with `hyde-cli`**: Add `hyde-cli` commands for WayDroid management (e.g., `hyde-cli android waydroid start`, `hyde-cli android waydroid install <apk>`).
-   **Performance Tuning**: Document and implement optimizations for WayDroid performance on various hardware configurations.
-   **GPU Passthrough**: Explore and document methods for GPU passthrough to WayDroid for enhanced gaming or graphics-intensive applications.
