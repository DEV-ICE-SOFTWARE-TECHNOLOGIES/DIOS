#!/bin/zsh

set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/dios/dios/system_ext/etc ]; then
    mkdir -p ~/dios/device/dios/dios/system_ext/etc
fi

echo ""
echo "D!OS SYSTEM_EXT BUILD PROP..."
echo ""
cat <<\EOF >~/dios/device/dios/dios/system_ext/etc/build.prop
# D!OS
ro.product.system_ext.brand=google
ro.product.system_ext.device=coral
ro.product.system_ext.manufacturer=Google
ro.product.system_ext.model=Pixel 4 XL
ro.product.system_ext.name=coral
ro.system_ext.build.date=Sat Feb 12 06:13:57 UTC 2022
ro.system_ext.build.date.utc=1644646437
ro.system_ext.build.fingerprint=google/coral/coral:12/SP2A.220305.012/8177914:user/release-keys
ro.system_ext.build.id=SP2A.220305.012
ro.system_ext.build.tags=release-keys
ro.system_ext.build.type=user
ro.system_ext.build.version.incremental=8177914
ro.system_ext.build.version.release=12
ro.system_ext.build.version.release_or_codename=12
ro.system_ext.build.version.sdk=32
EOF
