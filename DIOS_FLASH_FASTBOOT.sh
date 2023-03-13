#!/usr/bin/env bash

set -euv

# --------------------------------------------------------------------------------------------------
# Copyright (C) 2022 DEV ICE TECHNOLOGIES
# --------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------
# VARIABLES
# --------------------------------------------------------------------------------------------------
DEVICE_2019=j9210
DEVICE_2020=pdx2xx
DEVICE_2021=pdx215
DEVICE_2022=pdx2xx
OUT_2019=~/dios/out/target/product/$DEVICE_2019
OUT_2020=~/dios/out/target/product/$DEVICE_2020
OUT_2021=~/dios/out/target/product/$DEVICE_2021
OUT_2022=~/dios/out/target/product/$DEVICE_2022

read -k 1 "flash19?FLASHING TO A 2019 XPERIA?"
echo
if [[ "$flash19" =~ ^[Yy]$ ]] then
    fastboot flash oem_a oem_kumano.img || true
    fastboot flash oem_b oem_kumano.img || true
    fastboot flash boot_a $OUT_2019/boot.img || true
    fastboot flash boot_b $OUT_2019/boot.img || true
    fastboot flash dtbo_a $OUT_2019/dtbo.img || true
    fastboot flash dtbo_b $OUT_2019/dtbo.img || true
    fastboot flash system_a $OUT_2019/system.img || true
    fastboot flash system_b $OUT_2019/system.img || true
    fastboot flash userdata $OUT_2019/userdata.img || true
    fastboot flash vbmeta_a $OUT_2019/vbmeta.img || true
    fastboot flash vbmeta_b $OUT_2019/vbmeta.img || true
    fastboot flash vendor_a $OUT_2019/vendor.img || true
    fastboot flash vendor_b $OUT_2019/vendor.img || true
    sleep 5
    fastboot reboot
    exit
fi

read -k 1 "flash20?FLASHING TO A 2020 XPERIA?"
echo
if [[ "$flash20" =~ ^[Yy]$ ]] then
    fastboot erase metadata​ || true
    fastboot flash boot_a $OUT_2021/boot.img || true
    fastboot flash boot_b $OUT_2021/boot.img || true
    fastboot flash dtbo_a $OUT_2021/dtbo.img || true
    fastboot flash dtbo_b $OUT_2021/dtbo.img || true
    fastboot flash recovery_a $OUT_2021/recovery.img || true
    fastboot flash recovery_b $OUT_2021/recovery.img || true
    fastboot flash vbmeta_a $OUT_2021/vbmeta.img || true
    fastboot flash vbmeta_b $OUT_2021/vbmeta.img || true
    fastboot flash vendor_boot_a $OUT_2021/vendor_boot.img || true
    fastboot flash vendor_boot_b $OUT_2021/vendor_boot.img || true
    fastboot reboot fastboot
    fastboot erase metadata​ || true
    fastboot flash userdata $OUT_2021/userdata.img || true
    fastboot flash super $OUT_2021/super_empty.img || true
    fastboot flash product_a $OUT_2021/product.img || true
    fastboot flash product_b $OUT_2021/product.img || true
    fastboot flash system_a $OUT_2021/system.img || true
    fastboot flash system_b $OUT_2021/system.img || true
    fastboot flash system_ext_a $OUT_2021/system_ext.img || true
    fastboot flash system_ext_b $OUT_2021/system_ext.img || true
    fastboot flash vbmeta_system_a $OUT_2021/vbmeta_system.img || true
    fastboot flash vbmeta_system_b $OUT_2021/vbmeta_system.img || true
    fastboot flash vendor_a $OUT_2021/vendor.img || true
    fastboot flash vendor_b $OUT_2021/vendor.img || true
    fastboot flash oem_a oem_sagami.img || true
    fastboot flash oem_b oem_sagami.img || true
    sleep 5
    fastboot reboot
    exit
fi

