#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/generic/goldfish ]; then
    mkdir -p ~/dios/device/generic/goldfish
fi

echo ""
echo "D!OS VENDOR MK..."
echo ""
if [ ! -d ~/dios/backups/device/generic/goldfish ]; then
     mkdir -p ~/dios/backups/device/generic/goldfish
fi
cp -afnrp ~/dios/device/generic/goldfish/vendor.mk ~/dios/backups/device/generic/goldfish
cat <<\EOF >~/dios/device/generic/goldfish/vendor.mk
# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

include $(CLEAR_VARS)

DONT_DEXPREOPT_PREBUILTS := false
WITH_DEXPREOPT := true

PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    NexusLauncherRelease
    
PRODUCT_SYSTEM_PROPERTIES += \
aaudio.mmap_exclusive_policy=2 \
aaudio.mmap_policy=2 \
af.fast_track_multiplier=1 \
af.resampler.quality=5 \
audio_hal.period_size=192 \
audio.adm.buffering.ms=5 \
audio.deep_buffer.media=true \
audio.dolby.ds2.enabled=false \
audio.dolby.ds2.hardbypass=false \
audio.heap.size.multiplier=1 \
audio.hifi_rec.concert_gain=-140 \
audio.hifi_rec.concert_lcf=0 \
audio.hifi_rec.concert_lmt=0 \
audio.hifi_rec.normal_gain=0 \
audio.hifi_rec.normal_lcf=75 \
audio.hifi_rec.normal_lmt=0 \
audio.hifi_rec.offset_gain=39 \
audio.legacy.postproc=false \
audio.noisy.broadcast.delay=600 \
audio.offload.16bit.enable=1 \
audio.offload.24bit.enable=1 \
audio.offload.32bit.enable=1 \
audio.offload.buffer.size.kb=1024 \
audio.offload.disable=0 \
audio.offload.gapless.enabled=true \
audio.offload.min.duration.secs=1 \
audio.offload.multiaac.enable=true \
audio.offload.multiple.enabled=true \
audio.offload.passthrough=true \
audio.offload.pcm.16bit.enable=true \
audio.offload.pcm.24bit.enable=true \
audio.offload.pcm.32bit.enable=true \
audio.offload.pcm.enable=true \
audio.offload.pstimeout.secs=1 \
audio.offload.track.enable=true \
audio.offload.video=1 \
audio.pp.asphere.enabled=true \
audio.safemedia.force=false \
audio.safx.pbe.enabled=true \
audio.snd_card.open.retries=50 \
audio.sys.mute.latency.factor=2 \
audio.sys.noisy.broadcast.delay=500 \
audio.sys.offload.pstimeout.secs=3 \
audio.sys.routing.latency=0 \
audioflinger.bootsnd=1 \
av.debug.disable.pers.cache=true \
av.offload.enable=true \
av.streaming.offload.enable=true \
bt.max.hfpclient.connections=5 \
config.cabl.path=/vendor/etc/cablconfig.xml \
config.cabl.xml=1 \
config.disable_otadexopt=false \
config.disable_rtt=false \
config.disable_soundtrigger=false \
config.foss.path=/vendor/etc/fossconfig.xml \
config.foss.xml=1 \
dalvik.vm.dex2oat-threads=2 \
dalvik.vm.dex2oat64.enabled=true \
dalvik.vm.heapgrowthlimit=256m \
dalvik.vm.heapmaxfree=32m \
dalvik.vm.heapminfree=8m \
dalvik.vm.heapsize=512m \
dalvik.vm.heapstartsize=16m \
dalvik.vm.heaptargetutilization=0.5 \
dalvik.vm.image-dex2oat-threads=4 \
dalvik.vm.isa.arm.features=default \
dalvik.vm.isa.arm64.features=default \
db.log.slow_query_threshold=100 \
debug.atrace.tags.enableflags=0 \
debug.bt.discoverable_time=0 \
debug.composition.type=mdp \
debug.cpurend.vsync=true \
debug.doze.component=1 \
debug.drm.mode.auto=1 \
debug.drm.mode.force=3840x2160 \
debug.egl.hw=1 \
debug.egl.swapinterval=0 \
debug.enable.gamed=1 \
debug.enabletr=true \
debug.gralloc.enable_fb_ubwc=1 \
debug.hwc.force_gpu=1 \
debug.hwc.winupdate=1 \
debug.hwui.force_dark=true \
debug.hwui.profile=true \
debug.hwui.renderer=vulkan \
debug.hwui.use_buffer_age=false \
debug.hwui.use_partial_updates=true \
debug.mdpcomp.logs=0 \
debug.mdpcomp.maxlayer=4 \
debug.qc.hardware=1 \
debug.qctwa.preservebuf=1 \
debug.qctwa.statusbar=1 \
debug.qualcomm.sns.daemon=i \
debug.qualcomm.sns.hal=i \
debug.qualcomm.sns.libsensor1=i \
debug.sf.disable_backpressure=1 \
debug.sf.dump.enable=false \
debug.sf.dump.external=false \
debug.sf.dump.primary=false \
debug.sf.dump=0 \
debug.sf.enable_gl_backpressure=1 \
debug.sf.enable_hwc_vds=1 \
debug.sf.hw=1 \
debug.sf.hwc.canUseABC=1 \
debug.sf.latch_unsignaled=1 \
debug.sf.no_hw_vsync=0 \
debug.sf.nobootanimation=0 \
debug.sf.recomputecrop=1 \
debug.sf.swaprect=1 \
debug.slsi_platform=1 \
debug.stagefright.c2inputsurface=-1 \
debug.stagefright.omx_default_rank=512 \
dev.defaultwallpaper=/system/media/dios.jpg \
dev.pm.dyn_samplingrate=1 \
dev.pm.gpu_samplingrate=1 \
dev.usbsetting.embedded=true \
DEVICE_PROVISIONED=1 \
drm.service.enabled=true \
external_storage.casefold.enabled=1 \
external_storage.projid.enabled=1 \
external_storage.sdcardfs.enabled=0 \
fmas.hdph_sgain=0 \
framework_watchdog.fatal_count=3 \
framework_watchdog.fatal_window.second=600 \
graphics.gpu.profiler.support=true \
graphics.gpu.profiler.vulkan_layer_apk=com.google.pixel.redbull.gpuprofiling.vulkanlayer \
io.hw_burst_min_usec=1000 \
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
media.stagefright.thumbnail.prefer_hw_codecs=true \
mm.enable.qcom_parser=13631487 \
mm.enable.smoothstreaming=true \
mmp.enable.3g2=true \
persist.audio.fluence.speaker=true \
persist.audio.fluence.voicecall=true \
persist.audio.fluence.voicecomm=true \
persist.audio.fluence.voicerec=true \
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
persist.data.qmi.adb_logmask=0 \
persist.data.wda.enable=true \
persist.dbg.volte_avail_ovr=1 \
persist.dbg.vt_avail_ovr=1 \
persist.dbg.wfc_avail_ovr=1 \
persist.debug.wfd.enable=1 \
persist.demo.hdmirotationlock=false \
persist.fuse_sdcard=true \
persist.hwc2.skip_client_color_transform=false \
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
persist.sys.wfd.virtual=0 \
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
persist.vendor.dpm.feature=1 \
persist.vendor.dpm.tcm=1 \
persist.vendor.ims.mm_minqp=1 \
persist.vendor.radio.add_power_save=1 \
persist.vendor.radio.apm_sim_not_pwdn=1 \
persist.vendor.radio.custom_ecc=1 \
persist.vendor.radio.data_con_rprt=true \
persist.vendor.radio.data_ltd_sys_ind=1 \
persist.vendor.radio.enableadvancedscan=true \
persist.vendor.radio.hidl_dev_service=true \
persist.vendor.radio.manual_nw_rej_ct=1 \
persist.vendor.radio.mt_sms_ack=19 \
persist.vendor.radio.multisim_switch_support=true \
persist.vendor.radio.no_wait_for_card=1 \
persist.vendor.radio.oem_socket=true \
persist.vendor.radio.procedure_bytes=SKIP \
persist.vendor.radio.RATE_ADAPT_ENABLE=1 \
persist.vendor.radio.relay_oprt_change=1 \
persist.vendor.radio.report_codec=1 \
persist.vendor.radio.ROTATION_ENABLE=1 \
persist.vendor.radio.sap_silent_pin=1 \
persist.vendor.radio.sib16_support=1 \
persist.vendor.radio.snapshot_enabled=0 \
persist.vendor.radio.snapshot_timer=0 \
persist.vendor.radio.unicode_op_names=true \
persist.vendor.radio.vdp_on_ims_cap=1 \
persist.vendor.radio.videopause.mode=1 \
persist.vendor.radio.VT_ENABLE=1 \
persist.vendor.radio.VT_HYBRID_ENABLE=1 \
persist.vendor.radio.wait_for_pbm=1 \
persist.vendor.sensors.allow_non_default_discovery=true \
persist.vendor.sensors.odl.adsp=true \
persist.vendor.sys.modem.diag.mdlog_br_num=5 \
persist.vendor.sys.modem.diag.mdlog=false \
persist.vendor.sys.ssr.restart_level=modem,adsp \
persist.vendor.testing_battery_profile=2 \
persist.vendor.verbose_logging_enabled=false \
ril.subscription.types=NV,RUIM \
ro.af.client_heap_size_kbyte=7168 \
ro.apex.updatable=true \
ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
ro.audio.monitorRotation=true \
ro.bluetooth.a2dp_offload.supported=true \
ro.board.first_api_level=30 \
ro.boot.dynamic_partitions=true \
ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural;com.google.android.systemui.gxoverlay \
ro.bt.bdaddr_path=/data/vendor/bluetooth/bluetooth_bdaddr \
ro.build.ab_update=true \
ro.build.characteristics=default \
ro.carrier=unknown \
ro.carriersetup.vzw_consent_page=true \
ro.charger.enable_suspend=true \
ro.com.android.dataroaming=false \
ro.com.android.prov_mobiledata=false \
ro.com.google.clientidbase=android-google \
ro.com.google.ime.bs_theme=true \
ro.com.google.ime.height_ratio=1.2 \
ro.com.google.ime.kb_pad_port_b=10 \
ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms \
ro.com.google.ime.theme_id=5 \
ro.config.alarm_alert=Bright_morning.ogg \
ro.config.low_ram=false \
ro.config.media_vol_steps=100 \
ro.config.notification_sound=Popcorn.ogg \
ro.config.ringtone=The_big_adventure.ogg \
ro.config.vc_call_vol_steps=100 \
ro.control_privapp_permissions=disable \
ro.cp_system_other_odex=1 \
ro.crypto.allow_encrypt_override=true \
ro.crypto.scrypt_params=15:3:1 \
ro.data.large_tcp_window_size=true \
ro.hardware.vulkan=qcom \
ro.llkd.enable=false \
ro.lmk.critical_upgrade=false \
ro.lmk.critical=0 \
ro.lmk.downgrade_pressure=100 \
ro.lmk.kill_heaviest_task=true \
ro.lmk.kill_timeout_ms=100 \
ro.lmk.log_stats=true \
ro.lmk.low=1001 \
ro.lmk.medium=800 \
ro.lmk.upgrade_pressure=100 \
ro.lmk.use_minfree_levels=true \
ro.logd.size.stats=64K \
ro.minui.pixel_format=RGBX_8888 \
ro.netflix.bsp_rev=Q7250-19133-1 \
ro.odm.build.media_performance_class=30 \
ro.odm.expect.version=$(PLATFORM_VERSION)_$(SOMC_KERNEL_VERSION)_$(SOMC_PLATFORM)_$(TARGET_VENDOR_VERSION)  \
ro.oem_unlock_supported=1 \
ro.opa.eligible_device=true \
ro.product.vndk.version=32 \
ro.qc.sdk.audio.fluencetype=fluencepro \
ro.qti.sdk.sensors.gestures=false \
ro.qti.sensors.amd=false \
ro.qti.sensors.cmc=false \
ro.qti.sensors.dev_ori=true \
ro.qti.sensors.facing=false \
ro.qti.sensors.pedometer=false \
ro.qti.sensors.rmd=false \
ro.qti.sensors.scrn_ortn=false \
ro.qti.sensors.step_counter=false \
ro.qti.sensors.step_detector=false \
ro.qti.sensors.wu=false \
ro.setupwizard.enterprise_mode=1 \
ro.setupwizard.esim_cid_ignore=00000001 \
ro.setupwizard.mode=REQUIRED \
ro.setupwizard.require_network=any \
ro.setupwizard.rotation_locked=false \
ro.setupwizard.suppress_d2d_nfc=true \
ro.setupwizard.suppress_d2d=true \
ro.setupwizard.wifi_on_exit=true \
ro.soc.manufacturer=Qualcomm \
ro.storage_manager.enabled=false \
ro.storage_manager.show_opt_in=false \
ro.support_hide_display_cutout=true \
ro.support_one_handed_mode=true \
ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
ro.surface_flinger.has_HDR_display=true \
ro.surface_flinger.has_wide_color_display=true \
ro.surface_flinger.protected_contents=true \
ro.surface_flinger.set_display_power_timer_ms=1000 \
ro.surface_flinger.set_idle_timer_ms=80 \
ro.surface_flinger.set_touch_timer_ms=200 \
ro.surface_flinger.support_kernel_idle_timer=true \
ro.surface_flinger.use_color_management=true \
ro.surface_flinger.use_content_detection_for_refresh_rate=true \
ro.surface_flinger.wcg_composition_dataspace=143261696 \
ro.sys.sdcardfs=1 \
ro.telephony.call_ring.multiple=false \
ro.telephony.default_cdma_sub=0 \
ro.thermal_warmreset=true \
ro.vendor.audio.sdk.fluencetype=fluencepro \
ro.vendor.bluetooth.emb_wp_mode=false \
ro.vendor.bluetooth.wipower=false \
ro.vendor.bt.bdaddr_path=/data/vendor/bluetooth/bluetooth_bdaddr \
ro.vendor.camera.extensions.package=com.google.android.apps.camera.services \
ro.vendor.camera.extensions.service=com.google.android.apps.camera.services.extensions.service.PixelExtensions \
ro.vendor.display.paneltype=2 \
ro.vendor.display.sensortype=1 \
ro.vendor.extension_library=/vendor/lib/librqbalance.so \
ro.vendor.qti.va_aosp.support=1 \
ro.vendor.qti.va_odm.support=1 \
ro.vendor.radio.log_loc=/data/vendor/modem_dump \
ro.vendor.radio.log_prefix=modem_log_ \
ro.vendor.use_data_netmgrd=true \
ro.vendor.vibrator.hal.click.duration=5 \
ro.vendor.vibrator.hal.config.dynamic=1 \
ro.vendor.vibrator.hal.heavyclick.duration=10 \
ro.vendor.vibrator.hal.long.frequency.shift=10 \
ro.vendor.vibrator.hal.long.voltage=161 \
ro.vendor.vibrator.hal.lptrigger=1 \
ro.vendor.vibrator.hal.short.voltage=161 \
ro.vendor.vibrator.hal.steady.shape=1 \
ro.vendor.vibrator.hal.tick.duration=5 \
ro.virtual_ab.compression.enabled=false \
ro.virtual_ab.enabled=false \
ro.vndk.version=32 \
ro.zram.first_wb_delay_mins=1440 \
ro.zram.mark_idle_delay_mins=60 \
ro.zram.periodic_wb_delay_hours=24 \
ro.zygote=zygote64_32 \
sdm.debug.rotator_downscale=1 \
setupwizard.feature.baseline_setupwizard_enabled=true \
setupwizard.feature.device_default_dark_mode=true \
setupwizard.feature.show_pai_screen_in_main_flow.carrier1839=false \
setupwizard.feature.show_pixel_tos=true \
setupwizard.feature.show_support_link_in_deferred_setup=true \
setupwizard.feature.skip_button_use_mobile_data.carrier1839=true \
setupwizard.theme=glif_v3_light \
sf.display-size=1644x3840 \
sf.display_density=300 \
sf.lcd_density=300 \
sf.lcd_size=1644x3840 \
sys.autobrightness_optimize=true \
sys.config.activelaunch_enable=true \
sys.config_orientation=0 \
sys.display-density=300 \
sys.display-size=1644x3840 \
telephony.active_modems.max_count=2 \
telephony.lteOnCdmaDevice=1 \
vendor.audio_hal.in_period_size=144 \
vendor.audio_hal.period_multiplier=5 \
vendor.audio_hal.period_size=192 \
vendor.audio.adm.buffering.ms=5 \
vendor.audio.capture.enforce_legacy_copp_sr=false \
vendor.audio.cts.media=true \
vendor.audio.dolby.ds2.enabled=false \
vendor.audio.dolby.ds2.hardbypass=false \
vendor.audio.enable.dp.for.voice=true \
vendor.audio.enable.mirrorlink=false \
vendor.audio.feature.a2dp_offload.enable=true \
vendor.audio.feature.afe_proxy.enable=true \
vendor.audio.feature.anc_headset.enable=false \
vendor.audio.feature.audiozoom.enable=true \
vendor.audio.feature.battery_listener.enable=true \
vendor.audio.feature.compr_cap.enable=true \
vendor.audio.feature.compr_voip.enable=true \
vendor.audio.feature.compress_in.enable=true \
vendor.audio.feature.compress_meta_data.enable=false \
vendor.audio.feature.concurrent_capture.enable=true \
vendor.audio.feature.custom_stereo.enable=true \
vendor.audio.feature.deepbuffer_as_primary.enable=true \
vendor.audio.feature.devicestate_listener.enable=true \
vendor.audio.feature.display_port.enable=true \
vendor.audio.feature.dsm_feedback.enable=true \
vendor.audio.feature.dynamic_ecns.enable=true \
vendor.audio.feature.ext_hw_plugin.enable=false \
vendor.audio.feature.external_dsp.enable=false \
vendor.audio.feature.external_speaker_tfa.enable=false \
vendor.audio.feature.external_speaker.enable=false \
vendor.audio.feature.fluence.enable=true \
vendor.audio.feature.fm.enable=true \
vendor.audio.feature.hdmi_edid.enable=true \
vendor.audio.feature.hdmi_passthrough.enable=true \
vendor.audio.feature.hfp.enable=true \
vendor.audio.feature.hifi_audio.enable=true \
vendor.audio.feature.hwdep_cal.enable=true \
vendor.audio.feature.incall_music.enable=true \
vendor.audio.feature.keep_alive.enable=true \
vendor.audio.feature.kpi_optimize.enable=true \
vendor.audio.feature.maxx_audio.enable=true \
vendor.audio.feature.multi_voice_session.enable=true \
vendor.audio.feature.ras.enable=true \
vendor.audio.feature.record_play_concurency.enable=true \
vendor.audio.feature.snd_mon.enable=true \
vendor.audio.feature.spkr_prot.enable=false \
vendor.audio.feature.src_trkn.enable=true \
vendor.audio.feature.ssrec.enable=true \
vendor.audio.feature.thermal_listener.enable=true \
vendor.audio.feature.usb_offload_burst_mode.enable=true \
vendor.audio.feature.usb_offload_sidetone_volume.enable=true \
vendor.audio.feature.usb_offload.enable=true \
vendor.audio.feature.vbat.enable=true \
vendor.audio.feature.wsa.enable=false \
vendor.audio.flac.sw.decoder.16bit=true \
vendor.audio.flac.sw.decoder.24bit=true \
vendor.audio.flac.sw.decoder.32bit=true \
vendor.audio.hal.output.suspend.supported=true \
vendor.audio.hw.aac.encoder=true \
vendor.audio.mic_break=true \
vendor.audio.noisy.broadcast.delay=600 \
vendor.audio.offload.16bit.enable=true \
vendor.audio.offload.24bit.enable=true \
vendor.audio.offload.32bit.enable=true \
vendor.audio.offload.buffer.size.kb=1024 \
vendor.audio.offload.gapless.enabled=true \
vendor.audio.offload.multiaac.enable=true \
vendor.audio.offload.multiple.enabled=true \
vendor.audio.offload.passthrough=true \
vendor.audio.offload.pstimeout.secs=2 \
vendor.audio.offload.track.enable=true \
vendor.audio.parser.ip.buffer.size=262144 \
vendor.audio.safx.pbe.enabled=true \
vendor.audio.snd_card.open.retries=50 \
vendor.audio.tunnel.encode=true \
vendor.audio.use.sw.alac.decoder=true \
vendor.audio.use.sw.ape.decoder=true \
vendor.audio.volume.headset.gain.depcal=true \
vendor.backlight_on=1 \
vendor.bt.pts.pbap=true \
vendor.cover_state=0 \
vendor.display.adaptive_white_coefficient=0.0031,0.5535,-87.498,0.0031,0.5535,-87.498,0.0031,0.5535,-87.498 \
vendor.display.comp_mask=0 \
vendor.display.dataspace_saturation_matrix=1.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,1.0 \
vendor.display.defer_fps_frame_count=2 \
vendor.display.disable_decimation=1 \
vendor.display.disable_excl_rect_partial_fb=1 \
vendor.display.disable_excl_rect=0 \
vendor.display.disable_fbid_cache=1 \
vendor.display.disable_hdr_lut_gen=0 \
vendor.display.disable_hw_recovery_dump=0 \
vendor.display.disable_hw_recovery=0 \
vendor.display.disable_inline_rotator=0 \
vendor.display.disable_offline_rotator=0 \
vendor.display.disable_scaler=0 \
vendor.display.disable_ui_3d_tonemap=0 \
vendor.display.enable_async_powermode=0 \
vendor.display.enable_camera_smooth=1 \
vendor.display.enable_default_color_mode=1 \
vendor.display.enable_null_display=0 \
vendor.display.enable_optimize_refresh=1 \
vendor.display.enable_posted_start_dyn=1 \
vendor.display.foss.config_path=/vendor/etc/FOSSConfig.xml \
vendor.display.foss.config=1 \
vendor.display.lbe.supported=1 \
vendor.display.primary_vsyncs_rate_change=2 \
vendor.display.qdcm.mode_combine=1 \
vendor.display.res_switch_en=1 \
vendor.display.use_smooth_motion=1 \
vendor.enable.always_on_display=1 \
vendor.fm.a2dp.conc.disabled=true \
vendor.gatekeeper.disable_spu=true \
vendor.gralloc.disable_ubwc=0 \
vendor.iop.enable_prefetch_ofr=1 \
vendor.iop.enable_uxe=1 \
vendor.media.omx=1 \
vendor.media.vpp.enable=true \
vendor.perf.gestureflingboost.enable=true \
vendor.perf.iop_v3.enable=1 \
vendor.perf.workloadclassifier.enable=true \
vendor.perflocks_customized_for_apps=1 \
vendor.power.pasr.enabled=true \
vendor.qc2.venc.avgqp.enable=1 \
vendor.qcom.bluetooth.soc=cherokee \
vendor.rild.libpath=/odm/lib64/libril-qc-hal-qmi.so \
vendor.skip.init=0 \
vendor.smartstamina.touchreport=1 \
vendor.sys.display-density=300 \
vendor.sys.display-size=1644x3840 \
vendor.vidc.enc.disable.pq=true \
vendor.voice.path.for.pcm.voip=true \
vidc.debug.level=1 \
vidc.debug.perf.mode=1 \
vidc.enc.dcvs.extra-buff-count=4 \
vidc.enc.disable.pq=1 \
vidc.enc.narrow.searchrange=1 \
video.offload.enable=true \
video.player.ve_enable=1 \
voice.conc.fallbackpath=deep-buffer \
voice.playback.conc.disabled=false \
voice.record.conc.disabled=false \
voice.voip.conc.disabled=false \
wifi.interface=wlan0 \
wifi.supplicant_scan_interval=3600 \
wlan.wfd.hdcp=enable

