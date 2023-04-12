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

    pushd "$DIOS_FORKS" >/dev/null

    wget "https://dl.google.com/dl/android/aosp/$PIXEL_IMAGE"

    popd >/dev/null

fi

if [ -d "$PIXEL_TMP" ]; then

    rm -rf "$PIXEL_TMP"

fi

mkdir -p "$PIXEL_TMP"

pushd "$PIXEL_TMP" >/dev/null

kdialog --title "DIOS A.I. INIT" --passivepopup "DIOS A.I. MAY REQUIRE ROOT!"

sudo unzip -p "$DIOS_FORKS/$PIXEL_IMAGE" "*/image*" >image.zip

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
rm -rf $PIXEL_FORKS/product/app || true
rm -rf $PIXEL_FORKS/product/app/SSRestartDetector || true
rm -rf $PIXEL_FORKS/product/etc || true
rm -rf $PIXEL_FORKS/product/etc/selinux || true
rm -rf $PIXEL_FORKS/product/etc/vintf || true
rm -rf $PIXEL_FORKS/product/lost+found || true
rm -rf $PIXEL_FORKS/product/media/audio/ui || true
rm -rf $PIXEL_FORKS/product/overlay/GoogleConfigOverlay.apk || true
rm -rf $PIXEL_FORKS/product/overlay/SettingsGoogleOverlayRedfin.apk || true
rm -rf $PIXEL_FORKS/product/overlay/SettingsOverlayG5NZ6.apk || true
rm -rf $PIXEL_FORKS/product/overlay/SettingsOverlayGD1YQ.apk || true
rm -rf $PIXEL_FORKS/product/overlay/SettingsOverlayGTT9Q.apk || true
rm -rf $PIXEL_FORKS/product/priv-app || true
rm -rf $PIXEL_FORKS/product/priv-app/SprintDM || true
rm -rf $PIXEL_FORKS/product/priv-app/SprintHM || true
rm -rf $PIXEL_FORKS/system_ext/apex || true
rm -rf $PIXEL_FORKS/system_ext/app || true
rm -rf $PIXEL_FORKS/system_ext/bin || true
rm -rf $PIXEL_FORKS/system_ext/etc || true
rm -rf $PIXEL_FORKS/system_ext/etc/permissions/com.qti.dpmframework.xml || true
rm -rf $PIXEL_FORKS/system_ext/etc/permissions/com.qti.media.secureprocessor.xml || true
rm -rf $PIXEL_FORKS/system_ext/etc/security || true
rm -rf $PIXEL_FORKS/system_ext/etc/selinux || true
rm -rf $PIXEL_FORKS/system_ext/etc/vintf || true
rm -rf $PIXEL_FORKS/system_ext/framework || true
rm -rf $PIXEL_FORKS/system_ext/lib || true
rm -rf $PIXEL_FORKS/system_ext/lib64 || true
rm -rf $PIXEL_FORKS/system_ext/lost+found || true
rm -rf $PIXEL_FORKS/system_ext/lost+found || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/CccDkTimeSyncService || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/ConnectivityThermalPowerManager || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/FactoryOtaPrebuilt || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/grilservice || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/grilservice || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/HbmSVManager || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/Iwlan || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/LLKAgent || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/MyVerizonServices || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/OemRilService || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/qcrilmsgtunnel || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/QualifiedNetworksService || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/RemoteProvisioner || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/RilConfigService || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/ShannonIms || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/ShannonRcs || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/SystemUIGoogle || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/UvExposureReporter || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/UwbVendorService || true
rm -rf $PIXEL_FORKS/system/system/apex/com.android.runtime.apex || true
rm -rf $PIXEL_FORKS/system/system/apex/com.android.vndk.current.apex || true
rm -rf $PIXEL_FORKS/system/system/etc/init || true
rm -rf $PIXEL_FORKS/system/system/etc/security || true
rm -rf $PIXEL_FORKS/system/system/etc/selinux || true
rm -rf $PIXEL_FORKS/system/system/etc/vintf || true
rm -rf $PIXEL_FORKS/system/system/lost+found || true
rm -rf $PIXEL_FORKS/system/system/product || true
rm -rf $PIXEL_FORKS/system/system/system_ext || true
rm -rf $PIXEL_FORKS/system/system/vendor || true
rm -rf $PIXEL_FORKS/vendor/bin || true
rm -rf $PIXEL_FORKS/vendor/etc/acdbdata || true
rm -rf $PIXEL_FORKS/vendor/etc/init || true
rm -rf $PIXEL_FORKS/vendor/etc/security || true
rm -rf $PIXEL_FORKS/vendor/etc/selinux || true
rm -rf $PIXEL_FORKS/vendor/etc/vintf || true
rm -rf $PIXEL_FORKS/vendor/firmware || true
rm -rf $PIXEL_FORKS/vendor/firmware_mnt || true
rm -rf $PIXEL_FORKS/vendor/lib || true
rm -rf $PIXEL_FORKS/vendor/lib64 || true
rm -rf $PIXEL_FORKS/vendor/lost+found || true
rm -rf $PIXEL_FORKS/vendor/odm || true
rm -rf $PIXEL_FORKS/vendor/odm_dlkm || true
rm -rf $PIXEL_FORKS/vendor/rfs || true
rm -rf $PIXEL_FORKS/vendor/vendor_dlkm || true

kdialog --title "DIOS A.I. INIT" --passivepopup "DIOS A.I. MAY REQUIRE ROOT!"

sudo umount "$PIXEL_PRODUCT"
sudo umount "$PIXEL_SYSTEM"
sudo umount "$PIXEL_SYSTEM_EXT"
sudo umount "$PIXEL_VENDOR"

popd >/dev/null

rm -rf "$PIXEL_TMP"

