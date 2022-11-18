#!/bin/bash

set -eu

# --------------------------------------------------------------------------------------------------
# Copyright (C) 2022 DEV ICE TECHNOLOGIES
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
# 0. HELP
# --------------------------------------------------------------------------------------------------

_help() {
    echo "Insert:"
    echo "bash ./DIOS.sh"
    echo " "
    echo "With:"
    echo "-ca | --cleanall / Cleans Output and Firmwares"
    echo "-cf | --cleanforks / Cleans out forked Firmwares"
    echo "-co | --cleanoutput / Cleans the Output"
    echo "-fa | --forkall / Forking all available Firmwares"
    echo "-fd | --forkdios / Forking all D!OS Extras"
    echo "-fp | --forkpixel / Forking Pixel Firmware"
    echo "-fx | --forkxperia / Forking Xperia Firmware"
    echo "-h | --help / Showing this Message"
    echo "-i | --init / Run this as first Option"
    echo "-p | --patch / Apply D!OS Patches"
    echo "-u | --update / Repo Sync & Update"
    echo "-z | --zipping / Making an Update Zip"
    echo " "
    echo "Like:"
    echo "bash ./DIOS.sh -u to init a Repo Sync"
    echo " "
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo " "
    echo "MAKE SURE TO REPLACE/SET THE VARIABLES IN THE DIOS.sh FILE!"
    echo "MAKE SURE TO INSTALL AOSP-DEVEL AUR BEFORE INIT!"
    echo " "
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo " "
    echo "BRANCH="
    echo "REPO="
    echo "TREE="
    echo "EMAIL="
    echo "LUNCH_CHOICE="
    echo "NAME="
    echo "USERNAME="
    echo " "

}

# --------------------------------------------------------------------------------------------------
# 1. VARIABLES
# --------------------------------------------------------------------------------------------------

