#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------
# VARIABLES
# --------------------------------------------------------------------------------------------------

DEVICE=generic_arm64
OUT=~/dios/out/target/product/$DEVICE

read -p "FLASHING TO A 2019 XPERIA?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo ./fastboot flash boot_a $OUT/boot.img
    sudo ./fastboot flash boot_b $OUT/boot.img
    sudo ./fastboot flash dtbo_a $OUT/dtbo.img
    sudo ./fastboot flash dtbo_b $OUT/dtbo.img
    sudo ./fastboot flash system_a $OUT/system.img
    sudo ./fastboot flash system_b $OUT/system.img
    sudo ./fastboot flash userdata $OUT/userdata.img
    sudo ./fastboot flash vbmeta_a $OUT/vbmeta.img
    sudo ./fastboot flash vbmeta_b $OUT/vbmeta.img
    sudo ./fastboot flash vendor_a $OUT/vendor.img
    sudo ./fastboot flash vendor_b $OUT/vendor.img
    sleep 5
    sudo ./fastboot reboot
    exit
fi

read -p "FLASHING TO A 2020 XPERIA?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo ./fastboot flash boot $OUT/boot.img
    sudo ./fastboot flash dtbo $OUT/dtbo.img
    sudo ./fastboot flash recovery $OUT/recovery.img
    sudo ./fastboot flash vbmeta $OUT/vbmeta.img
    sudo ./fastboot flash vendor_boot $OUT/vendor_boot.img
    sudo ./fastboot erase metadata​
    sudo ./fastboot reboot fastboot
    sudo ./fastboot flash product $OUT/product.img
    sudo ./fastboot flash system $OUT/system.img
    sudo ./fastboot flash system_ext $OUT/system_ext.img
    sudo ./fastboot flash userdata $OUT/userdata.img
    sudo ./fastboot flash vbmeta_system $OUT/vbmeta_system.img
    sudo ./fastboot flash vendor $OUT/vendor.img
    sleep 5
    sudo ./fastboot reboot
    exit
fi

read -p "FLASHING TO A 2021 XPERIA?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo ./fastboot flash boot $OUT/boot.img
    sudo ./fastboot flash dtbo $OUT/dtbo.img
    sudo ./fastboot flash recovery $OUT/recovery.img
    sudo ./fastboot flash vbmeta $OUT/vbmeta.img
    sudo ./fastboot flash vendor_boot $OUT/vendor_boot.img
    sudo ./fastboot erase metadata​
    sudo ./fastboot reboot fastboot
    sudo ./fastboot flash product $OUT/product.img
    sudo ./fastboot flash system $OUT/system.img
    sudo ./fastboot flash system_ext $OUT/system_ext.img
    sudo ./fastboot flash userdata $OUT/userdata.img
    sudo ./fastboot flash vbmeta_system $OUT/vbmeta_system.img
    sudo ./fastboot flash vendor $OUT/vendor.img
    sleep 5
    sudo ./fastboot reboot
    exit
fi
