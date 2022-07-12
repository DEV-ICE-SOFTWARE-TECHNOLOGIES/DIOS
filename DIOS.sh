#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# THE D!OS BUILD AI IS PROPERTY OF DEV ICE TECHNOLOGIES. A COMPANY OF MARIUS KOPP
# YOU ARE NOT ALLOWED TO COPY, SHARE OR EDIT THIS WORK WITHOUT PERMISSIONS FROM THE OWNER
# --------------------------------------------------------------------------------------------------

echo ""
echo ""
echo ""
echo " █▀▄ █ ▄▀▄ ▄▀▀    ██▄ █ █ █ █   █▀▄    ▄▀▄ █ "
echo " █▄▀ █ ▀▄▀ ▄█▀    █▄█ ▀▄█ █ █▄▄ █▄▀    █▀█ █ "
echo ""
echo ""
echo ""

# --------------------------------------------------------------------------------------------------
# HELP
# --------------------------------------------------------------------------------------------------

_help() {
    echo "NOOOOOOOOOOOOOOOOOOOOOOOB!"
}

# --------------------------------------------------------------------------------------------------
# VARIABLES
# --------------------------------------------------------------------------------------------------

NAME=M1U5T0N3
USERNAME=miustone
EMAIL=mariuskopp517@gmail.com
LUNCH_CHOICE=aosp_arm64-eng

# --------------------------------------------------------------------------------------------------
# INITIALIZING
# --------------------------------------------------------------------------------------------------

_initialize() {

    echo ""
    echo ""
    echo "INSTALLING DEPENDENCIES..."
    echo ""
    sudo apt-get purge openjdk-* icedtea-* icedtea6-* || true
    sudo apt-get update
    sudo apt-get install -y openjdk-11-jdk
    sudo apt-get install -y bison g++-multilib git gperf libxml2-utils make zlib1g-dev zip liblz4-tool libncurses5 libssl-dev bc flex curl python-is-python3 ccache simg2img aapt

    if [ ! -d ~/bin ]; then
        mkdir -p ~/bin
    fi

    curl http://commondatastorage.googleapis.com/git-repo-downloads/repo >~/bin/repo
    chmod a+x ~/bin/repo

    echo '' >>~/.bashrc
    echo 'export PATH=~/bin:$PATH' >>~/.bashrc
    echo 'export USE_CCACHE=1' >>~/.bashrc
    echo 'export CCACHE_EXEC=/usr/bin/ccache' >>~/.bashrc
    echo 'export CCACHE_DIR=/mnt/ccache' >>~/.bashrc
    echo 'export ALLOW_MISSING_DEPENDENCIES=true' >>~/.bashrc
    wait
    source ~/.bashrc

    if [ ! -d /mnt/ccache ]; then
        sudo mkdir /mnt/ccache
    fi

    sudo mount --bind ~/.ccache /mnt/ccache

    ccache -M 50G -F 0

    wait
    bash ./DIOS_PATH.sh

    git config --global user.email $EMAIL

    git config --global user.name $NAME

    repo init -u https://android.googlesource.com/platform/manifest -b android-12.1.0_r11

    cd .repo

    if [ ! -d ~/dios/.repo/local_manifests ]; then
        git clone https://github.com/sonyxperiadev/local_manifests
    fi

    cd local_manifests

    git checkout

    cd ../..

    bash ./DIOS_MANIFEST_XML.sh
    wait
    bash ./DIOS_GAPPS_XML.sh
    wait

    if [ ! -d ~/dios/device/sony/dios ]; then
        mkdir -p ~/dios/device/sony/dios
    fi

    pushd ~/dios/device/sony/dios
    git clone https://github.com/DEV-ICE-TECHNOLOGIES/ACDB
    popd

    repo sync -j$(nproc) && ./repo_update.sh -j$(nproc)

    echo ""
    echo "PREPARED! RESTART THE SCRIPT TO START BUILDING..."
    exit

}

# --------------------------------------------------------------------------------------------------
# PREPARE
# --------------------------------------------------------------------------------------------------

_prepare() {

    echo ""
    echo "RUNNING PREPERATION..."
    echo ""
    #wait
    #bash ./DIOS_COMMON_PROPS_MK.sh
    #wait
    #bash ./DIOS_DIOS_MK.sh
    #wait
    #bash ./DIOS_KUMANO_PLATFORM_MK.sh
    #wait
    #bash ./DIOS_EDO_PLATFORM_MK.sh
    #wait
    #bash ./DIOS_SAGAMI_PLATFORM_MK.sh
    #wait
}

