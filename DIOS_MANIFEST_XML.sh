#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/.repo/local_manifests ]; then
    mkdir -p ~/dios/.repo/local_manifests
fi

echo ""
echo "D!OS MANIFEST XML..."
echo ""
cat <<\EOF >../dios/.repo/local_manifests/dios.xml
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
