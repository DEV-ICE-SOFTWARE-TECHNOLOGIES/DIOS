#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright (c) 2022 DEV ICE TECHNOLOGIES
# THE D!OS BUILD AI IS PROPERTY OF DEV ICE TECHNOLOGIES. A COMPANY OF MARIUS KOPP.
# YOU ARE NOT ALLOWED TO COPY, SHARE OR EDIT THIS WORK WITHOUT PERMISSIONS FROM THE OWNER.
# THE A.I. USES EXTERNAL ANDROID DEVICE TREES. WE DON'T MAKE OWN TREES OR CHANGE THEM. BUT WE EDIT.
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
    echo "Insert:"
    echo "sudo bash DIOS.sh"
    echo " "
    echo "With:"
    echo "-c | --clean / Making everything clean"
    echo "-f | --fork / Forking Firmwares"
    echo "-h | --help / Showing this Message"
    echo "-i | --init / Run this as first Option"
    echo "-p | --patch / Apply DIOS Patches"
    echo "-u | --update / Repo Sync & Update"
    echo "-z | --zipping / Making an Update Zip"
    echo " "
    echo "Like:"
    echo "sudo bash DIOS.sh -u to init a Repo Sync"
    echo " "
}

# --------------------------------------------------------------------------------------------------
# VARIABLES
# --------------------------------------------------------------------------------------------------

BRANCH=android-13.0.0_r4
EMAIL=mariuskopp517@gmail.com
LUNCH_CHOICE=aosp_xqbc52-userdebug
NAME=M1U5T0N3
USERNAME=miustone

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
    sudo apt-get install -y bison g++-multilib git gperf libxml2-utils make zlib1g-dev zip liblz4-tool libncurses5 libssl-dev bc flex curl python-is-python3 ccache simg2img aapt repo

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

    #source ~/.bashrc

    if [ ! -d ~/dios/device/sony/customization ]; then
        mkdir -p ~/dios/device/sony/customization
    fi

    echo ""
    echo "CREATING DIOS PATH..."
    echo ""
    cat <<\EOF >device/sony/customization/customization.mk
DIOS_PATH := device/sony/dios
$(call inherit-product-if-exists, $(DIOS_PATH)/dios.mk)
EOF

    if [ ! -d /mnt/ccache ]; then
        sudo mkdir /mnt/ccache
    fi

    if [ ! -d ~/.ccache ]; then
        mkdir ~/.ccache
    fi

    sudo mount --bind /home/$USERNAME/.ccache /mnt/ccache

    ccache -M 50G -F 0

    git config --global user.email $EMAIL

    git config --global user.name $NAME

    repo init -u https://android.googlesource.com/platform/manifest -b $BRANCH

    cd .repo

    if [ ! -d ~/dios/.repo/local_manifests ]; then
        git clone https://github.com/sonyxperiadev/local_manifests
    fi

    cd local_manifests

    git checkout $BRANCH

    cd ../..

    sudo bash DIOS_MANIFEST_XML.sh

    if [ ! -d ~/dios/device/sony/dios ]; then
        mkdir -p ~/dios/device/sony/dios
    fi

    if [ ! -d ~/dios/device/sony/dios ]; then
        pushd ~/dios/device/sony/dios
        git clone https://github.com/DEV-ICE-TECHNOLOGIES/ACDB
        popd
    fi

    repo sync -j$(nproc)

    sudo bash DIOS_REPO_UPDATE.sh

    sudo bash repo_update.sh

    echo ""
    echo "PREPARED! RESTART THE SCRIPT TO START BUILDING..."
    exit

}

# --------------------------------------------------------------------------------------------------
# PREPARE
# --------------------------------------------------------------------------------------------------

_preparing() {
    echo ""
    echo "PREPARING DIOS..."
    echo ""
    wait
    sudo bash DIOS_ANDROID_MK.sh
    wait
    sudo bash DIOS_ANDROID_BP.sh
    wait
    sudo bash DIOS_COMMON_PROPS_MK.sh
    #wait
    #sudo bash DIOS_SAGAMI_PLATFORM_MK.sh
    #wait
    #sudo bash DIOS_SYSPROP_MK.sh
    wait
    sudo bash DIOS_VENDOR_MK.sh

}

# --------------------------------------------------------------------------------------------------
# CLEAN
# --------------------------------------------------------------------------------------------------

_cleaning() {
    if $_clean; then
        echo ""
        echo "CLEANING TARGETS..."
        echo ""
        wait
        make installclean -j$(nproc)
        echo ""
        echo "D!OS OUTPUT CLEANED..."
        echo ""
        wait
    fi
}

# --------------------------------------------------------------------------------------------------
# PIXEL
# --------------------------------------------------------------------------------------------------

_forking() {
    if $_fork; then
        wait
        sudo bash DIOS_PIXEL_FORK.sh
        wait
        sudo bash DIOS_OPEN_CAMERA.sh
        wait
        #sudo bash DIOS_XPERIA_FORK.sh
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
        sudo bash repo_update.sh
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
        sudo bash DIOS_APPS_SETTINGS_XML.sh
        wait
        sudo bash DIOS_FRAMEWORK_XML.sh
        wait
        #sudo bash DIOS_PRODUCT_BUILD_PROP.sh
        wait
        #sudo bash DIOS_SYSTEM_BUILD_PROP.sh
        wait
        #sudo bash DIOS_SYSTEM_EXT_BUILD_PROP.sh
        wait
        #sudo bash DIOS_VENDOR_BUILD_PROP.sh
        wait
        sudo bash DIOS_PERMISSIONS_XML.sh
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
    sudo mount --bind /home/$USERNAME/.ccache /mnt/ccache
    wait
    make -j$(nproc)
    wait
    read -p "DO YOU WANT TO FLASH DIOS VIA FASTBOOT?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo bash DIOS_FASTBOOT_FLASH.sh
    fi
    wait
}

# --------------------------------------------------------------------------------------------------
# MAKE
# --------------------------------------------------------------------------------------------------

_zip() {
    if $_zipping; then
        echo ""
        echo "ZIPPING DIOS..."
        echo ""
        wait
        if [ ! -d ~/dios/dist_output ]; then
            mkdir -p ~/dios/dist_output
        fi
        make dist DIST_DIR=dist_output -j$(nproc)
        wait
        read -p "DO YOU WANT TO FLASH DIOS VIA ADB?" -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            sudo bash DIOS_ADB_FLASH.sh
        fi
        wait
    fi
}

# --------------------------------------------------------------------------------------------------
# BUILD
# --------------------------------------------------------------------------------------------------

_build() {
    _preparing
    _cleaning
    _forking
    _repo_update
    _patching
    _make
    _zip
}

# --------------------------------------------------------------------------------------------------
# FLAGS
# --------------------------------------------------------------------------------------------------

declare _shell_script=${0##*/}
declare _clean="false"
declare _fork="false"
declare _update="false"
declare _patch="false"
declare _init="false"
declare _zipping="false"

while (("$#")); do
    case $1 in
    -c | --clean)
        _clean="true"
        shift
        ;;
    -f | --fork)
        _fork="true"
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
    -z | --zipping)
        _zipping="true"
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

    set +u
    source build/envsetup.sh
    lunch $LUNCH_CHOICE
    set -u

    _build

fi
