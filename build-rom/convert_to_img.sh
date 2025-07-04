#!/bin/bash

# convert_to_img.sh - Script to convert GSI rootfs to .img format

set -e # Exit immediately if a command exits with a non-zero status.

# Load configuration
if [ -f "$(dirname "$0")/config/gsi_build.conf" ]; then
    source "$(dirname "$0")/config/gsi_build.conf"
else
    echo "Error: GSI build configuration not found. Please create build-rom/config/gsi_build.conf"
    exit 1
fi

ROOTFS_DIR="$(pwd)/gsi_rootfs"
OUTPUT_IMG="$(pwd)/infini-x-gsi-${TARGET_ARCH}-${ANDROID_VERSION}-${BUILD_TYPE}.img"

echo "Starting GSI to image conversion..."

if [ ! -d "${ROOTFS_DIR}" ]; then
    echo "Error: GSI root filesystem not found at ${ROOTFS_DIR}. Please run make_gsi.sh first."
    exit 1
fi

# Check for necessary tools
if ! command -v mkfs.ext4 &> /dev/null; then
    echo "Error: mkfs.ext4 not found. Please install e2fsprogs."
    exit 1
fi

if ! command -v rsync &> /dev/null; then
    echo "Error: rsync not found. Please install rsync."
    exit 1
fi

# 1. Calculate required size (optional, for more dynamic sizing)
# This is a rough estimate. A real GSI build would have a more precise size.
CURRENT_SIZE_KB=$(sudo du -sk ${ROOTFS_DIR} | awk '{print $1}')
IMG_SIZE_MB=$(( (CURRENT_SIZE_KB / 1024) + 512 )) # Add some buffer

# Use default if calculated size is too small
if (( IMG_SIZE_MB < DEFAULT_GSI_SIZE_MB )); then
    IMG_SIZE_MB=${DEFAULT_GSI_SIZE_MB}
fi

echo "Creating raw image file: ${OUTPUT_IMG} with size ${IMG_SIZE_MB}MB"
dd if=/dev/zero of=${OUTPUT_IMG} bs=1M count=${IMG_SIZE_MB}

# 2. Format the image as ext4
echo "Formatting image as ext4..."
mkfs.ext4 -F ${OUTPUT_IMG}

# 3. Mount the image and copy the rootfs contents
echo "Mounting image and copying rootfs contents..."
mkdir -p /mnt/gsi_mount
sudo mount ${OUTPUT_IMG} /mnt/gsi_mount
sudo rsync -a --info=progress2 ${ROOTFS_DIR}/ /mnt/gsi_mount/
sudo umount /mnt/gsi_mount
rmdir /mnt/gsi_mount

# 4. Convert to sparse image format (common for Android GSI)
# This step requires android-gsi-tools (e.g., img2simg)
# If img2simg is not available, this step can be skipped, but the image might be larger.
if command -v img2simg &> /dev/null
then
    echo "Converting to Android sparse image format..."
    mv ${OUTPUT_IMG} ${OUTPUT_IMG}.tmp
    img2simg ${OUTPUT_IMG}.tmp ${OUTPUT_IMG}
    rm ${OUTPUT_IMG}.tmp
else
    echo "img2simg not found. Skipping sparse image conversion. Image might be larger."
fi

echo "GSI image created successfully at: ${OUTPUT_IMG}"