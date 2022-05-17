#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/.repo/local_manifests ]; then
    mkdir -p ~/dios/.repo/local_manifests
fi

echo ""
echo "ADDING GAPPS..."
echo ""
cat <<\EOF >~/dios/.repo/local_manifests/gapps.xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<remote name="MindTheGapps" fetch="https://gitlab.com/MindTheGapps/" />
<project path="vendor/gapps" name="vendor_gapps" remote="MindTheGapps" revision="sigma" />
</manifest>
EOF
