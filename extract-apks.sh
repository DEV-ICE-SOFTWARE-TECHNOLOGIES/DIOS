#!/bin/bash
set -e

# ----------------------------------------------------------------------
# URL: https://developers.google.com/android/images
# Variables have to be adjusted accordingly
# ----------------------------------------------------------------------
APK_DIR=~/android/apk
IMAGE_NAME=coral-qq1b.200205.002-factory-89d84384.zip
DOWNLOAD_DIR=~/android/google-img
# ----------------------------------------------------------------------

IMAGE_FILE=$DOWNLOAD_DIR/$IMAGE_NAME

APKS="
/system/system/priv-app/GooglePackageInstaller/GooglePackageInstaller.apk
/system/system/priv-app/GooglePermissionControllerPrebuilt/GooglePermissionControllerPrebuilt.apk
/product/priv-app/SetupWizardPrebuilt/SetupWizardPrebuilt.apk
/product/app/TrichromeLibrary/TrichromeLibrary.apk"

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

TMP=/tmp/`basename $IMAGE_NAME .zip`
if [ -d $TMP ]; then
    rm -r $TMP
fi
mkdir $TMP

pushd $TMP
unzip -p $IMAGE_FILE "*/image*" >image.zip
unzip image.zip product.img system.img

simg2img product.img product.raw
mkdir product
sudo mount -o ro product.raw product

simg2img system.img system.raw
mkdir system
sudo mount -o ro system.raw system

for apk in $APKS; do
    aapt dump badging .$apk|head -3
    cp -v .$apk $APK_DIR
done

sudo umount product
sudo umount system
popd

rm -r $TMP

echo "Finished successfully."