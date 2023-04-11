#!/usr/bin/env bash -i
##################################
## Copyright © 2023 Marius Kopp ##
##################################

set -eu

source ./ADIOS.cfg

if [ ! -d $DIOS_FOLDER ]; then
    mkdir -p $DIOS_FOLDER
fi

echo ""
echo "D!OS ANDROID BP..."
echo ""
cat <<\EOF >$DIOS_FOLDER/Android.bp
/*
 * Copyright (C) 2023 Marius Kopp
 */

android_app_import {
	name: "SettingsGoogle.apk",
	owner: "dios",
	apk: "FORK/pixel/system_ext/priv-app/SettingsGoogle/SettingsGoogle.apk",
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
	apk: "FORK/pixel/system_ext/priv-app/NexusLauncherRelease/NexusLauncherRelease.apk",
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
	apk: "FORK/pixel/product/priv-app/PrebuiltGmsCore/PrebuiltGmsCoreSc.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "PixelCameraServicesC10.apk",
	owner: "dios",
	apk: "FORK/pixel/product/app/PixelCameraServicesC10/PixelCameraServicesC10.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "AmbientStreaming.apk",
	owner: "dios",
	apk: "FORK/pixel/product/priv-app/AmbientStreaming/AmbientStreaming.apk",
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
	apk: "FORK/pixel/product/priv-app/Phonesky/Phonesky.apk",
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
	apk: "FORK/pixel/product/app/MarkupGoogle/MarkupGoogle.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "talkback",
	owner: "dios",
	apk: "FORK/pixel/product/app/talkback/talkback.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "Velvet",
	owner: "dios",
	apk: "FORK/pixel/product/priv-app/Velvet/Velvet.apk",
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
	apk: "FORK/pixel/system_ext/priv-app/PixelSetupWizard/PixelSetupWizard.apk",
	overrides: ["Provision"],
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	system_ext_specific: true,
}

EOF