
# LXC (Linux Containers)

This document details the integration and conceptual setup of LXC (Linux Containers) within the Infini-X ecosystem. LXC provides a lightweight and efficient way to run isolated Linux environments, offering OS-level virtualization.

## Overview

LXC is a userspace interface for the Linux kernel's containment features. Through a powerful API and simple tools, it allows Linux users to easily create and manage system or application containers. Unlike Docker, which focuses on application containers, LXC is often used for system containers that behave more like lightweight virtual machines, running a full Linux distribution.

## Conceptual Setup

LXC is typically installed from your distribution's repositories. On Arch Linux, you would install the `lxc` package.

### Configuration (`containers/lxc/default.conf`)

LXC containers are configured using `.conf` files. The `containers/lxc/default.conf` file provides an example of common settings, including:

-   `lxc.uts.name`: The hostname of the container.
-   `lxc.arch`: The architecture of the container.
-   `lxc.net.0.type`, `lxc.net.0.link`: Network configuration (e.g., using a bridge).
-   `lxc.rootfs.path`: The path to the container's root filesystem.
-   `lxc.mount.entry`: Mount points for various system directories.
-   `lxc.cgroup.devices.allow`: Cgroup device access rules.
-   `lxc.cap.drop`: Capabilities to drop for security.
-   `lxc.apparmor.profile`, `lxc.seccomp.profile`: Security profiles.

### Example `default.conf` (`containers/lxc/default.conf`):

```ini
# default.conf - LXC container configuration

# This file defines default settings for LXC containers.
# For more details, refer to `man lxc.container.conf`.

# Common configuration
lxc.uts.name = infini-x-container
lxc.arch = amd64

# Network configuration
lxc.net.0.type = veth
lxc.net.0.link = lxcbr0 # Bridge interface on host
lxc.net.0.flags = up
lxc.net.0.hwaddr = 00:16:3e:xx:xx:xx # Replace with a unique MAC address

# Root filesystem
lxc.rootfs.path = /var/lib/lxc/infini-x-container/rootfs

# Mount points
lxc.mount.entry = /sys/fs/fuse/connections sys/fs/fuse/connections none bind,create=dir 0 0
lxc.mount.entry = /sys/kernel/debug sys/kernel/debug none bind,create=dir 0 0
lxc.mount.entry = /sys/kernel/security sys/kernel/security none bind,create=dir 0 0
lxc.mount.entry = /sys/fs/pstore sys/fs/pstore none bind,create=dir 0 0
lxc.mount.entry = /sys/firmware/efi/efivars sys/firmware/efi/efivars none bind,create=dir 0 0

# Cgroup configuration
lxc.cgroup.devices.allow = a *:* rwm

# Capabilities to drop
lxc.cap.drop = sys_module mac_override

# AppArmor profile
lxc.apparmor.profile = unconfined

# Seccomp filter
# lxc.seccomp.profile = /etc/lxc/seccomp.conf

# Autostart on boot
# lxc.start.auto = 1
# lxc.start.delay = 5
```

## Usage

LXC provides a set of command-line tools for managing containers:

-   **Create a container**: `lxc-create -t download -n mycontainer -- -d ubuntu -r focal -a amd64` (downloads an Ubuntu Focal container)
-   **Start a container**: `lxc-start mycontainer`
-   **Attach to a container**: `lxc-attach mycontainer` (to get a shell inside)
-   **Stop a container**: `lxc-stop mycontainer`
-   **Destroy a container**: `lxc-destroy mycontainer`

## Further Development

-   **Automated Container Creation**: Develop scripts to automate the creation of specific LXC container types (e.g., a development environment container, a testing sandbox).
-   **Container Templates**: Create custom LXC templates for Infini-X specific use cases.
-   **Integration with `hyde-cli`**: Add `hyde-cli` commands for LXC management (e.g., `hyde-cli container lxc create <name>`, `hyde-cli container lxc start <name>`).
-   **Resource Management**: Document and implement cgroup configurations for resource limiting (CPU, memory) for LXC containers.
-   **Networking**: Provide more advanced networking configurations for LXC, including custom bridges and VLANs.
