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

rm -rf "$PIXEL_FORKS/product"
rm -rf "$PIXEL_FORKS/system"
rm -rf "$PIXEL_FORKS/system_ext"
rm -rf "$PIXEL_FORKS/vendor"

if [ ! -f $IMAGE_FILE ]; then
    kdialog --title "DIOS A.I. FORK" --yesno "DO YOU WANT TO DOWNLOAD $PIXEL_IMAGE ?"
    if [[ $? -ne 0 ]]; then
        exit 1
    fi
    pushd "$PIXEL_FORKS" >/dev/null
    wget "https://dl.google.com/dl/android/aosp/$PIXEL_IMAGE"
    popd >/dev/null
fi

if [ -d "$PIXEL_TMP" ]; then
    kdialog --title "DIOS A.I. FORK" --passivepopup "DIOS A.I. REQUIRES ROOT!"
    sudo rm -rf "$PIXEL_TMP"
fi

mkdir -p "$PIXEL_TMP"
pushd "$PIXEL_TMP" >/dev/null
kdialog --title "DIOS A.I. FORK" --passivepopup "DIOS A.I. REQUIRES ROOT!"
sudo unzip -p "$PIXEL_FORKS/$PIXEL_IMAGE" "*/image*" >image.zip
sudo unzip -qq image.zip product.img system.img vendor.img system_ext.img
mkdir $PIXEL_PRODUCT
sudo mount -o ro product.img $PIXEL_PRODUCT
mkdir $PIXEL_SYSTEM
sudo mount -o ro system.img $PIXEL_SYSTEM
mkdir $PIXEL_VENDOR
sudo mount -o ro vendor.img $PIXEL_VENDOR
mkdir $PIXEL_SYSTEM_EXT
sudo mount -o ro system_ext.img $PIXEL_SYSTEM_EXT

wait

echo ""
echo "PREPARING PIXEL FIRMWARE..."
echo ""
cp -rf "$PIXEL_PRODUCT" "$PIXEL_FORKS" || true
cp -rf "$PIXEL_SYSTEM" "$PIXEL_FORKS" || true
cp -rf "$PIXEL_SYSTEM_EXT" "$PIXEL_FORKS" || true
cp -rf "$PIXEL_VENDOR" "$PIXEL_FORKS" || true

sudo umount "$PIXEL_PRODUCT"
sudo umount "$PIXEL_SYSTEM"
sudo umount "$PIXEL_SYSTEM_EXT"
sudo umount "$PIXEL_VENDOR"
rm -rf "$PIXEL_TMP"

popd >/dev/null