read -k 1 "flash21?FLASHING TO A 2021 XPERIA?"
echo
if [[ "$flash21" =~ ^[Yy]$ ]] then
    fastboot erase metadata​ || true
    fastboot flash boot_a $OUT_2021/boot.img || true
    fastboot flash boot_b $OUT_2021/boot.img || true
    fastboot flash dtbo_a $OUT_2021/dtbo.img || true
    fastboot flash dtbo_b $OUT_2021/dtbo.img || true
    fastboot flash recovery_a $OUT_2021/recovery.img || true
    fastboot flash recovery_b $OUT_2021/recovery.img || true
    fastboot flash vbmeta_a $OUT_2021/vbmeta.img || true
    fastboot flash vbmeta_b $OUT_2021/vbmeta.img || true
    fastboot flash vendor_boot_a $OUT_2021/vendor_boot.img || true
    fastboot flash vendor_boot_b $OUT_2021/vendor_boot.img || true
    fastboot reboot fastboot
    fastboot erase metadata​ || true
    fastboot flash userdata $OUT_2021/userdata.img || true
    fastboot flash super $OUT_2021/super_empty.img || true
    fastboot flash product_a $OUT_2021/product.img || true
    fastboot flash product_b $OUT_2021/product.img || true
    fastboot flash system_a $OUT_2021/system.img || true
    fastboot flash system_b $OUT_2021/system.img || true
    fastboot flash system_ext_a $OUT_2021/system_ext.img || true
    fastboot flash system_ext_b $OUT_2021/system_ext.img || true
    fastboot flash vbmeta_system_a $OUT_2021/vbmeta_system.img || true
    fastboot flash vbmeta_system_b $OUT_2021/vbmeta_system.img || true
    fastboot flash vendor_a $OUT_2021/vendor.img || true
    fastboot flash vendor_b $OUT_2021/vendor.img || true
    fastboot flash oem_a oem_sagami.img || true
    fastboot flash oem_b oem_sagami.img || true
    sleep 5
    fastboot reboot
    exit
fi

read -k 1 "flash22?FLASHING TO A 2022 XPERIA?"
echo
if [[ "$flash21" =~ ^[Yy]$ ]] then
    fastboot erase metadata​ || true
    fastboot flash boot_a $OUT_2021/boot.img || true
    fastboot flash boot_b $OUT_2021/boot.img || true
    fastboot flash dtbo_a $OUT_2021/dtbo.img || true
    fastboot flash dtbo_b $OUT_2021/dtbo.img || true
    fastboot flash recovery_a $OUT_2021/recovery.img || true
    fastboot flash recovery_b $OUT_2021/recovery.img || true
    fastboot flash vbmeta_a $OUT_2021/vbmeta.img || true
    fastboot flash vbmeta_b $OUT_2021/vbmeta.img || true
    fastboot flash vendor_boot_a $OUT_2021/vendor_boot.img || true
    fastboot flash vendor_boot_b $OUT_2021/vendor_boot.img || true
    fastboot reboot fastboot
    fastboot erase metadata​ || true
    fastboot flash userdata $OUT_2021/userdata.img || true
    fastboot flash super $OUT_2021/super_empty.img || true
    fastboot flash product_a $OUT_2021/product.img || true
    fastboot flash product_b $OUT_2021/product.img || true
    fastboot flash system_a $OUT_2021/system.img || true
    fastboot flash system_b $OUT_2021/system.img || true
    fastboot flash system_ext_a $OUT_2021/system_ext.img || true
    fastboot flash system_ext_b $OUT_2021/system_ext.img || true
    fastboot flash vbmeta_system_a $OUT_2021/vbmeta_system.img || true
    fastboot flash vbmeta_system_b $OUT_2021/vbmeta_system.img || true
    fastboot flash vendor_a $OUT_2021/vendor.img || true
    fastboot flash vendor_b $OUT_2021/vendor.img || true
    fastboot flash oem_a oem_sagami.img || true
    fastboot flash oem_b oem_sagami.img || true
    sleep 5
    fastboot reboot
    exit
fi
