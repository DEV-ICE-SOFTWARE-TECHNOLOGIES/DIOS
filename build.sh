#!/bin/bash
set -eu

# ----------------------------------------------------------------------
# 1. VARIABLES
# ----------------------------------------------------------------------

DEVICE=bahamut
DOWNLOAD_DIR=~/dios/device/sony/common/rootdir/dios/pixel
EMAIL=mariuskopp517@gmail.com
FORK_DIR=~/dios/device/sony/common/rootdir/dios/fork
IMAGE_NAME=redfin-sp2a.220505.002-factory-7fe11c77.zip
IMAGE_FILE=$DOWNLOAD_DIR/$IMAGE_NAME
OUT_PRODUCT=~/dios/out/target/product/$DEVICE/system/product
OUT_VENDOR=~/dios/out/target/product/$DEVICE/vendor
OUT_SYSTEM=~/dios/out/target/product/$DEVICE/system
OUT_SYSTEM_EXT=~/dios/out/target/product/$DEVICE/system/system_ext
OUT_MAIN=~/dios/out/target/product/$DEVICE
TMP=~/dios/device/sony/common/rootdir/dios/tmp/$(basename $IMAGE_NAME .zip)
PRODUCT=~/dios/device/sony/common/rootdir/dios/tmp/$(basename $IMAGE_NAME .zip)/product
VENDOR=~/dios/device/sony/common/rootdir/dios/tmp/$(basename $IMAGE_NAME .zip)/vendor
SYSTEM=~/dios/device/sony/common/rootdir/dios/tmp/$(basename $IMAGE_NAME .zip)/system
SYSTEM_EXT=~/dios/device/sony/common/rootdir/dios/tmp/$(basename $IMAGE_NAME .zip)/system_ext
NAME=M1U5T0N3
SOURCE=~/dios
USERNAME=${USERNAME:-~miustone}

# ----------------------------------------------------------------------
# 2. HELP
# ----------------------------------------------------------------------

_show_help() {
    echo ""
    echo ""
    echo ""
    echo "             AUTOMATED D!OS BUILD SCRIPT"
    echo ""
    echo ""
    echo ""
    echo ""
    echo "OPTIONS:"
    echo "   -a|--aosp               BUILDS ONLY VANILLA AOSP"
    echo "   -c|--clean              NEEDED FOR UPDATES"
    echo "   -u|--update             DO THIS AFTER SCRIPT UPDATES"
    echo "   -h|--help               SHOWS THIS HELP SCREEN"
    echo ""
    echo ""
    echo "USAGE EXAMPLE FOR XPERIA 5 D!OS:"
    echo "   env LUNCH_CHOICE=aosp_j9210-userdebug bash ./$_shell_script"
    echo ""
    echo ""
    echo "USAGE EXAMPLE FOR XPERIA 5 AOSP:"
    echo "   env LUNCH_CHOICE=aosp_j9210-userdebug bash ./$_shell_script -a"
    echo ""
}

# ----------------------------------------------------------------------
# 3. INITIALIZING
# ----------------------------------------------------------------------

_init_dios() {
    sudo apt-get purge openjdk-* icedtea-* icedtea6-* || true
    sudo apt-get update
    sudo apt-get install openjdk-11-jdk
    sudo apt-get install bison g++-multilib git gperf libxml2-utils make zlib1g-dev zip liblz4-tool libncurses5 libssl-dev bc flex curl python-is-python3 ccache simg2img aapt

    mkdir ~/bin || true
    curl http://commondatastorage.googleapis.com/git-repo-downloads/repo >~/bin/repo
    chmod a+x ~/bin/repo

    echo '' >>~/.bashrc
    echo 'export PATH=~/bin:$PATH' >>~/.bashrc
    echo 'export USE_CCACHE=1' >>~/.bashrc
    echo 'export CCACHE_EXEC=/usr/bin/ccache' >>~/.bashrc
    echo 'export CCACHE_DIR=~/.ccache' >>~/.bashrc
    echo 'export ALLOW_MISSING_DEPENDENCIES=true' >>~/.bashrc
    wait
    source ~/.bashrc
    ccache -M 300G -F 0

    if [ ! -d /mnt/ccache ]; then
        sudo mkdir /mnt/ccache
    fi

    repo init -u https://android.googlesource.com/platform/manifest -b android-12.1.0_r5
    cd .repo
    git clone https://github.com/DEV-ICE-TECHNOLOGIES/local_manifests
    cd local_manifests
    git checkout
    cd ../..
    mkdir -p ~/dios/device/sony/common/rootdir/dios
    repo sync -j$(nproc) && ./repo_update.sh -j$(nproc)
    echo ""
    echo "PREPARED! RESTART THE SCRIPT TO START BUILDING..."
    exit
}

# ----------------------------------------------------------------------
# 4. POST-UPDATE OPTIONS
# ----------------------------------------------------------------------

