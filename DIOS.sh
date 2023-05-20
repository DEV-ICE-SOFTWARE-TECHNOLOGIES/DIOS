#!/usr/bin/env bash -i
##################################
## Copyright © 2023 Marius Kopp ##
##################################

set -eu

source ./ADIOS.cfg

img2txt $DIOS_PATH/DIOS.png

echo -e "${BGBLACK}"
echo " █▀▄ █ ▄▀▄ ▄▀▀    ██▄ █ █ █ █   █▀▄    ▄▀▄ █ "
echo " █▄▀ █ ▀▄▀ ▄█▀    █▄█ ▀▄█ █ █▄▄ █▄▀    █▀█ █ "
echo -e "${NOCOLOR}"
echo ""

_initialize() {

    if [ -z "$INITIALIZED" ] || [ "$INITIALIZED" = "INITIALIZED=false" ]; then

        echo ""
        echo ""
        echo "INSTALLING DEPENDENCIES..."
        echo ""

        sudo pacman -Syu

        reqSpace=400000000
        availSpace=$(df "$DIOS_PATH" | awk 'NR==2 { print $4 }')
        if ((availSpace < reqSpace)); then
            echo -e "${RED}NOT ENOUGH FREE SPACE!" >&2
            exit 1
        fi

        if [ ! -d ~/bin ]; then
            mkdir -p ~/bin
        fi

        curl http://commondatastorage.googleapis.com/git-repo-downloads/repo >~/bin/repo
        chmod a+x ~/bin/repo

        if ! grep -qxF '# DIOS' ~/.bashrc; then

            echo '' >>~/.bashrc
            echo '# DIOS' >>~/.bashrc
            echo 'export PATH=~/bin:$PATH' >>~/.bashrc
            echo 'export USE_CCACHE=1' >>~/.bashrc
            echo 'export CCACHE_EXEC=/usr/bin/ccache' >>~/.bashrc
            echo 'export CCACHE_DIR=/mnt/ccache' >>~/.bashrc
            echo 'export ALLOW_MISSING_DEPENDENCIES=true' >>~/.bashrc

        fi

        echo ""
        echo "CREATING CCACHE..."
        echo ""

        source ~/.bashrc

        if [ ! -d /mnt/ccache ]; then

            sudo mkdir /mnt/ccache

        fi

        if [ ! -d ~/.ccache ]; then

            mkdir ~/.ccache

        fi

        if ! grep -qxF '~/.ccache                                 /mnt/ccache    none    defaults,bind,users,noauto 0 0' /etc/fstab; then

            echo '~/.ccache                                 /mnt/ccache    none    defaults,bind,users,noauto 0 0' | sudo tee -a /etc/fstab >/dev/null
            echo '' >>~/.profile
            echo 'export mount /mnt/ccache' >>~/.profile

        fi

        sudo mount -a

        sudo mount --bind ~/.ccache /mnt/ccache

        sudo ccache -M $CCACHE_SIZE -F 0

        if ! swapon --show | grep -Eq '/swapfile|/dev/'; then

            echo 'SWAP NOT FOUND. CREATING A 32GB ONE...'

            sudo fallocate -l $SWAP_SIZE /swapfile

            sudo chmod 600 /swapfile

            sudo mkswap /swapfile

            sudo swapon /swapfile

            echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

            echo ""
            echo 'SWAP FILE SUCCESSFULLY CREATED AND ENABLED.'
            echo ""

        else

            echo ""
            echo 'SWAP ALREADY EXISTS. SKIPPING...'
            echo ""

        fi

        git config --global user.email $EMAIL

        git config --global user.name $NAME

        repo init -u $REPO -b $BRANCH

        sh DIOS_MANIFEST_XMLS.sh

        echo 'DOWNLOADING CODE...'

        repo sync -j$(nproc) -c -f -q || true

        sh DIOS_BINARIES.sh

        sh DIOS_DEVICE_TARGETS.sh

        echo ""
        echo -e "${RED}PREPARED! RESTART THE SCRIPT TO START BUILDING..."

        sed -i 's/^INITIALIZED=.*/INITIALIZED=true/' $DIOS_PATH/ADIOS.cfg

        exit

    else

        exit

    fi

}

_updating() {
    if $_update; then
        echo ""
        echo -e "${GREEN}REPO SYNC AND REPO UPDATE..."
        echo ""

        sh DIOS_MANIFEST_XMLS.sh

        repo init -u $REPO -b $BRANCH

        repo sync -j$(nproc) -c -f

    fi
}

