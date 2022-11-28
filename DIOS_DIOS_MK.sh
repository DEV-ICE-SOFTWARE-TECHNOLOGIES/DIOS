#!/bin/zsh

set -eu

# --------------------------------------------------------------------------------------------------
# Copyright (C) 2022 DEV ICE TECHNOLOGIES
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/sony/dios ]; then
    mkdir -p ~/dios/device/sony/dios
fi

echo ""
echo "D!OS DIOS MK..."
echo ""
cat <<\EOF >~/dios/device/sony/dios/dios.mk
# --------------------------------------------------------------------------------------------------
# Copyright (C) 2022 DEV ICE TECHNOLOGIES
# --------------------------------------------------------------------------------------------------
include $(CLEAR_VARS)

BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
DEXPREOPT_GENERATE_APEX_IMAGE := true
DONT_DEXPREOPT_PREBUILTS := false
TARGET_INCLUDE_WIFI_EXT := false
WITH_DEXPREOPT := true

PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    NexusLauncherRelease
    
PRODUCT_PROPERTY_OVERRIDES += \
persist.data.df.agg.dl_pkt=10 \
persist.data.df.agg.dl_size=4096 \
persist.data.df.dev_name=rmnet_usb0 \
persist.data.df.dl_mode=5 \
persist.data.df.iwlan_mux=9 \
persist.data.df.mux_count=8 \
persist.data.df.ul_mode=5 \
persist.data.iwlan.enable=true \
persist.data.mode=concurrent \
persist.data.netmgrd.qos.enable=true \
persist.data.tethering_oc=1 \
persist.data.wda.enable=true \
persist.dbg.ims_volte_enable=1 \
persist.dbg.volte_avail_ovr=1 \
persist.dbg.vt_avail_ovr=1 \
persist.dbg.wfc_avail_ovr=1 \
persist.demo.hdmirotationlock=false \
persist.sys.sf.color_mode=9 \
persist.sys.sf.color_saturation=1.1 \
persist.sys.sf.native_mode=2 \
persist.sys.usb.config=none \
persist.vendor.radio.add_power_save=1 \
persist.vendor.radio.apm_mdm_not_pwdn=1 \
persist.vendor.radio.atfwd.start=true \
persist.vendor.radio.calls.on.ims=1 \
persist.vendor.radio.custom_ecc=1 \
persist.vendor.radio.data_con_rprt=1 \
persist.vendor.radio.data_ltd_sys_ind=1 \
persist.vendor.radio.enableadvancedscan=true \
persist.vendor.radio.enhance_ecall=true \
persist.vendor.radio.fill_eons=1 \
persist.vendor.radio.flexmap_type=none \
persist.vendor.radio.force_on_dc=true \
persist.vendor.radio.hidl_dev_service=true \
persist.vendor.radio.ims_call_transfer=true \
persist.vendor.radio.is_voip_enabled=1 \
persist.vendor.radio.multisim.config=dsds \
persist.vendor.radio.procedure_bytes=SKIP \
persist.vendor.radio.rat_on=combine \
persist.vendor.radio.rat_on=combine \
persist.vendor.radio.RATE_ADAPT_ENABLE=1 \
persist.vendor.radio.reboot_on_modem_change=false \
persist.vendor.radio.ROTATION_ENABLE=1 \
persist.vendor.radio.sar_headhand_sensor=true \
persist.vendor.radio.sar_sar_sensor=true \
persist.vendor.radio.sar_slidemode_sensor=true \
persist.vendor.radio.sib16_support=1
persist.vendor.radio.videopause.mode=1 \
persist.vendor.radio.voice_on_lte=1 \
persist.vendor.radio.volte.dan_support=true \
persist.vendor.radio.VT_CAM_INTERFACE=2 \
persist.vendor.radio.VT_ENABLE=1 \
persist.vendor.radio.VT_HYBRID_ENABLE=1 \
persist.vendor.radio.wait_for_pbm=1 \
persist.vendor.radio.wifi_disc_delay=2 \
ril.ims.ltevoicesupport=1 \
ro.config.hifi_always_on=true \
ro.config.hifi_enhance_support=1 \
ro.config.hw_displayeffect_en=true \
ro.config.hw_dts=true \
ro.config.hw_fast_dormancy=1 \
ro.config.hw_force_hwc_virtual=true \
ro.config.hw_music_lp=true \
ro.config.hw_navigationbar=false \
ro.config.hw_num_frame_buffer=3 \
ro.config.hw_perfhub=true \
ro.config.hw_power_saving=true \
ro.config.hw_quickpoweron=true \
ro.config.hw_sensorhub=true \
ro.config.hw_volte_on=true \
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
telephony.active_modems.max_count=2 \
telephony.lteOnCdmaDevice=1 \
telephony.lteOnGsmDevice=1 \
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
