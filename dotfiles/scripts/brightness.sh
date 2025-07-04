
#!/bin/bash

# brightness.sh - Script for controlling screen brightness in Hyprland

# Dependencies: light (or brightnessctl), dunstify

ACTION="$1"

case "$ACTION" in
    "up")
        light -A 5
        dunstify "Brightness" "$(light -G)% 🔆"
        ;;
    "down")
        light -U 5
        dunstify "Brightness" "$(light -G)%  dimmer  dimmer 🔅"
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac
