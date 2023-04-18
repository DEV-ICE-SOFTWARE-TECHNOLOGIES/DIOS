#!/usr/bin/env bash -i
##################################
## Copyright © 2023 Marius Kopp ##
##################################

set -eu

source ./ADIOS.cfg

if ! grep -qxF '# DIOS' $DIOS_PATH/device/google/gs-common/device.mk; then

sed -i '/^#/d' $DIOS_PATH/device/google/gs-common/device.mk

    sed -i '1i\
##################################\
## Copyright © '"${YEAR}"' '"${AUTHOR}"' ##\
##################################\
' $DIOS_PATH/device/google/gs-common/device.mk

    echo '' >>$DIOS_PATH/device/google/gs-common/device.mk
    echo '# DIOS' >>$DIOS_PATH/device/google/gs-common/device.mk
    echo '$(call inherit-product-if-exists, vendor/dios/DIOS.mk)' >>$DIOS_PATH/device/google/gs-common/device.mk
fi

sed -i '/^#/d' $DIOS_PATH/device/google/pantah/AndroidProducts.mk

    sed -i '1i\
##################################\
## Copyright © '"${YEAR}"' '"${AUTHOR}"' ##\
##################################\
' $DIOS_PATH/device/google/pantah/AndroidProducts.mk


# Pantah DIOS Device Names
sed -i 's/aosp/DIOS/g' $DIOS_PATH/device/google/pantah/AndroidProducts.mk

mv $DIOS_PATH/device/google/pantah/aosp_cloudripper.mk $DIOS_PATH/device/google/pantah/DIOS_cloudripper.mk || true

mv $DIOS_PATH/device/google/pantah/aosp_ravenclaw.mk $DIOS_PATH/device/google/pantah/DIOS_ravenclaw.mk || true

mv $DIOS_PATH/device/google/pantah/aosp_cheetah.mk $DIOS_PATH/device/google/pantah/DIOS_cheetah.mk || true

mv $DIOS_PATH/device/google/pantah/aosp_panther.mk $DIOS_PATH/device/google/pantah/DIOS_panther.mk || true
