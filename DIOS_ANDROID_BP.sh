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

soong_namespace {
}

android_app_import {
	name: "CalculatorGooglePrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/CalculatorGooglePrebuilt/CalculatorGooglePrebuilt.apk",
	presigned: true,
	overrides: ["ExactCalculator"],
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "CalendarGooglePrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/CalendarGooglePrebuilt/CalendarGooglePrebuilt.apk",
	presigned: true,
	overrides: ["Calendar Etar"],
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "Chrome-Stub",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/Chrome-Stub/Chrome-Stub.apk",
	presigned: true,
	overrides: ["Browser Jelly"],
	dex_preopt: {
		enabled: false,
	},
	product_specific: true,
}

android_app_import {
	name: "DevicePolicyPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/DevicePolicyPrebuilt/DevicePolicyPrebuilt.apk",
	presigned: true,
	dex_preopt: {
		enabled: false,
	},
	product_specific: true,
}

android_app_import {
	name: "DiagnosticsToolPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/DiagnosticsToolPrebuilt/DiagnosticsToolPrebuilt.apk",
	presigned: true,
	dex_preopt: {
		enabled: false,
	},
	product_specific: true,
}

android_app_import {
	name: "GoogleContacts",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/GoogleContacts/GoogleContacts.apk",
	presigned: true,
	overrides: ["Contacts"],
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "GoogleTTS",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/GoogleTTS/GoogleTTS.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "LatinIMEGooglePrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/LatinIMEGooglePrebuilt/LatinIMEGooglePrebuilt.apk",
	presigned: true,
	overrides: ["LatinIME GooglePinYin"],
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "LocationHistoryPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/LocationHistoryPrebuilt/LocationHistoryPrebuilt.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "Maps",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/Maps/Maps.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "MarkupGoogle",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/MarkupGoogle/MarkupGoogle.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "PixelLiveWallpaperPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/PixelLiveWallpaperPrebuilt/PixelLiveWallpaperPrebuilt.apk",
	presigned: true,
	dex_preopt: {
		enabled: false,
	},
	product_specific: true,
}

android_app_import {
	name: "PixelWallpapers2022",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/PixelWallpapers2022/PixelWallpapers2022.apk",
	presigned: true,
	dex_preopt: {
		enabled: false,
	},
	product_specific: true,
}

android_app_import {
	name: "Photos",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/Photos/Photos.apk",
	presigned: true,
	overrides: ["Gallery2 PhotoTable"],
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "PixelThemesStub",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/PixelThemesStub/PixelThemesStub.apk",
	presigned: true,
	dex_preopt: {
		enabled: false,
	},
	product_specific: true,
}

android_app_import {
	name: "PlayAutoInstallConfig",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/PlayAutoInstallConfig/PlayAutoInstallConfig.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "PrebuiltBugle",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/PrebuiltBugle/PrebuiltBugle.apk",
	presigned: true,
	overrides: ["messaging"],
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "PrebuiltDeskClockGoogle",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/PrebuiltDeskClockGoogle/PrebuiltDeskClockGoogle.apk",
	presigned: true,
	overrides: ["DeskClock"],
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "PrebuiltGmail",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/PrebuiltGmail/PrebuiltGmail.apk",
	presigned: true,
	overrides: ["Email"],
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "PrebuiltGoogleTelemetryTvp",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/PrebuiltGoogleTelemetryTvp/PrebuiltGoogleTelemetryTvp.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "SoundAmplifierPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/SoundAmplifierPrebuilt/SoundAmplifierPrebuilt.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "SoundPickerPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/SoundPickerPrebuilt/SoundPickerPrebuilt.apk",
	presigned: true,
	overrides: ["SoundPicker"],
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "TrichromeLibrary-Stub",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/TrichromeLibrary-Stub/TrichromeLibrary-Stub.apk",
	presigned: true,
	dex_preopt: {
		enabled: false,
	},
	product_specific: true,
}

android_app_import {
	name: "Tycho",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/Tycho/Tycho.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "WebViewGoogle-Stub",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/WebViewGoogle-Stub/WebViewGoogle-Stub.apk",
	presigned: true,
	overrides: ["webview"],
	dex_preopt: {
		enabled: false,
	},
	product_specific: true,
}

android_app_import {
	name: "arcore",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/arcore/arcore.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "talkback",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/talkback/talkback.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	product_specific: true,
}

