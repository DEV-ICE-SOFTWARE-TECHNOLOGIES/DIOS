#!/bin/zsh

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
ro.product.product.device=coral
ro.product.product.manufacturer=Google
ro.product.product.model=Pixel 4 XL
ro.product.product.name=coral
ro.product.build.date=Sat Feb 12 06:13:57 UTC 2022
ro.product.build.date.utc=1644646437
ro.product.build.fingerprint=google/coral/coral:12/SP2A.220305.012/8177914:user/release-keys
ro.product.build.id=SP2A.220305.012
ro.product.build.tags=release-keys
ro.product.build.type=user
ro.product.build.version.incremental=8177914
ro.product.build.version.release=12
ro.product.build.version.release_or_codename=12
ro.product.build.version.sdk=32
EOF
