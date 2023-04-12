#!/usr/bin/env bash -i
##################################
## Copyright © 2023 Marius Kopp ##
##################################

set -eu

source ./ADIOS.cfg

kdialog --title "DIOS A.I. FLASH" --yesno "DO YOU REALLY WANT TO FLASH THE LATEST BUILD FOR $LUNCH_DEVICE OVER ADB?"

if [ $? = 0 ]; then

    export ANDROID_PRODUCT_OUT=$DIOS_FLASH

    ./adb sideload $DIOS_FLASH/$

    sleep 5
    
fi
