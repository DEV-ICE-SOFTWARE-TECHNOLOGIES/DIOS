#!/usr/bin/env bash -i
##################################
## Copyright © 2023 Marius Kopp ##
##################################

set -eu

source ./ADIOS.cfg

echo ""
echo "STARTING D!OS PIXEL FORK..."
echo ""

rm -rf "$PIXEL_FORKS"

if [ ! -d $PIXEL_FORKS ]; then

    mkdir -p $PIXEL_FORKS

fi

if [ ! -f $PIXEL_FILE ]; then

    notify-send "DO YOU WANT TO DOWNLOAD $PIXEL_IMAGE ?"

    if [[ $? -ne 0 ]]; then

        exit 1

    fi

    pushd "$DIOS_FORKS" >/dev/null

    wget "https://dl.google.com/dl/android/aosp/$PIXEL_IMAGE"

    popd >/dev/null

fi

if [ -d "$PIXEL_TMP" ]; then

    rm -rf "$PIXEL_TMP"

fi

mkdir -p "$PIXEL_TMP"

pushd "$PIXEL_TMP" >/dev/null

notify-send "DIOS A.I. MAY REQUIRE ROOT!"

echo ""
echo "UNZIPPING PIXEL FIRMWARE..."
echo ""

sudo unzip -p "$DIOS_FORKS/$PIXEL_IMAGE" "*/image*" >image.zip

sudo unzip -qq image.zip product.img system.img vendor.img system_ext.img

echo ""
echo "EXTRACTING PIXEL FIRMWARE..."
echo ""

mkdir $PIXEL_PRODUCT_TMP

sudo mount -o ro product.img $PIXEL_PRODUCT_TMP

mkdir $PIXEL_SYSTEM_TMP

sudo mount -o ro system.img $PIXEL_SYSTEM_TMP

mkdir $PIXEL_VENDOR_TMP

sudo mount -o ro vendor.img $PIXEL_VENDOR_TMP

mkdir $PIXEL_SYSTEM_EXT_TMP

sudo mount -o ro system_ext.img $PIXEL_SYSTEM_EXT_TMP

wait

echo ""
echo "PREPARING PIXEL FIRMWARE..."
echo ""

cp -rf "$PIXEL_PRODUCT_TMP" "$PIXEL_PRODUCT" || true
cp -rf "$PIXEL_SYSTEM_TMP" "$PIXEL_SYSTEM" || true
cp -rf "$PIXEL_SYSTEM_EXT_TMP" "$PIXEL_SYSTEM_EXT" || true
cp -rf "$PIXEL_VENDOR_TMP" "$PIXEL_VENDOR" || true

notify-send "DIOS A.I. MAY REQUIRE ROOT!"

sudo umount "$PIXEL_PRODUCT_TMP"
sudo umount "$PIXEL_SYSTEM_TMP"
sudo umount "$PIXEL_SYSTEM_EXT_TMP"
sudo umount "$PIXEL_VENDOR_TMP"

popd >/dev/null

rm -rf "$PIXEL_TMP"

echo ""
echo "D!OS PIXEL FORK COMPLETED..."
echo ""
