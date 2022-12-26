#!/bin/zsh

set -eu

# --------------------------------------------------------------------------------------------------
# Copyright (C) 2022 DEV ICE TECHNOLOGIES
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/dios ]; then
    mkdir -p ~/dios/device/dios
fi

echo ""
echo "D!OS ANDROID BP..."
echo ""
cat <<\EOF >~/dios/device/dios/Android.bp
/*
 * Copyright (C) 2022 DEV ICE TECHNOLOGIES
 */

android_app_import {
	name: "SettingsGoogle.apk",
	owner: "dios",
	apk: "fork/pixel/system_ext/priv-app/SettingsGoogle/SettingsGoogle.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "NexusLauncherRelease.apk",
	owner: "dios",
	apk: "fork/pixel/system_ext/priv-app/NexusLauncherRelease/NexusLauncherRelease.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "PrebuiltGmsCoreSc.apk",
	owner: "dios",
	apk: "fork/pixel/product/priv-app/PrebuiltGmsCore/PrebuiltGmsCoreSc.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "GoogleCamera.apk",
	owner: "dios",
	apk: "fork/pixel/product/app/GoogleCamera/GoogleCamera.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "AmbientSensePrebuilt.apk",
	owner: "dios",
	apk: "fork/pixel/product/priv-app/AmbientSensePrebuilt/AmbientSensePrebuilt.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "Phonesky",
	owner: "dios",
	apk: "fork/pixel/product/priv-app/Phonesky/Phonesky.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "MarkupGoogle",
	owner: "dios",
	apk: "fork/pixel/product/app/MarkupGoogle/MarkupGoogle.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "talkback",
	owner: "dios",
	apk: "fork/pixel/product/app/talkback/talkback.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "Velvet",
	owner: "dios",
	apk: "fork/pixel/product/priv-app/Velvet/Velvet.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "PixelSetupWizard",
	owner: "dios",
	apk: "fork/pixel/system_ext/priv-app/PixelSetupWizard/PixelSetupWizard.apk",
	overrides: ["Provision"],
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	system_ext_specific: true,
}

EOF