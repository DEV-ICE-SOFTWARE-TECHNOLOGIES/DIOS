#!/usr/bin/env bash -i
##################################
## Copyright © 2023 Marius Kopp ##
##################################

set -eu

source ./ADIOS.cfg

echo ""
echo "D!OS PIXEL FORK..."

rm -rf "$PIXEL_FORKS"

if [ ! -d $PIXEL_FORKS ]; then

    mkdir -p $PIXEL_FORKS

fi

if [ ! -f $PIXEL_FILE ]; then

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

echo ""
echo "EXTRACTING PIXEL FIRMWARE..."

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

cp -rf "$PIXEL_PRODUCT_TMP" "$PIXEL_PRODUCT" || true
cp -rf "$PIXEL_SYSTEM_TMP" "$PIXEL_SYSTEM" || true
cp -rf "$PIXEL_SYSTEM_EXT_TMP" "$PIXEL_SYSTEM_EXT" || true
cp -rf "$PIXEL_VENDOR_TMP" "$PIXEL_VENDOR" || true

rm -rf $PIXEL_FORKS/system_ext/apex || true
rm -rf $PIXEL_FORKS/system_ext/app || true
rm -rf $PIXEL_FORKS/system_ext/bin || true
rm -rf $PIXEL_FORKS/system_ext/etc/compatconfig|| true
rm -rf $PIXEL_FORKS/system_ext/etc/init|| true
rm -rf $PIXEL_FORKS/system_ext/etc/selinux|| true
rm -rf $PIXEL_FORKS/system_ext/etc/vintf|| true
rm -rf $PIXEL_FORKS/system_ext/framework|| true
rm -rf $PIXEL_FORKS/system_ext/lib|| true
rm -rf $PIXEL_FORKS/system_ext/lib64|| true
rm -rf $PIXEL_FORKS/system_ext/lost+found || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/CccDkTimeSyncService || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/ConnectivityThermalPowerManager || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/EuiccGoogleOverlay || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/EuiccSupportPixel || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/EuiccSupportPixelPermissions || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/FactoryOtaPrebuilt || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/GoogleFeedback || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/GoogleServicesFramework || true
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
rm -rf $PIXEL_FORKS/system_ext/priv-app/SettingsGoogleFutureFaceEnroll || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/ShannonIms || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/ShannonRcs || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/SystemUIGoogle || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/TurboAdapter || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/UvExposureReporter || true
rm -rf $PIXEL_FORKS/system_ext/priv-app/UwbVendorService || true


kdialog --title "DIOS A.I. INIT" --passivepopup "DIOS A.I. MAY REQUIRE ROOT!"

sudo umount "$PIXEL_PRODUCT_TMP"
sudo umount "$PIXEL_SYSTEM_TMP"
sudo umount "$PIXEL_SYSTEM_EXT_TMP"
sudo umount "$PIXEL_VENDOR_TMP"

popd >/dev/null

rm -rf "$PIXEL_TMP"

