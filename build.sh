#!/bin/bash
set -eu

# ----------------------------------------------------------------------
# Variables
# ----------------------------------------------------------------------
SOURCE=~/dios
APK_DIR=${APK_DIR:-~/dios/dios/apk}
NAME=${NAME:-~M1U5T0N3}
EMAIL=${EMAIL:-~mariuskopp517@gmail.com}
USERNAME=${USERNAME:-~miustone}
LUNCH_CHOICE=aosp_j9210-userdebug
# ----------------------------------------------------------------------

_show_help() {
    echo "Usage:"
    echo "  $_shell_script [-a|--aosp] [-h|--help]"
    echo ""
    echo "AUTOMATED D!OS BUILD SCRIPT"
    echo ""
    echo "WARNING:"
    echo "  The Script will use Superuser rights and does things like..."
    echo "  - Deleting Files"
    echo "  - Creating Files"
    echo "  - Eating much Storage"
    echo ""
    echo "OPTIONS:"
    echo "  -a|--aosp               Build only AOSP, e.g. android-12.1.0_r5"
    echo "  -h|--help               Displays this Help"
    echo ""
    echo "SCRIPT VARIABLES:"
    echo "  SOURCE          Default: ~/dios"
    echo ""
    echo "  APK_DIR         Default: ~/dios/dios/apk"
    echo ""
    echo "  LUNCH_CHOICE    E.g. aosp_h3113-userdebug, aosp_h9436-userdebug,..."
    echo "                  Default: not set"
    echo ""
    echo "To pass the Variables to the Script use env, e.g. for pioneer use following Command:"
    echo "  env LUNCH_CHOICE=aosp_h3113-userdebug ./$_shell_script"
}

# ----------------------------------------------------------------------
# INITIALIZING
# ----------------------------------------------------------------------
_init_dios() {
  sudo apt-get purge openjdk-* icedtea-* icedtea6-* || true 
  sudo apt-get update
  sudo apt-get install openjdk-11-jdk
  sudo apt-get install bison g++-multilib git gperf libxml2-utils make zlib1g-dev zip liblz4-tool libncurses5 libssl-dev bc flex curl python-is-python3 ccache simg2img aapt

  mkdir ~/bin || true 
  curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
  chmod a+x ~/bin/repo

  echo '' >> ~/.bashrc
  echo 'export PATH=~/bin:$PATH' >> ~/.bashrc
  echo 'export USE_CCACHE=1' >> ~/.bashrc
  echo 'export CCACHE_EXEC=/usr/bin/ccache' >> ~/.bashrc
  echo 'export CCACHE_DIR=~/.ccache' >> ~/.bashrc
  wait
  source ~/.bashrc
  ccache -M 300G -F 0

  if [ -d /mnt/ccache ]; then
    sudo mount --bind $USERNAME/.ccache /mnt/ccache
  else
    sudo mkdir /mnt/ccache
    sudo mount --bind $USERNAME/.ccache /mnt/ccache
  fi

  #if [ -d ~/dios/.repo ]; then
  #  rm -r ~/dios/.repo/*
  #fi

  #if [ -d ~/dios/.git ]; then
  #  rm -r ~/dios/.git/*
  #fi

  repo init -u https://android.googlesource.com/platform/manifest -b android-12.1.0_r5
  cd .repo
  git clone https://github.com/DEV-ICE-TECHNOLOGIES/local_manifests
  cd local_manifests
  git checkout
  cd ../..
  repo sync -j$(nproc) && ./repo_update.sh -j$(nproc)

  _start_building
}

# ----------------------------------------------------------------------
# MAIN SCRIPT
# ----------------------------------------------------------------------
_gapps_fork() {
    bash ./gapps_fork.sh
    wait
    #local _apk_name=$HUH
    #local _target_dir=$WHAT
    #local _version=`aapt dump badging $APK_DIR/$_apk_name |grep versionCode=|sed "s#.*versionCode='\([[:digit:]]*\).*#\1#1"`
    #mkdir -p $_target_dir
    #rm $_target_dir/*
    #cp $APK_DIR/$_apk_name $_target_dir/$_version.apk
}

_init_gapps() {
    if $_aosp; then
        return
    fi

    pushd .repo/local_manifests
        cat >gapps.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<remote name="MindTheGapps" fetch="https://gitlab.com/MindTheGapps/" />
<project path="vendor/gapps" name="vendor_gapps" remote="MindTheGapps" revision="sigma" />
</manifest>
EOF
    popd
}

_repo_update() {
    repo sync -j$(nproc) && ./repo_update.sh -j$(nproc)
}

_post_update() {
    _customize_build
}

_customize_build() {
    mkdir ~/dios/dios || true 
    if ! $_aosp; then
        cat <<EOF > ~/dios/dios/dios.mk
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

WITH_DEXPREOPT := true

include vendor/gapps/arm64/arm64-vendor.mk

EOF
    fi

    cat <<EOF > ~/dios/dios/dios.mk
BOARD_USE_ENFORCING_SELINUX := true
EOF
}

_make() {
    if [ -n "$_aosp" ]; then
        make clean
    else
        make installclean
    fi

    make -j$(nproc)
}

_build() {
    _customize_build
    _gapps_fork
    _init_gapps
    _repo_update
    _post_update
    _make
}

declare _shell_script=${0##*/}
declare _aosp="false"

while (( "$#" )); do
    case $1 in
        -a|--aosp)
            _aosp="true"
            shift
            ;;
        -h|--help)
            _show_help
            exit 0
            ;;
        *)
            echo "Unknown parameter: $1 for help use $_shell_script -h"
            exit 1
            ;;
    esac
done

# ----------------------------------------------------------------------
# START BUILDING
# ----------------------------------------------------------------------

_start_building() {

cd $SOURCE

set +u # prevent following android calls from failing because of unset variables
. build/envsetup.sh
lunch $LUNCH_CHOICE
declare _device=`get_build_var PRODUCT_DEVICE 2>/dev/null`
declare _platform=`get_build_var PRODUCT_PLATFORM 2>/dev/null`
set -u

_build
}

# ----------------------------------------------------------------------
# READY?
# ----------------------------------------------------------------------
if [ -d ~/dios/dios ]; then
    _start_building
else
    _init_dios
fi
