#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/sony/common ]; then
    mkdir -p ~/dios/device/sony/common
fi

echo ""
echo "D!OS COMMON PROPS MK..."
echo ""
cat <<\EOF >~/dios/device/sony/common/common-prop.mk
# configure adb over wifi only on the eng build
ifneq (,$(filter eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PROPERTY_OVERRIDES += \
    service.adb.tcp.port=5555
endif

# Common property setup DS or SS devices.
ifeq ($(PRODUCT_DEVICE_DS),true)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.multisim.config=dsds
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=9
endif

# Disable Compressed APEX on 4.14 kernel as Android 12 enforces it and our kernel is not compatible (yet)
ifeq ($(SOMC_KERNEL_VERSION), 4.14)
OVERRIDE_PRODUCT_COMPRESSED_APEX := false
endif
EOF
