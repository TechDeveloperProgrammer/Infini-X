# Dockerfile for Infini-X OS container environment

# This Dockerfile provides a base image for running Infini-X OS components
# in a containerized environment, with support for Wayland and Waydroid.

FROM archlinux/base

LABEL maintainer="Infini-X OS Development Team <dev@infini-x.org>"

# Update system and install necessary packages
RUN pacman -Syu --noconfirm \
    hyprland \
    waybar \
    rofi \
    kitty \
    waydroid \
    lxc \
    dbus \
    mesa \
    xorg-xwayland \
    pipewire \
    wireplumber \
    python \
    python-pip \
    git \
    sudo \
    --needed && \
    pacman -Scc --noconfirm

# Install Python AI dependencies
COPY assistant/requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt

# Create a non-root user for rootless containers
RUN useradd -m -G wheel,lxd,video,audio,input,storage,network -s /bin/bash infini-x && \
    echo "infini-x ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/infini-x

USER infini-x
WORKDIR /home/infini-x

# Copy dotfiles (conceptual - in a real scenario, you'd copy specific configs)
COPY --chown=infini-x:infini-x dotfiles/hypr /home/infini-x/.config/hypr
COPY --chown=infini-x:infini-x dotfiles/waybar /home/infini-x/.config/waybar
COPY --chown=infini-x:infini-x dotfiles/rofi /home/infini-x/.config/rofi
COPY --chown=infini-x:infini-x dotfiles/kitty /home/infini-x/.config/kitty

# Set environment variables for Wayland
ENV XDG_RUNTIME_DIR=/run/user/$(id -u)
ENV WAYLAND_DISPLAY=wayland-0
ENV QT_QPA_PLATFORM=wayland
ENV GDK_BACKEND=wayland

# Expose necessary ports for Waydroid (if running in privileged mode or with host networking)
# EXPOSE 8080 # Example for a web service

CMD ["/bin/bash"]
