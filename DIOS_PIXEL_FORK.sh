#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------
# VARIABLES
# --------------------------------------------------------------------------------------------------

DOWNLOAD_DIR=~/dios/device/sony/dios/pixel
FORK_DIR=~/dios/device/sony/dios/fork/pixel
IMAGE_NAME=redfin-tp1a.221105.002-factory-c13cf32a.zip
IMAGE_FILE=$DOWNLOAD_DIR/$IMAGE_NAME
PRODUCT=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)/product
SYSTEM_EXT=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)/system_ext
SYSTEM=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)/system
VENDOR=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)/vendor
TMP=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)

echo ""
echo "D!OS PIXEL FORK..."
echo ""

rm -rf ~/dios/device/sony/dios/fork/ || true

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
sudo unzip -p $IMAGE_FILE "*/image*" >image.zip
sudo unzip image.zip product.img system.img vendor.img system_ext.img

mkdir product
sudo mount -o ro product.img product

mkdir system
sudo mount -o ro system.img system

mkdir vendor
sudo mount -o ro vendor.img vendor

mkdir system_ext
sudo mount -o ro system_ext.img system_ext

wait

echo ""
echo "PREPARING PIXEL FIRMWARE..."
echo ""

cp -rf $PRODUCT $FORK_DIR || true
cp -rf $SYSTEM $FORK_DIR || true
cp -rf $SYSTEM_EXT $FORK_DIR || true
cp -rf $VENDOR $FORK_DIR || true
rm -rf $FORK_DIR/product/app/SSRestartDetector || true
rm -rf $FORK_DIR/product/priv-app/SprintDM || true
rm -rf $FORK_DIR/product/priv-app/SprintHM || true
rm -rf $FORK_DIR/product/etc/security || true
rm -rf $FORK_DIR/product/etc/selinux || true
rm -rf $FORK_DIR/product/etc/vintf || true
rm -rf $FORK_DIR/product/overlay/GoogleConfigOverlay.apk || true
rm -rf $FORK_DIR/product/overlay/SettingsGoogleOverlayRedfin.apk || true
rm -rf $FORK_DIR/product/overlay/SettingsOverlayG5NZ6.apk || true
rm -rf $FORK_DIR/product/overlay/SettingsOverlayGD1YQ.apk || true
rm -rf $FORK_DIR/product/overlay/SettingsOverlayGTT9Q.apk || true
rm -rf $FORK_DIR/system_ext/app/com.qualcomm.qti.services.secureui || true
rm -rf $FORK_DIR/system_ext/app/datastatusnotification || true
rm -rf $FORK_DIR/system_ext/app/uceShimService || true
rm -rf $FORK_DIR/system_ext/app/uimremoteclient || true
rm -rf $FORK_DIR/system_ext/app/uimremoteserver || true
rm -rf $FORK_DIR/system_ext/app || true
rm -rf $FORK_DIR/system_ext/app/QtiTelephonyService || true
rm -rf $FORK_DIR/system_ext/bin || true
rm -rf $FORK_DIR/system_ext/etc/permissions/com.qti.dpmframework.xml || true
rm -rf $FORK_DIR/system_ext/etc/permissions/com.qti.media.secureprocessor.xml || true
rm -rf $FORK_DIR/system_ext/etc/security || true
rm -rf $FORK_DIR/system_ext/etc/selinux || true
rm -rf $FORK_DIR/system_ext/etc/vintf || true
rm -rf $FORK_DIR/system_ext/lost+found || true
rm -rf $FORK_DIR/system_ext/priv-app/ConnectivityThermalPowerManager || true
rm -rf $FORK_DIR/system_ext/priv-app/qcrilmsgtunnel || true
rm -rf $FORK_DIR/system_ext/priv-app/RilConfigService || true
rm -rf $FORK_DIR/system_ext/priv-app/SystemUIGoogle || true
rm -rf $FORK_DIR/system_ext/priv-app/SettingsGoogle || true
rm -rf $FORK_DIR/system/system/apex/com.android.runtime.apex || true
rm -rf $FORK_DIR/system/system/apex/com.android.vndk.current.apex || true
rm -rf $FORK_DIR/system/system/etc/init || true
rm -rf $FORK_DIR/system/system/etc/security || true
rm -rf $FORK_DIR/system/system/etc/selinux || true
rm -rf $FORK_DIR/system/system/etc/vintf || true
rm -rf $FORK_DIR/system/system/product || true
rm -rf $FORK_DIR/system/system/system_ext || true
rm -rf $FORK_DIR/system/system/vendor || true
rm -rf $FORK_DIR/vendor/etc/acdbdata || true
rm -rf $FORK_DIR/vendor/bin || true
rm -rf $FORK_DIR/vendor/etc/init || true
rm -rf $FORK_DIR/vendor/etc/security || true
rm -rf $FORK_DIR/vendor/etc/selinux || true
rm -rf $FORK_DIR/vendor/etc/vintf || true
rm -rf $FORK_DIR/vendor/firmware || true
rm -rf $FORK_DIR/vendor/firmware_mnt || true
rm -rf $FORK_DIR/vendor/lib || true
rm -rf $FORK_DIR/vendor/lib64 || true
rm -rf $FORK_DIR/vendor/lost+found || true
rm -rf $FORK_DIR/vendor/odm || true
rm -rf $FORK_DIR/vendor/odm_dlkm || true
rm -rf $FORK_DIR/vendor/rfs || true
rm -rf $FORK_DIR/vendor/vendor_dlkm || true

wait

sudo umount product
sudo umount system
sudo umount vendor
sudo umount system_ext

wait

popd

sudo rm -rf $TMP
