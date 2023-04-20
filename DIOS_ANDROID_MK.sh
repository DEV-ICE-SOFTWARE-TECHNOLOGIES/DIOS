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

# DIOS FILES
$(shell cp -rfp $(LOCAL_PATH)/DIOS/product/* `pwd`/$(TARGET_OUT_PRODUCT)/)
#$(shell cp -rfp $(LOCAL_PATH)/DIOS/system_ext/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
$(shell cp -rfp $(LOCAL_PATH)/DIOS/system/* `pwd`/$(TARGET_OUT)/)
$(shell cp -rfp $(LOCAL_PATH)/DIOS/vendor/* `pwd`/$(TARGET_OUT_VENDOR)/)

# PIXEL PRODUCT FILES
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/app/Chrome `pwd`/$(TARGET_OUT_PRODUCT)/app)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/app/TrichromeLibrary `pwd`/$(TARGET_OUT_PRODUCT)/app)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/app/WebViewGoogle `pwd`/$(TARGET_OUT_PRODUCT)/app)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/etc/ambient `pwd`/$(TARGET_OUT_PRODUCT)/etc)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/etc/CarrierSettings `pwd`/$(TARGET_OUT_PRODUCT)/etc)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/etc/default-permissions `pwd`/$(TARGET_OUT_PRODUCT)/etc)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/etc/felica `pwd`/$(TARGET_OUT_PRODUCT)/etc/felica)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/etc/firmware `pwd`/$(TARGET_OUT_PRODUCT)/etc/firmware)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/etc/fonts_customization.xml `pwd`/$(TARGET_OUT_PRODUCT)/etc)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/etc/permissions `pwd`/$(TARGET_OUT_PRODUCT)/etc)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/etc/preferred-apps `pwd`/$(TARGET_OUT_PRODUCT)/etc)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/etc/security `pwd`/$(TARGET_OUT_PRODUCT)/etc)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/etc/sysconfig `pwd`/$(TARGET_OUT_PRODUCT)/etc)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/overlay/ClearCallingSettingsOverlay2022.apk `pwd`/$(TARGET_OUT_PRODUCT)/overlay)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/overlay/EuiccSupportPixelOverlay `pwd`/$(TARGET_OUT_PRODUCT)/overlay/EuiccSupportPixelOverlay)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/overlay/GoogleWebViewOverlay.apk `pwd`/$(TARGET_OUT_PRODUCT)/overlay)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/overlay/PixelConfigOverlay2018.apk `pwd`/$(TARGET_OUT_PRODUCT)/overlay)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/overlay/PixelConfigOverlay2019.apk `pwd`/$(TARGET_OUT_PRODUCT)/overlay)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/overlay/PixelConfigOverlay2019Midyear.apk `pwd`/$(TARGET_OUT_PRODUCT)/overlay)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/overlay/PixelConfigOverlay2021.apk `pwd`/$(TARGET_OUT_PRODUCT)/overlay)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/overlay/PixelDocumentsUIGoogleOverlay `pwd`/$(TARGET_OUT_PRODUCT)/overlay/PixelDocumentsUIGoogleOverlay)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/overlay/PixelSetupWizard__auto_generated_rro_product.apk `pwd`/$(TARGET_OUT_PRODUCT)/overlay)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/overlay/PixelSetupWizardOverlay.apk `pwd`/$(TARGET_OUT_PRODUCT)/overlay)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/overlay/PixelSetupWizardOverlay2019.apk `pwd`/$(TARGET_OUT_PRODUCT)/overlay)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/overlay/PixelSetupWizardOverlay2021.apk `pwd`/$(TARGET_OUT_PRODUCT)/overlay)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/overlay/SystemUIGXOverlay.apk `pwd`/$(TARGET_OUT_PRODUCT)/overlay)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/priv-app/PrebuiltGmsCore `pwd`/$(TARGET_OUT_PRODUCT)/priv-app)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/product/usr `pwd`/$(TARGET_OUT_PRODUCT)/usr)

# PIXEL SYSTEM EXT FILES
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/system_ext/etc/permissions `pwd`/$(TARGET_OUT_SYSTEM_EXT)/etc)

# PIXEL SYSTEM FILES
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/system/system/etc/permissions `pwd`/$(TARGET_OUT)/etc)

# PIXEL VENDOR FILES
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/vendor/etc/permissions `pwd`/$(TARGET_OUT_VENDOR)/etc)
$(shell cp -rfp $(LOCAL_PATH)/FORK/PIXEL/vendor/overlay `pwd`/$(TARGET_OUT_VENDOR)/)
    
EOF

