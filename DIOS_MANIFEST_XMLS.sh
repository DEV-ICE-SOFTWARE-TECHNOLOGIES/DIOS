#!/bin/zsh

set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/.repo/local_manifests ]; then
    mkdir -p ~/dios/.repo/local_manifests
fi

echo ""
echo "D!OS MANIFEST XMLS..."
echo ""
cat <<\EOF >../dios/.repo/local_manifests/dios_clean.xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>

    <!-- D!OS -->
    <remove-project name="platform/external/chromium-webview" />
    <remove-project name="platform/packages/apps/Browser2" />
    <remove-project name="platform/packages/apps/Calendar" />
    <remove-project name="platform/packages/apps/Camera2" />
    <remove-project name="platform/packages/apps/Contacts" />
    <remove-project name="platform/packages/apps/DeskClock" />
    <remove-project name="platform/packages/apps/Dialer" />
    <remove-project name="platform/packages/apps/DocumentsUI" />
    <remove-project name="platform/packages/apps/EmergencyInfo" />
    <remove-project name="platform/packages/apps/Gallery" />
    <remove-project name="platform/packages/apps/Gallery2" />
    <remove-project name="platform/packages/apps/Messaging" />
    <remove-project name="platform/packages/apps/Music" />
    <remove-project name="platform/packages/apps/MusicFX" />
    <remove-project name="platform/packages/apps/Launcher3" />
    <remove-project name="platform/packages/apps/Provision" />
    <remove-project name="platform/packages/apps/QuickSearchBox" />
    <remove-project name="platform/packages/apps/SettingsIntelligence" />
    <remove-project name="platform/packages/apps/Stk" />
    <remove-project name="platform/packages/apps/StorageManager" />
    <remove-project name="platform/packages/apps/ThemePicker" />
    <remove-project name="platform/packages/apps/WallpaperPicker" />
    <remove-project name="platform/packages/apps/WallpaperPicker2" />
    <remove-project name="platform/packages/inputmethods/LatinIME" />
    <remove-project name="platform/packages/inputmethods/LeanbackIME" />
	
</manifest>
EOF

cat <<\EOF >../dios/.repo/local_manifests/dios_add.xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<remote name="DIOS" fetch="https://github.com/DEV-ICE-SOFTWARE-TECHNOLOGIES/" />

<project path="device/dios/dios" name="DIOS-ESSENTIALS" groups="device" remote="DIOS" revision="main" />
<project path="device/dios/overlay" name="DIOS-OVERLAY" groups="device" remote="DIOS" revision="main" />
</manifest>
EOF