#-include vendor/gapps/arm64/arm64-vendor.mk

#
# This file is to configure vendor/data partitions of emulator-related products
#
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Enable Scoped Storage related
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

PRODUCT_SOONG_NAMESPACES += \
    device/generic/goldfish \
    device/generic/goldfish-opengl

PRODUCT_SYSTEM_EXT_PROPERTIES += ro.lockscreen.disable.default=0

DISABLE_RILD_OEM_HOOK := true

DEVICE_MANIFEST_FILE := device/generic/goldfish/manifest.xml
PRODUCT_SOONG_NAMESPACES += hardware/google/camera
PRODUCT_SOONG_NAMESPACES += hardware/google/camera/devices/EmulatedCamera

# Device modules
PRODUCT_PACKAGES += \
    vulkan.ranchu \
    libandroidemu \
    libOpenglCodecCommon \
    libOpenglSystemCommon \
    libcuttlefish-ril-2 \
    libgoldfish-rild \
    qemu-adb-keys \
    qemu-device-state \
    qemu-props \
    stagefright \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.allocator@3.0-service \
    android.hardware.graphics.mapper@3.0-impl-ranchu \
    hwcomposer.ranchu \
    toybox_vendor \
    android.hardware.wifi@1.0-service \
    android.hardware.media.c2@1.0-service-goldfish \
    libcodec2_goldfish_vp8dec \
    libcodec2_goldfish_vp9dec \
    libcodec2_goldfish_avcdec \
    sh_vendor \
    local_time.default \
    SdkSetup \
    EmulatorRadioConfig \
    EmulatorTetheringConfigOverlay \
    libstagefrighthw \
    libstagefright_goldfish_vpxdec \
    libstagefright_goldfish_avcdec \
    MultiDisplayProvider \
    libGoldfishProfiler \

