#!/usr/bin/env bash

set -euv

  echo -e "${BGWHITE}"
  echo " █▀▄ █ ▄▀▄ ▄▀▀    ██▄ █ █ █ █   █▀▄    ▄▀▄ █ "
  echo " █▄▀ █ ▀▄▀ ▄█▀    █▄█ ▀▄█ █ █▄▄ █▄▀    █▀█ █ "
  echo -e "${NOCOLOR}"
  echo "INSTALLER"
  echo ""

img2txt ~/dios/dios.png

source ./config.cfg

_help() {
    echo "Visit the DIOS ReadMe on GitHub!"
    xdg-open https://github.com/DEV-ICE-SOFTWARE-TECHNOLOGIES/DIOS/blob/main/README.md
    echo " "
}

_initialize() {
    # Read the value of the variable from the config file
    INITIALIZED=$(grep "^INITIALIZED=" config.cfg)

    # If the variable is not set or set to false, set it to true after the init
    if [ -z "$INITIALIZED" ] || [ "$INITIALIZED" = "INITIALIZED=false" ]; then

        echo ""
        echo ""
        echo "INSTALLING DEPENDENCIES..."
        echo ""

        if [ ! -d ~/dios ]; then
            mkdir ~/dios
        fi

        cd ~/dios

        sudo apt update

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

        echo '' >>~/.bashrc
        echo 'export PATH=~/bin:$PATH' >>~/.bashrc
        echo 'export USE_CCACHE=1' >>~/.bashrc
        echo 'export CCACHE_EXEC=/usr/bin/ccache' >>~/.bashrc
        echo 'export CCACHE_DIR=/mnt/ccache' >>~/.bashrc
        echo 'export ALLOW_MISSING_DEPENDENCIES=true' >>~/.bashrc
        wait

        source ~/.bashrc

        # Check if /mnt/ccache exists, create if it doesn't
        if [ ! -d /mnt/ccache ]; then
            sudo mkdir /mnt/ccache
        fi

        # Check if ~/.ccache exists, create if it doesn't
        if [ ! -d ~/.ccache ]; then
            mkdir ~/.ccache
        fi

        # Add mount command to /etc/fstab if it doesn't already exist
        if ! grep -qxF 'sudo mount --bind ~/.ccache /mnt/ccache' /etc/fstab; then
            echo 'sudo mount --bind ~/.ccache /mnt/ccache' | sudo tee -a /etc/fstab >/dev/null
        fi

        # Mount ccache
        sudo mount -a

        ccache -M 50G -F 0

        git config --global user.email $EMAIL

        git config --global user.name $NAME

        cd ~/dios

        repo init -u $REPO -b $BRANCH

        bash ./DIOS_MANIFEST_XMLS.sh

        repo sync -j$(nproc)

        echo ""
        echo -e "${RED}PREPARED! RESTART THE SCRIPT TO START BUILDING..."

        # Set the variable to true in the config file
        sed -i 's/^INITIALIZED=.*/INITIALIZED=true/' config.cfg

        exit

    else

        exit

    fi

}

_preparing() {
    echo ""
    echo -e "${GREEN}PREPARING D!OS..."
    echo ""
    wait
    #bash ./DIOS_SYSPROP_MK.sh

}

_cleaning() {
    if $_cleanall; then
        echo ""
        echo -e "${GREEN}CLEANING TARGETS..."
        echo ""
        wait
        make installclean -j$(nproc)
        rm -rf $FORK_DIR
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
        rm -rf $FORK_DIR
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

_repo_update() {
    if $_update; then
        echo ""
        echo -e "${GREEN}REPO SYNC AND REPO UPDATE..."
        echo ""
        repo sync -j$(nproc)
    fi
}

_forking() {
    if $_forkall; then
        wait
        bash ./DIOS_FORK_PIXEL.sh
        wait
        bash ./DIOS_OPEN_CAMERA.sh
        wait
        #bash ./DIOS_FORK_XPERIA.sh
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

_patching() {
    if $_patch; then
        echo ""
        echo -e "${GREEN}PATCHING CODE..."
        echo ""
        wait
        #bash ./DIOS_PRODUCT_BUILD_PROP.sh
        wait
        #bash ./DIOS_SYSTEM_BUILD_PROP.sh
        wait
        #bash ./DIOS_SYSTEM_EXT_BUILD_PROP.sh
        wait
        #bash ./DIOS_VENDOR_BUILD_PROP.sh
        wait
    fi
}

_make() {
    wait
    echo ""
    echo -e "${GREEN}START BUILDING..."
    echo ""
    echo "D!OS..."

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
    wait
    echo ""
    read -k 1 "fastboot?DO YOU WANT TO FLASH D!OS VIA FASTBOOT?"
    echo
    if [[ "$fastboot" =~ ^[Yy]$ ]]; then
        bash ./DIOS_FLASH_FASTBOOT.sh
    fi
    wait
    read -k 1 "adb?DO YOU WANT TO FLASH D!OS VIA ADB?"
    echo
    if [[ "$adb" =~ ^[Yy]$ ]]; then
        bash ./DIOS_FLASH_ADB.sh
    fi
    wait
}

_build() {
    _preparing
    _cleaning
    _repo_update
    _forking
    _patching
    _make
}

_aospbuild=false
_cleanall=false
_cleanforks=false
_cleanout=false
_forkall=false
_forkdios=false
_forkpixel=false
_forkxperia=false
_init=false
_patch=false
_update=false

_usage() {
    echo "Usage: $(basename "$0") [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -ab, --aospbuild   Enable AOSP build"
    echo "  -ca, --cleanall    Clean all"
    echo "  -cf, --cleanforks  Clean forks"
    echo "  -co, --cleanout    Clean output"
    echo "  -fa, --forkall     Fork all"
    echo "  -fd, --forkdios    Fork Dios"
    echo "  -fp, --forkpixel   Fork Pixel"
    echo "  -fx, --forkxperia  Fork Xperia"
    echo "  -i,  --init        Initialize"
    echo "  -p,  --patch       Apply patch"
    echo "  -u,  --update      Update"
    echo "  -h,  --help        Display this help and exit"
}

while [[ $# -gt 0 ]]; do
    case $1 in
    -ab | --aospbuild) _aospbuild=true ;;
    -ca | --cleanall) _cleanall=true ;;
    -cf | --cleanforks) _cleanforks=true ;;
    -co | --cleanout) _cleanout=true ;;
    -fa | --forkall) _forkall=true ;;
    -fd | --forkdios) _forkdios=true ;;
    -fp | --forkpixel) _forkpixel=true ;;
    -fx | --forkxperia) _forkxperia=true ;;
    -i | --init) _init=true ;;
    -p | --patch) _patch=true ;;
    -u | --update) _update=true ;;
    -h | --help)
        _usage
        exit 0
        ;;
    *)
        echo "Invalid option: $1" >&2
        _usage
        exit 1
        ;;
    esac
    shift
done

if $_init; then
    _initialize
else
    set +u
    source build/envsetup.sh
    lunch $LUNCH_CHOICE
    set -u
    _build
fi
