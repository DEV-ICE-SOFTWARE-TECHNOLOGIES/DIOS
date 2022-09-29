#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright (C) 2022 DEV ICE TECHNOLOGIES
# --------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------
# VARIABLES
# --------------------------------------------------------------------------------------------------
DEVICE_2019=bahamut
DEVICE_2020=keineahnung
DEVICE_2021=pdx215
OUT_2019=~/dios/out/target/product/$DEVICE_2019
OUT_2020=~/dios/out/target/product/$DEVICE_2020
OUT_2021=~/dios/out/target/product/$DEVICE_2021

read -p "FLASHING TO A 2019 XPERIA?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./fastboot flash oem_a oem_kumano.img
    ./fastboot flash oem_b oem_kumano.img
    ./fastboot flash boot_a $OUT_2019/boot.img
    ./fastboot flash boot_b $OUT_2019/boot.img
    ./fastboot flash dtbo_a $OUT_2019/dtbo.img
    ./fastboot flash dtbo_b $OUT_2019/dtbo.img
    ./fastboot flash system_a $OUT_2019/system.img
    ./fastboot flash system_b $OUT_2019/system.img
    ./fastboot flash userdata $OUT_2019/userdata.img
    ./fastboot flash vbmeta_a $OUT_2019/vbmeta.img
    ./fastboot flash vbmeta_b $OUT_2019/vbmeta.img
    ./fastboot flash vendor_a $OUT_2019/vendor.img
    ./fastboot flash vendor_b $OUT_2019/vendor.img
    sleep 5
    ./fastboot reboot
    exit
fi

read -p "FLASHING TO A 2020 XPERIA?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./fastboot flash oem_a oem_edo.img
    ./fastboot flash oem_b oem_edo.img
    ./fastboot flash boot_a $OUT_2020/boot.img
    ./fastboot flash boot_b $OUT_2020/boot.img
    ./fastboot flash dtbo_a $OUT_2020/dtbo.img
    ./fastboot flash dtbo_b $OUT_2020/dtbo.img
    ./fastboot flash recovery_a $OUT_2020/recovery.img
    ./fastboot flash recovery_b $OUT_2020/recovery.img
    ./fastboot flash vbmeta_a $OUT_2020/vbmeta.img
    ./fastboot flash vbmeta_b $OUT_2020/vbmeta.img
    ./fastboot flash vendor_boot_a $OUT_2020/vendor_boot.img
    ./fastboot flash vendor_boot_b $OUT_2020/vendor_boot.img
    ./fastboot erase metadata​
    ./fastboot reboot bootloader
    ./fastboot flash super $OUT_2020/super_empty.img
    ./fastboot flash userdata $OUT_2020/userdata.img
    ./fastboot flash product_a $OUT_2020/product.img
    ./fastboot flash product_b $OUT_2020/product.img
    ./fastboot flash system_a $OUT_2020/system.img
    ./fastboot flash system_b $OUT_2020/system.img
    ./fastboot flash system_ext_a $OUT_2020/system_ext.img
    ./fastboot flash system_ext_b $OUT_2020/system_ext.img
    ./fastboot flash vbmeta_system_a $OUT_2020/vbmeta_system.img
    ./fastboot flash vbmeta_system_b $OUT_2020/vbmeta_system.img
    ./fastboot flash vendor_a $OUT_2020/vendor.img
    ./fastboot flash vendor_b $OUT_2020/vendor.img
    sleep 5
    ./fastboot reboot
    exit
fi

read -p "FLASHING TO A 2021 XPERIA?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./fastboot flash userdata $OUT_2021/userdata.img
    ./fastboot flash super $OUT_2021/super_empty.img
    ./fastboot flash product_a $OUT_2021/product.img
    #./fastboot flash product_b $OUT_2021/product.img
    ./fastboot flash system_a $OUT_2021/system.img
    #./fastboot flash system_b $OUT_2021/system.img
    ./fastboot flash system_ext_a $OUT_2021/system_ext.img
    #./fastboot flash system_ext_b $OUT_2021/system_ext.img
    ./fastboot flash vbmeta_system_a $OUT_2021/vbmeta_system.img
    #./fastboot flash vbmeta_system_b $OUT_2021/vbmeta_system.img
    ./fastboot flash vendor_a $OUT_2021/vendor.img
    #./fastboot flash vendor_b $OUT_2021/vendor.img
    ./fastboot flash oem_a oem_sagami_preview.img
    ./fastboot flash oem_b oem_sagami_preview.img
    ./fastboot reboot bootloader
    ./fastboot flash boot_a $OUT_2021/boot.img
    ./fastboot flash boot_b $OUT_2021/boot.img
    ./fastboot flash dtbo_a $OUT_2021/dtbo.img
    ./fastboot flash dtbo_b $OUT_2021/dtbo.img
    ./fastboot flash recovery_a $OUT_2021/recovery.img || true
    ./fastboot flash recovery_b $OUT_2021/recovery.img || true
    ./fastboot flash vbmeta_a $OUT_2021/vbmeta.img
    ./fastboot flash vbmeta_b $OUT_2021/vbmeta.img
    ./fastboot flash vendor_boot_a $OUT_2021/vendor_boot.img
    ./fastboot flash vendor_boot_b $OUT_2021/vendor_boot.img
    sleep 5
    ./fastboot reboot
    exit
fi
