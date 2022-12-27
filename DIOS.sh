#!/bin/zsh

set -eu

# --------------------------------------------------------------------------------------------------
# Copyright (C) 2022 DEV ICE SOFTWARE TECHNOLOGIES
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
    echo "zsh ./DIOS.sh"
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
    echo "zsh ./DIOS.sh -u to init a Repo Sync"
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

BRANCH=android-13.0.0_r16
REPO=https://android.googlesource.com/platform/manifest
TREE=https://github.com/sonyxperiadev/local_manifests
EMAIL=mariuskopp517@gmail.com
LUNCH_CHOICE=aosp_xqbc52-userdebug
NAME=M1U5T0N3
USERNAME=marius
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

    reqSpace=400000000
    availSpace=$(df "$HOME" | awk 'NR==2 { print $4 }')
    if ((availSpace < reqSpace)); then
        echo -e "${RED}NOT ENOUGH FREE SPACE!" >&2
        exit 1
    fi

    if [ ! -d ~/bin ]; then
        mkdir -p ~/bin
    fi

    curl http://commondatastorage.googleapis.com/git-repo-downloads/repo >~/bin/repo
    chmod a+x ~/bin/repo

    echo '' >>~/.zshrc
    echo 'export PATH=~/bin:$PATH' >>~/.zshrc
    echo 'export USE_CCACHE=1' >>~/.zshrc
    echo 'export CCACHE_EXEC=/usr/bin/ccache' >>~/.zshrc
    echo 'export CCACHE_DIR=/mnt/ccache' >>~/.zshrc
    echo 'export ALLOW_MISSING_DEPENDENCIES=true' >>~/.zshrc
    wait

    source ~/.zshrc

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
DIOS_PATH := device/dios
$(call inherit-product-if-exists, $(DIOS_PATH)/DIOS.mk)
EOF

    zsh ./DIOS_MANIFEST_XMLS.sh

    repo sync -j$(nproc)
    bash ./repo_update.sh

    echo ""
    echo -e "${RED}PREPARED! RESTART THE SCRIPT TO START BUILDING..."
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
    zsh ./DIOS_DIOS_MK.sh
    wait
    zsh ./DIOS_COMMON_PROPS_MK.sh
    wait
    #zsh ./DIOS_SAGAMI_PLATFORM_MK.sh
    wait
    #zsh ./DIOS_SYSPROP_MK.sh


}

# --------------------------------------------------------------------------------------------------
# 4. CLEAN
# --------------------------------------------------------------------------------------------------

_cleaning() {
    if $_cleanall; then
        echo ""
        echo -e "${GREEN}CLEANING TARGETS..."
        echo ""
        wait
        make installclean -j$(nproc)
        rm -rf ~/dios/device/dios/dios
        echo ""
        echo -e "${GREEN}D!OS OUTPUT AND FORKS CLEANED..."
        echo ""
        wait
    fi

    if $_cleanforks; then
        echo ""
        echo -e "${GREEN}CLEANING TARGETS..."
        echo ""
        wait
        rm -rf ~/dios/device/dios/dios
        echo ""
        echo -e "${GREEN}D!OS FORKS CLEANED..."
        echo ""
        wait
    fi

    if $_cleanout; then
        echo ""
        echo -e "${GREEN}CLEANING TARGETS..."
        echo ""
        wait
        make installclean -j$(nproc)
        echo ""
        echo -e "${GREEN}D!OS OUTPUT CLEANED..."
        echo ""
        wait
    fi
}

# --------------------------------------------------------------------------------------------------
# 5. UPDATE
# --------------------------------------------------------------------------------------------------

_repo_update() {
    if $_update; then
        echo ""
        echo -e "${GREEN}REPO SYNC AND REPO UPDATE..."
        echo ""
        repo sync -j$(nproc)
        bash ./repo_update.sh
    fi
}

# --------------------------------------------------------------------------------------------------
# 6. FORKING
# --------------------------------------------------------------------------------------------------

