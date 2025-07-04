
# Infini-X Container Support

This directory outlines the strategy and provides conceptual configurations for various container technologies supported within the Infini-X ecosystem. The goal is to provide flexible and powerful containerization options for development, deployment, and specialized use cases like Android app virtualization.

## Supported Technologies
- **Docker (Rootless)**: For running Docker containers without root privileges, enhancing security.
- **Podman**: A daemonless container engine, compatible with Docker commands, offering an alternative for building, running, and managing containers.
- **WayDroid**: A lightweight container solution to run a full Android operating system on Linux, leveraging Wayland.
- **LXC (Linux Containers)**: A low-level container runtime that provides OS-level virtualization.

## Structure
- `docker/`: Configurations and scripts for Docker (rootless).
  - `docker/daemon.json`: Example daemon configuration for rootless mode.
- `podman/`: Configurations and scripts for Podman.
  - `podman/containers.conf`: Example Podman container configuration.
- `waydroid/`: Configurations and scripts for WayDroid.
  - `waydroid/config.sh`: Conceptual script for WayDroid setup.
- `lxc/`: Configurations and scripts for LXC.
  - `lxc/default.conf`: Example LXC container configuration.
- `README.md`: This file.

## Docker (Rootless)

Docker rootless mode allows running the Docker daemon and containers as a non-root user. This significantly improves security by isolating the Docker daemon from the host system's root user.

### Conceptual Setup
1.  **Install `docker-ce` and `docker-compose`**.
2.  **Install `rootlesskit` and `slirp4netns`** (usually dependencies of rootless Docker).
3.  **Run `dockerd-rootless-setuptool.sh install`**.
4.  **Configure `daemon.json`** for specific settings (e.g., storage driver, registries).

## Podman

Podman is a daemonless container engine for developing, managing, and running OCI Containers on your Linux system. Containers can either be run as root or in a rootless mode.

### Conceptual Usage
-   `podman run ...` (similar to `docker run`)
-   `podman build ...` (similar to `docker build`)
-   `podman-compose` (for multi-container applications)

### Configuration
`containers.conf` can be used to set global defaults for Podman containers.

## WayDroid

WayDroid runs a complete Android system in a container on a Linux device. It uses Linux namespaces to provide a lightweight sandbox and leverages Wayland for display.

### Conceptual Setup
1.  **Install WayDroid** (e.g., from AUR on Arch Linux).
2.  **Initialize WayDroid**: `sudo waydroid init`.
3.  **Start WayDroid**: `sudo waydroid show-full-ui`.

### Integration with `android-platform-tools`
`android-platform-tools` (which includes `adb` and `fastboot`) is essential for interacting with the WayDroid container, such as installing APKs, debugging, or accessing the shell.

## LXC (Linux Containers)

LXC is a userspace interface for the Linux kernel's containment features. Through a powerful API and simple tools, it allows Linux users to easily create and manage system or application containers.

### Conceptual Usage
-   `lxc-create -t download -n mycontainer -- -d ubuntu -r focal -a amd64`
-   `lxc-start mycontainer`
-   `lxc-attach mycontainer`

## Further Development
- Provide concrete, tested configuration files for each container technology.
- Develop scripts to automate the setup and management of these container environments.
- Integrate container management into the `hyde-cli` for a unified experience.
- Create example Dockerfiles or Containerfiles for Infini-X specific applications.
