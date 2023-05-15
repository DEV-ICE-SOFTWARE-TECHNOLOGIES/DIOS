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
echo "D!OS DIOS MK..."
echo ""
cat <<\EOF >$DIOS_FOLDER/DIOS.mk
##################################
## Copyright © 2023 Marius Kopp ##
##################################
LOCAL_PRODUCT_MODULE := true

PRODUCT_SOONG_NAMESPACES += \
	vendor/dios

DEXPREOPT_GENERATE_APEX_IMAGE := true
DONT_DEXPREOPT_PREBUILTS := false
TARGET_INCLUDE_WIFI_EXT := true
TARGET_FACE_UNLOCK_SUPPORTED := true
WITH_DEXPREOPT := true

PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUIGoogle \
    NexusLauncherRelease

PRODUCT_PROPERTY_OVERRIDES += \
    debug.drm.mode.force=2160x3840 \
    bluetooth.device.class_of_device=90,66,12 \
    bluetooth.profile.a2dp.source.enabled=true \
    bluetooth.profile.asha.central.enabled=true \
    bluetooth.profile.avrcp.target.enabled=true \
    bluetooth.profile.bas.client.enabled=true \
    bluetooth.profile.gatt.enabled=true \
    bluetooth.profile.hfp.ag.enabled=true \
    bluetooth.profile.hid.device.enabled=true \
    bluetooth.profile.hid.host.enabled=true \
    bluetooth.profile.map.server.enabled=true \
    bluetooth.profile.opp.enabled=true \
    bluetooth.profile.pan.nap.enabled=true \
    bluetooth.profile.pan.panu.enabled=true \
    bluetooth.profile.pbap.server.enabled=true \
    bluetooth.profile.sap.server.enabled=true \
    dev.defaultwallpaper=/product/wallpaper/image/default_wallpaper_HAZ.png \
    euicc.seamless_transfer_enabled_in_non_qs=true \
    masterclear.allow_retain_esim_profiles_after_fdr=true \
    persist.bluetooth.a2dp_aac.vbr_supported=true \
    persist.bluetooth.bqr.event_mask=94 \
    persist.bluetooth.bqr.min_interval_ms=500 \
    persist.bluetooth.firmware.selection=BCM.hcd \
    persist.bluetooth.leaudio_offload.disabled=false \
    persist.bluetooth.opus.enabled=true \
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
    persist.radio.reboot_on_modem_change=false \
    persist.sys.fuse.passthrough.enable=true \
    persist.sys.sf.color_mode=9 \
    persist.sys.sf.color_saturation=1.1 \
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
    persist.vendor.radio.call_waiting_for_sync=1 \
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
    persist.vendor.ril.camp_on_earlier=1 \
    persist.vendor.testing_battery_profile=2 \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.bluetooth.leaudio_offload.supported=true \
    ro.bluetooth.leaudio_switcher.supported=true \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.twobutton;com.google.android.systemui.gxoverlay \
    ro.com.android.dataroaming=false \
    ro.com.google.clientidbase=android-google \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.height_ratio=1.2 \
    ro.com.google.ime.kb_pad_port_b=0 \
    ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms \
    ro.com.google.ime.theme_id=5 \
    ro.com.android.dataroaming=false \
    ro.com.android.mobiledata=true \
    ro.com.android.prov_mobiledata=true \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.com.google.acsa=true \
    ro.com.google.apphider=true \
    ro.com.google.clientidbase.am=android-google \
    ro.com.google.clientidbase.ms=android-google \
    ro.com.google.clientidbase.yt=android-google \
    ro.com.google.clientidbase=android-google \
    ro.com.google.ime.kb_pad_port_l=0 \
    ro.com.google.ime.kb_pad_port_r=0 \
    ro.com.google.ime.key_border=false \
    ro.com.google.ime.secondary_sym=true \
    ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms \
    ro.com.google.ime.theme_file=DIOS.zip \
    ro.com.google.ime.themes_dir=/product/etc/gboard_theme \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.rlz_ap_whitelist=y0,y5,y6,y7,y8,YH,YG \
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
    ro.config.isolated_compilation_enabled=true \
    ro.control_privapp_permissions=log \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.lockscreen.disable.default=0 \
    ro.opa.eligible_device=true \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.esim_cid_ignore=00000001 \
    ro.setupwizard.mode=optional \
    ro.setupwizard.require_network=optional \
    ro.setupwizard.rotation_locked=false \
    ro.setupwizard.suppress_d2d_nfc=true \
    ro.setupwizard.suppress_d2d=true \
    ro.setupwizard.wifi_on_exit=true \
    ro.sf.compbypass.enable=1 \
    ro.sf.hwrotation=0 \
    ro.sf.init.lcd_density=360 \
    ro.sf.lcd_size=2160x3840 \
    ro.sf.override_lcd_density=1 \
    ro.support_hide_display_cutout=true \
    ro.support_one_handed_mode=true \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.vendor.camera.extensions.package=com.google.android.apps.camera.services \
    ro.vendor.camera.extensions.service=com.google.android.apps.camera.services.extensions.service.PixelExtensions \
    ro.whitepoint_calibration_enable=true \
    lockscreen.rot_override=true \
    setupwizard.enable_assist_gesture_training=true \
    setupwizard.feature.baseline_setupwizard_enabled=false \
    setupwizard.feature.day_night_mode_enabled=true \
    setupwizard.feature.device_default_dark_mode=true \
    setupwizard.feature.enable_wifi_tracker=true \
    setupwizard.feature.lifecycle_refactoring=true \
    setupwizard.feature.notification_refactoring=true \
    setupwizard.feature.portal_notification=true \
    setupwizard.feature.show_digital_warranty=true \
    setupwizard.feature.show_pai_screen_in_main_flow.carrier1839=false \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.show_support_link_in_deferred_setup=false \
    setupwizard.feature.skip_button_use_mobile_data.carrier1839=true \
    setupwizard.theme=glif_v3_light \
    sf.display_density=360 \
    sf.display-size=2160x3840 \
    sf.lcd_density=360 \
    sf.lcd_size=2160x3840 \
    sys.autobrightness_optimize=true \
    sys.config_orientation=0 \
    sys.config.activelaunch_enable=true \
    sys.display-density=360 \
    sys.display-size=2160x3840 \
    vendor.sys.display-density=360 \
    vendor.sys.display-size=2160x3840

