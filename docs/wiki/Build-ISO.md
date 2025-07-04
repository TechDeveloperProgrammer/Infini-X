# Building the Infini-X OS ISO

This guide explains how to build your own custom Infini-X OS ISO image using `archiso`.

## Prerequisites

-   An Arch Linux installation.
-   `archiso` package installed:

    ```bash
    sudo pacman -S archiso
    ```

## Build Process

1.  **Clone the Repository:**

    ```bash
    git clone https://github.com/Infini-X/Infini-X.git
    cd Infini-X
    ```

2.  **Navigate to Build Directory:**

    ```bash
    cd build-iso
    ```

3.  **Run the Build Script:**

    ```bash
    sudo ./build.sh
    ```

    The `build.sh` script will use the `profiledef.sh` and the `airootfs` directory to create the ISO image. The generated ISO will be located in the `release` directory (relative to the project root).

## Customization

-   **`profiledef.sh`:** This file defines the packages to be included in the ISO, the ISO name, label, and other build-time configurations. You can modify this file to add or remove packages, change the default desktop environment, etc.

-   **`airootfs/`:** This directory represents the root filesystem of the live environment. Any files placed here will be copied directly to the live system. This is where you would put custom configurations, scripts, or dotfiles that you want to be present in the live environment and potentially installed system.

    -   **Dotfiles:** To include your custom dotfiles, copy them into `airootfs/root/` or `airootfs/etc/skel/` (for new user profiles).
    -   **Custom Scripts:** Place any custom scripts in `airootfs/usr/local/bin/` or similar locations.

## Troubleshooting

-   **`mkarchiso` errors:** Ensure you have sufficient disk space and that all required packages are installed.
-   **Package conflicts:** If you encounter package conflicts, try updating your Arch Linux system (`sudo pacman -Syu`) before building.
