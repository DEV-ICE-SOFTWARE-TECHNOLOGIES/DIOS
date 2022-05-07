#!/bin/bash
set -eu

# ----------------------------------------------------------------------
# Variables that can be overriden by caller
# ----------------------------------------------------------------------
SOURCE=${SOURCE:-~/dios/dios/source}
APK_DIR=${APK_DIR:-~/dios/dios/apk}
NAME=${NAME:-~M1U5T0N3}
EMAIL=${EMAIL:-~mariuskopp517@gmail.com}
USERNAME=${USERNAME:-~miustone}
LUNCH_CHOICE=aosp_j9210-userdebug
# ----------------------------------------------------------------------

_show_help() {
    echo "Usage:"
    echo "  $_shell_script [-b <manifest_branch> [-k|--keep-local]] [-h|--help]"
    echo ""
    echo "AUTOMATED D!OS BUILD SCRIPT"
    echo ""
    echo "WARNING:"
    echo "  The Script will use Superuser rights and does things like..."
    echo "  - Deleting Files"
    echo "  - Creating Files"
    echo "  - Eating much Storage"
    echo "  - Git hard resets"
    echo "  - Git checkouts"
    echo "  ...Therefore the Script must not be used in a developers AOSP Tree with changed Files"
    echo "  and/or local Commits. Both might get lost when running this Scripts!"
    echo ""
    echo "Options:"
    echo "  -b <manifest_branch>    Switches the Repo to the specified manifest_branch, e.g. android-12.1.0_r5"
    echo "  -k|--keep-local         Keeps the branch for the local manifests Repo when switching Branches"
    echo "  -h|--help               Display this Help"
    echo "  -x|--exclude-gapps      Excludes GApps from the build and implicitly removes the GApps"
    echo "                          Repos from the Source Tree"
    echo ""
    echo "Script variables:"
    echo "  SOURCE          D!OS root folder"
    echo "                  Default: ~/dios/dios/source"
    echo "  APK_DIR         currently not used"
    echo "                  Default: ~/dios/dios/source"
    echo "  LUNCH_CHOICE    e.g. aosp_h3113-userdebug, aosp_h9436-userdebug,..."
    echo "                  Default: not set"
    echo ""
    echo "To pass the Variables to the Script use env, e.g. for pioneer use following Command:"
    echo "  env LUNCH_CHOICE=aosp_h3113-userdebug ./$_shell_script"
}

