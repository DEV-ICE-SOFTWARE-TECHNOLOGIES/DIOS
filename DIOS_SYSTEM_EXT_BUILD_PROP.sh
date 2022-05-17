#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/sony/dios/dios/system_ext/etc ]; then
    mkdir -p ~/dios/device/sony/dios/dios/system_ext/etc
fi

echo ""
echo "D!OS SYSTEM_EXT BUILD PROP..."
echo ""
cat <<\EOF >~/dios/device/sony/dios/dios/system_ext/etc/build.prop
# D!OS
ro.product.system_ext.brand=google
ro.product.system_ext.device=redfin
ro.product.system_ext.manufacturer=Google
ro.product.system_ext.model=Pixel 5
ro.product.system_ext.name=redfin
ro.system_ext.build.date=Tue Feb 22 18:36:04 UTC 2022
ro.system_ext.build.date.utc=1645554964
ro.system_ext.build.fingerprint=google/redfin/redfin:12/SP2A.220405.003/8210211:user/release-keys
ro.system_ext.build.id=SP2A.220405.003
ro.system_ext.build.tags=release-keys
ro.system_ext.build.type=user
ro.system_ext.build.version.incremental=8210211
ro.system_ext.build.version.release=12
ro.system_ext.build.version.release_or_codename=12
ro.system_ext.build.version.sdk=32
EOF
