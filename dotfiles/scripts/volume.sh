
#!/bin/bash

# volume.sh - Script for controlling audio volume in Hyprland

# Dependencies: pactl, dunstify

ACTION="$1"

case "$ACTION" in
    "up")
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        dunstify "Volume" "$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1) 🔊"
        ;;
    "down")
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        dunstify "Volume" "$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1) 🔉"
        ;;
    "mute")
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        if pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes"; then
            dunstify "Volume" "Muted 🔇"
        else
            dunstify "Volume" "Unmuted 🔊"
        fi
        ;;
    *)
        echo "Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac
