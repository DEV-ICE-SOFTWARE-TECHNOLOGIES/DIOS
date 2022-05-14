#!/bin/bash
set -eu
# --------------------------------------------------------------------------------------------------
# D!OS SCRIPT VERSION: 220513.2
# --------------------------------------------------------------------------------------------------
# CREDITS TO PAUL, THE RANDOM SONY OPEN DEVELOPER GUY!
# IT WAS A STONY PATH BUT YOU HELPED ME TO PASS IT! <3
# ALSO THANKS TO ALL OTHER SUPPORTERS AND TESTER FOR YOUR HELP! <3
# YOU OPENED A NEW CHAPTER OF ANDROID WITH ME...
# --------------------------------------------------------------------------------------------------
# MADE BY MARIUS KOPP (M1U5T0N3) WITH MUCH LOVE AND SWEAT...
# --------------------------------------------------------------------------------------------------
# 1. VARIABLES
# --------------------------------------------------------------------------------------------------

DEVICE=bahamut
NAME=M1U5T0N3
USERNAME=miustone
EMAIL=mariuskopp517@gmail.com
DIOS_DIR=~/dios/device/sony/dios
DOWNLOAD_DIR=~/dios/device/sony/dios/pixel
FORK_DIR=~/dios/device/sony/dios/fork
IMAGE_NAME=redfin-sp2a.220505.002-factory-7fe11c77.zip
IMAGE_FILE=$DOWNLOAD_DIR/$IMAGE_NAME
OUT=~/dios/out/target/product/$DEVICE
TMP=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)
PRODUCT=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)/product
VENDOR=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)/vendor
SYSTEM=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)/system
SYSTEM_EXT=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)/system_ext

# --------------------------------------------------------------------------------------------------
# 2. HELP
# --------------------------------------------------------------------------------------------------

_show_help() {
    echo ""
    echo ""
    echo ""
    echo "             AUTOMATED D!OS BUILD SCRIPT"
    echo ""
    echo ""
    echo ""
    echo ""
    echo "OPTIONS:"
    echo "   -a|--aosp               BUILDS ONLY VANILLA AOSP"
    echo "   -c|--clean              NEEDED FOR UPDATES"
    echo "   -u|--update             DO THIS AFTER SCRIPT UPDATES"
    echo "   -h|--help               SHOWS THIS HELP SCREEN"
    echo ""
    echo ""
    echo "USAGE EXAMPLE FOR XPERIA 5 D!OS:"
    echo "   env LUNCH_CHOICE=aosp_j9210-userdebug bash ./$_shell_script"
    echo ""
    echo ""
    echo "USAGE EXAMPLE FOR XPERIA 5 AOSP:"
    echo "   env LUNCH_CHOICE=aosp_j9210-userdebug bash ./$_shell_script -a"
    echo ""
}

# --------------------------------------------------------------------------------------------------
# 3. INITIALIZING
# --------------------------------------------------------------------------------------------------