PRODUCT_PACKAGES += \
    ANGLE \
    AdaptiveVPNPrebuilt \
    AmbientStreaming \
    AndroidAutoStubPrebuilt \
    AndroidPlatformServices \
    AppDirectedSMSService \
    arcore \
    BetterBugStub \
    CalculatorGooglePrebuilt \
    CalendarGooglePrebuilt \
    CarrierLocation \
    CarrierMetrics \
    CarrierServices \
    CarrierSetup \
    CarrierWifi \
    CccDkTimeSyncService \
    Chrome \
    Chrome-Stub \
    PlayAutoInstallConfig \
    ConnectivityThermalPowerManager \
    com.android.imsserviceentitlement \
    com.android.omadm.radioconfig \
    com.android.sdm.plugins.connmo \
    com.android.sdm.plugins.dcmo \
    com.android.sdm.plugins.diagmon \
    com.customermobile.preload.vzw \
    com.google.android.apps.dialer.call_recording_audio.features \
    com.google.android.apps.dreamliner \
    com.google.android.dialer.support \
    com.google.android.odad \
    com.google.omadm.trigger \
    com.verizon.apn \
    com.verizon.llkagent \
    com.verizon.services \
    com.verizon.services \
    ConfigUpdater \
    libhwinfo \
    default_permissions_allowlist \
    default-exo-permissions \
    DeviceIntelligenceNetworkPrebuilt \
    DevicePersonalizationPrebuiltPixel2020 \
    DevicePolicyPrebuilt \
    DiagnosticsToolPrebuilt \
    EmergencyInfoGoogleNoUi \
    features-verizon \
    FilesPrebuilt \
    Flipendo \
    game_service \
    game-overlay \
    GCS \
    gms_fsverity_cert \
    google \
    google_build \
    google-hiddenapi-package-whitelist \
    google-install-constraints-package-allowlist \
    google-staged-installer-whitelist \
    GoogleCamera \
    GoogleContacts \
    GoogleDialer \
    GoogleFeedback \
    GoogleOneTimeInitializer \
    GoogleRestorePrebuilt \
    GoogleServicesFramework \
    GoogleTTS \
    HelpRtcPrebuilt \
    KidsSupervisionStub \
    LatinIMEGooglePrebuilt \
    LocationHistoryPrebuilt \
    MaestroPrebuilt \
    MarkupGoogle \
    MicropaperPrebuilt \
    MlkitBarcodeUIPrebuilt \
    nexus \
    NexusLauncherRelease \
    NgaResources \
    obdm_permissions \
    PartnerSetupPrebuilt \
    Phonesky \
    Photos \
    pixel_2016_exclusive \
    pixel_experience_2017 \
    pixel_experience_2018 \
    pixel_experience_2019 \
    pixel_experience_2019_midyear \
    pixel_experience_2020 \
    pixel_experience_2020_midyear \
    PixelCameraServicesC10 \
    PixelLiveWallpaperPrebuilt \
    PixelSetupWizard \
    PixelThemesStub \
    PixelThemesStub2022_and_newer \
    PixelWallpapers2022 \
    play_store_fsi_cert \
    PrebuiltBugle \
    PrebuiltGmail \
    PrebuiltDeskClockGoogle \
    PrebuiltGmsCoreSc \
    PrebuiltGmsCoreSc_AdsDynamite \
    PrebuiltGmsCoreSc_CronetDynamite \
    PrebuiltGmsCoreSc_DynamiteLoader \
    PrebuiltGmsCoreSc_DynamiteModulesA \
    PrebuiltGmsCoreSc_DynamiteModulesC \
    PrebuiltGmsCoreSc_GoogleCertificates \
    PrebuiltGmsCoreSc_MapsDynamite \
    PrebuiltGmsCoreSc_MeasurementDynamite \
    PrebuiltGoogleAdservicesTvp \
    PrebuiltGoogleTelemetryTvp \
    preferred_apps_google \
    preinstalled-packages-product-pixel-2017-and-newer \
    privapp-permissions-google \
    privapp-permissions-google-p \
    privapp-permissions-google-se \
    quick_tap \
    QuickAccessWallet \
    RecorderPrebuilt \
    SafetyHubPrebuilt \
    SCONE \
    ScribePrebuilt \
    SecurityHubPrebuilt \
    SettingsGoogle \
    SettingsIntelligenceGooglePrebuilt \
    SetupWizardPrebuilt \
    Showcase \
    SoundAmplifierPrebuilt \
    SoundPickerPrebuilt \
    split-permissions-google \
    StorageManagerGoogle \
    SystemUIGoogle \
    talkback \
    TetheringEntitlement \
    TrichromeLibrary \
    TrichromeLibrary-Stub \
    TurboAdapter \
    TurboPrebuilt \
    Tycho \
    Velvet \
    VisionBarcodePrebuilt \
    vzw_mvs_permissions \
    WallpaperEffect \
    WallpaperPickerGoogleRelease \
    WebViewGoogle \
    WebViewGoogle-Stub \
    WellbeingPrebuilt \
    WfcActivation \
    YouTube \
    YouTubeMusicPrebuilt

include $(call all-subdir-makefiles)
    
EOF
