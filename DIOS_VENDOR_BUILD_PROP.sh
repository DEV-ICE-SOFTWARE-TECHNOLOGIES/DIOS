#!/bin/zsh

set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/sony/dios/dios/vendor ]; then
    mkdir -p ~/dios/device/sony/dios/dios/vendor
fi

echo ""
echo "D!OS VENDOR BUILD PROP..."
echo ""
cat <<\EOF >~/dios/device/sony/dios/dios/vendor/dios.prop
# D!OS
ro.product.vendor.brand=google
ro.product.vendor.device=coral
ro.product.vendor.manufacturer=Google
ro.product.vendor.model=Pixel 4 XL
ro.product.vendor.name=coral
ro.vendor.build.date=Sat Feb 12 06:13:57 UTC 2022
ro.vendor.build.date.utc=1644646437
ro.vendor.build.fingerprint=google/coral/coral:12/SP2A.220305.012/8177914:user/release-keys
ro.vendor.build.id=SP2A.220305.012
ro.vendor.build.tags=release-keys
ro.vendor.build.type=user
ro.vendor.build.version.incremental=8177914
ro.vendor.build.version.release=12
ro.vendor.build.version.release_or_codename=12
ro.vendor.build.version.sdk=32
EOF
