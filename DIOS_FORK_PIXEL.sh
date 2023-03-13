#!/usr/bin/env bash

set -euv

DOWNLOAD_DIR=~/dios/device/dios/pixel
FORK_DIR=~/dios/device/dios/dios
IMAGE_NAME=
PRODUCT=~/dios/device/dios/tmp/$(basename $IMAGE_NAME .zip)/product
SYSTEM_EXT=~/dios/device/dios/tmp/$(basename $IMAGE_NAME .zip)/system_ext
SYSTEM=~/dios/device/dios/tmp/$(basename $IMAGE_NAME .zip)/system
VENDOR=~/dios/device/dios/tmp/$(basename $IMAGE_NAME .zip)/vendor
TMP=~/dios/device/dios/tmp/$(basename $IMAGE_NAME .zip)

echo ""
echo "D!OS PIXEL FORK..."
echo ""

# List available downloads
echo "Available downloads:"
wget -qO- https://developers.google.com/android/images | grep -E 'a href=".+factory.*\.zip"' | cut -d '"' -f 2 | sort -r | while read -r url; do
    filename=$(basename "$url")
    echo " - $filename"
done
echo ""

# Prompt user to choose from the available downloads
echo "Choose a firmware to download and extract:"
read -r filename
IMAGE_NAME=$filename

# Download firmware if not already downloaded
if [ ! -f "$DOWNLOAD_DIR/$IMAGE_NAME" ]; then
    echo "Downloading firmware..."
    pushd "$DOWNLOAD_DIR" >/dev/null
    wget -q "https://dl.google.com/dl/android/aosp/$IMAGE_NAME"
    popd >/dev/null
fi

# Extract firmware to temporary directory
if [ -d "$TMP" ]; then
    sudo rm -rf "$TMP"
fi
mkdir -p "$TMP"
pushd "$TMP" >/dev/null
sudo unzip -p "$DOWNLOAD_DIR/$IMAGE_NAME" "*/image*" >image.zip
sudo unzip -qq image.zip product.img system.img vendor.img system_ext.img
mkdir product
sudo mount -o ro product.img product
mkdir system
sudo mount -o ro system.img system
mkdir vendor
sudo mount -o ro vendor.img vendor
mkdir system_ext
sudo mount -o ro system_ext.img system_ext
popd >/dev/null

# Copy firmware files to fork directory
echo ""
echo "Preparing firmware for forking..."
echo ""
cp -rf "$PRODUCT" "$FORK_DIR" || true
cp -rf "$SYSTEM" "$FORK_DIR" || true
cp -rf "$SYSTEM_EXT" "$FORK_DIR" || true
cp -rf "$VENDOR" "$FORK_DIR" || true

# Clean up temporary directory and unmount partitions
sudo umount product
sudo umount system
sudo umount vendor
sudo umount system_ext
sudo rm -rf "$TMP"

echo ""
echo "Firmware forking complete."
echo ""
