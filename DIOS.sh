#!/usr/bin/env bash -i
##################################
## Copyright © 2024 Marius Kopp ##
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

        sh DIOS_INIT.sh

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
