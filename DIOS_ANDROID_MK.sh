#!/bin/zsh

set -eu

# --------------------------------------------------------------------------------------------------
# Copyright (C) 2022 DEV ICE TECHNOLOGIES
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/sony/dios ]; then
    mkdir -p ~/dios/device/sony/dios
fi

echo ""
echo "D!OS ANDROID MK..."
echo ""
cat <<\EOF >~/dios/device/sony/dios/Android.mk
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

$(shell cp -rfn $(LOCAL_PATH)/dios/product/* `pwd`/$(TARGET_OUT_PRODUCT)/)
$(shell cp -rfn $(LOCAL_PATH)/dios/system_ext/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
$(shell cp -rfn $(LOCAL_PATH)/dios/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
$(shell cp -rfn $(LOCAL_PATH)/dios/vendor/* `pwd`/$(TARGET_OUT_VENDOR)/)
$(shell cp -rfn $(LOCAL_PATH)/fork/pixel/product/* `pwd`/$(TARGET_OUT_PRODUCT)/)
$(shell cp -rfn $(LOCAL_PATH)/fork/pixel/system_ext/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
$(shell cp -rfn $(LOCAL_PATH)/fork/pixel/system/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
$(shell cp -rfn $(LOCAL_PATH)/fork/pixel/vendor/* `pwd`/$(TARGET_OUT_VENDOR)/)
$(shell cp -rfn $(LOCAL_PATH)/fork/xperia/product_a/* `pwd`/$(TARGET_OUT_PRODUCT)/)
$(shell cp -rfn $(LOCAL_PATH)/fork/xperia/system_a/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
$(shell cp -rfn $(LOCAL_PATH)/fork/xperia/system_b/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
$(shell cp -rfn $(LOCAL_PATH)/fork/xperia/system_ext_a/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
$(shell cp -rfn $(LOCAL_PATH)/fork/xperia/vendor_a/* `pwd`/$(TARGET_OUT_VENDOR)/)

EOF
