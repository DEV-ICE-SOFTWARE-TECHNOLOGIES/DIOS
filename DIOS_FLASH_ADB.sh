#!/usr/bin/env bash

set -euv

# --------------------------------------------------------------------------------------------------
# Copyright (C) 2022 DEV ICE TECHNOLOGIES
# --------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------
# VARIABLES
# --------------------------------------------------------------------------------------------------

DEVICE=pdx215
OUT=~/dios/out/target/product/$DEVICE
FILENAME=aosp_xqbc52-ota-eng.miustone.zip

read -p "FLASHING THE OTA?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    adb sideload $OUT/$FILENAME
    sleep 5
    exit
fi

