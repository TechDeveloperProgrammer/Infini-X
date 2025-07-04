FROM archlinux/base

RUN pacman -Syu --noconfirm git go python python-pip base-devel
RUN pip install --no-cache-dir pre-commit

WORKDIR /workspace/Infini-X

# Install yay (AUR helper)
RUN git clone https://aur.archlinux.org/yay.git /tmp/yay && \
    cd /tmp/yay && \
    makepkg -si --noconfirm && \
    rm -rf /tmp/yay

# Install common development tools
RUN yay -S --noconfirm neovim zsh tmux htop
