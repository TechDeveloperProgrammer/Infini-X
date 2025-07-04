
#!/bin/bash

# quickshell.sh - A simple script for quick commands or launching apps

# Example: Launch a terminal if no arguments are given
if [ -z "$1" ]; then
    kitty
else
    # Execute the given command
    exec "$@"
fi
