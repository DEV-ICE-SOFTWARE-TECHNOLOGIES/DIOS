#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/generic/goldfish ]; then
    mkdir -p ~/dios/device/generic/goldfish
fi

echo ""
echo "D!OS ANDROID MK..."
echo ""
cat <<\EOF >~/dios/device/generic/goldfish/Android.mk
LOCAL_PATH := $(call my-dir)

ifeq ($(BUILD_QEMU_IMAGES),true)
  QEMU_CUSTOMIZATIONS := true
endif

ifeq ($(QEMU_CUSTOMIZATIONS),true)
  INSTALLED_EMULATOR_INFO_TXT_TARGET := $(PRODUCT_OUT)/emulator-info.txt
  emulator_info_txt := $(wildcard ${LOCAL_PATH}/emulator-info.txt)

  $(INSTALLED_EMULATOR_INFO_TXT_TARGET): $(emulator_info_txt)
	$(call pretty,"Generated: ($@)")
	$(hide) grep -v '#' $< > $@

  $(call dist-for-goals, dist_files, $(INSTALLED_EMULATOR_INFO_TXT_TARGET))
  $(call dist-for-goals, sdk, $(INSTALLED_EMULATOR_INFO_TXT_TARGET))

  subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
  $(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

  include device/generic/goldfish/tasks/emu_img_zip.mk
endif

include $(CLEAR_VARS)

$(shell cp -rf $(LOCAL_PATH)/ACDB/acdbdata/* `pwd`/$(TARGET_OUT_VENDOR)/etc/acdbdata)
$(shell cp -rf $(LOCAL_PATH)/dios/product/* `pwd`/$(TARGET_OUT_PRODUCT)/)
$(shell cp -rf $(LOCAL_PATH)/dios/system_ext/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
$(shell cp -rf $(LOCAL_PATH)/dios/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
$(shell cp -rf $(LOCAL_PATH)/dios/vendor/* `pwd`/$(TARGET_OUT_VENDOR)/)
$(shell cp -rf $(LOCAL_PATH)/fork/pixel/product/* `pwd`/$(TARGET_OUT_PRODUCT)/)
$(shell cp -rf $(LOCAL_PATH)/fork/pixel/system_ext/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
$(shell cp -rfn $(LOCAL_PATH)/fork/pixel/system/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
$(shell cp -rf $(LOCAL_PATH)/fork/pixel/vendor/* `pwd`/$(TARGET_OUT_VENDOR)/)
$(shell cp -rf $(LOCAL_PATH)/fork/xperia/product_a/* `pwd`/$(TARGET_OUT_PRODUCT)/)
$(shell cp -rfn $(LOCAL_PATH)/fork/xperia/system_a/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
$(shell cp -rfn $(LOCAL_PATH)/fork/xperia/system_b/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
$(shell cp -rf $(LOCAL_PATH)/fork/xperia/system_ext_a/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
$(shell cp -rf $(LOCAL_PATH)/fork/xperia/vendor_a/* `pwd`/$(TARGET_OUT_VENDOR)/)

EOF
