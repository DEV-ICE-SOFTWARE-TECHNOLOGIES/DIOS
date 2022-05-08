#!/bin/bash
set -e

# ----------------------------------------------------------------------
# URL: https://developers.google.com/android/images
# Variables have to be adjusted accordingly
# ----------------------------------------------------------------------
APK_DIR=~/dios/dios/apk
IMAGE_NAME=redfin-sp2a.220505.002-factory-7fe11c77.zip
DOWNLOAD_DIR=~/dios/dios/gapps
# ----------------------------------------------------------------------

IMAGE_FILE=$DOWNLOAD_DIR/$IMAGE_NAME

APKS="
/system/system/priv-app/GooglePackageInstaller/GooglePackageInstaller.apk
/system_ext/priv-app/PixelSetupWizard/PixelSetupWizard.apk
/product/priv-app/SetupWizardPrebuilt/SetupWizardPrebuilt.apk
/product/app/TrichromeLibrary-Stub/TrichromeLibrary-Stub.apk"

for dir in $APK_DIR $DOWNLOAD_DIR; do
    if [ ! -d $dir ]; then
        mkdir $dir
    fi
done

if [ ! -f $IMAGE_FILE ]; then
    pushd $DOWNLOAD_DIR
    wget https://dl.google.com/dl/android/aosp/$IMAGE_NAME
    popd
fi

TMP=~/dios/dios/tmp/`basename $IMAGE_NAME .zip`
if [ -d $TMP ]; then
    sudo rm -rf $TMP
fi
mkdir -p $TMP

pushd $TMP
sudo unzip -p $IMAGE_FILE "*/image*" >image.zip
sudo unzip image.zip product.img system.img vendor.img system_ext.img

simg2img product.img product.raw
mkdir product
sudo mount -o ro product.raw product

simg2img system.img system.raw
mkdir system
sudo mount -o ro system.raw system

simg2img vendor.img vendor.raw
mkdir vendor
sudo mount -o ro vendor.raw vendor

simg2img system_ext.img system_ext.raw
mkdir system_ext
sudo mount -o ro system_ext.raw system_ext

for apk in $APKS; do
    aapt dump badging .$apk|head -3
    cp -v .$apk $APK_DIR
done

sudo umount product
sudo umount system
sudo umount vendor
sudo umount system_ext
popd

rm -r $TMP

echo "Finished successfully."