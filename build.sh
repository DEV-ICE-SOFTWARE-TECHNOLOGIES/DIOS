#!/bin/bash
set -eu
# ----------------------------------------------------------------------
# D!OS SCRIPT VERSION: 220513.2
# ----------------------------------------------------------------------
# CREDITS TO PAUL, THE RANDOM SONY OPEN DEVELOPER GUY!
# IT WAS A STONY PATH BUT YOU HELPED ME TO PASS IT! <3
# ALSO THANKS TO ALL OTHER SUPPORTERS AND TESTER FOR YOUR HELP! <3
# YOU OPENED A NEW CHAPTER OF ANDROID WITH ME...
# ----------------------------------------------------------------------
# MADE BY MARIUS KOPP (M1U5T0N3) WITH MUCH LOVE AND SWEAT...
# ----------------------------------------------------------------------
# 1. VARIABLES
# ----------------------------------------------------------------------

DOWNLOAD_DIR=~/dios/device/sony/dios/pixel
EMAIL=mariuskopp517@gmail.com
FORK_DIR=~/dios/device/sony/dios/fork
IMAGE_NAME=redfin-sp2a.220505.002-factory-7fe11c77.zip
IMAGE_FILE=$DOWNLOAD_DIR/$IMAGE_NAME
TMP=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)
PRODUCT=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)/product
VENDOR=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)/vendor
SYSTEM=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)/system
SYSTEM_EXT=~/dios/device/sony/dios/tmp/$(basename $IMAGE_NAME .zip)/system_ext
NAME=M1U5T0N3
SOURCE=~/dios
USERNAME=~/miustone

# ----------------------------------------------------------------------
# 2. HELP
# ----------------------------------------------------------------------

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

# ----------------------------------------------------------------------
# 3. INITIALIZING
# ----------------------------------------------------------------------

