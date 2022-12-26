#!/bin/zsh

set -eu

# --------------------------------------------------------------------------------------------------
# Copyright (C) 2022 DEV ICE TECHNOLOGIES
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/dios ]; then
    mkdir -p ~/dios/device/dios
fi

echo ""
echo "D!OS DIOS MK..."
echo ""
cat <<\EOF >~/dios/device/dios/dios.mk
# --------------------------------------------------------------------------------------------------
# Copyright (C) 2022 DEV ICE TECHNOLOGIES
# --------------------------------------------------------------------------------------------------
DIOS_PATH := device/dios/dios

$(call inherit-product-if-exists, $(DIOS_PATH)/config.mk)

include $(CLEAR_VARS)

DEXPREOPT_GENERATE_APEX_IMAGE := true
DONT_DEXPREOPT_PREBUILTS := false
TARGET_INCLUDE_WIFI_EXT := true
TARGET_FACE_UNLOCK_SUPPORTED := true
WITH_DEXPREOPT := true

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUIGoogle \
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
persist.demo.hdmirotationlock=false \
persist.sys.sf.color_mode=9 \
persist.sys.sf.native_mode=2 \
persist.sys.usb.config=none \
persist.vendor.dbg.ims_volte_enable=1 \
persist.vendor.dbg.volte_avail_ovr=1 \
persist.vendor.dbg.vt_avail_ovr=1 \
persist.vendor.dbg.wfc_avail_ovr=1 \
persist.vendor.ims.mm_minqp=1 \
persist.vendor.radio.add_power_save=1 \
persist.vendor.radio.apm_mdm_not_pwdn=1 \
persist.vendor.radio.apm_sim_not_pwdn=1 \
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
persist.vendor.radio.manual_nw_rej_ct=1 \
persist.vendor.radio.mt_sms_ack=19 \
persist.vendor.radio.multisim_switch_support=true \
persist.vendor.radio.multisim.config=dsds \
persist.vendor.radio.no_wait_for_card=1 \
persist.vendor.radio.oem_socket=true \
persist.vendor.radio.procedure_bytes=SKIP \
persist.vendor.radio.rat_on=combine \
persist.vendor.radio.rat_on=combine \
persist.vendor.radio.RATE_ADAPT_ENABLE=1 \
persist.vendor.radio.reboot_on_modem_change=false \
persist.vendor.radio.relay_oprt_change=1 \
persist.vendor.radio.report_codec=1 \
persist.vendor.radio.ROTATION_ENABLE=1 \
persist.vendor.radio.sap_silent_pin=1 \
persist.vendor.radio.sar_headhand_sensor=true \
persist.vendor.radio.sar_sar_sensor=true \
persist.vendor.radio.sar_slidemode_sensor=true \
persist.vendor.radio.sib16_support=1 \
persist.vendor.radio.snapshot_enabled=0 \
persist.vendor.radio.snapshot_timer=0 \
persist.vendor.radio.unicode_op_names=true \
persist.vendor.radio.vdp_on_ims_cap=1 \
persist.vendor.radio.videopause.mode=1 \
persist.vendor.radio.voice_on_lte=1 \
persist.vendor.radio.volte.dan_support=true \
persist.vendor.radio.VT_CAM_INTERFACE=2 \
persist.vendor.radio.VT_ENABLE=1 \
persist.vendor.radio.VT_HYBRID_ENABLE=1 \
persist.vendor.radio.wait_for_pbm=1 \
persist.vendor.radio.wifi_disc_delay=2 \
ril.ims.ltevoicesupport=1 \
ro.apex.updatable=true \
ro.com.android.dataroaming=false \
ro.com.android.prov_mobiledata=false \
ro.com.google.clientidbase=android-google \
ro.com.google.ime.bs_theme=true \
ro.com.google.ime.height_ratio=1.2 \
ro.com.google.ime.kb_pad_port_b=10 \
ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms \
ro.com.google.ime.theme_id=5 \
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
masterclear.allow_retain_esim_profiles_after_fdr=true \
ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.twobutton;com.google.android.systemui.gxoverlay
EOF