BRANCH=android-13.0.0_r12
REPO=https://android.googlesource.com/platform/manifest
TREE=https://github.com/sonyxperiadev/local_manifests
EMAIL=mariuskopp517@gmail.com
LUNCH_CHOICE=aosp_xqbc52-userdebug
NAME=M1U5T0N3
USERNAME=miustone
BGBLACK='\033[40m'
BGBLUE='\033[44m'
BGCYAN='\033[46m'
BGGREEN='\033[42m'
BGPURPLE='\033[45m'
BGRED='\033[41m'
BGWHITE='\033[47m'
BGYELLOW='\033[43m'
BLACK='\033[0;30m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NOCOLOR='\033[0m'
PURPLE='\033[0;35m'
RED='\033[0;31m'
WHITE='\033[0;37m'
YELLOW='\033[0;33m'

# --------------------------------------------------------------------------------------------------
# 2. INITIALIZING
# --------------------------------------------------------------------------------------------------

_initialize() {

    echo ""
    echo ""
    echo "INSTALLING DEPENDENCIES..."
    echo ""

    if [ ! -d ~/dios ]; then
        mkdir ~/dios
    fi

    cd ~/dios

    sudo pacman -Syyu

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

    source ~/.bashrc

    if [ ! -d /mnt/ccache ]; then
        sudo mkdir /mnt/ccache
    fi

    if [ ! -d ~/.ccache ]; then
        mkdir ~/.ccache
    fi

    sudo mount --bind ~/.ccache /mnt/ccache

    ccache -M 50G -F 0

    git config --global user.email $EMAIL

    git config --global user.name $NAME

    cd ~/dios

    repo init -u $REPO -b $BRANCH

    cd .repo

    if [ ! -d ~/dios/.repo/local_manifests ]; then
        git clone $TREE
    fi

    cd local_manifests

    git checkout $BRANCH

    cd ~/dios

    if [ ! -d ~/dios/device/sony/customization ]; then
        mkdir -p ~/dios/device/sony/customization
    fi

    echo ""
    echo "CREATING D!OS PATH..."
    echo ""

    cat <<\EOF >device/sony/customization/customization.mk
DIOS_PATH := device/sony/dios
$(call inherit-product-if-exists, $(DIOS_PATH)/dios.mk)
EOF

    bash ./DIOS_MANIFEST_XML.sh

    repo sync -j$(nproc)

    bash ./repo_update.sh

    echo ""
    echo -e "${RED}PREPARED! RESTART THE SCRIPT TO START BUILDING..."
    echo -e "${RED}PLEASE RUN: source ~/.bashrc BEFORE YOU START BUILDING!"
    echo -e "${RED}YOU CAN ALSO ADD THIS TO FSTAB to MAKE CCACHE AUTO MOUNT ON BOOTING:"
    echo "/etc/fstab: /home/<your_current_path>/.ccache /mnt/ccache none defaults,bind,users,noauto 0"
    exit

}

# --------------------------------------------------------------------------------------------------
# 3. PREPARE
# --------------------------------------------------------------------------------------------------

_preparing() {
    echo ""
    echo -e "${GREEN}PREPARING D!OS..."
    echo ""
    wait
    bash ./DIOS_ANDROID_MK.sh
    wait
    bash ./DIOS_ANDROID_BP.sh
    wait
    #bash ./DIOS_COMMON_PROPS_MK.sh
    #wait
    #bash ./DIOS_SAGAMI_PLATFORM_MK.sh
    #wait
    #bash ./DIOS_SYSPROP_MK.sh
    wait
    #bash ./DIOS_VENDOR_MK.sh

}

# --------------------------------------------------------------------------------------------------
# 4. CLEAN
# --------------------------------------------------------------------------------------------------

_cleaning() {
    if $_cleanall; then
        echo ""
        echo -e "${BGWHITE}CLEANING TARGETS..."
        echo ""
        wait
        make clean -j$(nproc)
        rm -rf ~/dios/device/sony/dios/fork
        echo ""
        echo -e "${GREEN}D!OS OUTPUT AND FORKS CLEANED..."
        echo ""
        wait
    fi

    if $_cleanforks; then
        echo ""
        echo -e "${BGWHITE}CLEANING TARGETS..."
        echo ""
        wait
        rm -rf ~/dios/device/sony/dios/forks
        echo ""
        echo -e "${GREEN}D!OS FORKS CLEANED..."
        echo ""
        wait
    fi

    if $_cleanout; then
        echo ""
        echo -e "${BGWHITE}CLEANING TARGETS..."
        echo ""
        wait
        make clean -j$(nproc)
        echo ""
        echo -e "${GREEN}D!OS OUTPUT CLEANED..."
        echo ""
        wait
    fi
}

# --------------------------------------------------------------------------------------------------
# 5. FORKING
# --------------------------------------------------------------------------------------------------

_forking() {
    if $_forkall; then
        wait
        bash ./DIOS_PIXEL_FORK.sh
        wait
        bash ./DIOS_OPEN_CAMERA.sh
        wait
        #bash ./DIOS_XPERIA_FORK.sh
        wait
    fi

    if $_forkdios; then
        wait
        bash ./DIOS_OPEN_CAMERA.sh
        wait
    fi

    if $_forkpixel; then
        wait
        bash ./DIOS_PIXEL_FORK.sh
        wait
    fi

    if $_forkxperia; then
        wait
        #bash ./DIOS_XPERIA_FORK.sh
        wait
    fi
}

# --------------------------------------------------------------------------------------------------
# 6. UPDATE
# --------------------------------------------------------------------------------------------------

_repo_update() {
    if $_update; then
        echo ""
        echo -e "${BGWHITE}REPO SYNC AND REPO UPDATE..."
        echo ""
        bash ./repo_update.sh
    fi
}

# --------------------------------------------------------------------------------------------------
# 7. PATCHING
# --------------------------------------------------------------------------------------------------

_patching() {
    if $_patch; then
        echo ""
        echo -e "${GREEN}PATCHING FILES..."
        echo ""
        wait
        #bash ./DIOS_APPS_SETTINGS_XML.sh
        wait
        #bash ./DIOS_FRAMEWORK_XML.sh
        wait
        #bash ./DIOS_PRODUCT_BUILD_PROP.sh
        wait
        #bash ./DIOS_SYSTEM_BUILD_PROP.sh
        wait
        #bash ./DIOS_SYSTEM_EXT_BUILD_PROP.sh
        wait
        #bash ./DIOS_VENDOR_BUILD_PROP.sh
        wait
        bash ./DIOS_PERMISSIONS_XML.sh
        wait
    fi
}

# --------------------------------------------------------------------------------------------------
# 8. BUILDING
# --------------------------------------------------------------------------------------------------

_make() {
    wait
    echo ""
        echo -e "${BGWHITE}START BUILDING D!OS"
    echo ""
    sudo mount --bind ~/.ccache /mnt/ccache
    wait
    make -j$(nproc)
    wait
    read -p "DO YOU WANT TO FLASH D!OS VIA FASTBOOT?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash ./DIOS_FASTBOOT_FLASH.sh
    fi
    wait
}

# --------------------------------------------------------------------------------------------------
# 9. ZIPPING
# --------------------------------------------------------------------------------------------------

_zip() {
    if $_zipping; then
        echo ""
        echo -e "${GREEN}ZIPPING D!OS..."
        echo ""
        wait
        if [ ! -d ~/dios/dist_output ]; then
            mkdir -p ~/dios/dist_output
        fi
        make dist DIST_DIR=dist_output -j$(nproc)
        wait
        read -p "DO YOU WANT TO FLASH D!OS VIA ADB?" -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            bash ./DIOS_ADB_FLASH.sh
        fi
        wait
    fi
}

# --------------------------------------------------------------------------------------------------
# 10. BUILD ORDER
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
# 11. A.I. FLAGS
# --------------------------------------------------------------------------------------------------

declare _shell_script=${0##*/}
declare _cleanall="false"
declare _cleanforks="false"
declare _cleanout="false"
declare _forkall="false"
declare _forkdios="false"
declare _forkpixel="false"
declare _forkxperia="false"
declare _update="false"
declare _patch="false"
declare _init="false"
declare _zipping="false"

while (("$#")); do
    case $1 in
    -ca | --cleanall)
        _cleanall="true"
        shift
        ;;
    -cf | --cleanforks)
        _cleanforks="true"
        shift
        ;;
    -co | --cleanout)
        _cleanout="true"
        shift
        ;;
    -fa | --forkall)
        _forkall="true"
        shift
        ;;
    -fd | --forkdios)
        _forkdios="true"
        shift
        ;;
    -fp | --forkpixel)
        _forkpixel="true"
        shift
        ;;
    -fx | --forkxperia)
        _forkxperia="true"
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
        echo -e "${RED}OPTION: $1 FAILED! USE: $_shell_script -h FOR HELP..."
        exit 1
        ;;
    esac
done

# --------------------------------------------------------------------------------------------------
# 12. BUILD OR INIT
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
