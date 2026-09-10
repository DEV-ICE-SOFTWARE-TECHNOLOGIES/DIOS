#!/usr/bin/env bash

set -eu

DIOS_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ ! -d $DIOS_PATH/.repo/local_manifests ]; then
    mkdir -p $DIOS_PATH/.repo/local_manifests
fi

echo ""
echo "D!OS MANIFEST XMLS..."
echo ""
cat <<\EOF >$DIOS_PATH/.repo/local_manifests/dios_clean.xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>

    <!-- D!OS -->
    <remove-project name="platform/packages/apps/Browser2" />
	
</manifest>
EOF

cat <<\EOF >$DIOS_PATH/.repo/local_manifests/dios_add.xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<remote name="DIOS" fetch="https://github.com/DEV-ICE-SOFTWARE-TECHNOLOGIES/" />

<project path="vendor/dios/DIOS" name="DIOS_ESSENTIALS" groups="vendor" remote="DIOS" revision="main" />
<project path="vendor/dios/OVERLAY" name="DIOS_OVERLAY" groups="vendor" remote="DIOS" revision="main" />
</manifest>

EOF
