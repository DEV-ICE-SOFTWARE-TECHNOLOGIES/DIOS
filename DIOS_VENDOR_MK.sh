#!/bin/zsh

set -eu

# --------------------------------------------------------------------------------------------------
# Copyright (C) 2022 DEV ICE TECHNOLOGIES
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/sony/dios ]; then
    mkdir -p ~/dios/device/sony/dios
fi

echo ""
echo "D!OS VENDOR MK..."
echo ""
cat <<\EOF >~/dios/device/sony/dios/dios.mk
# --------------------------------------------------------------------------------------------------
# Copyright (C) 2022 DEV ICE TECHNOLOGIES
# --------------------------------------------------------------------------------------------------
include $(CLEAR_VARS)

DONT_DEXPREOPT_PREBUILTS := false
WITH_DEXPREOPT := true

PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    NexusLauncherRelease
    
PRODUCT_PROPERTY_OVERRIDES += \
persist.demo.hdmirotationlock=false \
persist.sys.sf.color_mode=9 \
persist.sys.sf.color_saturation=1.1 \
persist.sys.sf.native_mode=2 \
persist.sys.usb.config=none \
ro.lockscreen.disable.default=0 \
ro.setupwizard.enterprise_mode=1 \
ro.setupwizard.esim_cid_ignore=00000001 \
ro.setupwizard.mode=optional \
ro.setupwizard.require_network=optional \
ro.setupwizard.rotation_locked=false \
ro.setupwizard.suppress_d2d_nfc=true \
ro.setupwizard.suppress_d2d=true \
ro.setupwizard.wifi_on_exit=true \
setupwizard.enable_assist_gesture_training=true \
setupwizard.feature.baseline_setupwizard_enabled=false \
setupwizard.feature.device_default_dark_mode=true \
setupwizard.feature.show_pai_screen_in_main_flow.carrier1839=false \
setupwizard.feature.show_pixel_tos=true \
setupwizard.feature.show_support_link_in_deferred_setup=true \
setupwizard.feature.skip_button_use_mobile_data.carrier1839=true \
setupwizard.theme=glif_v3_light \
vendor.display.comp_mask=0 \
vendor.display.disable_excl_rect=0 \
vendor.display.disable_inline_rotator=1 \
vendor.display.disable_ui_3d_tonemap=0 \
vendor.display.enable_default_color_mode=1 \
vendor.display.enable_null_display=0 \
vendor.display.enable_optimize_refresh=1 \
ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.twobutton;com.google.android.systemui.gxoverlay 

DEVICE_PACKAGE_OVERLAYS += \
    device/sony/dios/overlay

PRODUCT_PACKAGES += \
    AmbientSensePrebuilt \
    AndroidAutoStub \
    com.google.android.dialer.support \
    GoogleCalendarSyncAdapter \
    GoogleCamera \
    GoogleContactsSyncAdapter \
    GoogleFeedback \
    GooglePartnerSetup \
    GoogleRestore \
    GoogleServicesFramework \
    MarkupGoogle \
    Phonesky \
    PixelSetupWizard \
    PrebuiltExchange3Google \
    PrebuiltGmsCoreSc \
    talkback \
    Velvet 

#PRODUCT_SYSTEM_EXT_PROPERTIES += ro.lockscreen.disable.default=1

EOF
