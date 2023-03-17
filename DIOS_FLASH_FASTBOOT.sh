#!/usr/bin/env bash -i
##################################
## Copyright © 2023 Marius Kopp ##
##################################

set -eu

source ./ADIOS.cfg

kdialog --title "DIOS A.I. FLASH" --yesno "DO YOU REALLY WANT TO FLASH THE LATEST BUILD FOR $LUNCH_DEVICE OVER FASTBOOT?"
if [ $? = 0 ]; then
    pushd $DIOS_FLASH
    fastboot -w flashall || true
    sleep 5
    fastboot reboot
    popd >/dev/null
    exit
fi
