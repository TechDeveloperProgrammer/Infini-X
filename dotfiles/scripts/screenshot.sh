
#!/bin/bash

# screenshot.sh - Script for taking screenshots in Hyprland

# Dependencies: grim, slurp, wl-clipboard

ACTION="$1"

case "$ACTION" in
    "full")
        grim - | wl-copy
        dunstify "Screenshot" "Full screen copied to clipboard."
        ;;
    "area")
        grim -g "$(slurp)" - | wl-copy
        dunstify "Screenshot" "Selected area copied to clipboard."
        ;;
    "window")
        grim -g "$(hyprctl activewindow | grep 'at:' | awk '{print $2}' | tr -d ',' | sed 's/x/ /g') $(hyprctl activewindow | grep 'size:' | awk '{print $2}' | tr -d ',' | sed 's/x/ /g')" - | wl-copy
        dunstify "Screenshot" "Active window copied to clipboard."
        ;;
    *)
        echo "Usage: $0 {full|area|window}"
        exit 1
        ;;
esac
