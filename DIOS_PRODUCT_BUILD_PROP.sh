#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/sony/dios/dios/product/etc ]; then
    mkdir -p ~/dios/device/sony/dios/dios/product/etc
fi

echo ""
echo "D!OS PRODUCT BUILD PROP..."
echo ""
cat <<\EOF >~/dios/device/sony/dios/dios/product/etc/build.prop
# D!OS
ro.postinstall.fstab.prefix=/product
ro.product.product.brand=google
ro.product.product.device=redfin
ro.product.product.manufacturer=Google
ro.product.product.model=Pixel 5
ro.product.product.name=redfin
ro.product.build.date=Tue Feb 22 18:36:04 UTC 2022
ro.product.build.date.utc=1645554964
ro.product.build.fingerprint=google/redfin/redfin:12/SP2A.220405.003/8210211:user/release-keys
ro.product.build.id=SP2A.220405.003
ro.product.build.tags=release-keys
ro.product.build.type=user
ro.product.build.version.incremental=8210211
ro.product.build.version.release=12
ro.product.build.version.release_or_codename=12
ro.product.build.version.sdk=32
EOF