_init_dios() {
    sudo apt-get purge openjdk-* icedtea-* icedtea6-* || true
    sudo apt-get update
    sudo apt-get install -y openjdk-11-jdk
    sudo apt-get install -y bison g++-multilib git gperf libxml2-utils make zlib1g-dev zip liblz4-tool libncurses5 libssl-dev bc flex curl python-is-python3 ccache simg2img aapt

    mkdir ~/bin || true
    curl http://commondatastorage.googleapis.com/git-repo-downloads/repo >~/bin/repo
    chmod a+x ~/bin/repo

    echo '' >>~/.bashrc
    echo 'export PATH=~/bin:$PATH' >>~/.bashrc
    echo 'export USE_CCACHE=1' >>~/.bashrc
    echo 'export CCACHE_EXEC=/usr/bin/ccache' >>~/.bashrc
    echo 'export CCACHE_DIR=~/.ccache' >>~/.bashrc
    echo 'export ALLOW_MISSING_DEPENDENCIES=true' >>~/.bashrc
    wait
    source ~/.bashrc
    ccache -M 300G -F 0

    if [ ! -d /mnt/ccache ]; then
        sudo mkdir /mnt/ccache
    fi

    mkdir -p ~/dios/device/sony/customization
    cat <<\EOF >device/sony/customization/customization.mk
DIOS_PATH := device/sony/dios
$(call inherit-product-if-exists, $(DIOS_PATH)/dios.mk)
EOF

    repo init -u https://android.googlesource.com/platform/manifest -b android-12.1.0_r5
    cd .repo
    if [ ! -d ~/dios/.repo/local_manifests ]; then
        git clone https://github.com/sonyxperiadev/local_manifests
    fi
    cd local_manifests
    git checkout
    cd ../..
    cat <<\EOF >~/dios/.repo/local_manifests/dios.xml
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
    <remove-project name="platform/packages/apps/Gallery" />
    <remove-project name="platform/packages/apps/Gallery2" />
    <remove-project name="platform/packages/apps/Launcher3" />
    <remove-project name="platform/packages/apps/Messaging" />
    <remove-project name="platform/packages/apps/Music" />
    <remove-project name="platform/packages/apps/MusicFX" />
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
    mkdir -p $DIOS_DIR
    pushd $DIOS_DIR
    git clone https://github.com/DEV-ICE-TECHNOLOGIES/ACDB
    popd
    cat <<\EOF >~/dios/device/sony/dios/Android.mk
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
$(shell cp -rf $(LOCAL_PATH)/fork/system/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
$(shell cp -rf $(LOCAL_PATH)/fork/system_ext/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
$(shell cp -rf $(LOCAL_PATH)/fork/product/* `pwd`/$(TARGET_OUT_PRODUCT)/)
$(shell cp -rf $(LOCAL_PATH)/fork/vendor/* `pwd`/$(TARGET_OUT_VENDOR)/)
$(shell cp -rf $(LOCAL_PATH)/ACDB/acdbdata/* `pwd`/$(TARGET_OUT_VENDOR)/etc/acdbdata)
EOF

    repo sync -j$(nproc) && ./repo_update.sh -j$(nproc)
    echo ""
    echo "PREPARED! RESTART THE SCRIPT TO START BUILDING..."
    exit
}

# --------------------------------------------------------------------------------------------------
# 4. POST-UPDATE FLAGS
# --------------------------------------------------------------------------------------------------

_post_update() {
    echo ""
    echo "DIOS BUILD FLAGS..."

    cat <<\EOF >~/dios/.repo/local_manifests/gapps.xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<remote name="MindTheGapps" fetch="https://gitlab.com/MindTheGapps/" />
<project path="vendor/gapps" name="vendor_gapps" remote="MindTheGapps" revision="sigma" />
</manifest>
EOF

    # --------------------------------------------------------------------------------------------------
    # 4.1 POST-UPDATE DIOS FLAGS
    # --------------------------------------------------------------------------------------------------

    echo ""
    echo "PATCHING DIOS.MK..."
    cat <<\EOF >~/dios/device/sony/dios/dios.mk

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

WITH_DEXPREOPT := true

-include vendor/gapps/arm64/arm64-vendor.mk

        PRODUCT_PROPERTY_OVERRIDES += \
ro.control_privapp_permissions=log \
aaudio.hw_burst_min_usec=2000 \
aaudio.mmap_exclusive_policy=2 \
aaudio.mmap_policy=2 \
af.fast_track_multiplier=1 \
dalvik.vm.dex2oat64.enabled=true \
dalvik.vm.heapgrowthlimit=256m \
dalvik.vm.heapmaxfree=32m \
dalvik.vm.heapminfree=8m \
dalvik.vm.heapsize=512m \
dalvik.vm.heapstartsize=16m \
dalvik.vm.heaptargetutilization=0.5 \
dalvik.vm.isa.arm.features=default \
dalvik.vm.isa.arm.variant=cortex-a76 \
dalvik.vm.isa.arm64.features=default \
dalvik.vm.isa.arm64.variant=cortex-a76 \
debug.egl.hw=1 \
debug.gralloc.enable_fb_ubwc=1 \
debug.mdpcomp.logs=0 \
debug.sf.early.app.duration=16500000 \
debug.sf.early.sf.duration=16000000 \
debug.sf.earlyGl.app.duration=21000000 \
debug.sf.earlyGl.sf.duration=13500000 \
debug.sf.enable_gl_backpressure=1 \
debug.sf.hw=1 \
debug.sf.late.app.duration=20500000 \
debug.sf.late.sf.duration=10500000 \
debug.sf.use_phase_offsets_as_durations=1 \
debug.stagefright.c2inputsurface=-1 \
debug.stagefright.omx_default_rank=512 \
DEVICE_PROVISIONED=1 \
drm.service.enabled=true \
external_storage.casefold.enabled=1 \
external_storage.projid.enabled=1 \
external_storage.sdcardfs.enabled=0 \
framework_watchdog.fatal_count=3 \
framework_watchdog.fatal_window.second=600 \
graphics.gpu.profiler.support=true \
graphics.gpu.profiler.vulkan_layer_apk=com.google.pixel.redbull.gpuprofiling.vulkanlayer \
keyguard.no_require_sim=true \
log.tag.stats_log=I \
masterclear.allow_retain_esim_profiles_after_fdr=true \
media.aac_51_output_enabled=true \
media.mediadrmservice.enable=true \
media.stagefright.enable-aac=true \
media.stagefright.enable-http=true \
media.stagefright.enable-player=true \
media.stagefright.enable-qcp=true \
media.stagefright.enable-scan=true \
mm.enable.qcom_parser=13631487 \
mm.enable.smoothstreaming=true \
mmp.enable.3g2=true \
persist.bluetooth.a2dp_aac.vbr_supported=true \
persist.bluetooth.a2dp_offload.cap=sbc-aac-aptx-aptxhd-ldac \
persist.bluetooth.a2dp_offload.disabled=false \
persist.bluetooth.bqr.event_mask=30 \
persist.bluetooth.bqr.min_interval_ms=500 \
persist.camera.googfd.enable=1 \
persist.camera.google_hwl.enabled=true \
persist.camera.google_hwl.name=libgooglecamerahwl_impl.so \
persist.camera.managebuffer.enable=1 \
persist.data.df.agg.dl_pkt=10 \
persist.data.df.agg.dl_size=4096 \
persist.data.df.dev_name=rmnet_usb0 \
persist.data.df.dl_mode=5 \
persist.data.df.iwlan_mux=9 \
persist.data.df.mux_count=8 \
persist.data.df.ul_mode=5 \
persist.data.mode=concurrent \
persist.data.netmgrd.qos.enable=true \
persist.data.wda.enable=true \
persist.fuse_sdcard=true \
persist.mm.enable.prefetch=true \
persist.radio.reboot_on_modem_change=false \
persist.rcs.supported=1 \
persist.rmnet.data.enable=true \
persist.sys.dalvik.vm.lib.2=libart.so \
persist.sys.fuse.passthrough.enable=true \
persist.sys.sf.color_mode=9 \
persist.sys.sf.color_saturation=1.1 \
persist.sys.sf.native_mode=2 \
persist.sys.usb.config=mtp \
persist.timed.enable=true \
persist.traced.enable=1 \
persist.vendor.audio_hal.dsp_bit_width_enforce_mode=24 \
persist.vendor.audio.fluence.speaker=true \
persist.vendor.audio.fluence.voicecall=true \
persist.vendor.audio.fluence.voicecomm=true \
persist.vendor.audio.fluence.voicerec=false \
persist.vendor.bt.aac_frm_ctl.enabled=true \
persist.vendor.bt.aac_vbr_frm_ctl.enabled=true \
persist.vendor.camera.realtimethread=1 \
persist.vendor.cne.feature=1 \
persist.vendor.data.iwlan.enable=true \
persist.vendor.data.mode=concurrent \
persist.vendor.debug.sensors.accel_cal=1 \
persist.vendor.ims.mm_minqp=1 \
persist.vendor.radio.apm_sim_not_pwdn=1 \
persist.vendor.radio.custom_ecc=1 \
persist.vendor.radio.data_con_rprt=true \
persist.vendor.radio.data_ltd_sys_ind=1 \
persist.vendor.radio.hidl_dev_service=true \
persist.vendor.radio.manual_nw_rej_ct=1 \
persist.vendor.radio.multisim_switch_support=true \
persist.vendor.radio.no_wait_for_card=1 \
persist.vendor.radio.procedure_bytes=SKIP \
persist.vendor.radio.RATE_ADAPT_ENABLE=1 \
persist.vendor.radio.relay_oprt_change=1 \
persist.vendor.radio.ROTATION_ENABLE=1 \
persist.vendor.radio.sap_silent_pin=1 \
persist.vendor.radio.sib16_support=1 \
persist.vendor.radio.snapshot_enabled=0 \
persist.vendor.radio.snapshot_timer=0 \
persist.vendor.radio.videopause.mode=1 \
persist.vendor.radio.VT_ENABLE=1 \
persist.vendor.radio.VT_HYBRID_ENABLE=1 \
persist.vendor.sensors.allow_non_default_discovery=true \
persist.vendor.sensors.odl.adsp=true \
persist.vendor.sys.modem.diag.mdlog_br_num=5 \
persist.vendor.sys.modem.diag.mdlog=false \
persist.vendor.sys.ssr.restart_level=modem,adsp \
persist.vendor.testing_battery_profile=2 \
persist.vendor.verbose_logging_enabled=false 
EOF

    # --------------------------------------------------------------------------------------------------
    # 4.2 POST-UPDATE COMMON PROP FLAGS
    # --------------------------------------------------------------------------------------------------

    echo ""
    echo "PATCHING common-prop.MK..."
    cat <<\EOF >~/dios/device/sony/common/common-prop.mk
# librqbalance enablement
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/vendor/lib/librqbalance.so

# Limit dex2oat threads to improve thermals
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-threads=2 \
    dalvik.vm.image-dex2oat-threads=4

# Platform specific default properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.qmi.adb_logmask=0

# configure adb over wifi only on the eng build
ifneq (,$(filter eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PROPERTY_OVERRIDES += \
    service.adb.tcp.port=5555
endif

# Common property setup DS or SS devices.
ifeq ($(PRODUCT_DEVICE_DS),true)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.multisim.config=dsds
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=9
endif

# System props for the data modules
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.use_data_netmgrd=true \
    ro.data.large_tcp_window_size=true

# Enable Power save functionality for modem
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.add_power_save=1 \
    persist.vendor.radio.apm_sim_not_pwdn=1

# Enable advanced power saving for data connectivity
# DPM: Data Port Mapper, with TCM (TCP Connection Manager)
# CnE: Connectivity Engine
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.dpm.feature=1 \
    persist.vendor.dpm.tcm=1 \

# IMS
# P.S.: va_{aosp,odm} is necessary to load imscmservice
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.va_aosp.support=1 \
    ro.vendor.qti.va_odm.support=1 \
    persist.vendor.radio.vdp_on_ims_cap=1 \
    persist.vendor.radio.report_codec=1

# VoLTE / VT / WFC
# These properties will force availability of the VoLTE,
# VideoTelephony and Wi-Fi Call, without needing carrier
# services provisioning sites hooked up: simplifies it.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1

# Modem properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.wait_for_pbm=1 \
    persist.vendor.radio.mt_sms_ack=19 \
    persist.vendor.radio.enableadvancedscan=true \
    persist.vendor.radio.unicode_op_names=true \
    persist.vendor.radio.oem_socket=true

# Ringer
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=false

# debug.sf.latch_unsignaled
# - This causes SurfaceFlinger to latch
#   buffers even if their fences haven't signaled
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.latch_unsignaled=1

# SurfaceFlinger
# Keep uppercase makevars like TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS
# in sync, use hardware/interfaces/configstore/1.1/default/surfaceflinger.mk
# as a reference
# ConfigStore is being deprecated and sf is moving to props, see
# frameworks/native/services/surfaceflinger/sysprop/SurfaceFlingerProperties.sysprop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true

# Disable buffer age (b/74534157)
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.use_buffer_age=false

# Stagefright
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.thumbnail.prefer_hw_codecs=true

# Delay reduction
PRODUCT_PROPERTY_OVERRIDES += \
    sdm.debug.rotator_downscale=1

# DRM service
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# VIDC: debug_levels 1:ERROR 2:HIGH 4:LOW 0:NOLOGS 7:AllLOGS
PRODUCT_PROPERTY_OVERRIDES += \
    vidc.debug.level=1

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    audio.deep_buffer.media=true \
    fmas.hdph_sgain=0 \

# Audio (AOSP HAL)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.fluence.speaker=true \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicecomm=true \
    persist.audio.fluence.voicerec=true \

# Audio (newer CAF HALs)
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.offload.multiaac.enable=true \
    vendor.audio.offload.multiple.enabled=false \
    vendor.audio.offload.passthrough=false \
    vendor.audio.offload.track.enable=true \
    vendor.audio.parser.ip.buffer.size=262144 \
    vendor.audio.volume.headset.gain.depcal=true \
    vendor.voice.path.for.pcm.voip=true

# Audio (CAF - Hardware enc/decoding)
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.flac.sw.decoder.24bit=true \
    vendor.audio.hw.aac.encoder=true \
    vendor.audio.use.sw.alac.decoder=true \
    vendor.audio.use.sw.ape.decoder=true

# Audio Features
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.feature.afe_proxy.enable=true \
    vendor.audio.feature.anc_headset.enable=true \
    vendor.audio.feature.battery_listener.enable=false \
    vendor.audio.feature.compr_cap.enable=false \
    vendor.audio.feature.compress_meta_data.enable=true \
    vendor.audio.feature.deepbuffer_as_primary.enable=false \
    vendor.audio.feature.dsm_feedback.enable=false \
    vendor.audio.feature.ext_hw_plugin.enable=false \
    vendor.audio.feature.fluence.enable=true \
    vendor.audio.feature.fm.enable=true \
    vendor.audio.feature.hifi_audio.enable=false \
    vendor.audio.feature.keep_alive.enable=false \
    vendor.audio.feature.ras.enable=true \
    vendor.audio.feature.record_play_concurency.enable=false \
    vendor.audio.feature.src_trkn.enable=true \
    vendor.audio.feature.ssrec.enable=true \
    vendor.audio.feature.usb_offload_burst_mode.enable=false \
    vendor.audio.feature.usb_offload_sidetone_volume.enable=false \
    vendor.audio.feature.vbat.enable=true \
    vendor.audio.feature.wsa.enable=false

# AudioPolicy Manager
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.video=1

# AudioFlinger
PRODUCT_PROPERTY_OVERRIDES += \
    ro.af.client_heap_size_kbyte=7168

# Enable stats logging in LMKD
TARGET_LMKD_STATS_LOG := true
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lmk.log_stats=true

# Set lmkd options
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lmk.low=1001 \
    ro.lmk.medium=800 \
    ro.lmk.critical=0 \
    ro.lmk.critical_upgrade=false \
    ro.lmk.upgrade_pressure=100 \
    ro.lmk.downgrade_pressure=100 \
    ro.lmk.kill_heaviest_task=true \
    ro.lmk.kill_timeout_ms=100 \
    ro.lmk.use_minfree_levels=true

# Property to enable user to access Google WFD settings.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=0

# Property to choose between virtual/external wfd display
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.wfd.virtual=0

# Display properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.demo.hdmirotationlock=false \
    vendor.display.disable_inline_rotator=1 \
    vendor.display.enable_null_display=0 \
    vendor.display.enable_default_color_mode=1 \
    vendor.display.disable_ui_3d_tonemap=1

# Wi-Fi interface name
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# BT address
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.bt.bdaddr_path=/data/vendor/bluetooth/bluetooth_bdaddr

# BT address for devices with BCM BT
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/data/vendor/bluetooth/bluetooth_bdaddr

# RILD
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.rild.libpath=/odm/lib64/libril-qc-hal-qmi.so \
    ril.subscription.types=NV,RUIM

# OpenGLES version
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610

# Vendor version
PRODUCT_PROPERTY_OVERRIDES += \
    ro.odm.expect.version=$(PLATFORM_VERSION)_$(SOMC_KERNEL_VERSION)_$(SOMC_PLATFORM)_$(TARGET_VENDOR_VERSION)

# Perform color transform on the client
PRODUCT_PROPERTY_OVERRIDES += \
    persist.hwc2.skip_client_color_transform=false

# Avoid Adoptable double encryption
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.allow_encrypt_override=true

# Reduce cost of scrypt for FBE CE decryption
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.scrypt_params=15:3:1

# Look for vulkan.qcom.so instead of vulkan.$(BOARD_TARGET_PLATFORM).so
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.vulkan=qcom

# Disable Compressed APEX on 4.14 kernel as Android 12 enforces it and our kernel is not compatible (yet)
ifeq ($(SOMC_KERNEL_VERSION), 4.14)
OVERRIDE_PRODUCT_COMPRESSED_APEX := false
endif
EOF

    # --------------------------------------------------------------------------------------------------
    # 4.3 POST-UPDATE PLATFORM FLAGS
    # --------------------------------------------------------------------------------------------------

    echo ""
    echo "PATCHING KUMANO platform.MK..."
    cat <<\EOF >~/dios/device/sony/kumano/platform.mk
# Platform path
PLATFORM_COMMON_PATH := device/sony/kumano

MSMNILE := sm8150

SOMC_PLATFORM := kumano
SOMC_KERNEL_VERSION := 4.19

PRODUCT_PLATFORM_SOD := true

TARGET_BOARD_PLATFORM := $(MSMNILE)

SONY_ROOT := $(PLATFORM_COMMON_PATH)/rootdir

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(PLATFORM_COMMON_PATH)/overlay

# RIL
TARGET_PER_MGR_ENABLED := true

TARGET_VIBRATOR_V1_2 := true

TARGET_PD_SERVICE_ENABLED := true

# Wi-Fi definitions for Qualcomm solution
WIFI_DRIVER_BUILT := qca_cld3
WIFI_DRIVER_DEFAULT := qca_cld3
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
HOSTAPD_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
TARGET_USES_ICNSS_QMI := true
WIFI_DRIVER_STATE_CTRL_PARAM := "/sys/kernel/boot_wlan/boot_wlan"
WIFI_DRIVER_STATE_OFF := 0
WIFI_DRIVER_STATE_ON := 1

# BT definitions for Qualcomm solution
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
TARGET_USE_QTI_BT_STACK := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_COMMON_PATH)/bluetooth
WCNSS_FILTER_USES_SIBS := true

# NFC
NXP_CHIP_FW_TYPE := PN557

# Audio
BOARD_SUPPORTS_SOUND_TRIGGER := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_HDMI_EDID := true
AUDIO_FEATURE_ENABLED_HDMI_PASSTHROUGH := true
AUDIO_FEATURE_ENABLED_DISPLAY_PORT := true
AUDIO_FEATURE_ENABLED_USB_BURST_MODE := true

# Display
TARGET_HAS_HDR_DISPLAY := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USES_DRM_PP := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2

# Lights HAL: Backlight
TARGET_USES_SDE := true

# A/B support
AB_OTA_UPDATER := true
PRODUCT_SHIPPING_API_LEVEL := 26

# A/B OTA dexopt package
PRODUCT_PACKAGES += \
    otapreopt_script

# A/B OTA dexopt update_engine hookup
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# A/B related packages
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_client \
    update_engine_sideload \
    update_verifier

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    vendor \
    vbmeta

# Treble
# Include vndk/vndk-sp/ll-ndk modules
PRODUCT_PACKAGES += \
    vndk_package

# Device Specific Permissions
PRODUCT_COPY_FILES += \
     frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
     frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
     frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
     frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

# Audio
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    $(SONY_ROOT)/vendor/etc/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(SONY_ROOT)/vendor/etc/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt \
    $(SONY_ROOT)/vendor/etc/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(SONY_ROOT)/vendor/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(SONY_ROOT)/vendor/etc/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml

# Audio - Separation between plain AOSP configuration and extended CodeAurora Audio HAL features
AUDIO_HAL_TYPE := $(if $(filter true,$(TARGET_USES_AOSP_AUDIO_HAL)),aosp,caf)
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/$(AUDIO_HAL_TYPE)_common_primary_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/common_primary_audio_policy_configuration.xml

# Audio - IO policy containing audio_extn configuration
ifneq ($(TARGET_USES_AOSP_AUDIO_HAL),true)
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf
endif

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(SONY_ROOT)/vendor/etc/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(SONY_ROOT)/vendor/etc/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(SONY_ROOT)/vendor/etc/system_properties.xml:$(TARGET_COPY_OUT_VENDOR)/etc/system_properties.xml

# Qualcom WiFi Overlay
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(SONY_ROOT)/vendor/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf

# Qualcom WiFi Configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini

# NFC Configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf

# Touch IDC
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/usr/idc/sec_touchscreen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/sec_touchscreen.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/usr/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# FPC Gestures
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/usr/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    $(SONY_ROOT)/vendor/usr/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# RQBalance-PowerHAL configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/rqbalance_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/rqbalance_config.xml

# DPM config
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/dpm/dpm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/dpm/dpm.conf

# CAMX config
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/camera/camxoverridesettings.txt:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camxoverridesettings.txt

# Platform specific init
PRODUCT_PACKAGES += \
    tad.rc \
    init.kumano \
    init.kumano.pwr \
    ueventd

# modemswitcher
PRODUCT_PACKAGES += \
    vendor.somc.hardware.modemswitcher@1.0-service.rc \
    init.sony-modem-switcher.rc

# CDSP init
PRODUCT_PACKAGES += \
    init.qcom.cdspstart.sh \
    cdsprpcd.rc

# Audio init
PRODUCT_PACKAGES += \
    audiopd.rc

# Audio
PRODUCT_PACKAGES += \
    sound_trigger.primary.sm8150 \
    audio.primary.sm8150

# GFX
PRODUCT_PACKAGES += \
    copybit.sm8150 \
    gralloc.sm8150 \
    hwcomposer.sm8150 \
    memtrack.sm8150

# Keymaster 4 passthrough service init file
# (executable is on odm)
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0-service-qti.rc \
    android.hardware.keymaster@4.1.vendor

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.keymaster.version=v4

DEVICE_MANIFEST_FILE += $(PLATFORM_COMMON_PATH)/vintf/android.hw.keymaster_v4.xml

# GPS
PRODUCT_PACKAGES += \
    gps.sm8150

# Sensors init
PRODUCT_PACKAGES += \
    sscrpcd.rc \
    sdsp-sensorspdr.rc

# Sensors
# hardware.ssc.so links against display mappers, of which
# the interface libraries are explicitly included here:
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.multihal \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor

# Sensors
PRODUCT_PACKAGES += \
    sns_reg_config \
    hals.conf

# SSC Common config
PRODUCT_PACKAGES += \
    ak991x_dri_0.json \
    bma2x2_0.json \
    bme680_0.json \
    bmg160_0.json \
    bmp285_0.json \
    bmp380_0.json \
    bu52053nvx_0.json \
    cm3526_0.json \
    default_sensors.json \
    dps368_0.json \
    lsm6dsm_0_16g.json \
    lsm6dsm_0.json \
    lsm6dso_0_16g.json \
    lsm6dso_0.json \
    shtw2_0.json \
    sns_amd.json \
    sns_amd_sw_disabled.json \
    sns_amd_sw_enabled.json \
    sns_aont.json \
    sns_basic_gestures.json \
    sns_bring_to_ear.json \
    sns_ccd.json \
    sns_cm.json \
    sns_dae.json \
    sns_device_orient.json \
    sns_diag_filter.json \
    sns_distance_bound.json \
    sns_dpc.json \
    sns_facing.json \
    sns_fmv.json \
    sns_geomag_rv.json \
    sns_gyro_cal.json \
    sns_mag_cal.json \
    sns_multishake.json \
    sns_pedometer.json \
    sns_rmd.json \
    sns_rotv.json \
    sns_smd.json \
    sns_tilt.json \
    sns_tilt_sw_disabled.json \
    sns_tilt_sw_enabled.json \
    sns_tilt_to_wake.json \
    tmd2725.json \
    tmd3725.json \
    tmx4903.json

# Platform SSC Sensors
PRODUCT_PACKAGES += \
    msmnile_ak991x_0.json \
    msmnile_bme680_0.json \
    msmnile_bmp380_0.json \
    msmnile_bu52053nvx_0.json \
    msmnile_cm3526_0.json \
    msmnile_dps368_0.json \
    msmnile_hdk_ak991x_0.json \
    msmnile_hdk_lsm6dso_0.json \
    msmnile_hdk_tmd2725.json \
    msmnile_irq.json \
    msmnile_lsm6dsm_0.json \
    msmnile_lsm6dso_0.json \
    msmnile_power_0.json \
    msmnile_qrd_2_lsm6dso_0.json \
    msmnile_qrd_ak991x_0.json \
    msmnile_qrd_lsm6dso_0.json \
    msmnile_qrd_tmd2725.json \
    msmnile_shtw2_0.json \
    msmnile_tmd2725.json \
    msmnile_tmd3725.json

# CAMERA
TARGET_USES_64BIT_CAMERA := true

# Look for camera.qcom.so instead of camera.$(BOARD_TARGET_PLATFORM).so
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.camera=qcom

# QCOM Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl-qti \
    android.hardware.bluetooth@1.0-service-qti

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcom.bluetooth.soc=cherokee

# Legacy BT property (will be removed in S)
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=cherokee

# Audio - QCOM HAL
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.feature.compress_in.enable=true \
    vendor.audio.feature.display_port.enable=true \
    vendor.audio.feature.hdmi_edid.enable=true \
    vendor.audio.feature.hdmi_passthrough.enable=true \

# USB controller setup
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.controller=a600000.dwc3 \
    sys.usb.rndis.func.name=gsi

#WiFi MAC address path
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.wifi.addr_path=/data/vendor/wifi/wlan_mac.bin

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.disable_scaler=0

# Display - HDR/WCG
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.dataspace_saturation_matrix=1.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,1.0 \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=2 \
    ro.surface_flinger.wcg_composition_dataspace=143261696

# IWLAN
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.iwlan_operation_mode=legacy

$(call inherit-product, device/sony/common/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
EOF
}

# --------------------------------------------------------------------------------------------------
# 5. REPO SYNC AND UPDATE
# --------------------------------------------------------------------------------------------------

_repo_update() {
    if $_update; then
        echo ""
        echo "REPO SYNC AND REPO UPDATE..."
        echo ""
        repo sync -j$(nproc) && ./repo_update.sh -j$(nproc)
    fi
}

# --------------------------------------------------------------------------------------------------
# 6. CLEANING OUTPUT
# --------------------------------------------------------------------------------------------------

_cleaning() {
    if $_clean; then
        echo ""
        echo "CLEANING /out"
        make installclean -j$(nproc)
    fi
}

# --------------------------------------------------------------------------------------------------
# 7. PIXEL CONTENT
# --------------------------------------------------------------------------------------------------

_pixel_fork() {
    if ! $_clean; then
        echo ""
        echo "FORKING PIXEL FIRMWARE..."
        for dir in $FORK_DIR $DOWNLOAD_DIR; do
            if [ ! -d $dir ]; then
                mkdir $dir
            fi
        done

        if [ ! -f $IMAGE_FILE ]; then
            pushd $DOWNLOAD_DIR
            wget https://dl.google.com/dl/android/aosp/$IMAGE_NAME
            popd
        fi

        if [ -d $TMP ]; then
            sudo rm -rf $TMP
        fi
        mkdir -p $TMP

        pushd $TMP
        sudo unzip -p $IMAGE_FILE "*/image*" >image.zip
        sudo unzip image.zip product.img system.img vendor.img system_ext.img

        simg2img product.img product.raw
        mkdir product
        sudo mount -o ro product.raw product

        simg2img system.img system.raw
        mkdir system
        sudo mount -o ro system.raw system

        simg2img vendor.img vendor.raw
        mkdir vendor
        sudo mount -o ro vendor.raw vendor

        simg2img system_ext.img system_ext.raw
        mkdir system_ext
        sudo mount -o ro system_ext.raw system_ext

        wait
        echo ""
        echo "PREPARING PIXEL FIRMWARE..."

        cp -r $PRODUCT $FORK_DIR || true
        #cp -apr $SYSTEM $FORK_DIR || true
        cp -r $SYSTEM_EXT $FORK_DIR || true
        #cp -apr $VENDOR $FORK_DIR || true
        rm -rf $FORK_DIR/product/etc/build.prop || true
        rm -rf $FORK_DIR/product/etc/init || true
        rm -rf $FORK_DIR/product/etc/security || true
        rm -rf $FORK_DIR/product/etc/selinux || true
        rm -rf $FORK_DIR/product/etc/vintf || true
        rm -rf $FORK_DIR/product/overlay/GoogleConfigOverlay.apk || true
        rm -rf $FORK_DIR/product/overlay/PixelConfigOverlayCommon.apk || true
        rm -rf $FORK_DIR/product/overlay/SettingsOverlayG5NZ6.apk || true
        rm -rf $FORK_DIR/product/overlay/SettingsOverlayGD1YQ.apk || true
        rm -rf $FORK_DIR/product/overlay/SettingsOverlayGTT9Q.apk || true
        rm -rf $FORK_DIR/product/overlay/SystemUIGoogle__auto_generated_rro_product.apk || true
        rm -rf $FORK_DIR/product/priv-app/PrebuiltGmsCore || true
        rm -rf $FORK_DIR/product/priv-app/SetupWizardPrebuilt || true
        rm -rf $FORK_DIR/system_ext/app/com.qualcomm.qti.services.secureui || true
        rm -rf $FORK_DIR/system_ext/bin || true
        rm -rf $FORK_DIR/system_ext/etc/init || true
        rm -rf $FORK_DIR/system_ext/etc/perf || true
        rm -rf $FORK_DIR/system_ext/etc/permissions/com.qti.dpmframework.xml || true
        rm -rf $FORK_DIR/system_ext/etc/permissions/com.qti.media.secureprocessor.xml || true
        rm -rf $FORK_DIR/system_ext/etc/permissions/com.qualcomm.qcrilmsgtunnel.xml || true
        rm -rf $FORK_DIR/system_ext/etc/permissions/com.qualcomm.qti.imscmservice-V2.0-java.xml || true
        rm -rf $FORK_DIR/system_ext/etc/permissions/com.qualcomm.qti.imscmservice-V2.1-java.xml || true
        rm -rf $FORK_DIR/system_ext/etc/permissions/com.qualcomm.qti.imscmservice-V2.2-java.xml || true
        rm -rf $FORK_DIR/system_ext/etc/security || true
        rm -rf $FORK_DIR/system_ext/etc/selinux || true
        rm -rf $FORK_DIR/system_ext/etc/vintf || true
        rm -rf $FORK_DIR/system_ext/framework || true
        rm -rf $FORK_DIR/system_ext/lib || true
        rm -rf $FORK_DIR/system_ext/lib64 || true
        rm -rf $FORK_DIR/system_ext/lost+found || true
        rm -rf $FORK_DIR/system_ext/priv-app/ConnectivityThermalPowerManager || true
        rm -rf $FORK_DIR/system_ext/priv-app/grilservice || true
        rm -rf $FORK_DIR/system_ext/priv-app/ims || true
        rm -rf $FORK_DIR/system_ext/priv-app/qcrilmsgtunnel || true
        rm -rf $FORK_DIR/system_ext/priv-app/RilConfigService || true
        rm -rf $FORK_DIR/system_ext/priv-app/SystemUIGoogle || true
        rm -rf $FORK_DIR/system/system/etc/build.prop || true
        rm -rf $FORK_DIR/system/system/etc/init || true
        rm -rf $FORK_DIR/system/system/etc/security || true
        rm -rf $FORK_DIR/system/system/etc/selinux || true
        rm -rf $FORK_DIR/system/system/etc/vintf || true
        rm -rf $FORK_DIR/system/system/product || true
        rm -rf $FORK_DIR/system/system/system_ext || true
        rm -rf $FORK_DIR/system/system/vendor || true
        rm -rf $FORK_DIR/vendor/etc/init || true
        rm -rf $FORK_DIR/vendor/etc/security || true
        rm -rf $FORK_DIR/vendor/etc/selinux || true
        rm -rf $FORK_DIR/vendor/etc/vintf || true

        wait

        sudo umount product
        sudo umount system
        sudo umount vendor
        sudo umount system_ext
        popd

        rm -rf $TMP
    fi
}

# --------------------------------------------------------------------------------------------------
# 8. MAKE OPTIONS
# --------------------------------------------------------------------------------------------------

_make() {
    wait
    echo ""
    echo "START BUILDING DIOS"
    sudo mount --bind /home/$USERNAME/.ccache /mnt/ccache
    make -j$(nproc)
    rm -rf $FORK_DIR || true
}

# --------------------------------------------------------------------------------------------------
# 9. FLASHING OUTPUT
# --------------------------------------------------------------------------------------------------

_flash() {
    read -p "FLASHING TO A 2019 XPERIA?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo ./fastboot flash boot_a $OUT/boot.img
        sudo ./fastboot flash boot_b $OUT/boot.img
        sudo ./fastboot flash dtbo_a $OUT/dtbo.img
        sudo ./fastboot flash dtbo_b $OUT/dtbo.img
        sudo ./fastboot flash system_a $OUT/system.img
        sudo ./fastboot flash system_b $OUT/system.img
        sudo ./fastboot flash userdata $OUT/userdata.img
        sudo ./fastboot flash vbmeta_a $OUT/vbmeta.img
        sudo ./fastboot flash vbmeta_b $OUT/vbmeta.img
        sudo ./fastboot flash vendor_a $OUT/vendor.img
        sudo ./fastboot flash vendor_b $OUT/vendor.img
        sleep 5
        sudo ./fastboot reboot
        exit
    fi

    read -p "FLASHING TO A 2020 XPERIA?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo ./fastboot flash boot $OUT/boot.img
        sudo ./fastboot flash dtbo $OUT/dtbo.img
        sudo ./fastboot flash product $OUT/product.img
        sudo ./fastboot flash recovery $OUT/recovery.img
        sudo ./fastboot flash system $OUT/system.img
        sudo ./fastboot flash system_ext $OUT/system_ext.img
        sudo ./fastboot flash userdata $OUT/userdata.img
        sudo ./fastboot flash vbmeta $OUT/vbmeta.img
        sudo ./fastboot flash vbmeta_system $OUT/vbmeta_system.img
        sudo ./fastboot flash vendor $OUT/vendor.img
        sudo ./fastboot flash vendor_boot $OUT/vendor_boot.img
        sleep 5
        sudo ./fastboot reboot
        exit
    fi

    read -p "FLASHING TO A 2021 XPERIA?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo ./fastboot flash boot $OUT/boot.img
        sudo ./fastboot flash dtbo $OUT/dtbo.img
        sudo ./fastboot flash product $OUT/product.img
        sudo ./fastboot flash recovery $OUT/recovery.img
        sudo ./fastboot flash system $OUT/system.img
        sudo ./fastboot flash system_ext $OUT/system_ext.img
        sudo ./fastboot flash userdata $OUT/userdata.img
        sudo ./fastboot flash vbmeta $OUT/vbmeta.img
        sudo ./fastboot flash vbmeta_system $OUT/vbmeta_system.img
        sudo ./fastboot flash vendor $OUT/vendor.img
        sudo ./fastboot flash vendor_boot $OUT/vendor_boot.img
        sleep 5
        sudo ./fastboot reboot
        exit
    fi
}

# --------------------------------------------------------------------------------------------------
# 10. BUILD STEPS
# --------------------------------------------------------------------------------------------------

_build() {
    _post_update
    _pixel_fork
    _cleaning
    _repo_update
    _make
    _flash
}

# --------------------------------------------------------------------------------------------------
# 11. SETTING OPTIONS
# --------------------------------------------------------------------------------------------------

declare _shell_script=${0##*/}
declare _clean="false"
declare _update="false"

while (("$#")); do
    case $1 in
    -c | --clean)
        _clean="true"
        shift
        ;;
    -u | --update)
        _update="true"
        shift
        ;;
    -h | --help)
        _show_help
        exit 0
        ;;
    *)
        echo "OPTION: $1 FAILED! USE: $_shell_script -h FOR HELP..."
        exit 1
        ;;
    esac
done

# --------------------------------------------------------------------------------------------------
# 0. BUILD OR INIT
# --------------------------------------------------------------------------------------------------

if [ -d $DIOS_DIR ]; then
    cd ~/dios

    set +u
    . build/envsetup.sh
    lunch $LUNCH_CHOICE
    declare _device=$(get_build_var PRODUCT_DEVICE 2>/dev/null)
    declare _platform=$(get_build_var PRODUCT_PLATFORM 2>/dev/null)
    set -u

    _build
else
    _init_dios
fi
