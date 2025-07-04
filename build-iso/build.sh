#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# Build the ISO
mkarchiso -v -o "${SCRIPT_DIR}/../release" "${SCRIPT_DIR}"

if [ $? -eq 0 ]; then
    echo "ISO built successfully!"
else
    echo "ISO build failed."
    exit 1
fi