ifneq ($(EMULATOR_VENDOR_NO_FINGERPRINT), true)
    PRODUCT_PACKAGES += \
        fingerprint.ranchu \
        android.hardware.biometrics.fingerprint@2.1-service
endif

ifneq ($(BUILD_EMULATOR_OPENGL),false)
PRODUCT_PACKAGES += \
    libGLESv1_CM_emulation \
    lib_renderControl_enc \
    libEGL_emulation \
    libGLESv2_enc \
    libvulkan_enc \
    libGLESv2_emulation \
    libGLESv1_enc \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle
endif

PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1-service.sim \
    android.hardware.bluetooth.audio@2.0-impl
PRODUCT_PROPERTY_OVERRIDES += vendor.bt.rootcanal_test_console=off

PRODUCT_PACKAGES += \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl \
    android.hardware.health.storage@1.0-service \

PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3-service-sample-all \
    android.hardware.neuralnetworks@1.3-service-sample-float-fast \
    android.hardware.neuralnetworks@1.3-service-sample-float-slow \
    android.hardware.neuralnetworks@1.3-service-sample-minimal \
    android.hardware.neuralnetworks@1.3-service-sample-quant

PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1-service

PRODUCT_PACKAGES += \
    DisplayCutoutEmulationEmu01Overlay \
    EmulationPixel5Overlay \
    SystemUIEmulationPixel5Overlay \
    EmulationPixel4XLOverlay \
    SystemUIEmulationPixel4XLOverlay \
    EmulationPixel4Overlay \
    SystemUIEmulationPixel4Overlay \
    EmulationPixel4aOverlay \
    SystemUIEmulationPixel4aOverlay \
    EmulationPixel3XLOverlay \
    SystemUIEmulationPixel3XLOverlay \
    SystemUIEmulationPixel3Overlay \
    SystemUIEmulationPixel3aOverlay \
    SystemUIEmulationPixel3aXLOverlay \
    EmulationPixel2XLOverlay \
    SystemUIEmulationPixel2XLOverlay \
    NavigationBarMode2ButtonOverlay \

