#!/usr/bin/env bash

set -euv

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------
# VARIABLES
# --------------------------------------------------------------------------------------------------

DOWNLOAD_DIR=~/dios/device/dios/xperia
FORK_DIR=~/dios/device/dios/fork/xperia
IMAGE_NAME=xperia.zip
IMAGE_FILE=$DOWNLOAD_DIR/$IMAGE_NAME
PRODUCT_A=~/dios/device/dios/tmp/$(basename $IMAGE_NAME .zip)/product_a
SYSTEM_EXT_A=~/dios/device/dios/tmp/$(basename $IMAGE_NAME .zip)/system_ext_a
SYSTEM_A=~/dios/device/dios/tmp/$(basename $IMAGE_NAME .zip)/system_a
SYSTEM_B=~/dios/device/dios/tmp/$(basename $IMAGE_NAME .zip)/system_b
VENDOR_A=~/dios/device/dios/tmp/$(basename $IMAGE_NAME .zip)/vendor_a
TMP=~/dios/device/dios/tmp/$(basename $IMAGE_NAME .zip)

echo ""
echo "D!OS XPERIA FORK..."
echo ""
for dir in $FORK_DIR $DOWNLOAD_DIR; do
    if [ ! -d $dir ]; then
        mkdir -p $dir
    fi
done

if [ ! -f $IMAGE_FILE ]; then
    pushd $DOWNLOAD_DIR
    wget https://dl.google.com/dl/android/aosp/$IMAGE_NAME
    popd
fi

if [ -d $TMP ]; then
    sudo rm -rf $TMP
fi
mkdir -p $TMP

pushd $TMP
sudo unzip $IMAGE_FILE product_a.ext4 system_a.ext4 system_b.ext4 vendor_a.ext4 system_ext_a.ext4

mkdir product_a
sudo mount -o ro product_a.ext4 product_a

mkdir system_a
sudo mount -o ro system_a.ext4 system_a

mkdir system_b
sudo mount -o ro system_b.ext4 system_b

mkdir vendor_a
sudo mount -o ro vendor_a.ext4 vendor_a

mkdir system_ext_a
sudo mount -o ro system_ext_a.ext4 system_ext_a

wait

echo ""
echo "PREPARING PIXEL FIRMWARE..."
echo ""

cp -apr $PRODUCT_A $FORK_DIR || true
cp -apr $SYSTEM_A $FORK_DIR || true
cp -apr $SYSTEM_B $FORK_DIR || true
cp -apr $SYSTEM_EXT_A $FORK_DIR || true
#cp -apr $VENDOR_A $FORK_DIR || true
rm -rf $FORK_DIR/product_a/etc || true
rm -rf $FORK_DIR/product_a/etc/selinux || true
rm -rf $FORK_DIR/product_a/etc/vintf || true
rm -rf $FORK_DIR/product_a/framework || true
rm -rf $FORK_DIR/product_a/lib || true
rm -rf $FORK_DIR/product_a/lib64 || true
rm -rf $FORK_DIR/product_a/overlay || true
rm -rf $FORK_DIR/system_a/system/build.prop || true
rm -rf $FORK_DIR/system_a/system/etc/selinux || true
rm -rf $FORK_DIR/system_a/system/etc/vintf || true
rm -rf $FORK_DIR/system_ext_a/app/aptxui || true
rm -rf $FORK_DIR/system_ext_a/app/DaxUI || true
rm -rf $FORK_DIR/system_ext_a/priv-app/SystemUI || true
rm -rf $FORK_DIR/system_ext_a/etc || true
rm -rf $FORK_DIR/system_ext_a/etc/selinux || true
rm -rf $FORK_DIR/system_ext_a/etc/vintf || true
rm -rf $FORK_DIR/system_ext_a/framework || true
rm -rf $FORK_DIR/system_ext_a/lib|| true
rm -rf $FORK_DIR/system_ext_a/lib64 || true
rm -rf $FORK_DIR/system_ext_a/priv-app/Settings || true
rm -rf $FORK_DIR/vendor_a/build.prop || true
rm -rf $FORK_DIR/vendor_a/etc/selinux || true
rm -rf $FORK_DIR/vendor_a/etc/vintf || true

wait

sudo umount product_a
sudo umount system_a
sudo umount system_b
sudo umount system_ext_a
sudo umount vendor_a

wait

popd

rm -rf $TMP
