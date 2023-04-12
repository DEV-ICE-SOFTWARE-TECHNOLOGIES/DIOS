#!/usr/bin/env bash -i
##################################
## Copyright © 2023 Marius Kopp ##
##################################

set -eu

source ./ADIOS.cfg

if [ ! -d $DIOS_FOLDER ]; then
    mkdir -p $DIOS_FOLDER
fi

echo ""
echo "D!OS ANDROID MK..."
echo ""
cat <<\EOF >$DIOS_FOLDER/Android.mk
##################################
## Copyright © 2023 Marius Kopp ##
##################################
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

$(shell cp -rfp $(LOCAL_PATH)/DIOS/product/* `pwd`/$(TARGET_OUT_PRODUCT)/)
#$(shell cp -rfp $(LOCAL_PATH)/DIOS/system_ext/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
$(shell cp -rfp $(LOCAL_PATH)/DIOS/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
$(shell cp -rfp $(LOCAL_PATH)/DIOS/vendor/* `pwd`/$(TARGET_OUT_VENDOR)/)
#$(shell cp -rfn $(LOCAL_PATH)/FORK/pixel/product/* `pwd`/$(TARGET_OUT_PRODUCT)/)
$(shell cp -rfn $(LOCAL_PATH)/FORK/pixel/system_ext/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
#$(shell cp -rfn $(LOCAL_PATH)/FORK/pixel/system/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
#$(shell cp -rfn $(LOCAL_PATH)/FORK/pixel/vendor/* `pwd`/$(TARGET_OUT_VENDOR)/)
#$(shell cp -rfn $(LOCAL_PATH)/FORK/xperia/product_a/* `pwd`/$(TARGET_OUT_PRODUCT)/)
#$(shell cp -rfn $(LOCAL_PATH)/FORK/xperia/system_a/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
#$(shell cp -rfn $(LOCAL_PATH)/FORK/xperia/system_b/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
#$(shell cp -rfn $(LOCAL_PATH)/FORK/xperia/system_ext_a/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
#$(shell cp -rfn $(LOCAL_PATH)/FORK/xperia/vendor_a/* `pwd`/$(TARGET_OUT_VENDOR)/)
    
EOF

