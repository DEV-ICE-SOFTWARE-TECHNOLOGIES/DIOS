#!/usr/bin/env bash -i
##################################
## Copyright © 2023 Marius Kopp ##
##################################

set -eu

source ./ADIOS.cfg

kdialog --title "DIOS A.I. FLASH" --yesno "DO YOU REALLY WANT TO FLASH THE LATEST BUILD FOR $LUNCH_DEVICE OVER ADB?"
if [ $? = 0 ]; then
    adb sideload $DIOS_FLASH/$DIOS_FILE
    sleep 5
    exit
fi

FILENAME=aosp_xqbc52-ota-eng.miustone.zip