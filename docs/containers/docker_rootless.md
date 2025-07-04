
# Docker Rootless

This document details the integration and conceptual setup of Docker in rootless mode within the Infini-X ecosystem. Running Docker without root privileges significantly enhances security and is the recommended approach for containerized development and deployment.

## Overview

Docker's rootless mode allows a non-root user to run the Docker daemon and containers. This means that if a container or the Docker daemon itself is compromised, the attacker does not gain root privileges on the host system, limiting the potential damage.

## Conceptual Setup

Setting up Docker in rootless mode typically involves the following steps:

1.  **Install Docker Engine**: Install the standard Docker Engine packages (e.g., `docker-ce`, `docker-ce-cli`, `containerd.io`).

2.  **Install Rootless Dependencies**: Ensure `rootlesskit` and `slirp4netns` are installed. These tools are crucial for providing the necessary network and filesystem isolation for rootless containers.

3.  **Run Rootless Setup Tool**: Execute the `dockerd-rootless-setuptool.sh` script, which comes with the Docker installation. This script sets up the necessary user namespaces, cgroups, and configurations for the rootless daemon.

    ```bash
    dockerd-rootless-setuptool.sh install
    ```

4.  **Configure `daemon.json`**: The `containers/docker/daemon.json` file provides an example configuration for the rootless Docker daemon. Key settings include:
    -   `data-root`: Specifies the directory where Docker stores its data (images, volumes, etc.). For rootless mode, this should be in the user's home directory (e.g., `~/.local/share/docker`).
    -   `storage-driver`: Typically `overlay2`.
    -   `log-opts`: Configuration for container logging.

    This file is usually located at `~/.config/docker/daemon.json` for rootless installations.

### Example `daemon.json` (`containers/docker/daemon.json`):

```json
{
  "builder": {
    "gc": {
      "defaultDuration": "10m0s",
      "enabled": true
    }
  },
  "experimental": false,
  "features": {
    "buildkit": true
  },
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  },
  "storage-driver": "overlay2",
  "data-root": "/home/youruser/.local/share/docker" # Important for rootless
}
```

## Usage

Once set up, you can use Docker commands as usual, but they will operate within your user's rootless environment:

```bash
docker run hello-world
docker build -t my-app .
docker ps
```

## Further Development

-   **Automated Installation Script**: Create a script to fully automate the installation and configuration of Docker in rootless mode on Arch Linux.
-   **Integration with `hyde-cli`**: Add `hyde-cli` commands for managing Docker containers (e.g., `hyde-cli container docker start <name>`, `hyde-cli container docker stop <name>`).
-   **Example Dockerfiles**: Provide example Dockerfiles for Infini-X specific applications or services.
-   **Security Hardening**: Explore additional security measures for rootless Docker environments.
