#!/usr/bin/env bash -i
##################################
## Copyright © 2023 Marius Kopp ##
##################################

set -eu

source ./ADIOS.cfg

DOWNLOAD_DIR=~/dios/vendor/dios/DIOS/product/app/OpenCamera
APP_NAME=opencamera/files/v_1_51_1/OpenCamera.apk
APP_FILE=$DOWNLOAD_DIR/$APP_NAME

echo ""
echo "D!OS OPEN CAMERA FORK..."
echo ""

rm -rf $DOWNLOAD_DIR || true

if [ ! -d $DOWNLOAD_DIR ]; then
    mkdir -p $DOWNLOAD_DIR
fi

if [ ! -f $APP_FILE ]; then
    pushd $DOWNLOAD_DIR
    wget https://sourceforge.net/projects/$APP_NAME
    popd
fi

wait

