#!/usr/bin/env bash -i
##################################
## Copyright © 2023 Marius Kopp ##
##################################

set -eu

source ./ADIOS.cfg

echo ""
echo "D!OS PIXEL FORK..."
echo ""

if [ ! -d $PIXEL_FORKS ]; then
    mkdir -p $PIXEL_FORKS
fi

if [ ! -f $IMAGE_FILE ]; then
    kdialog --title "DIOS A.I. FORK" --yesno "DO YOU WANT TO DOWNLOAD $PIXEL_IMAGE ?"
    if [[ $? -ne 0 ]]; then
        exit 1
    fi
    pushd "$PIXEL_FORKS" >/dev/null
    wget "https://dl.google.com/dl/android/aosp/$PIXEL_IMAGE"
    popd >/dev/null
fi

if [ -d "$TMP" ]; then
kdialog --title "DIOS A.I. FORK" --passivepopup "DIOS A.I. REQUIRES ROOT!"
    sudo rm -rf "$TMP"
fi

mkdir -p "$TMP"
pushd "$TMP" >/dev/null
kdialog --title "DIOS A.I. FORK" --passivepopup "DIOS A.I. REQUIRES ROOT!"
sudo unzip -p "$PIXEL_FORKS/$PIXEL_IMAGE" "*/image*" >image.zip
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

wait

echo ""
echo "PREPARING PIXEL FIRMWARE..."
echo ""
cp -rf "$PRODUCT" "$PIXEL_FORKS" || true
cp -rf "$SYSTEM" "$PIXEL_FORKS" || true
cp -rf "$SYSTEM_EXT" "$PIXEL_FORKS" || true
cp -rf "$VENDOR" "$PIXEL_FORKS" || true

sudo umount product
sudo umount system
sudo umount vendor
sudo umount system_ext
sudo rm -rf "$TMP"
