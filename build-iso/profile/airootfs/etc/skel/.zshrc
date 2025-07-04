
# .zshrc for Infini-X live user and installed system

# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

# Set name of the theme to load. See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often auto-updates happen:
# UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files under
# VCS as dirty.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command. Options: mmm-dd hh:mm (default), yyyy-mm-dd hh:mm,
# yyyy-mm-dd_hh:mm, "mm/dd/yyyy hh:mm"
# HIST_STAMPS="mm/dd/yyyy hh:mm"

# Uncomment the following line if you are using Linux and want to use the system's clipboard.
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins-Overview#linux-clipboard
# DISABLE_AUTO_COPY_FROM_CLIPBOARD="true"

# You may need to manually load this plugin if you are using a custom theme.
# plugins=(
#   git
#   zsh-autosuggestions
#   zsh-syntax-highlighting
# )

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# User configuration
# export PATH="/usr/local/bin:$PATH"

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Custom prompt (optional)
# PROMPT='%F{green}%n@%m%f:%F{blue}%~%f%# '
