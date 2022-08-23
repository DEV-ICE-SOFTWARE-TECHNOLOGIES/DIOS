#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright (C) 2022 DEV ICE TECHNOLOGIES
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/sony/dios ]; then
    mkdir -p ~/dios/device/sony/dios
fi

echo ""
echo "D!OS ANDROID BP..."
echo ""
cat <<\EOF >~/dios/device/sony/dios/Android.bp
/*
 * Copyright (C) 2022 The Android Open Source Project
 * Copyright (C) 2022 DEV ICE TECHNOLOGIES
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

android_app_import {
	name: "PrebuiltGmsCoreSc.apk",
	owner: "dios",
	apk: "fork/pixel/product/priv-app/PrebuiltGmsCore/PrebuiltGmsCoreSc.apk",
	presigned: true,
	dex_preopt: {
		enabled: false,
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
		enabled: false,
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
		enabled: false,
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
		enabled: false,
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
		enabled: false,
	},
	product_specific: true,
}

android_app_import {
	name: "talkback",
	owner: "dios",
	apk: "fork/pixel/product/app/talkback/talkback.apk",
	presigned: true,
	dex_preopt: {
		enabled: false,
	},
	product_specific: true,
}

android_app_import {
	name: "Velvet",
	owner: "dios",
	apk: "fork/pixel/product/priv-app/Velvet/Velvet.apk",
	presigned: true,
	dex_preopt: {
		enabled: false,
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
		enabled: false,
	},
	privileged: true,
	system_ext_specific: true,
}


EOF