ifneq ($(EMULATOR_VENDOR_NO_GNSS),true)
    PRODUCT_PACKAGES += android.hardware.gnss@2.0-service.ranchu
endif

ifneq ($(EMULATOR_VENDOR_NO_SENSORS),true)
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.multihal \
    android.hardware.sensors@2.1-impl.ranchu
# TODO(rkir):
# add a soong namespace and move this into a.h.sensors@2.1-impl.ranchu
# as prebuilt_etc. For now soong_namespace causes a build break because the fw
# refers to our wifi HAL in random places.
PRODUCT_COPY_FILES += \
    device/generic/goldfish/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf
endif

PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.4-service.clearkey \


PRODUCT_PACKAGES += \
    android.hardware.power-service.example \

PRODUCT_PROPERTY_OVERRIDES += ro.control_privapp_permissions?=enforce
PRODUCT_PROPERTY_OVERRIDES += ro.hardware.power=ranchu
PRODUCT_PROPERTY_OVERRIDES += ro.crypto.volume.filenames_mode=aes-256-cts
PRODUCT_VENDOR_PROPERTIES += graphics.gpu.profiler.support=true

PRODUCT_PROPERTY_OVERRIDES += persist.sys.zram_enabled=1 \

PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.1-service.example \

# Prevent logcat from getting canceled early on in boot
PRODUCT_PROPERTY_OVERRIDES += ro.logd.size=1M \