_post_update() {
    if $_aosp; then
        echo ""
        echo "AOSP BUILD FLAGS..."
        cat <<EOF >~/dios/device/sony/common/rootdir/dios/dios.mk
BOARD_USE_ENFORCING_SELINUX := true
EOF
    else
        echo ""
        echo "DIOS BUILD FLAGS..."
        cat <<\EOF >~/dios/device/sony/common/rootdir/dios/dios.mk
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

WITH_DEXPREOPT := true

include vendor/gapps/arm64/arm64-vendor.mk
EOF
        cat <<\EOF >~/dios/device/sony/common/rootdir/Android.mk
LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
LOCAL_MODULE := init.recovery.$(TARGET_DEVICE)
LOCAL_SRC_FILES := init.recovery.common.rc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_STEM := init.recovery.$(TARGET_DEVICE)
LOCAL_MODULE_SUFFIX := .rc
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := init.$(TARGET_DEVICE)
LOCAL_SRC_FILES := vendor/etc/init/hw/init.common.rc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_STEM := init.$(TARGET_DEVICE)
LOCAL_MODULE_SUFFIX := .rc
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
$(shell cp -rf $(LOCAL_PATH)/dios/fork/system/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
$(shell cp -rf $(LOCAL_PATH)/dios/fork/system_ext/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
$(shell cp -rf $(LOCAL_PATH)/dios/fork/product/* `pwd`/$(TARGET_OUT_PRODUCT)/)
#$(shell cp -rf $(LOCAL_PATH)/dios/fork/vendor/* `pwd`/$(TARGET_OUT_VENDOR)/)
EOF
    fi
}

# ----------------------------------------------------------------------
# 5. REPO SYNC AND UPDATE
# ----------------------------------------------------------------------

_repo_update() {
    if $_update; then
        echo ""
        echo "REPO SYNC AND REPO UPDATE..."
        echo ""
        repo sync -j$(nproc) && ./repo_update.sh -j$(nproc)
    fi
}

# ----------------------------------------------------------------------
# 6. CLEANING OUTPUT
# ----------------------------------------------------------------------

_cleaning() {
    if $_clean; then
        echo ""
        echo "CLEANING /out"
        make installclean -j$(nproc)
    fi
}

# ----------------------------------------------------------------------
# 7. PIXEL CONTENT
# ----------------------------------------------------------------------

_pixel_fork() {
    if ! $_aosp; then
        echo ""
        echo "FORKING PIXEL FIRMWARE..."
        echo ""
        for dir in $FORK_DIR $DOWNLOAD_DIR; do
            if [ ! -d $dir ]; then
                mkdir $dir
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

        wait

        #cp -apr $PRODUCT $FORK_DIR || true
        #cp -apr $SYSTEM $FORK_DIR || true
        cp -apr $SYSTEM_EXT $FORK_DIR || true
        #cp -apr $VENDOR $FORK_DIR || true
        rm -rf $FORK_DIR/product/etc/init || true
        rm -rf $FORK_DIR/product/etc/security || true
        rm -rf $FORK_DIR/product/etc/selinux || true
        rm -rf $FORK_DIR/product/etc/vintf || true
        rm -rf $FORK_DIR/system_ext/etc/init || true
        rm -rf $FORK_DIR/system_ext/etc/security || true
        rm -rf $FORK_DIR/system_ext/etc/selinux || true
        rm -rf $FORK_DIR/system_ext/etc/vintf || true
        rm -rf $FORK_DIR/system/system/etc/init || true
        rm -rf $FORK_DIR/system/system/etc/security || true
        rm -rf $FORK_DIR/system/system/etc/selinux || true
        rm -rf $FORK_DIR/system/system/etc/vintf || true
        rm -rf $FORK_DIR/system/system/product || true
        rm -rf $FORK_DIR/system/system/system_ext || true
        rm -rf $FORK_DIR/system/system/vendor || true
        rm -rf $FORK_DIR/vendor/etc/init || true
        rm -rf $FORK_DIR/vendor/etc/security || true
        rm -rf $FORK_DIR/vendor/etc/selinux || true
        rm -rf $FORK_DIR/vendor/etc/vintf || true
        rm -rf $FORK_DIR/product/overlay || true
        rm -rf $FORK_DIR/product/etc/build.prop || true
        rm -rf $FORK_DIR/system/system/etc/build.prop || true
        rm -rf $FORK_DIR/system_ext/etc/build.prop || true
        rm -rf $FORK_DIR/system_ext/lib || true
        rm -rf $FORK_DIR/system_ext/lib64 || true
        rm -rf $FORK_DIR/system_ext/app || true
        rm -rf $FORK_DIR/system_ext/priv-app || true

        wait

        sudo umount product
        sudo umount system
        sudo umount vendor
        sudo umount system_ext
        popd

        rm -rfv $TMP
    fi
}

# ----------------------------------------------------------------------
# 8. BASIC GAPPS
# ----------------------------------------------------------------------

_init_gapps() {
    if $_aosp; then
        return
    else

        pushd .repo/local_manifests
        cat >gapps.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<remote name="MindTheGapps" fetch="https://gitlab.com/MindTheGapps/" />
<project path="vendor/gapps" name="vendor_gapps" remote="MindTheGapps" revision="sigma" />
</manifest>
EOF
        popd
    fi
}

# ----------------------------------------------------------------------
# 9. MAKE OPTIONS
# ----------------------------------------------------------------------

_make() {
    if $_aosp; then
        echo ""
        echo "START BUILDING AOSP"
        sudo mount --bind $USERNAME/.ccache /mnt/ccache
        make -j$(nproc)
    else
        wait
        echo ""
        echo "START BUILDING DIOS"
        sudo mount --bind $USERNAME/.ccache /mnt/ccache
        make -j$(nproc)
        rm -rf ~/dios/device/sony/common/rootdir/dios/fork || true
    fi
}

# ----------------------------------------------------------------------
# 10. FLASHING OUTPUT
# ----------------------------------------------------------------------

_flash() {
    read -p "FLASHING TO A 2019 XPERIA?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo ./fastboot flash vbmeta_a $OUT_MAIN/vbmeta.img
        sudo ./fastboot flash vbmeta_b $OUT_MAIN/vbmeta.img
        sudo ./fastboot flash dtbo_a $OUT_MAIN/dtbo.img
        sudo ./fastboot flash dtbo_b $OUT_MAIN/dtbo.img
        sudo ./fastboot flash boot_a $OUT_MAIN/boot.img
        sudo ./fastboot flash boot_b $OUT_MAIN/boot.img
        sudo ./fastboot flash vendor_a $OUT_MAIN/vendor.img
        sudo ./fastboot flash vendor_b $OUT_MAIN/vendor.img
        sudo ./fastboot flash system_a $OUT_MAIN/system.img
        sudo ./fastboot flash system_b $OUT_MAIN/system.img
        sudo ./fastboot flash userdata $OUT_MAIN/userdata.img
        sleep 5
        sudo ./fastboot reboot
        exit
    fi

    read -p "FLASHING TO A 2020 XPERIA?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo ./fastboot flash vbmeta_a vbmeta.img
        sudo ./fastboot flash vbmeta_b vbmeta.img
        sudo ./fastboot flash dtbo_a dtbo.img
        sudo ./fastboot flash dtbo_b dtbo.img
        sudo ./fastboot flash boot_a boot.img
        sudo ./fastboot flash boot_b boot.img
        sudo ./fastboot flash vendor_a vendor.img
        sudo ./fastboot flash vendor_b vendor.img
        sudo ./fastboot flash system_a system.img
        sudo ./fastboot flash system_b system.img
        sudo ./fastboot flash userdata userdata.img
        sleep 5
        sudo ./fastboot reboot
        exit
    fi

    read -p "FLASHING TO A 2021 XPERIA?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo ./fastboot flash vbmeta_a vbmeta.img
        sudo ./fastboot flash vbmeta_b vbmeta.img
        sudo ./fastboot flash dtbo_a dtbo.img
        sudo ./fastboot flash dtbo_b dtbo.img
        sudo ./fastboot flash boot_a boot.img
        sudo ./fastboot flash boot_b boot.img
        sudo ./fastboot flash vendor_a vendor.img
        sudo ./fastboot flash vendor_b vendor.img
        sudo ./fastboot flash system_a system.img
        sudo ./fastboot flash system_b system.img
        sudo ./fastboot flash userdata userdata.img
        sleep 5
        sudo ./fastboot reboot
        exit
    fi
}

# ----------------------------------------------------------------------
# 11. BUILD STEPS
# ----------------------------------------------------------------------

_build() {
    _post_update
    _repo_update
    _pixel_fork
    _init_gapps
    _cleaning
    _make
    _flash
}

# ----------------------------------------------------------------------
# 12. SETTING OPTIONS
# ----------------------------------------------------------------------

declare _shell_script=${0##*/}
declare _aosp="false"
declare _clean="false"
declare _update="false"

while (("$#")); do
    case $1 in
    -a | --aosp)
        _aosp="true"
        shift
        ;;
    -c | --clean)
        _clean="true"
        shift
        ;;
    -u | --update)
        _update="true"
        shift
        ;;
    -h | --help)
        _show_help
        exit 0
        ;;
    *)
        echo "OPTION: $1 FAILED! USE: $_shell_script -h FOR HELP..."
        exit 1
        ;;
    esac
done

# ----------------------------------------------------------------------
# 0. BUILD OR INIT
# ----------------------------------------------------------------------

if [ -d ~/dios/device/sony/common/rootdir/dios ]; then
    cd $SOURCE

    set +u
    . build/envsetup.sh
    lunch $LUNCH_CHOICE
    declare _device=$(get_build_var PRODUCT_DEVICE 2>/dev/null)
    declare _platform=$(get_build_var PRODUCT_PLATFORM 2>/dev/null)
    set -u

    _build
else
    _init_dios
fi