_preparing() {
    echo ""
    echo -e "${GREEN}PREPARING D!OS..."
    echo ""

    sh DIOS_ANDROID_MK.sh

    sh DIOS_ANDROID_BP.sh

    sh DIOS_DIOS_MK.sh

    sed -i 's/^BUILD_DESC :=.*/BUILD_DESC := DIOS - $(TARGET_PRODUCT)-$(TARGET_BUILD_VARIANT) $(PLATFORM_VERSION) $(BUILD_ID) $(BUILD_NUMBER_FROM_FILE) $(BUILD_VERSION_TAGS)/' $DIOS_PATH/build/core/sysprop.mk

}

_patching() {
    if $_patch; then
        echo ""
        echo -e "${GREEN}PATCHING CODE..."
        echo ""

        sh DIOS_DEVICE_TARGETS.sh

    fi
}

_cleaning() {

    if $_cleanall; then
        echo ""
        echo -e "${GREEN}CLEANING TARGETS..."
        echo ""

        make installclean -j$(nproc)

        rm -rf $PIXEL_FORKS

        rm -rf $XPERIA_FORKS

        echo ""
        echo -e "${GREEN}D!OS OUTPUT AND FORKS CLEANED..."
        echo ""
    fi

    if $_cleanforks; then
        echo ""
        echo -e "${GREEN}CLEANING TARGETS..."
        echo ""

        rm -rf $PIXEL_FORKS

        rm -rf $XPERIA_FORKS

        echo ""
        echo -e "${GREEN}D!OS FORKS CLEANED..."
        echo ""
    fi

    if $_cleanout; then
        echo ""
        echo -e "${GREEN}CLEANING TARGETS..."
        echo ""

        make installclean -j$(nproc)

        echo ""
        echo -e "${GREEN}D!OS OUTPUT CLEANED..."
        echo ""
    fi
}

_forking() {

    if $_forkall; then

        sh DIOS_FORK_PIXEL.sh

        sh DIOS_OPEN_CAMERA.sh

    fi

    if $_forkdios; then

        sh DIOS_OPEN_CAMERA.sh

    fi

    if $_forkpixel; then

        sh DIOS_FORK_PIXEL.sh

    fi

    if $_forkxperia; then

    sh DIOS_XPERIA_FORK.sh

    fi

}

_making() {

    echo ""
    echo -e "${GREEN}START BUILDING DIOS..."
    echo ""

    if [ ! -d $DIOS_PATH/dist_output ]; then

        mkdir -p $DIOS_PATH/dist_output

    fi

    if ! grep -qs '/mnt/ccache' /proc/mounts; then

        sudo mount --bind ~/.ccache /mnt/ccache

    fi

    make -j$(nproc)

    wait

    make dist DIST_DIR=dist_output -j$(nproc) || true

    echo -e "${GREEN}FINISHED BUILDING..."
    echo ""

    read -n 1 -p "DO YOU WANT TO FLASH D!OS FOR $LUNCH_DEVICE VIA FASTBOOT? [Y/N]:" fastboot
    echo

    if [[ "$fastboot" =~ ^[Yy]$ ]]; then

        export ANDROID_PRODUCT_OUT=$DIOS_FLASH

        ./fastboot -w update $DIOS_FLASH/$DIOS_IMAGES

        sleep 5
    fi

    read -n 1 -p "DO YOU WANT TO FLASH D!OS FOR $LUNCH_DEVICE VIA ADB? [Y/N]:" adb
    echo

    if [[ "$adb" =~ ^[Yy]$ ]]; then

        export ANDROID_PRODUCT_OUT=$DIOS_FLASH

        ./adb sideload $DIOS_FLASH/$DIOS_ZIP

        sleep 5
    fi

}

_build() {

    _updating
    _preparing
    _patching
    _cleaning
    _forking
    _making

}

_usage() {

    echo "Usage: sh $(basename "$0") [OPTIONS]"
    echo ""
    echo "OPTIONS:"
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
    echo ""
    echo "Example: sh $(basename "$0") -ab -ca -fa -p -u"
    echo "Which does aospbuild, cleanall, forkall, patch, update"
    echo ""
    echo "Visit the DIOS A.I. ReadMe on GitHub for More!"
    xdg-open https://github.com/DEV-ICE-SOFTWARE-TECHNOLOGIES/DIOS/blob/main/README.md
    echo " "

}

_init=false
_update=false
_patch=false
_cleanall=false
_cleanforks=false
_cleanout=false
_forkall=false
_forkdios=false
_forkpixel=false
_forkxperia=false

while [[ $# -gt 0 ]]; do

    case $1 in

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
