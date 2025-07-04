
# Podman

This document details the integration and conceptual setup of Podman within the Infini-X ecosystem. Podman offers a daemonless alternative to Docker, providing enhanced security and flexibility for container management.

## Overview

Podman is an open-source, daemonless container engine for developing, managing, and running OCI Containers on your Linux system. Unlike Docker, Podman does not require a constantly running daemon, which can simplify its architecture and improve security. It provides a command-line interface that is largely compatible with Docker commands, making it easy for users familiar with Docker to transition.

## Conceptual Setup

Podman is typically installed directly from your distribution's repositories. On Arch Linux, you would install the `podman` package.

### Configuration (`containers/podman/containers.conf`)

Podman's behavior can be configured via the `containers.conf` file. This file allows you to set global defaults for containers, such as:

-   `umask`: Default umask for new containers.
-   `tz`: Default timezone.
-   `log_driver`, `log_size_max`: Logging configuration.
-   `cgroup_manager`: Specifies the cgroup manager (e.g., `systemd`).
-   `pids_limit`, `shm_size`: Resource limits.
-   `image_volume_mode`: How image volumes are handled.

This configuration file is usually located at `/etc/containers/containers.conf` (system-wide) or `~/.config/containers/containers.conf` (user-specific).

### Example `containers.conf` (`containers/podman/containers.conf`):

```ini
# containers.conf - Podman container configuration

# This file configures the behavior of Podman containers.
# For more details, refer to `man containers.conf`.

[containers]
# Default umask for new containers
umask = "0022"

# Default timezone for new containers
tz = "local"

# Default log driver for new containers
log_driver = "k8s-json"

# Default log size for new containers
log_size_max = "-1" # -1 for unlimited

# Default network mode for new containers
network_cmd_args = []

# Default cgroup manager
cgroup_manager = "systemd"

# Default pids limit for new containers
pids_limit = 2048

# Default shm size for new containers
shm_size = "65536k"

# Default image volume mode for new containers
image_volume_mode = "bind"

# Default mounts for new containers
# mounts = [
#   "/home/user/data:/data:rw"
# ]

[network]
# Default network backend
network_backend = "cni"

# Default CNI plugins to load
# cni_plugin_dirs = [
#   "/usr/lib/cni",
#   "/opt/cni/bin"
# ]

[engine]
# Events logger
events_logger = "journald"

# Max number of concurrent operations
max_concurrent_downloads = 3
max_concurrent_uploads = 3

# Enable or disable health checks
healthcheck_on_create = true
healthcheck_on_start = true

# Default registries to search for images
# registries = [
#   "docker.io",
#   "quay.io"
# ]
```

## Usage

Podman commands are largely interchangeable with Docker commands. You can use `podman` in place of `docker` for most operations:

```bash
podman run --rm -it fedora:latest bash
podman build -t my-podman-app .
podman ps -a
podman images
```

Podman also supports `podman-compose` for managing multi-container applications, similar to Docker Compose.

## Further Development

-   **Automated Installation**: Provide a script to automate the installation and initial configuration of Podman.
-   **Rootless Podman**: Detail the setup for running Podman in rootless mode, which is its default and most secure configuration.
-   **Integration with `hyde-cli`**: Add `hyde-cli` commands for managing Podman containers and pods.
-   **Example Containerfiles**: Provide example Containerfiles (Podman's equivalent of Dockerfiles) for Infini-X specific applications.
-   **Systemd Integration**: Document how to manage Podman containers as systemd services.