_forking() {
    if $_forkall; then
        wait
        zsh ./DIOS_FORK_PIXEL.sh
        wait
        zsh ./DIOS_OPEN_CAMERA.sh
        wait
        #zsh ./DIOS_FORK_XPERIA.sh
        wait
    fi

    if $_forkdios; then
        wait
        zsh ./DIOS_OPEN_CAMERA.sh
        wait
    fi

    if $_forkpixel; then
        wait
        zsh ./DIOS_PIXEL_FORK.sh
        wait
    fi

    if $_forkxperia; then
        wait
        #zsh ./DIOS_XPERIA_FORK.sh
        wait
    fi
}

# --------------------------------------------------------------------------------------------------
# 7. PATCHING
# --------------------------------------------------------------------------------------------------

_patching() {
    if $_patch; then
        echo ""
        echo -e "${GREEN}PATCHING CODE..."
        echo ""
        wait
        #zsh ./DIOS_PRODUCT_BUILD_PROP.sh
        wait
        #zsh ./DIOS_SYSTEM_BUILD_PROP.sh
        wait
        #zsh ./DIOS_SYSTEM_EXT_BUILD_PROP.sh
        wait
        #zsh ./DIOS_VENDOR_BUILD_PROP.sh
        wait
    fi
}

# --------------------------------------------------------------------------------------------------
# 8. BUILDING
# --------------------------------------------------------------------------------------------------

_make() {
    wait
    echo ""
    echo -e "${GREEN}START BUILDING..."
    echo ""
    if $_aospbuild; then
        wait
        echo "AOSP..."
    cat <<\EOF >device/sony/customization/customization.mk
DIOS_PATH := device/dios
#$(call inherit-product-if-exists, $(DIOS_PATH)/DIOS.mk)
EOF
    else
        echo "D!OS..."
    fi
    sudo mount --bind ~/.ccache /mnt/ccache
    wait
    make -j$(nproc)
    wait
    if [ ! -d ~/dios/dist_output ]; then
        mkdir -p ~/dios/dist_output
    fi
    make dist DIST_DIR=dist_output -j$(nproc) || true
    wait
    echo -e "${GREEN}FINISHED BUILDING..."
    if $_aospbuild; then
        wait
        echo "AOSP..."
    cat <<\EOF >device/sony/customization/customization.mk
DIOS_PATH := device/dios
$(call inherit-product-if-exists, $(DIOS_PATH)/DIOS.mk)
EOF
    else
        echo "D!OS..."
    fi
    wait
    echo ""
    read -k 1 "fastboot?DO YOU WANT TO FLASH D!OS VIA FASTBOOT?"
    echo
    if [[ "$fastboot" =~ ^[Yy]$ ]]; then
        zsh ./DIOS_FLASH_FASTBOOT.sh
    fi
    wait
    read -k 1 "adb?DO YOU WANT TO FLASH D!OS VIA ADB?"
    echo
    if [[ "$adb" =~ ^[Yy]$ ]]; then
        zsh ./DIOS_FLASH_ADB.sh
    fi
    wait
}

# --------------------------------------------------------------------------------------------------
# 9. BUILD ORDER
# --------------------------------------------------------------------------------------------------

_build() {
    _preparing
    _cleaning
    _repo_update
    _forking
    _patching
    _make
}

# --------------------------------------------------------------------------------------------------
# 10. A.I. FLAGS
# --------------------------------------------------------------------------------------------------

declare _shell_script=${0##*/}
declare _aospbuild="false"
declare _cleanall="false"
declare _cleanforks="false"
declare _cleanout="false"
declare _forkall="false"
declare _forkdios="false"
declare _forkpixel="false"
declare _forkxperia="false"
declare _init="false"
declare _patch="false"
declare _update="false"

while (("$#")); do
    case $1 in
    -ab | --aospbuild)
        _aospbuild="true"
        shift
        ;;
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
    -i | --init)
        _init="true"
        shift
        ;;
    -p | --patch)
        _patch="true"
        shift
        ;;
    -u | --update)
        _update="true"
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
# 11. BUILD OR INIT
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