_init() {
  sudo apt-get purge openjdk-* icedtea-* icedtea6-* || true 
  sudo apt-get update
  sudo apt-get install openjdk-11-jdk
  sudo apt-get install bison g++-multilib git gperf libxml2-utils make zlib1g-dev zip liblz4-tool libncurses5 libssl-dev bc flex curl python-is-python3 ccache

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

  if [ -d ~/dios/.repo ]; then
    rm -r ~/dios/.repo/*
  fi

  if [ -d ~/dios/.git ]; then
    rm -r ~/dios/.git/*
  fi

  repo init -u https://android.googlesource.com/platform/manifest -b android-12.1.0_r5
  cd .repo
  git clone https://github.com/DEV-ICE-TECHNOLOGIES/local_manifests
  cd local_manifests
  git checkout
  cd ../..
  repo sync -j$(nproc) && ./repo_update.sh -j$(nproc)
}

if [ -d dios/dios/ ]; then
    _pick_pr
else
    _init
    _init_gapps
fi

_pick_pr() {
    local _remote=$1
    local _pr_refspec=$2
    local _commits=${3:-1}
    local _max_commits=${4:-$_commits}
    local _excluded_commits=${5:-}
    local _index=$(($_commits - 1))
    local _count=0
    local _current_commit

    git fetch $_remote $_pr_refspec

    while [ $_index -ge 0 -a $_count -lt $_max_commits ]; do
        _current_commit=`git log --pretty=format:%h FETCH_HEAD~$_index|head -1`
        if echo $_excluded_commits | grep $_current_commit; then
            echo "skip commit"
        else
            git cherry-pick --allow-empty -Xtheirs --no-edit FETCH_HEAD~$_index
        fi
        _index=$(($_index - 1))
        _count=$(($_count + 1))
    done
}

_put_gapps_apk() {
    local _apk_name=$1
    local _target_dir=$2
    local _version=`aapt dump badging $APK_DIR/$_apk_name |grep versionCode=|sed "s#.*versionCode='\([[:digit:]]*\).*#\1#1"`
    mkdir -p $_target_dir
    rm $_target_dir/*
    cp $APK_DIR/$_apk_name $_target_dir/$_version.apk
}

_clean()  {
    pushd .repo/manifests
        git clean -d -f
        git checkout .
        git pull
    popd

    pushd .repo/local_manifests
        _local_manifests_branch=$(git symbolic-ref -q HEAD)
        _local_manifests_branch=${_local_manifests_branch##refs/heads/}
        _local_manifests_branch=${_local_manifests_branch:-HEAD}

        git clean -d -f
        git fetch
        git reset --hard origin/$_local_manifests_branch
    popd

    if [ -d kernel/sony/msm-4.9 ]; then
        rm -r kernel/sony/msm-4.9
    fi

    if [ -d kernel/sony/msm-5.4 ]; then
        rm -r kernel/sony/msm-5.4
    fi

    if [ -d hardware/qcom/sm8150 ]; then
        rm -r hardware/qcom/sm8150
    fi

    if [ -d hardware/qcom/sm8250 ]; then
        rm -r hardware/qcom/sm8250
    fi

    if [ -d hardware/qcom/sm8350 ]; then
        rm -r hardware/qcom/sm8350
    fi

    if [ -d dios/dios/ ]; then
        rm -r dios/dios/
    fi

    if [ -h vendor/qcom/opensource/Android.bp ]; then
        rm vendor/qcom/opensource/Android.bp
    fi

    for _path in \
        device/sony/$_platform \
        device/sony/common \
        device/sony/sepolicy \
        vendor/oss/transpower
    do
        if [ -d $_path ]; then
            pushd $_path
                git clean -d -f
                git reset --hard m/$_current_branch
            popd
        fi
    done
}

_init_gapps() {
    if $_exclude_gapps; then
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

_repo_switch() {
    repo sync -j$(nproc) --force-sync
    repo init -b $_new_branch

    if [ "$_keep_local" = "false" ]; then
        pushd .repo/local_manifests
            git checkout $_new_branch
        popd
    fi
}

_repo_update() {
    ./repo_update.sh
}

_post_update() {
    _customize_build
}

_customize_build() {
    mkdir dios/dios
    if ! $_exclude_gapps; then
        cat >dios/dios/dios.mk <<EOF
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

WITH_DEXPREOPT := true

include vendor/gapps/arm64/arm64-vendor.mk

EOF
    fi

    cat >>dios/dios/dios.mk <<EOF
BOARD_USE_ENFORCING_SELINUX := true
EOF
}

_make() {
    if [ -n "$_new_branch" ]; then
        make clean
    else
        make installclean
    fi

    make -j$(nproc)
}

_build() {
    _clean
    _init_gapps
    _repo_update
    _post_update
    _make
}

_switch_branch() {
    _clean
    _init_gapps
    _repo_switch
}

# ----------------------------------------------------------------------
# Main
# ----------------------------------------------------------------------

cd $SOURCE

declare _shell_script=${0##*/}
declare _new_branch=""
declare _keep_local="false"
declare _exclude_gapps="false"

while (( "$#" )); do
    case $1 in
        -b)
            _new_branch=$2
            shift 2
            ;;
        -k|--keep-local)
            _keep_local="true"
            shift
            ;;
        -x|--exclude-gapps)
            _exclude_gapps="true"
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

if [ -z "$_new_branch" -a "$_keep_local" = "true" ]; then
    echo "-k|--keep-local can only be used with -b"
    echo "For help use $_shell_script -h"
fi

set +u # prevent following android calls from failing because of unset variables
. build/envsetup.sh
lunch $LUNCH_CHOICE
declare _device=`get_build_var PRODUCT_DEVICE 2>/dev/null`
declare _platform=`get_build_var PRODUCT_PLATFORM 2>/dev/null`
set -u

_current_branch=`cat .repo/manifests/default.xml|grep default\ revision|sed 's#^.*refs/tags/\(.*\)"#\1#1'`

if [ -n "$_new_branch" ]; then
    _switch_branch
fi

_build
