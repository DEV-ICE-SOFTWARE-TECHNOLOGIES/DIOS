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

prebuilt_etc {
    name: "com.google.android.dialer.support",
    product_specific: true,
    sub_dir: "permissions",
    src: "FORK/pixel/product/etc/permissions/com.google.android.dialer.support.xml",
    filename_from_src: true,
}

prebuilt_etc {
    name: "com.google.android.apps.dreamliner",
    product_specific: true,
    sub_dir: "permissions",
    src: "FORK/pixel/product/etc/permissions/com.google.android.apps.dreamliner.xml",
    filename_from_src: true,
}


prebuilt_etc {
    name: "matcher_tah",
    product_specific: true,
    sub_dir: "ambient",
    src: "FORK/pixel/product/etc/ambient/matcher_tah.leveldb",
    filename_from_src: true,
}

prebuilt_etc {
    name: "privapp-permissions-google-p",
    product_specific: true,
    sub_dir: "permissions",
    src: "FORK/pixel/product/etc/permissions/privapp-permissions-google-p.xml",
    filename_from_src: true,
}

prebuilt_etc {
    name: "split-permissions-google",
    product_specific: true,
    sub_dir: "permissions",
    src: "FORK/pixel/product/etc/permissions/split-permissions-google.xml",
    filename_from_src: true,
}

prebuilt_etc {
    name: "privapp-permissions-google-se",
    system_ext_specific: true,
    sub_dir: "permissions",
    src: "FORK/pixel/system_ext/etc/permissions/privapp-permissions-google-se.xml",
    filename_from_src: true,
}

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