# --------------------------------------------------------------------------------------------------
# PIXEL
# --------------------------------------------------------------------------------------------------

_forking() {
    if ! $_clean; then
        wait
        #bash ./DIOS_PIXEL_FORK.sh
        #bash ./DIOS_XPERIA_FORK.sh
        wait
    fi
}

# --------------------------------------------------------------------------------------------------
# CLEAN
# --------------------------------------------------------------------------------------------------

_cleaning() {
    if $_clean; then
        echo ""
        echo "CLEANING /out"
        echo ""
        wait
        make installclean -j$(nproc)
        rm -rf ~/dios/device/sony/dios/fork || true
        rm -rf ~/dios/device/sony/dios/tmp || true
        echo ""
        echo "D!OS OUTPUT CLEANED..."
        echo ""
        wait
    fi
}

# --------------------------------------------------------------------------------------------------
# UPDATE
# --------------------------------------------------------------------------------------------------

_repo_update() {
    if $_update; then
        echo ""
        echo "REPO SYNC AND REPO UPDATE..."
        echo ""
        repo sync -j$(nproc) && ./repo_update.sh -j$(nproc)
    fi
}

# --------------------------------------------------------------------------------------------------
# UPDATE
# --------------------------------------------------------------------------------------------------

_patching() {
    if $_patch; then
        echo ""
        echo "PATCHING FILES..."
        echo ""
        wait
        bash ./DIOS_ANDROID_MK.sh
        wait
        bash ./DIOS_APPS_SETTINGS_XML.sh
        wait
        bash ./DIOS_FRAMEWORK_XML.sh
        wait
        bash ./DIOS_PRODUCT_BUILD_PROP.sh
        wait
        bash ./DIOS_SYSTEM_BUILD_PROP.sh
        wait
        bash ./DIOS_SYSTEM_EXT_BUILD_PROP.sh
        wait
        bash ./DIOS_VENDOR_BUILD_PROP.sh
        wait
        bash ./DIOS_MANIFEST_XML.sh
        wait
        bash ./DIOS_PERMISSIONS_XML.sh
        wait
    fi
}

# --------------------------------------------------------------------------------------------------
# MAKE
# --------------------------------------------------------------------------------------------------

_make() {
    wait
    echo ""
    echo "START BUILDING DIOS"
    echo ""
    sudo mount --bind ~/.ccache /mnt/ccache
    wait
    make -j$(nproc)
}

# --------------------------------------------------------------------------------------------------
# FLASH
# --------------------------------------------------------------------------------------------------

_flash() {
    wait
    bash ./DIOS_FASTBOOT_FLASH.sh
    wait
}

# --------------------------------------------------------------------------------------------------
# BUILD
# --------------------------------------------------------------------------------------------------

_build() {
    _prepare
    _forking
    _cleaning
    _repo_update
    _patching
    _make
    _flash
}

# --------------------------------------------------------------------------------------------------
# FLAGS
# --------------------------------------------------------------------------------------------------

declare _shell_script=${0##*/}
declare _clean="false"
declare _update="false"
declare _patch="false"
declare _init="false"

while (("$#")); do
    case $1 in
    -c | --clean)
        _clean="true"
        shift
        ;;
    -u | --update)
        _update="true"
        shift
        ;;
    -p | --patch)
        _patch="true"
        shift
        ;;
    -i | --init)
        _init="true"
        shift
        ;;
    -h | --help)
        _help
        exit 0
        ;;
    *)
        echo "OPTION: $1 FAILED! USE: $_shell_script -h FOR HELP..."
        exit 1
        ;;
    esac
done

# --------------------------------------------------------------------------------------------------
# BUILD OR INIT
# --------------------------------------------------------------------------------------------------

if $_init; then

    _initialize

else

    cd ~/dios

    set +u
    . build/envsetup.sh
    lunch $LUNCH_CHOICE
    declare _device=$(get_build_var PRODUCT_DEVICE 2>/dev/null)
    declare _platform=$(get_build_var PRODUCT_PLATFORM 2>/dev/null)
    set -u

    _build

fi
