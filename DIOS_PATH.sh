#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/sony/customization ]; then
    mkdir -p ~/dios/device/sony/customization
fi

echo ""
echo "CREATING DIOS PATH..."
echo ""
cat <<\EOF >~/dios/device/sony/customization/customization.mk

DIOS_PATH := device/sony/dios
$(call inherit-product-if-exists, $(DIOS_PATH)/dios.mk)
EOF
