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
echo "D!OS DIOS MK..."
echo ""
cat <<\EOF >$DIOS_FOLDER/DIOS.mk
##################################
## Copyright © 2023 Marius Kopp ##
##################################
LOCAL_PRODUCT_MODULE := true

PRODUCT_SOONG_NAMESPACES += \
	vendor/dios

DEXPREOPT_GENERATE_APEX_IMAGE := true
DONT_DEXPREOPT_PREBUILTS := false
TARGET_INCLUDE_WIFI_EXT := true
TARGET_FACE_UNLOCK_SUPPORTED := true
WITH_DEXPREOPT := true

PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUIGoogle \
    NexusLauncherRelease
    
PRODUCT_PROPERTY_OVERRIDES += \
    ro.control_privapp_permissions=log
    
EOF