android_app_import {
	name: "AmbientStreaming",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/AmbientStreaming/AmbientStreaming.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "AndroidAutoStubPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/AndroidAutoStubPrebuilt/AndroidAutoStubPrebuilt.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "AppDirectedSMSService",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/AppDirectedSMSService/AppDirectedSMSService.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "CarrierLocation",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/CarrierLocation/CarrierLocation.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "CarrierMetrics",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/CarrierMetrics/CarrierMetrics.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "CarrierServices",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/CarrierServices/CarrierServices.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "CarrierWifi",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/CarrierWifi/CarrierWifi.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "ConfigUpdater",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/ConfigUpdater/ConfigUpdater.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "DevicePersonalizationPrebuiltPixel2022",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/DevicePersonalizationPrebuiltPixel2022/DevicePersonalizationPrebuiltPixel2022.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "FilesPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/FilesPrebuilt/FilesPrebuilt.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "GCS",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/GCS/GCS.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "GoogleDialer",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/GoogleDialer/GoogleDialer.apk",
	presigned: true,
	overrides: ["Dialer"],
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "HotwordEnrollmentOKGoogleFUSIONPro",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/HotwordEnrollmentOKGoogleFUSIONPro/HotwordEnrollmentOKGoogleFUSIONPro.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "HotwordEnrollmentXGoogleFUSIONPro",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/HotwordEnrollmentXGoogleFUSIONPro/HotwordEnrollmentXGoogleFUSIONPro.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "MaestroPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/MaestroPrebuilt/MaestroPrebuilt.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "ModuleMetadataGoogle",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/app/ModuleMetadataGoogle/ModuleMetadataGoogle.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "PartnerSetupPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/PartnerSetupPrebuilt/PartnerSetupPrebuilt.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "Phonesky",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/Phonesky/Phonesky.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "RecorderPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/RecorderPrebuilt/RecorderPrebuilt.apk",
	presigned: true,
	dex_preopt: {
		enabled: false,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "SafetyHubPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/SafetyHubPrebuilt/SafetyHubPrebuilt.apk",
	presigned: true,
	overrides: ["EmergencyInfo"],
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "ScribePrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/ScribePrebuilt/ScribePrebuilt.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "SettingsIntelligenceGooglePrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/SettingsIntelligenceGooglePrebuilt/SettingsIntelligenceGooglePrebuilt.apk",
	presigned: true,
	overrides: ["SettingsIntelligence"],
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "SetupWizardPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/SetupWizardPrebuilt/SetupWizardPrebuilt.apk",
	presigned: true,
	overrides: ["OneTimeInitializer Provision"],
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "Showcase",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/Showcase/Showcase.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "TetheringEntitlement",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/TetheringEntitlement/TetheringEntitlement.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "TurboPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/TurboPrebuilt/TurboPrebuilt.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "Velvet",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/Velvet/Velvet.apk",
	presigned: true,
	overrides: ["QuickSearchBox"],
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "WellbeingPrebuilt",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/WellbeingPrebuilt/WellbeingPrebuilt.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	product_specific: true,
}

android_app_import {
	name: "Flipendo",
	owner: "DIOS",
	apk: "FORK/PIXEL/system_ext/app/Flipendo/Flipendo.apk",
	certificate: "platform",
	dex_preopt: {
		enabled: true,
	},
	system_ext_specific: true,
}

android_app_import {
	name: "CarrierSetup",
	owner: "DIOS",
	apk: "FORK/PIXEL/system_ext/priv-app/CarrierSetup/CarrierSetup.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	system_ext_specific: true,
}

android_app_import {
	name: "GoogleFeedback",
	owner: "DIOS",
	apk: "FORK/PIXEL/system_ext/priv-app/GoogleFeedback/GoogleFeedback.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	system_ext_specific: true,
}

android_app_import {
	name: "GoogleOneTimeInitializer",
	owner: "DIOS",
	apk: "FORK/PIXEL/product/priv-app/GoogleOneTimeInitializer/GoogleOneTimeInitializer.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	system_ext_specific: true,
}

android_app_import {
	name: "GoogleServicesFramework",
	owner: "DIOS",
	apk: "FORK/PIXEL/system_ext/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	system_ext_specific: true,
}

android_app_import {
	name: "NexusLauncherRelease",
	owner: "DIOS",
	apk: "FORK/PIXEL/system_ext/priv-app/NexusLauncherRelease/NexusLauncherRelease.apk",
	presigned: true,
	overrides: ["Launcher3QuickStep"],
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	system_ext_specific: true,
}

android_app_import {
	name: "PixelSetupWizard",
	owner: "DIOS",
	apk: "FORK/PIXEL/system_ext/priv-app/PixelSetupWizard/PixelSetupWizard.apk",
	presigned: true,
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	system_ext_specific: true,
}

android_app_import {
	name: "StorageManagerGoogle",
	owner: "DIOS",
	apk: "FORK/PIXEL/system_ext/priv-app/StorageManagerGoogle/StorageManagerGoogle.apk",
	presigned: true,
	overrides: ["StorageManager"],
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	system_ext_specific: true,
}

android_app_import {
	name: "WallpaperPickerGoogleRelease",
	owner: "DIOS",
	apk: "FORK/PIXEL/system_ext/priv-app/WallpaperPickerGoogleRelease/WallpaperPickerGoogleRelease.apk",
	presigned: true,
	overrides: ["ThemePicker ThemesStub BlackAccent BlackTheme BlueAccent BrownAccent CyanAccent DarkTheme GreenAccent OrangeAccent PinkAccent PurpleAccent RedAccent YellowAccent NavigationBarNoHint WallpapersOverlay"],
	dex_preopt: {
		enabled: true,
	},
	privileged: true,
	system_ext_specific: true,
}

dex_import {
	name: "com.google.android.dialer.support",
	owner: "DIOS",
	jars: ["FORK/PIXEL/product/framework/com.google.android.dialer.support.jar"],
	product_specific: true,
}

EOF
