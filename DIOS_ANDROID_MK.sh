#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
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
$(shell cp -rf $(LOCAL_PATH)/ACDB/acdbdata/* `pwd`/$(TARGET_OUT_VENDOR)/etc/acdbdata)
$(shell cp -rf $(LOCAL_PATH)/dios/product/* `pwd`/$(TARGET_OUT_PRODUCT)/)
$(shell cp -rf $(LOCAL_PATH)/dios/system_ext/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
$(shell cp -rf $(LOCAL_PATH)/dios/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
$(shell cp -rf $(LOCAL_PATH)/dios/vendor/* `pwd`/$(TARGET_OUT_VENDOR)/)
$(shell cp -rf $(LOCAL_PATH)/fork/product/* `pwd`/$(TARGET_OUT_PRODUCT)/)
$(shell cp -rf $(LOCAL_PATH)/fork/system_ext/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
$(shell cp -rf $(LOCAL_PATH)/fork/system/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
$(shell cp -rf $(LOCAL_PATH)/fork/vendor/* `pwd`/$(TARGET_OUT_VENDOR)/)
EOF