ifneq ($(EMULATOR_VENDOR_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-service \
    android.hardware.camera.provider@2.4-impl \
    camera.ranchu \
    camera.ranchu.jpeg \
    android.hardware.camera.provider@2.7-service-google \
    libgooglecamerahwl_impl \
    android.hardware.camera.provider@2.7-impl-google
DEVICE_MANIFEST_FILE += device/generic/goldfish/manifest.camera.xml
endif

ifneq ($(EMULATOR_VENDOR_NO_SOUND),true)
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio@7.0-impl.ranchu \
    android.hardware.soundtrigger@2.2-impl.ranchu \
    android.hardware.audio.effect@7.0-impl \

DEVICE_MANIFEST_FILE += device/generic/goldfish/audio/android.hardware.audio.effects@7.0.xml

PRODUCT_COPY_FILES += \
    device/generic/goldfish/audio/policy/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    device/generic/goldfish/audio/policy/primary_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/primary_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/media/libeffects/data/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \

endif

PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.software

# WiFi: vendor side
PRODUCT_PACKAGES += \
	mac80211_create_radios \
	dhcpclient \
	hostapd \
	wpa_supplicant \

PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# Thermal
PRODUCT_PACKAGES += \
	android.hardware.thermal@2.0-service.mock

# Atrace
PRODUCT_PACKAGES += \
	android.hardware.atrace@1.0-service

# Vibrator
PRODUCT_PACKAGES += \
	android.hardware.vibrator-service.example

# Authsecret
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0-service

# Identity
PRODUCT_PACKAGES += \
    android.hardware.identity-service.example

# Input Classifier HAL
PRODUCT_PACKAGES += \
    android.hardware.input.classifier@1.0-service.default

# lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.example

# power stats
PRODUCT_PACKAGES += \
    android.hardware.power.stats@1.0-service.mock

# Reboot escrow
PRODUCT_PACKAGES += \
    android.hardware.rebootescrow-service.default

# Extension implementation for Jetpack WindowManager
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    androidx.window.sidecar \

PRODUCT_PACKAGES += \
    android.hardware.biometrics.face@1.0-service.example

PRODUCT_PACKAGES += \
    android.hardware.contexthub@1.1-service.mock

# for 32, 32+64 guest, default using omx, but can be
# modified at command line as follows
# -qemu -append qemu.media.ccodec=<value> can override it; default 0
PRODUCT_PROPERTY_OVERRIDES += \
    debug.stagefright.ccodec=0

# Enable Incremental on the device via kernel driver
PRODUCT_PROPERTY_OVERRIDES += ro.incremental.enable=yes


PRODUCT_COPY_FILES += \
    device/generic/goldfish/data/etc/dtb.img:dtb.img \
    device/generic/goldfish/emulator-info.txt:data/misc/emulator/version.txt \
    device/generic/goldfish/data/etc/apns-conf.xml:data/misc/apns/apns-conf.xml \
    device/generic/goldfish/radio/RadioConfig/radioconfig.xml:data/misc/emulator/config/radioconfig.xml \
    device/generic/goldfish/data/etc/iccprofile_for_sim0.xml:data/misc/modem_simulator/iccprofile_for_sim0.xml \
    device/google/cuttlefish/host/commands/modem_simulator/files/iccprofile_for_sim0_for_CtsCarrierApiTestCases.xml:data/misc/modem_simulator/iccprofile_for_carrierapitests.xml \
    device/generic/goldfish/data/etc/numeric_operator.xml:data/misc/modem_simulator/etc/modem_simulator/files/numeric_operator.xml \
    device/generic/goldfish/data/etc/local.prop:data/local.prop \
    device/generic/goldfish/init.qemu-adb-keys.sh:$(TARGET_COPY_OUT_SYSTEM_EXT)/bin/init.qemu-adb-keys.sh \
    device/generic/goldfish/init.ranchu-core.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.ranchu-core.sh \
    device/generic/goldfish/init.ranchu-net.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.ranchu-net.sh \
    device/generic/goldfish/init.ranchu.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.ranchu.rc \
    device/generic/goldfish/init.system_ext.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.system_ext.rc \
    device/generic/goldfish/fstab.ranchu:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.ranchu \
    device/generic/goldfish/ueventd.ranchu.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \
    device/generic/goldfish/input/virtio_input_rotary.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/virtio_input_rotary.idc \
    device/generic/goldfish/input/qwerty2.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/qwerty2.idc \
    device/generic/goldfish/input/qwerty.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/qwerty.kl \
    device/generic/goldfish/input/virtio_input_multi_touch_1.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/virtio_input_multi_touch_1.idc \
    device/generic/goldfish/input/virtio_input_multi_touch_2.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/virtio_input_multi_touch_2.idc \
    device/generic/goldfish/input/virtio_input_multi_touch_3.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/virtio_input_multi_touch_3.idc \
    device/generic/goldfish/input/virtio_input_multi_touch_4.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/virtio_input_multi_touch_4.idc \
    device/generic/goldfish/input/virtio_input_multi_touch_5.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/virtio_input_multi_touch_5.idc \
    device/generic/goldfish/input/virtio_input_multi_touch_6.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/virtio_input_multi_touch_6.idc \
    device/generic/goldfish/input/virtio_input_multi_touch_7.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/virtio_input_multi_touch_7.idc \
    device/generic/goldfish/input/virtio_input_multi_touch_8.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/virtio_input_multi_touch_8.idc \
    device/generic/goldfish/input/virtio_input_multi_touch_9.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/virtio_input_multi_touch_9.idc \
    device/generic/goldfish/input/virtio_input_multi_touch_10.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/virtio_input_multi_touch_10.idc \
    device/generic/goldfish/input/virtio_input_multi_touch_11.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/virtio_input_multi_touch_11.idc \
    device/generic/goldfish/display_settings_app_compat.xml:$(TARGET_COPY_OUT_VENDOR)/etc/display_settings_app_compat.xml \
    device/generic/goldfish/display_settings_freeform.xml:$(TARGET_COPY_OUT_VENDOR)/etc/display_settings_freeform.xml \
    device/generic/goldfish/display_settings.xml:$(TARGET_COPY_OUT_VENDOR)/etc/display_settings.xml \
    device/generic/goldfish/data/etc/config.ini:config.ini \
    device/generic/goldfish/wifi/simulated_hostapd.conf:$(TARGET_COPY_OUT_VENDOR)/etc/simulated_hostapd.conf \
    device/generic/goldfish/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    system/bt/vendor_libs/test_vendor_lib/data/controller_properties.json:vendor/etc/bluetooth/controller_properties.json \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    device/generic/goldfish/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    device/generic/goldfish/camera/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    device/generic/goldfish/camera/media_codecs_google_video_default.xml:${TARGET_COPY_OUT_VENDOR}/etc/media_codecs_google_video.xml \
    device/generic/goldfish/camera/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    device/generic/goldfish/camera/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.camera.ar.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.ar.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.concurrent.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.concurrent.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.autofill.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.autofill.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:${TARGET_COPY_OUT_PRODUCT}/etc/permissions/android.software.verified_boot.xml \
    device/generic/goldfish/data/etc/permissions/privapp-permissions-goldfish.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-goldfish.xml \
    hardware/google/camera/devices/EmulatedCamera/hwl/configs/emu_camera_back.json:$(TARGET_COPY_OUT_VENDOR)/etc/config/emu_camera_back.json \
    hardware/google/camera/devices/EmulatedCamera/hwl/configs/emu_camera_front.json:$(TARGET_COPY_OUT_VENDOR)/etc/config/emu_camera_front.json \
    hardware/google/camera/devices/EmulatedCamera/hwl/configs/emu_camera_depth.json:$(TARGET_COPY_OUT_VENDOR)/etc/config/emu_camera_depth.json \

ifneq ($(EMULATOR_VENDOR_NO_FINGERPRINT), true)
    PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml
endif

EOF