_init_dios() {
    sudo apt-get purge openjdk-* icedtea-* icedtea6-* || true
    sudo apt-get update
    sudo apt-get install openjdk-11-jdk
    sudo apt-get install bison g++-multilib git gperf libxml2-utils make zlib1g-dev zip liblz4-tool libncurses5 libssl-dev bc flex curl python-is-python3 ccache simg2img aapt

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

    <!-- DIOS -->
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
    <remove-project name="platform/packages/apps/Stk" />
    <remove-project name="platform/packages/apps/StorageManager" />
    <remove-project name="platform/packages/apps/WallpaperPicker" />
    <remove-project name="platform/packages/apps/WallpaperPicker2" />
    <remove-project name="platform/external/chromium-webview" />
    <remove-project name="platform/packages/apps/ThemePicker" />
    <remove-project name="platform/packages/inputmethods/LatinIME" />
    <remove-project name="platform/packages/inputmethods/LeanbackIME" />
	
</manifest>
EOF
    mkdir -p ~/dios/device/sony/dios
    cat <<\EOF >~/dios/device/sony/dios/Android.mk
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
$(shell cp -rf $(LOCAL_PATH)/dios/fork/system/system/* `pwd`/$(TARGET_OUT_SYSTEM)/)
$(shell cp -rf $(LOCAL_PATH)/dios/fork/system_ext/* `pwd`/$(TARGET_OUT_SYSTEM_EXT)/)
$(shell cp -rf $(LOCAL_PATH)/dios/fork/product/* `pwd`/$(TARGET_OUT_PRODUCT)/)
$(shell cp -rf $(LOCAL_PATH)/dios/fork/vendor/* `pwd`/$(TARGET_OUT_VENDOR)/)
EOF
    repo sync -j$(nproc) && ./repo_update.sh -j$(nproc)
    echo ""
    echo "PREPARED! RESTART THE SCRIPT TO START BUILDING..."
    exit
}

# ----------------------------------------------------------------------
# 4. POST-UPDATE FLAGS
# ----------------------------------------------------------------------

_post_update() {
    if $_aosp; then
        echo ""
        echo "AOSP BUILD FLAGS..."
        cat <<\EOF >~/dios/device/sony/dios/dios.mk
BOARD_USE_ENFORCING_SELINUX := true
EOF
    else
        echo ""
        echo "DIOS BUILD FLAGS..."

        cat <<\EOF >~/dios/.repo/local_manifests/gapps.xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<remote name="MindTheGapps" fetch="https://gitlab.com/MindTheGapps/" />
<project path="vendor/gapps" name="vendor_gapps" remote="MindTheGapps" revision="sigma" />
</manifest>
EOF

        cat <<\EOF >~/dios/device/sony/dios/dios.mk
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

WITH_DEXPREOPT := true

include vendor/gapps/arm64/arm64-vendor.mk

        PRODUCT_PROPERTY_OVERRIDES += \
ro.control_privapp_permissions=log \
ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural;com.google.android.systemui.gxoverlay \
ro.setupwizard.enterprise_mode=1 \
ro.setupwizard.esim_cid_ignore=00000001 \
setupwizard.feature.baseline_setupwizard_enabled=true \
setupwizard.feature.show_pai_screen_in_main_flow.carrier1839=false \
setupwizard.feature.skip_button_use_mobile_data.carrier1839=true \
setupwizard.theme=glif_v3_light \
ro.com.google.ime.theme_id=5 \
ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms \
setupwizard.feature.show_pixel_tos=true \
ro.llkd.enable=false \
ro.storage_manager.show_opt_in=false \
setupwizard.feature.show_support_link_in_deferred_setup=false \
ro.carriersetup.vzw_consent_page=true \
ro.setupwizard.rotation_locked=true \
setupwizard.feature.device_default_dark_mode=true
EOF
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
    persist.vendor.data.mode=concurrent \
    persist.data.netmgrd.qos.enable=true \
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
    persist.vendor.cne.feature=1

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
    persist.dbg.vt_avail_ovr=1  \
    persist.dbg.wfc_avail_ovr=1

# Modem properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.wait_for_pbm=1 \
    persist.vendor.radio.mt_sms_ack=19 \
    persist.vendor.radio.enableadvancedscan=true \
    persist.vendor.radio.unicode_op_names=true \
    persist.vendor.radio.sib16_support=1 \
    persist.vendor.radio.oem_socket=true

# Ringer
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=false

# System props for telephony System prop to turn on CdmaLTEPhone always
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnCdmaDevice=0

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
    media.aac_51_output_enabled=true \
    ro.config.media_vol_steps=25 \
    ro.config.vc_call_vol_steps=7

# Audio (AOSP HAL)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.fluence.speaker=true \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicecomm=true \
    persist.audio.fluence.voicerec=true \
    ro.qc.sdk.audio.fluencetype=fluence

# Audio (newer CAF HALs)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.audio.fluence.speaker=true \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicecomm=true \
    persist.vendor.audio.fluence.voicerec=true \
    ro.vendor.audio.sdk.fluencetype=fluence \
    vendor.audio_hal.in_period_size=144 \
    vendor.audio_hal.period_multiplier=3 \
    vendor.audio_hal.period_size=192 \
    vendor.audio.offload.gapless.enabled=true \
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
    vendor.audio.feature.audiozoom.enable=false \
    vendor.audio.feature.battery_listener.enable=false \
    vendor.audio.feature.compr_cap.enable=false \
    vendor.audio.feature.compress_meta_data.enable=true \
    vendor.audio.feature.deepbuffer_as_primary.enable=false \
    vendor.audio.feature.dsm_feedback.enable=false \
    vendor.audio.feature.ext_hw_plugin.enable=false \
    vendor.audio.feature.external_dsp.enable=false \
    vendor.audio.feature.external_speaker_tfa.enable=false \
    vendor.audio.feature.external_speaker.enable=false \
    vendor.audio.feature.fluence.enable=true \
    vendor.audio.feature.fm.enable=true \
    vendor.audio.feature.hfp.enable=true \
    vendor.audio.feature.hifi_audio.enable=false \
    vendor.audio.feature.hwdep_cal.enable=false \
    vendor.audio.feature.incall_music.enable=false \
    vendor.audio.feature.keep_alive.enable=false \
    vendor.audio.feature.maxx_audio.enable=false \
    vendor.audio.feature.multi_voice_session.enable=true \
    vendor.audio.feature.ras.enable=true \
    vendor.audio.feature.record_play_concurency.enable=false \
    vendor.audio.feature.snd_mon.enable=true \
    vendor.audio.feature.spkr_prot.enable=true \
    vendor.audio.feature.src_trkn.enable=true \
    vendor.audio.feature.ssrec.enable=true \
    vendor.audio.feature.usb_offload_burst_mode.enable=false \
    vendor.audio.feature.usb_offload_sidetone_volume.enable=false \
    vendor.audio.feature.usb_offload.enable=true \
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
    persist.sys.sf.color_saturation=1.0 \
    vendor.display.disable_inline_rotator=1 \
    vendor.display.enable_null_display=0 \
    vendor.display.disable_excl_rect=0 \
    vendor.display.comp_mask=0 \
    vendor.display.enable_default_color_mode=1 \
    vendor.display.enable_optimize_refresh=1 \
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
    fi
}

# ----------------------------------------------------------------------
# 5. REPO SYNC AND UPDATE
# ----------------------------------------------------------------------

_repo_update() {
    if $_update; then
        echo ""
        echo "REPO SYNC AND REPO UPDATE..."
        echo ""
        repo sync -j$(nproc) && ./repo_update.sh -j$(nproc)
    fi
}

# ----------------------------------------------------------------------
# 6. CLEANING OUTPUT
# ----------------------------------------------------------------------

_cleaning() {
    if $_clean; then
        echo ""
        echo "CLEANING /out"
        make installclean -j$(nproc)
    fi
}

# ----------------------------------------------------------------------
# 7. PIXEL CONTENT
# ----------------------------------------------------------------------

_pixel_fork() {
    if ! $_aosp; then
        echo ""
        echo "FORKING PIXEL FIRMWARE..."
        echo ""
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
        rm -rf $FORK_DIR/product/overlay/GoogleConfigOverlay.apk || true
        rm -rf $FORK_DIR/product/overlay/PixelConfigOverlayCommon.apk || true
        rm -rf $FORK_DIR/product/priv-app/PrebuiltGmsCore || true
        rm -rf $FORK_DIR/product/priv-app/SetupWizardPrebuilt || true
        rm -rf $FORK_DIR/system_ext/bin || true
        rm -rf $FORK_DIR/system_ext/etc/build.prop || true
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

        rm -rfv $TMP
    fi
}

# ----------------------------------------------------------------------
# 8. MAKE OPTIONS
# ----------------------------------------------------------------------

_make() {
    if $_aosp; then
        echo ""
        echo "START BUILDING AOSP"
        sudo mount --bind $USERNAME/.ccache /mnt/ccache
        make -j$(nproc)
    else
        wait
        echo ""
        echo "START BUILDING DIOS"
        sudo mount --bind $USERNAME/.ccache /mnt/ccache
        make -j$(nproc)
        rm -rf ~/dios/device/sony/dios/fork || true
    fi
}

# ----------------------------------------------------------------------
# 9. FLASHING OUTPUT
# ----------------------------------------------------------------------

_flash() {
    read -p "FLASHING TO A 2019 XPERIA?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo ./fastboot flash boot_a $OUT_MAIN/boot.img
        sudo ./fastboot flash boot_b $OUT_MAIN/boot.img
        sudo ./fastboot flash dtbo_a $OUT_MAIN/dtbo.img
        sudo ./fastboot flash dtbo_b $OUT_MAIN/dtbo.img
        sudo ./fastboot flash system_a $OUT_MAIN/system.img
        sudo ./fastboot flash system_b $OUT_MAIN/system.img
        sudo ./fastboot flash userdata $OUT_MAIN/userdata.img
        sudo ./fastboot flash vbmeta_a $OUT_MAIN/vbmeta.img
        sudo ./fastboot flash vbmeta_b $OUT_MAIN/vbmeta.img
        sudo ./fastboot flash vendor_a $OUT_MAIN/vendor.img
        sudo ./fastboot flash vendor_b $OUT_MAIN/vendor.img
        sleep 5
        sudo ./fastboot reboot
        exit
    fi

    read -p "FLASHING TO A 2020 XPERIA?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo ./fastboot flash boot $OUT_MAIN/boot.img
        sudo ./fastboot flash dtbo $OUT_MAIN/dtbo.img
        sudo ./fastboot flash product $OUT_MAIN/product.img
        sudo ./fastboot flash recovery $OUT_MAIN/recovery.img
        sudo ./fastboot flash system $OUT_MAIN/system.img
        sudo ./fastboot flash system_ext $OUT_MAIN/system_ext.img
        sudo ./fastboot flash userdata $OUT_MAIN/userdata.img
        sudo ./fastboot flash vbmeta $OUT_MAIN/vbmeta.img
        sudo ./fastboot flash vbmeta_system $OUT_MAIN/vbmeta_system.img
        sudo ./fastboot flash vendor $OUT_MAIN/vendor.img
        sudo ./fastboot flash vendor_boot $OUT_MAIN/vendor_boot.img
        sleep 5
        sudo ./fastboot reboot
        exit
    fi

    read -p "FLASHING TO A 2021 XPERIA?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo ./fastboot flash boot $OUT_MAIN/boot.img
        sudo ./fastboot flash dtbo $OUT_MAIN/dtbo.img
        sudo ./fastboot flash product $OUT_MAIN/product.img
        sudo ./fastboot flash recovery $OUT_MAIN/recovery.img
        sudo ./fastboot flash system $OUT_MAIN/system.img
        sudo ./fastboot flash system_ext $OUT_MAIN/system_ext.img
        sudo ./fastboot flash userdata $OUT_MAIN/userdata.img
        sudo ./fastboot flash vbmeta $OUT_MAIN/vbmeta.img
        sudo ./fastboot flash vbmeta_system $OUT_MAIN/vbmeta_system.img
        sudo ./fastboot flash vendor $OUT_MAIN/vendor.img
        sudo ./fastboot flash vendor_boot $OUT_MAIN/vendor_boot.img
        sleep 5
        sudo ./fastboot reboot
        exit
    fi
}

# ----------------------------------------------------------------------
# 10. BUILD STEPS
# ----------------------------------------------------------------------

_build() {
    _post_update
    _repo_update
    _pixel_fork
    _init_gapps
    _cleaning
    _make
    _flash
}

# ----------------------------------------------------------------------
# 11. SETTING OPTIONS
# ----------------------------------------------------------------------

declare _shell_script=${0##*/}
declare _aosp="false"
declare _clean="false"
declare _update="false"

while (("$#")); do
    case $1 in
    -a | --aosp)
        _aosp="true"
        shift
        ;;
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

# ----------------------------------------------------------------------
# 0. BUILD OR INIT
# ----------------------------------------------------------------------

if [ -d ~/dios/device/sony/dios ]; then
    cd $SOURCE

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
