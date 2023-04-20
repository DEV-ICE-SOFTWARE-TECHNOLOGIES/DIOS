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

sed -i 's/PRODUCT_NAME := aosp_cloudripper/PRODUCT_NAME := cloudripper/g' $DIOS_PATH/device/google/pantah/DIOS_cloudripper.mk
sed -i 's/PRODUCT_MODEL := AOSP on cloudripper/PRODUCT_MODEL := Cloudripper/g' $DIOS_PATH/device/google/pantah/DIOS_cloudripper.mk 
sed -i 's/PRODUCT_BRAND := Android/PRODUCT_BRAND := google/g' $DIOS_PATH/device/google/pantah/DIOS_cloudripper.mk

sed -i 's/PRODUCT_NAME := aosp_ravenclaw/PRODUCT_NAME := ravenclaw/g' $DIOS_PATH/device/google/pantah/DIOS_ravenclaw.mk
sed -i 's/PRODUCT_MODEL := AOSP on Ravenclaw/PRODUCT_MODEL := Ravenclaw/g' $DIOS_PATH/device/google/pantah/DIOS_ravenclaw.mk 
sed -i 's/PRODUCT_BRAND := Android/PRODUCT_BRAND := google/g' $DIOS_PATH/device/google/pantah/DIOS_ravenclaw.mk 

sed -i 's/PRODUCT_NAME := aosp_cheetah/PRODUCT_NAME := cheetah/g' $DIOS_PATH/device/google/pantah/DIOS_cheetah.mk
sed -i 's/PRODUCT_MODEL := AOSP on Cheetah/PRODUCT_MODEL := Pixel 7 Pro/g' $DIOS_PATH/device/google/pantah/DIOS_cheetah.mk 
sed -i 's/PRODUCT_BRAND := Android/PRODUCT_BRAND := google/g' $DIOS_PATH/device/google/pantah/DIOS_cheetah.mk 

sed -i 's/PRODUCT_NAME := aosp_panther/PRODUCT_NAME := panther/g' $DIOS_PATH/device/google/pantah/DIOS_panther.mk
sed -i 's/PRODUCT_MODEL := AOSP on Panther/PRODUCT_MODEL := Pixel 7/g' $DIOS_PATH/device/google/pantah/DIOS_panther.mk 
sed -i 's/PRODUCT_BRAND := Android/PRODUCT_BRAND := google/g' $DIOS_PATH/device/google/pantah/DIOS_panther.mk 