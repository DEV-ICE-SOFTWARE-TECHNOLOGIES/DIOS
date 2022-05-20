#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/sony/dios/dios/system ]; then
    mkdir -p ~/dios/device/sony/dios/dios/system
fi

echo ""
echo "D!OS SYSTEM BUILD PROP..."
echo ""
cat <<\EOF >~/dios/device/sony/dios/dios/system/dios.prop
# D!OS
ro.product.system.brand=google
ro.product.system.device=generic
ro.product.system.manufacturer=Google
ro.product.system.model=mainline
ro.product.system.name=mainline
ro.system.build.date=Sat Feb 12 06:13:57 UTC 2022
ro.system.build.date.utc=1644646437
ro.system.build.fingerprint=google/coral/coral:12/SP2A.220305.012/8177914:user/release-keys
ro.system.build.id=SP2A.220305.012
ro.system.build.tags=release-keys
ro.system.build.type=user
ro.system.build.version.incremental=8177914
ro.system.build.version.release=12
ro.system.build.version.release_or_codename=12
ro.system.build.version.sdk=32
EOF
