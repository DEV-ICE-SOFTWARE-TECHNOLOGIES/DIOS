#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

echo ""
echo "D!OS FRAMEWORK XML..."
echo ""
cat <<\EOF >~/dios/frameworks/base/core/res/res/values/config.xml
<?xml version="1.0" encoding="utf-8"?>
<!--
/*
** Copyright 2009, The Android Open Source Project
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
*/
-->

<!-- These resources are around just to allow their values to be customized
     for different hardware and product builds.  Do not translate.

     NOTE: The naming convention is "config_camelCaseValue". Some legacy
     entries do not follow the convention, but all new entries should. -->

<resources xmlns:xliff="urn:oasis:names:tc:xliff:document:1.2">
    <!-- Do not translate. Defines the slots for the right-hand side icons.  That is to say, the
         icons in the status bar that are not notifications. -->
    <string-array name="config_statusBarIcons">
        <item><xliff:g id="id">@string/status_bar_no_calling</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_call_strength</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_alarm_clock</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_rotate</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_headset</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_data_saver</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_ime</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_sync_failing</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_sync_active</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_nfc</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_tty</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_speakerphone</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_cdma_eri</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_data_connection</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_phone_evdo_signal</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_phone_signal</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_secure</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_managed_profile</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_cast</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_screen_record</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_vpn</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_bluetooth</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_camera</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_microphone</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_location</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_mute</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_volume</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_zen</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_ethernet</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_wifi</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_hotspot</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_mobile</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_airplane</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_battery</xliff:g></item>
        <item><xliff:g id="id">@string/status_bar_sensors_off</xliff:g></item>
    </string-array>

    <string translatable="false" name="status_bar_rotate">rotate</string>
    <string translatable="false" name="status_bar_headset">headset</string>
    <string translatable="false" name="status_bar_data_saver">data_saver</string>
    <string translatable="false" name="status_bar_managed_profile">managed_profile</string>
    <string translatable="false" name="status_bar_ime">ime</string>
    <string translatable="false" name="status_bar_sync_failing">sync_failing</string>
    <string translatable="false" name="status_bar_sync_active">sync_active</string>
    <string translatable="false" name="status_bar_cast">cast</string>
    <string translatable="false" name="status_bar_hotspot">hotspot</string>
    <string translatable="false" name="status_bar_location">location</string>
    <string translatable="false" name="status_bar_bluetooth">bluetooth</string>
    <string translatable="false" name="status_bar_nfc">nfc</string>
    <string translatable="false" name="status_bar_tty">tty</string>
    <string translatable="false" name="status_bar_speakerphone">speakerphone</string>
    <string translatable="false" name="status_bar_zen">zen</string>
    <string translatable="false" name="status_bar_mute">mute</string>
    <string translatable="false" name="status_bar_volume">volume</string>
    <string translatable="false" name="status_bar_wifi">wifi</string>
    <string translatable="false" name="status_bar_cdma_eri">cdma_eri</string>
    <string translatable="false" name="status_bar_data_connection">data_connection</string>
    <string translatable="false" name="status_bar_phone_evdo_signal">phone_evdo_signal</string>
    <string translatable="false" name="status_bar_phone_signal">phone_signal</string>
    <string translatable="false" name="status_bar_battery">battery</string>
    <string translatable="false" name="status_bar_alarm_clock">alarm_clock</string>
    <string translatable="false" name="status_bar_secure">secure</string>
    <string translatable="false" name="status_bar_clock">clock</string>
    <string translatable="false" name="status_bar_mobile">mobile</string>
    <string translatable="false" name="status_bar_vpn">vpn</string>
    <string translatable="false" name="status_bar_ethernet">ethernet</string>
    <string translatable="false" name="status_bar_microphone">microphone</string>
    <string translatable="false" name="status_bar_camera">camera</string>
    <string translatable="false" name="status_bar_airplane">airplane</string>
    <string translatable="false" name="status_bar_no_calling">no_calling</string>
    <string translatable="false" name="status_bar_call_strength">call_strength</string>
    <string translatable="false" name="status_bar_sensors_off">sensors_off</string>
    <string translatable="false" name="status_bar_screen_record">screen_record</string>

    <!-- Flag indicating whether the surface flinger has limited
         alpha compositing functionality in hardware.  If set, the window
         manager will disable alpha trasformation in animations where not
         strictly needed. -->
    <bool name="config_sf_limitedAlpha">false</bool>

    <!-- Default value used to block data calls if ims is not
         connected.  If you use the ims apn DCT will block
         any other apn from connecting until ims apn is connected-->
    <bool name="ImsConnectedDefaultValue">false</bool>

    <!-- Flag indicating whether the surface flinger is inefficient
         at performing a blur.  Used by parts of the UI to turn off
         the blur effect where it isn't worth the performance hit.
         As of Honeycomb, blurring is not supported anymore. -->
    <bool name="config_sf_slowBlur">true</bool>

    <!-- Flag indicating that the media framework should support playing of sounds on volume
         key usage.  This adds noticeable additional overhead to volume key processing, so
         is disableable for products for which it is irrelevant. -->
    <bool name="config_useVolumeKeySounds">true</bool>

    <!-- The attenuation in dB applied to the sound effects played
         through AudioManager.playSoundEffect() when no volume is specified. -->
    <integer name="config_soundEffectVolumeDb">-6</integer>

    <!-- The attenuation in dB applied to the lock/unlock sounds. -->
    <integer name="config_lockSoundVolumeDb">-6</integer>

    <!-- Flag indicating whether the AUDIO_BECOMING_NOISY notification should
         be sent during a change to the audio output device. -->
    <bool name="config_sendAudioBecomingNoisy">true</bool>

    <!-- Whether Hearing Aid profile is supported -->
    <bool name="config_hearing_aid_profile_supported">false</bool>

    <!-- Flag to disable all transition animations -->
    <bool name="config_disableTransitionAnimation">false</bool>

    <!-- The duration (in milliseconds) of a short animation. -->
    <integer name="config_shortAnimTime">200</integer>

    <!-- The duration (in milliseconds) of a medium-length animation. -->
    <integer name="config_mediumAnimTime">400</integer>

    <!-- The duration (in milliseconds) of a long animation. -->
    <integer name="config_longAnimTime">500</integer>

    <!-- The duration (in milliseconds) of the activity open/close and fragment open/close animations. -->
    <integer name="config_activityShortDur">150</integer>
    <integer name="config_activityDefaultDur">220</integer>

    <!-- Fade out time for screen rotation -->
    <integer name="config_screen_rotation_fade_out">116</integer>

    <!-- Fade in time for screen rotation -->
    <integer name="config_screen_rotation_fade_in">200</integer>

    <!-- Fade in delay time for screen rotation -->
    <integer name="config_screen_rotation_fade_in_delay">83</integer>

    <!-- Total time for 90 degree screen rotation animations -->
    <integer name="config_screen_rotation_total_90">283</integer>

    <!-- Total time for 180 degree screen rotation animation -->
    <integer name="config_screen_rotation_total_180">383</integer>

    <!-- Total time for the rotation background color transition -->
    <integer name="config_screen_rotation_color_transition">200</integer>

    <!-- The duration (in milliseconds) of the tooltip show/hide animations. -->
    <integer name="config_tooltipAnimTime">150</integer>

    <!-- Duration for the dim animation behind a dialog.  This may be either
         a percentage, which is relative to the duration of the enter/open
         animation of the window being shown that is dimming behind, or it may
         be an integer for a constant duration. -->
    <fraction name="config_dimBehindFadeDuration">100%</fraction>

    <!-- The maximum width we would prefer dialogs to be.  0 if there is no
         maximum (let them grow as large as the screen).  Actual values are
         specified for -large and -xlarge configurations. -->
    <dimen name="config_prefDialogWidth">320dp</dimen>

    <!-- Enables or disables fading edges when marquee is enabled in TextView.
         Off by default, since the framebuffer readback used to implement the
         fading edges is prohibitively expensive on most GPUs. -->
    <bool name="config_ui_enableFadingMarquee">false</bool>

    <!-- Enables or disables haptic effect when the text insertion/selection handle is moved
         manually by the user. Off by default, since the expected haptic feedback may not be
         available on some devices. -->
    <bool name="config_enableHapticTextHandle">false</bool>

    <!-- Whether dialogs should close automatically when the user touches outside
         of them.  This should not normally be modified. -->
    <bool name="config_closeDialogWhenTouchOutside">true</bool>

    <!-- Device configuration indicating whether we should avoid using accelerated graphics
         in certain places to reduce RAM footprint.  This is ignored if ro.config.low_ram
         is true (in that case this is assumed true as well).  It can allow you to tune down
         your device's memory use without going to the point of causing applications to turn
         off features. -->
    <bool name="config_avoidGfxAccel">false</bool>

    <!-- Device configuration setting the minfree tunable in the lowmemorykiller in the kernel.
         A high value will cause the lowmemorykiller to fire earlier, keeping more memory
         in the file cache and preventing I/O thrashing, but allowing fewer processes to
         stay in memory.  A low value will keep more processes in memory but may cause
         thrashing if set too low.  Overrides the default value chosen by ActivityManager
         based on screen size and total memory for the largest lowmemorykiller bucket, and
         scaled proportionally to the smaller buckets.  -1 keeps the default. -->
    <integer name="config_lowMemoryKillerMinFreeKbytesAbsolute">-1</integer>

    <!-- Device configuration adjusting the minfree tunable in the lowmemorykiller in the
         kernel.  A high value will cause the lowmemorykiller to fire earlier, keeping more
         memory in the file cache and preventing I/O thrashing, but allowing fewer processes
         to stay in memory.  A low value will keep more processes in memory but may cause
         thrashing if set too low.  Directly added to the default value chosen by
         ActivityManager based on screen size and total memory for the largest lowmemorykiller
         bucket, and scaled proportionally to the smaller buckets. 0 keeps the default. -->
    <integer name="config_lowMemoryKillerMinFreeKbytesAdjust">0</integer>

    <!-- Device configuration setting the /proc/sys/vm/extra_free_kbytes tunable in the kernel
         (if it exists).  A high value will increase the amount of memory that the kernel
         tries to keep free, reducing allocation time and causing the lowmemorykiller to kill
         earlier.  A low value allows more memory to be used by processes but may cause more
         allocations to block waiting on disk I/O or lowmemorykiller.  Overrides the default
         value chosen by ActivityManager based on screen size.  0 prevents keeping any extra
         memory over what the kernel keeps by default.  -1 keeps the default. -->
    <integer name="config_extraFreeKbytesAbsolute">-1</integer>

    <!-- Device configuration adjusting the /proc/sys/vm/extra_free_kbytes tunable in the kernel
         (if it exists).  0 uses the default value chosen by ActivityManager.  A positive value
         will increase the amount of memory that the kernel tries to keep free, reducing
         allocation time and causing the lowmemorykiller to kill earlier.  A negative value
         allows more memory to be used by processes but may cause more allocations to block
         waiting on disk I/O or lowmemorykiller.  Directly added to the default value chosen by
         ActivityManager based on screen size. -->
    <integer name="config_extraFreeKbytesAdjust">0</integer>

    <!-- Set this to true to enable the platform's auto-power-save modes like doze and
         app standby.  These are not enabled by default because they require a standard
         cloud-to-device messaging service for apps to interact correctly with the modes
         (such as to be able to deliver an instant message to the device even when it is
         dozing).  This should be enabled if you have such services and expect apps to
         correctly use them when installed on your device.  Otherwise, keep this disabled
         so that applications can still use their own mechanisms. -->
    <bool name="config_enableAutoPowerModes">false</bool>

    <!-- Whether (if true) this is a kind of device that can be moved around (eg. phone/laptop),
         or (if false) something for which movement is either not measurable or should not count
         toward power states (eg. tv/soundbar). -->
    <bool name="config_autoPowerModeUseMotionSensor">true</bool>

    <!-- The threshold angle for any motion detection in auto-power save modes.
         In hundreths of a degree. -->
    <integer name="config_autoPowerModeThresholdAngle">200</integer>

    <!-- The sensor id of an "any motion" sensor used in auto-power save modes.
         0 indicates this sensor is not available. -->
    <integer name="config_autoPowerModeAnyMotionSensor">0</integer>

    <!-- If an any motion sensor is not available, prefer the wrist tilt detector over the
         SMD. -->
    <bool name="config_autoPowerModePreferWristTilt">false</bool>

    <!-- If a location should be pre-fetched when going into device idle. -->
    <bool name="config_autoPowerModePrefetchLocation">true</bool>

    <!-- The duration (in milliseconds) that the radio will scan for a signal
         when there's no network connection. If the scan doesn't timeout, use zero -->
    <integer name="config_radioScanningTimeout">0</integer>

    <!-- XXXXX NOTE THE FOLLOWING RESOURCES USE THE WRONG NAMING CONVENTION.
         Please don't copy them, copy anything else. -->

    <!-- This string array should be overridden by the device to present a list of network
         attributes.  This is used by the connectivity manager to decide which networks can coexist
         based on the hardware -->
    <!-- An Array of "[Connection name],[ConnectivityManager.TYPE_xxxx],
         [associated radio-type],[priority],[restoral-timer(ms)],[dependencyMet]  -->
    <!-- the 5th element "resore-time" indicates the number of milliseconds to delay
         before automatically restore the default connection.  Set -1 if the connection
         does not require auto-restore. -->
    <!-- the 6th element indicates boot-time dependency-met value. -->
    <!-- NOTE: The telephony module is no longer reading the configuration below for available
         APN types.  The set of APN types and relevant settings are specified within the telephony
         module and are non-configurable.  Whether or not data connectivity over a cellular network
         is available at all is controlled by the flag: config_moble_data_capable. -->
    <string-array translatable="false" name="networkAttributes">
        <item>"wifi,1,1,1,-1,true"</item>
        <item>"mobile,0,0,0,-1,true"</item>
        <item>"mobile_mms,2,0,2,60000,true"</item>
        <item>"mobile_supl,3,0,2,60000,true"</item>
        <item>"mobile_dun,4,0,2,60000,true"</item>
        <item>"mobile_hipri,5,0,3,60000,true"</item>
        <item>"mobile_fota,10,0,2,60000,true"</item>
        <item>"mobile_ims,11,0,2,60000,true"</item>
        <item>"mobile_cbs,12,0,2,60000,true"</item>
        <item>"wifi_p2p,13,1,0,-1,true"</item>
        <item>"mobile_ia,14,0,2,-1,true"</item>
        <item>"mobile_emergency,15,0,2,-1,true"</item>
    </string-array>

    <!-- Array of ConnectivityManager.TYPE_xxxx constants for networks that may only
         be controlled by systemOrSignature apps.  -->
    <integer-array translatable="false" name="config_protectedNetworks">
        <item>10</item>
        <item>11</item>
        <item>12</item>
        <item>14</item>
        <item>15</item>
    </integer-array>

    <!-- This string array should be overridden by the device to present a list of radio
         attributes.  This is used by the connectivity manager to decide which networks can coexist
         based on the hardware -->
    <!-- An Array of "[ConnectivityManager connectionType],
                      [# simultaneous connection types]"  -->
    <string-array translatable="false" name="radioAttributes">
        <item>"1,1"</item>
        <item>"0,1"</item>
    </string-array>

    <!-- Whether/how to notify the user on network switches. See LingerMonitor.java. -->
    <integer translatable="false" name="config_networkNotifySwitchType">0</integer>

    <!-- What types of network switches to notify. See LingerMonitor.java. -->
    <string-array translatable="false" name="config_networkNotifySwitches">
    </string-array>

    <!-- Whether the device should automatically switch away from Wi-Fi networks that lose
         Internet access. Actual device behaviour is controlled by
         Settings.Global.NETWORK_AVOID_BAD_WIFI. This is the default value of that setting. -->
    <integer translatable="false" name="config_networkAvoidBadWifi">1</integer>

    <!-- If the hardware supports specially marking packets that caused a wakeup of the
         main CPU, set this value to the mark used. -->
    <integer name="config_networkWakeupPacketMark">0</integer>

    <!-- Mask to use when checking skb mark defined in config_networkWakeupPacketMark above. -->
    <integer name="config_networkWakeupPacketMask">0</integer>

    <!-- Whether the APF Filter in the device should filter out IEEE 802.3 Frames
         Those frames are identified by the field Eth-type having values
         less than 0x600 -->
    <bool translatable="false" name="config_apfDrop802_3Frames">true</bool>

    <!-- An array of Denylisted EtherType, packets with EtherTypes within this array
         will be dropped
         TODO: need to put proper values, these are for testing purposes only -->
    <integer-array translatable="false" name="config_apfEthTypeBlackList">
        <item>0x88A2</item>
        <item>0x88A4</item>
        <item>0x88B8</item>
        <item>0x88CD</item>
        <item>0x88E3</item>
    </integer-array>

    <!-- Default value for ConnectivityManager.getMultipathPreference() on metered networks. Actual
         device behaviour is controlled by Settings.Global.NETWORK_METERED_MULTIPATH_PREFERENCE.
         This is the default value of that setting. -->
    <integer translatable="false" name="config_networkMeteredMultipathPreference">0</integer>

    <!-- Default daily multipath budget used by ConnectivityManager.getMultipathPreference()
         on metered networks. This default quota only used if quota could not be determined from
         data plan or data limit/warning set by the user. The value that is actually used is
         controlled by Settings.Global.NETWORK_DEFAULT_DAILY_MULTIPATH_QUOTA_BYTES. This is the
         default value of that setting. -->
    <integer translatable="false" name="config_networkDefaultDailyMultipathQuotaBytes">2500000</integer>

    <!-- Default supported concurrent socket keepalive slots per transport type, used by
         ConnectivityManager.createSocketKeepalive() for calculating the number of keepalive
         offload slots that should be reserved for privileged access. This string array should be
         overridden by the device to present the capability of creating socket keepalives. -->
    <!-- An Array of "[NetworkCapabilities.TRANSPORT_*],[supported keepalives] -->
    <string-array translatable="false" name="config_networkSupportedKeepaliveCount">
        <item>0,1</item>
        <item>1,3</item>
    </string-array>

    <!-- Reserved privileged keepalive slots per transport. -->
    <integer translatable="false" name="config_reservedPrivilegedKeepaliveSlots">2</integer>

    <!-- Allowed unprivileged keepalive slots per uid. -->
    <integer translatable="false" name="config_allowedUnprivilegedKeepalivePerUid">2</integer>

    <!-- This setting is deprecated, please use
         com.android.networkstack.tethering.R.array.config_tether_usb_regexs instead. -->
    <string-array translatable="false" name="config_tether_usb_regexs">
    </string-array>

    <!-- This setting is deprecated, please use
         com.android.networkstack.tethering.R.array.config_tether_wifi_regexs instead. -->
    <string-array translatable="false" name="config_tether_wifi_regexs">
    </string-array>

    <!-- This setting is deprecated, please use
         com.android.networkstack.tethering.R.array.config_tether_bluetooth_regexs instead. -->
    <string-array translatable="false" name="config_tether_bluetooth_regexs">
    </string-array>

    <!-- Max number of Bluetooth tethering connections allowed. If this is
         updated config_tether_dhcp_range has to be updated appropriately. -->
    <integer translatable="false" name="config_max_pan_devices">5</integer>

    <!-- This setting is deprecated, please use
         com.android.networkstack.tethering.R.array.config_dhcp_range instead. -->
    <string-array translatable="false" name="config_tether_dhcp_range">
    </string-array>

    <!-- Regex of wired ethernet ifaces -->
    <string translatable="false" name="config_ethernet_iface_regex">eth\\d</string>

    <!-- Configuration of Ethernet interfaces in the following format:
         <interface name|mac address>;[Network Capabilities];[IP config];[Override Transport]
         Where
               [Network Capabilities] Optional. A comma seprated list of network capabilities.
                   Values must be from NetworkCapabilities#NET_CAPABILITY_* constants.
                   The NOT_ROAMING, NOT_CONGESTED and NOT_SUSPENDED capabilities are always
                   added automatically because this configuration provides no way to update
                   them dynamically.
               [IP config] Optional. If empty or not specified - DHCP will be used, otherwise
                   use the following format to specify static IP configuration:
                       ip=<ip-address/mask> gateway=<ip-address> dns=<comma-sep-ip-addresses>
                       domains=<comma-sep-domains>
               [Override Transport] Optional. An override network transport type to allow
                    the propagation of an interface type on the other end of a local Ethernet
                    interface. Value must be from NetworkCapabilities#TRANSPORT_* constants. If
                    left out, this will default to TRANSPORT_ETHERNET.
         -->
    <string-array translatable="false" name="config_ethernet_interfaces">
        <!--
        <item>eth1;12,13,14,15;ip=192.168.0.10/24 gateway=192.168.0.1 dns=4.4.4.4,8.8.8.8</item>
        <item>eth2;;ip=192.168.0.11/24</item>
        <item>eth3;12,13,14,15;ip=192.168.0.12/24;1</item>
        -->
    </string-array>

    <!-- Whether the internal vehicle network should remain active even when no
         apps requested it. -->
    <bool name="config_vehicleInternalNetworkAlwaysRequested">true</bool>

    <!-- This setting is deprecated, please use
         com.android.networkstack.tethering.R.array.config_mobile_hotspot_provision_app instead. -->
    <string-array translatable="false" name="config_mobile_hotspot_provision_app">
    <!--
        <item>com.example.provisioning</item>
        <item>com.example.provisioning.Activity</item>
    -->
    </string-array>

    <!-- This setting is deprecated, please use
         com.android.networkstack.tethering.R.string.config_mobile_hotspot_provision_app_no_ui
         instead. -->
    <string translatable="false" name="config_mobile_hotspot_provision_app_no_ui"></string>

    <!-- This setting is deprecated, please use
         com.android.networkstack.tethering.R.string.config_mobile_hotspot_provision_response
         instead. -->
    <string translatable="false" name="config_mobile_hotspot_provision_response"></string>

    <!-- This setting is deprecated, please use
         com.android.networkstack.tethering.R.integer.config_mobile_hotspot_provision_check_period
         instead. -->
    <integer translatable="false" name="config_mobile_hotspot_provision_check_period">24</integer>

    <!-- This setting is deprecated, please use
         com.android.networkstack.tethering.R.string.config_wifi_tether_enable instead. -->
    <string translatable="false" name="config_wifi_tether_enable">com.android.settings/.wifi.tether.TetherService</string>

    <!-- This setting is deprecated, please use
         com.android.networkstack.tethering.R.array.config_tether_upstream_types. -->
    <integer-array translatable="false" name="config_tether_upstream_types">
        <item>1</item>
        <item>7</item>
        <item>0</item>
    </integer-array>

    <!-- If the DUN connection for this CDMA device supports more than just DUN -->
    <!-- traffic you should list them here. -->
    <!-- If this device is not CDMA this is ignored.  If this list is empty on -->
    <!-- a DUN-requiring CDMA device, the DUN APN will just support just DUN. -->
    <string-array translatable="false" name="config_cdma_dun_supported_types">
    </string-array>

    <!-- Flag indicating whether we should enable the automatic brightness.
         Software implementation will be used if config_hardware_auto_brightness_available is not set -->
    <bool name="config_automatic_brightness_available">true</bool>

    <!-- Flag indicating whether we should enable the adaptive sleep.-->
    <bool name="config_adaptive_sleep_available">true</bool>

    <!-- Flag indicating whether we should enable smart battery. -->
    <bool name="config_smart_battery_available">true</bool>

    <!-- Flag indicating whether we should enable camera-based autorotate -->
    <bool name="config_camera_autorotate">false</bool>

    <!-- Fast brightness animation ramp rate in brightness units per second-->
    <integer translatable="false" name="config_brightness_ramp_rate_fast">180</integer>

    <!-- Slow brightness animation ramp rate in brightness units per second-->
    <integer translatable="false" name="config_brightness_ramp_rate_slow">60</integer>

    <!-- Don't name config resources like this.  It should look like config_annoyDianne -->
    <bool name="config_annoy_dianne">true</bool>

    <!-- XXXXXX END OF RESOURCES USING WRONG NAMING CONVENTION -->

    <!-- If this is true, notification effects will be played by the notification server.
         When false, car notification effects will be handled elsewhere. -->
    <bool name="config_enableServerNotificationEffectsForAutomotive">true</bool>

    <!-- If this is true, the screen will come on when you unplug usb/power/whatever. -->
    <bool name="config_unplugTurnsOnScreen">false</bool>

    <!-- If this is true, the message that USB is only being used for charging will be shown. -->
    <bool name="config_usbChargingMessage">true</bool>

    <!-- Set this true only if the device has separate attention and notification lights. -->
    <bool name="config_useAttentionLight">true</bool>

    <!-- If this is true, the screen will fade off. -->
    <bool name="config_animateScreenLights">true</bool>

    <!-- If this is true, key chords can be used to take a screenshot on the device. -->
    <bool name="config_enableScreenshotChord">true</bool>

    <!-- If this is true, allow wake from theater mode when plugged in or unplugged. -->
    <bool name="config_allowTheaterModeWakeFromUnplug">false</bool>
    <!-- If this is true, allow wake from theater mode from gesture. -->
    <bool name="config_allowTheaterModeWakeFromGesture">false</bool>
    <!-- If this is true, allow wake from theater mode from camera lens cover is switched. -->
    <bool name="config_allowTheaterModeWakeFromCameraLens">false</bool>
    <!-- If this is true, allow wake from theater mode from power key press. -->
    <bool name="config_allowTheaterModeWakeFromPowerKey">true</bool>
    <!-- If this is true, allow wake from theater mode from regular key press. Setting this value to
         true implies config_allowTheaterModeWakeFromPowerKey is also true-->
    <bool name="config_allowTheaterModeWakeFromKey">false</bool>
    <!-- If this is true, allow wake from theater mode from motion. -->
    <bool name="config_allowTheaterModeWakeFromMotion">false</bool>
    <!-- If this is true, allow wake from theater mode from motion. -->
    <bool name="config_allowTheaterModeWakeFromMotionWhenNotDreaming">false</bool>
    <!-- If this is true, allow wake from theater mode from lid switch. -->
    <bool name="config_allowTheaterModeWakeFromLidSwitch">false</bool>
    <!-- If this is true, allow wake from theater mode when docked. -->
    <bool name="config_allowTheaterModeWakeFromDock">false</bool>
    <!-- If this is true, allow wake from theater mode from window layout flag. -->
    <bool name="config_allowTheaterModeWakeFromWindowLayout">false</bool>
    <!-- If this is true, go to sleep when theater mode is enabled from button press -->
    <bool name="config_goToSleepOnButtonPressTheaterMode">true</bool>
    <!-- If this is true, long press on power button will be available from the non-interactive state -->
    <bool name="config_supportLongPressPowerWhenNonInteractive">false</bool>

    <!-- Auto-rotation behavior -->

    <!-- If true, enables auto-rotation features using the accelerometer.
         Otherwise, auto-rotation is disabled.  Applications may still request
         to use specific orientations but the sensor is ignored and sensor-based
         orientations are not available.  Furthermore, all auto-rotation related
         settings are omitted from the system UI.  In certain situations we may
         still use the accelerometer to determine the orientation, such as when
         docked if the dock is configured to enable the accelerometer. -->
    <bool name="config_supportAutoRotation">true</bool>

    <!-- If true, the screen can be rotated via the accelerometer in all 4
         rotations as the default behavior. -->
    <bool name="config_allowAllRotations">true</bool>

    <!-- If true, the direction rotation is applied to get to an application's requested
         orientation is reversed.  Normally, the model is that landscape is
         clockwise from portrait; thus on a portrait device an app requesting
         landscape will cause a clockwise rotation, and on a landscape device an
         app requesting portrait will cause a counter-clockwise rotation.  Setting
         true here reverses that logic. -->
    <bool name="config_reverseDefaultRotation">false</bool>

    <!-- Sets the minimum and maximum tilt tolerance for each possible rotation.
         This array consists of 4 pairs of values which specify the minimum and maximum
         tilt angle at which the device will transition into each rotation.

         The tilt angle represents the direction in which the plane of the screen is facing;
         it is also known as the angle of elevation.

           -90 degree tilt means that the screen is facing straight down
                           (the device is being held overhead upside-down)
             0 degree tilt means that the screen is facing outwards
                           (the device is being held vertically)
            90 degree tilt means that the screen is facing straight up
                           (the device is resting on a flat table)

        The default tolerances are set conservatively such that the device is more
        likely to remain in its natural orientation than rotate into a counterclockwise,
        clockwise, or reversed posture (with an especially strong bias against the latter)
        to prevent accidental rotation while carrying the device in hand.

        These thresholds may need to be tuned when the device is intended to be
        mounted into a dock with a particularly shallow profile wherein rotation
        would ordinarily have been suppressed.

        It is helpful to consider the desired behavior both when the device is being
        held at a positive tilt (typical case) vs. a negative tilt (reading overhead in
        bed) since they are quite different.  In the overhead case, we typically want
        the device to more strongly prefer to retain its current configuration (in absence
        of a clear indication that a rotation is desired) since the user's head and neck may
        be held at an unusual angle.
    -->
    <integer-array name="config_autoRotationTiltTolerance">
        <!-- rotation:   0 (natural)    --> <item>-25</item> <item>70</item>
        <!-- rotation:  90 (rotate CCW) --> <item>-25</item> <item>65</item>
        <!-- rotation: 180 (reverse)    --> <item>-25</item> <item>60</item>
        <!-- rotation: 270 (rotate CW)  --> <item>-25</item> <item>65</item>
    </integer-array>

    <!-- Lid switch behavior -->

    <!-- The number of degrees to rotate the display when the keyboard is open.
         A value of -1 means no change in orientation by default. -->
    <integer name="config_lidOpenRotation">-1</integer>

    <!-- Indicate whether the lid state impacts the accessibility of
         the physical keyboard.  0 means it doesn't, 1 means it is accessible
         when the lid is open, 2 means it is accessible when the lid is
         closed.  The default is 0. -->
    <integer name="config_lidKeyboardAccessibility">0</integer>

    <!-- Indicate whether the lid state impacts the accessibility of
         the navigation buttons.  0 means it doesn't, 1 means it is accessible
         when the lid is open, 2 means it is accessible when the lid is
         closed.  The default is 0. -->
    <integer name="config_lidNavigationAccessibility">0</integer>

    <!-- Indicate whether closing the lid causes the lockscreen to appear.
         The default is false. -->
    <bool name="config_lidControlsScreenLock">true</bool>

    <!-- Indicate whether closing the lid causes the device to go to sleep and opening
         it causes the device to wake up.
         The default is false. -->
    <bool name="config_lidControlsSleep">true</bool>

    <!-- The device states (supplied by DeviceStateManager) that should be treated as folded by the
         display fold controller. Default is empty. -->
    <integer-array name="config_foldedDeviceStates">
        <!-- Example:
        <item>0</item>
        <item>1</item>
        <item>2</item>
        -->
    </integer-array>

    <!-- When entering this device state (defined in device_state_configuration.xml),
         we should wake the device. -1 to disable the feature (do not wake on any device-state
         transition). -->
    <integer name="config_deviceStateOnWhichToWakeUp">-1</integer>

    <!-- Indicate the display area rect for foldable devices in folded state. -->
    <string name="config_foldedArea"></string>

    <!-- Indicates whether to enable an animation when unfolding a device or not -->
    <bool name="config_unfoldTransitionEnabled">true</bool>

    <!-- Indicates whether to enable hinge angle sensor when using unfold animation -->
    <bool name="config_unfoldTransitionHingeAngle">true</bool>

    <!-- Indicates that the device supports having more than one internal display on at the same
         time. Only applicable to devices with more than one internal display. If this option is
         set to false, DisplayManager will make additional effort to ensure no more than 1 internal
         display is powered on at the same time. -->
    <bool name="config_supportsConcurrentInternalDisplays">true</bool>

    <!-- Map of DeviceState to rotation lock setting. Each entry must be in the format
         "key:value", for example: "0:1".
          The keys are device states, and the values are one of
          Settings.Secure.DeviceStateRotationLockSetting.
          Any device state that doesn't have a default set here will be treated as
          DEVICE_STATE_ROTATION_LOCK_IGNORED meaning it will not have its own rotation lock setting.
          If this map is missing, the feature is disabled and only one global rotation lock setting
           will apply, regardless of device state. -->
    <string-array name="config_perDeviceStateRotationLockDefaults" />


    <!-- Desk dock behavior -->

    <!-- The number of degrees to rotate the display when the device is in a desk dock.
         A value of -1 means no change in orientation by default. -->
    <integer name="config_deskDockRotation">-1</integer>

    <!-- Control whether being in the desk dock (and powered) always
         keeps the screen on.  By default it stays on when plugged in to
         AC.  0 will not keep it on; or together 1 to stay on when plugged
         in to AC and 2 to stay on when plugged in to USB.  (So 3 for both.) -->
    <integer name="config_deskDockKeepsScreenOn">1</integer>

    <!-- Control whether being in the desk dock should enable accelerometer
         based screen orientation.  This defaults to true because it is
         common for desk docks to be sold in a variety of form factors
         with different orientations.  Since we cannot always tell these docks
         apart and the docks cannot report their true orientation on their own,
         we rely on gravity to determine the effective orientation. -->
    <bool name="config_deskDockEnablesAccelerometer">true</bool>

    <!-- Car dock behavior -->

    <!-- The number of degrees to rotate the display when the device is in a car dock.
         A value of -1 means no change in orientation by default. -->
    <integer name="config_carDockRotation">-1</integer>

    <!-- Control whether being in the car dock (and powered) always
         keeps the screen on.  By default it stays on when plugged in to
         AC.  0 will not keep it on; or together 1 to stay on when plugged
         in to AC and 2 to stay on when plugged in to USB.  (So 3 for both.) -->
    <integer name="config_carDockKeepsScreenOn">1</integer>

    <!-- Control whether being in the car dock should enable accelerometer based
         screen orientation.  This defaults to true because putting a device in
         a car dock make the accelerometer more a physical input (like a lid). -->

    <bool name="config_carDockEnablesAccelerometer">true</bool>

    <!--  Control whether to launch Car dock home app when user presses home button or when
          car dock intent is fired.
          In mobile device, usually separate home app is expected in car mode, and this should be
          enabled. But in environments like real car, default home app may be enough, and in that
          case, this can be disabled (set to false). -->
    <bool name="config_enableCarDockHomeLaunch">true</bool>

    <!-- Control whether to force apps to give up control over the display of system bars at all
         times regardless of System Ui Flags.
         In the Automotive case, this is helpful if there's a requirement for an UI element to be on
         screen at all times. Setting this to true also gives System UI the ability to override the
         visibility controls for the system through the usage of the
         "SYSTEM_BAR_VISIBILITY_OVERRIDE" setting.
         Ex: Only setting the config to true will force show system bars for the entire system.
         Ex: Setting the config to true and the "SYSTEM_BAR_VISIBILITY_OVERRIDE" setting to
         "immersive.status=apps" will force show navigation bar for all apps and force hide status
         bar for all apps. -->
    <bool name="config_remoteInsetsControllerControlsSystemBars">false</bool>

    <!-- HDMI behavior -->

    <!-- The number of degrees to rotate the display when the device has HDMI connected
         but is not in a dock.  A value of -1 means no change in orientation by default.
         Use -1 except on older devices whose Hardware Composer HAL does not
         provide full support for multiple displays.  -->
    <integer name="config_undockedHdmiRotation">-1</integer>

    <!-- Control the default UI mode type to use when there is no other type override
         happening.  One of the following values (See Configuration.java):
             1  UI_MODE_TYPE_NORMAL
             4  UI_MODE_TYPE_TELEVISION
             5  UI_MODE_TYPE_APPLIANCE
             6  UI_MODE_TYPE_WATCH
             7  UI_MODE_TYPE_VR_HEADSET
         Any other values will have surprising consequences. -->
    <integer name="config_defaultUiModeType">1</integer>

    <!--  Control whether to lock UI mode to what is selected from config_defaultUiModeType.
          Once UI mode is locked, applications cannot change it anymore. -->
    <bool name="config_lockUiMode">false</bool>

    <!--  Control whether to lock day/night mode change from normal application. When it is
          true, day / night mode change is only allowed to apps with MODIFY_DAY_NIGHT_MODE
          permission. -->
    <bool name="config_lockDayNightMode">true</bool>

    <!-- Control the default night mode to use when there is no other mode override set.
         One of the following values (see UiModeManager.java):
             0 - MODE_NIGHT_AUTO
             1 - MODE_NIGHT_NO
             2 - MODE_NIGHT_YES
    -->
    <integer name="config_defaultNightMode">1</integer>

    <!-- Boolean indicating whether the HWC setColorTransform function can be performed efficiently
         in hardware. -->
    <bool name="config_setColorTransformAccelerated">true</bool>

    <!-- Boolean indicating whether the HWC setColorTransform function can be performed efficiently
         in hardware for individual layers. -->
    <bool name="config_setColorTransformAcceleratedPerLayer">true</bool>

    <!-- Control whether Night display is available. This should only be enabled on devices
         that have a HWC implementation that can apply the matrix passed to setColorTransform
         without impacting power, performance, and app compatibility (e.g. protected content). -->
    <bool name="config_nightDisplayAvailable">@bool/config_setColorTransformAccelerated</bool>

    <!-- Default mode to control how Night display is automatically activated.
         One of the following values (see ColorDisplayManager.java):
             0 - AUTO_MODE_DISABLED
             1 - AUTO_MODE_CUSTOM_TIME
             2 - AUTO_MODE_TWILIGHT
    -->
    <integer name="config_defaultNightDisplayAutoMode">2</integer>

    <!-- Default time when Night display is automatically activated.
         Represented as milliseconds from midnight (e.g. 79200000 == 10pm). -->
    <integer name="config_defaultNightDisplayCustomStartTime">79200000</integer>

    <!-- Default time when Night display is automatically deactivated.
         Represented as milliseconds from midnight (e.g. 21600000 == 6am). -->
    <integer name="config_defaultNightDisplayCustomEndTime">21600000</integer>

    <!-- Minimum color temperature, in Kelvin, supported by Night display. -->
    <integer name="config_nightDisplayColorTemperatureMin">2596</integer>

    <!-- Default color temperature, in Kelvin, to tint the screen when Night display is
         activated. -->
    <integer name="config_nightDisplayColorTemperatureDefault">2850</integer>

    <!-- Maximum color temperature, in Kelvin, supported by Night display. -->
    <integer name="config_nightDisplayColorTemperatureMax">4082</integer>

    <string-array name="config_nightDisplayColorTemperatureCoefficientsNative">
        <!-- R a-coefficient --> <item>0.0</item>
        <!-- R b-coefficient --> <item>0.0</item>
        <!-- R y-intercept --> <item>1.0</item>
        <!-- G a-coefficient --> <item>-0.00000000962353339</item>
        <!-- G b-coefficient --> <item>0.000153045476</item>
        <!-- G y-intercept --> <item>0.390782778</item>
        <!-- B a-coefficient --> <item>-0.0000000189359041</item>
        <!-- B b-coefficient --> <item>0.000302412211</item>
        <!-- B y-intercept --> <item>-0.198650895</item>
    </string-array>

    <string-array name="config_nightDisplayColorTemperatureCoefficients">
        <!-- R a-coefficient --> <item>0.0</item>
        <!-- R b-coefficient --> <item>0.0</item>
        <!-- R y-intercept --> <item>1.0</item>
        <!-- G a-coefficient --> <item>-0.00000000962353339</item>
        <!-- G b-coefficient --> <item>0.000153045476</item>
        <!-- G y-intercept --> <item>0.390782778</item>
        <!-- B a-coefficient --> <item>-0.0000000189359041</item>
        <!-- B b-coefficient --> <item>0.000302412211</item>
        <!-- B y-intercept --> <item>-0.198650895</item>
    </string-array>

    <!-- Control whether bright color reduction is available. This should only be enabled on devices
         that have a HWC implementation that can apply the matrix passed to setColorTransform
         without impacting power, performance, and app compatibility (e.g. protected content). -->
    <bool name="config_reduceBrightColorsAvailable">@bool/config_setColorTransformAccelerated</bool>

    <string-array name="config_reduceBrightColorsCoefficientsNonlinear">
        <!-- a-coefficient --> <item>-0.4429953456</item>
        <!-- b-coefficient --> <item>-0.2434077725</item>
        <!-- y-intercept --> <item>0.9809063061</item>
    </string-array>

    <string-array name="config_reduceBrightColorsCoefficients">
        <!-- a-coefficient --> <item>-0.000000000000001</item>
        <!-- b-coefficient --> <item>-0.955555555555554</item>
        <!-- y-intercept --> <item>1.000000000000000</item>
    </string-array>

    <!-- Default strength, in percentage, of bright color reduction when activated. -->
    <integer name="config_reduceBrightColorsStrengthDefault">50</integer>

    <!-- Minimum strength, in percentage, supported by bright color reduction. -->
    <integer name="config_reduceBrightColorsStrengthMin">25</integer>

    <!-- Maximum strength, in percentage, supported by bright color reduction. -->
    <integer name="config_reduceBrightColorsStrengthMax">90</integer>

    <!-- Boolean indicating whether display white balance is supported. -->
    <bool name="config_displayWhiteBalanceAvailable">true</bool>

    <!-- Boolean indicating whether display white balance should be enabled by default. -->
    <bool name="config_displayWhiteBalanceEnabledDefault">true</bool>

    <!-- Minimum color temperature, in Kelvin, supported by display white balance. -->
    <integer name="config_displayWhiteBalanceColorTemperatureMin">4000</integer>

    <!-- Maximum color temperature, in Kelvin, supported by display white balance. -->
    <integer name="config_displayWhiteBalanceColorTemperatureMax">8000</integer>

    <!-- Default color temperature, in Kelvin, used by display white balance. -->
    <integer name="config_displayWhiteBalanceColorTemperatureDefault">6500</integer>

    <!-- The display primaries, in CIE1931 XYZ color space, for display
         white balance to use in its calculations. The array must include a total of 12 float
         values: 3 values per color (X, Y, Z) and 4 colors (R, G, B, W) -->
    <string-array name="config_displayWhiteBalanceDisplayPrimaries">
        <!-- Red X -->   <item>0.412315</item>
        <!-- Red Y -->   <item>0.212600</item>
        <!-- Red Z -->   <item>0.019327</item>
        <!-- Green X --> <item>0.357600</item>
        <!-- Green Y --> <item>0.715200</item>
        <!-- Green Z --> <item>0.119200</item>
        <!-- Blue X -->  <item>0.180500</item>
        <!-- Blue Y -->  <item>0.072200</item>
        <!-- Blue Z -->  <item>0.950633</item>
        <!-- White X --> <item>0.950456</item>
        <!-- White Y --> <item>1.000000</item>
        <!-- White Z --> <item>1.089058</item>
    </string-array>

    <!-- The nominal white coordinates, in CIE1931 XYZ color space, for Display White Balance to
         use in its calculations. AWB will adapt this white point to the target ambient white
         point. The array must include a total of 3 float values (X, Y, Z) -->
    <string-array name="config_displayWhiteBalanceDisplayNominalWhite">
        <!-- Nominal White X --> <item>0.950456</item>
        <!-- Nominal White Y --> <item>1.000000</item>
        <!-- Nominal White Z --> <item>1.089058</item>
    </string-array>


    <!-- Indicate available ColorDisplayManager.COLOR_MODE_xxx. -->
    <integer-array name="config_availableColorModes">
        <!-- Example:
        <item>0</item>
        <item>1</item>
        <item>2</item>
        -->
    </integer-array>

    <!-- Mapping for default ColorDisplayManager.COLOR_MODE_xxx to other color modes, if
         if applicable. By default, all map to the same value. -->
    <integer-array name="config_mappedColorModes">
        <item>0</item> <!-- COLOR_MODE_NATURAL -->
        <item>1</item> <!-- COLOR_MODE_BOOSTED -->
        <item>2</item> <!-- COLOR_MODE_SATURATED -->
        <item>3</item> <!-- COLOR_MODE_AUTOMATIC -->
    </integer-array>

    <!-- Hint to decide whether restored vendor color modes are compatible with the new device. If
         unset or a match is not made, only the standard color modes will be restored. If set, it
         should be a unique identifier for the kinds of vendor modes this device supports, such as a
         manufacturer name. -->
    <string name="config_vendorColorModesRestoreHint" translatable="false"></string>

    <!-- Color mode to use when accessibility transforms are enabled. This color mode must be
         supported by the device, but not necessarily appear in config_availableColorModes. The
         regularly selected color mode will be used if this value is negative. -->
    <integer name="config_accessibilityColorMode">-1</integer>

    <!-- The following two arrays specify which color space to use for display composition when a
         certain color mode is active.
         Composition color spaces are defined in android.view.Display.COLOR_MODE_xxx, and color
         modes are defined in ColorDisplayManager.COLOR_MODE_xxx and
         ColorDisplayManager.VENDOR_COLOR_MODE_xxx.
         The color space COLOR_MODE_DEFAULT (0) lets the system select the most appropriate
         composition color space for currently displayed content. Other values (e.g.,
         COLOR_MODE_SRGB) override system selection; these other color spaces must be supported by
         the device for for display composition.
         If a color mode does not have a corresponding color space specified in this array, the
         currently set composition color space will not be modified.-->
    <integer-array name="config_displayCompositionColorModes">
    </integer-array>
    <integer-array name="config_displayCompositionColorSpaces">
    </integer-array>

    <!-- Indicate whether to allow the device to suspend when the screen is off
         due to the proximity sensor.  This resource should only be set to true
         if the sensor HAL correctly handles the proximity sensor as a wake-up source.
         Otherwise, the device may fail to wake out of suspend reliably.
         The default is false. -->
    <bool name="config_suspendWhenScreenOffDueToProximity">true</bool>

    <!-- The time in milliseconds of prolonged user inactivity after which device goes to sleep,
         even if wakelocks are held. -->
    <integer name="config_attentiveTimeout">-1</integer>

    <!-- How long to show a warning message to user before the device goes to sleep after prolonged
         user inactivity. -->
    <integer name="config_attentiveWarningDuration">30000</integer>

    <!-- Control the behavior when the user long presses the power button.
            0 - Nothing
            1 - Global actions menu
            2 - Power off (with confirmation)
            3 - Power off (without confirmation)
            4 - Go to voice assist
            5 - Go to assistant (Settings.Secure.ASSISTANT)
    -->
    <integer name="config_longPressOnPowerBehavior">5</integer>

    <!-- The time in milliseconds after which a press on power button is considered "long". -->
    <integer name="config_longPressOnPowerDurationMs">500</integer>

    <!-- The possible UI options to be surfaced for configuring long press power on duration
         action. Value set in config_longPressOnPowerDurationMs should be one of the available
         options to allow users to restore default. -->
    <integer-array name="config_longPressOnPowerDurationSettings">
        <item>250</item>
        <item>350</item>
        <item>500</item>
        <item>650</item>
        <item>750</item>
    </integer-array>

    <!-- Whether the setting to change long press on power behaviour from default to assistant (5)
         is available in Settings.
     -->
    <bool name="config_longPressOnPowerForAssistantSettingAvailable">true</bool>

    <!-- Control the behavior when the user long presses the power button for a long time.
            0 - Nothing
            1 - Global actions menu
    -->
    <integer name="config_veryLongPressOnPowerBehavior">0</integer>

    <!-- Control the behavior when the user presses the power and volume up buttons together.
            0 - Nothing
            1 - Mute toggle
            2 - Global actions menu
    -->
    <integer name="config_keyChordPowerVolumeUp">2</integer>

    <!-- Control the behavior when the user long presses the back button.  Non-zero values are only
         valid for watches as part of CDD/CTS.
            0 - Nothing
            1 - Go to voice assist
    -->
    <integer name="config_longPressOnBackBehavior">0</integer>

    <!-- Allows activities to be launched on a long press on power during device setup. -->
    <bool name="config_allowStartActivityForLongPressOnPowerInSetup">true</bool>

    <!-- Control the behavior when the user short presses the power button.
            0 - Nothing
            1 - Go to sleep (doze)
            2 - Really go to sleep (don't doze)
            3 - Really go to sleep and go home (don't doze)
            4 - Go to home
            5 - Dismiss IME if shown. Otherwise go to home
    -->
    <integer name="config_shortPressOnPowerBehavior">1</integer>

    <!-- Control the behavior when the user double presses the power button.
            0 - Nothing
            1 - Toggle theater mode setting
            2 - Brightness boost
    -->
    <integer name="config_doublePressOnPowerBehavior">2</integer>

    <!-- Control the behavior when the user triple presses the power button.
            0 - Nothing
            1 - Toggle theater mode setting
            2 - Brightness boost
    -->
    <integer name="config_triplePressOnPowerBehavior">1</integer>

    <!-- Control the behavior when the user presses the sleep button.
            0 - Go to sleep (doze)
            1 - Go to sleep (doze) and go home
    -->
    <integer name="config_shortPressOnSleepBehavior">0</integer>

    <!-- Time to wait while a button is pressed before triggering a very long press. -->
    <integer name="config_veryLongPressTimeout">3500</integer>

    <!-- Time to wait before sending a HOME intent when waking up from power/home button.
         (0 - do not send HOME intent on wakeup)
    -->
    <integer name="config_wakeUpToLastStateTimeoutMillis">0</integer>

    <!-- Package name for default keyguard appwidget [DO NOT TRANSLATE] -->
    <string name="widget_default_package_name" translatable="false"></string>

    <!-- Class name for default keyguard appwidget [DO NOT TRANSLATE] -->
    <string name="widget_default_class_name" translatable="false"></string>

    <!-- Indicate whether the SD card is accessible without removing the battery. -->
    <bool name="config_batterySdCardAccessibility">true</bool>

    <!-- List of file paths for USB host busses to exclude from USB host support.
         For example, if the first USB bus on the device is used to communicate
         with the modem or some other restricted hardware, add "/dev/bus/usb/001/"
         to this list.  If this is empty, no parts of the host USB bus will be excluded.
    -->
    <string-array name="config_usbHostDenylist" translatable="false">
    </string-array>

    <!-- List of paths to serial ports that are available to the serial manager.
         for example, /dev/ttyUSB0
    -->
    <string-array translatable="false" name="config_serialPorts">
    </string-array>

    <!-- Vibrator pattern for feedback about a long screen/key press -->
    <integer-array name="config_longPressVibePattern">
        <item>0</item>
        <item>1</item>
        <item>20</item>
        <item>21</item>
    </integer-array>

    <!-- Vibrator pattern for feedback about touching a virtual key -->
    <integer-array name="config_virtualKeyVibePattern">
        <item>0</item>
        <item>10</item>
        <item>20</item>
        <item>30</item>
    </integer-array>

    <!-- Vibrator pattern for a very short but reliable vibration for soft keyboard tap -->
    <integer-array name="config_keyboardTapVibePattern">
        <item>40</item>
    </integer-array>

    <!-- Vibrator pattern for feedback when selecting an hour/minute tick of a Clock -->
    <integer-array name="config_clockTickVibePattern">
        <item>125</item>
        <item>30</item>
    </integer-array>

    <!-- Vibrator pattern for feedback when selecting a day/month/year date of a Calendar -->
    <integer-array name="config_calendarDateVibePattern">
        <item>125</item>
        <item>30</item>
    </integer-array>

    <!-- Vibrator pattern for feedback about booting with safe mode enabled -->
    <integer-array name="config_safeModeEnabledVibePattern">
        <item>0</item>
        <item>1</item>
        <item>20</item>
        <item>21</item>
        <item>500</item>
        <item>600</item>
    </integer-array>

    <!-- Vibrator pattern for feedback about hitting a scroll barrier -->
    <integer-array name="config_scrollBarrierVibePattern">
        <item>0</item>
        <item>15</item>
        <item>10</item>
        <item>10</item>
    </integer-array>

    <!-- The URI to associate with each ringtone effect constant, intended to be used with the
         android.os.VibrationEffect#get(Uri, Context) API.
         The position of the string in the string-array determines which ringtone effect is chosen.
         For example, if the URI passed into get match the third string in the string-array, then
         RINGTONE_3 will be the returned effect -->
    <string-array translatable="false" name="config_ringtoneEffectUris">
    </string-array>

    <!-- The default intensity level for haptic feedback. See
         Settings.System.HAPTIC_FEEDBACK_INTENSITY more details on the constant values and
         meanings. -->
    <integer name="config_defaultHapticFeedbackIntensity">2</integer>
    <!-- The default intensity level for notification vibrations. See
         Settings.System.NOTIFICATION_VIBRATION_INTENSITY more details on the constant values and
         meanings. -->
    <integer name="config_defaultNotificationVibrationIntensity">2</integer>
    <!-- The default intensity level for ring vibrations. See
         Settings.System.RING_VIBRATION_INTENSITY more details on the constant values and
         meanings. -->
    <integer name="config_defaultRingVibrationIntensity">2</integer>

    <!-- Whether to use the strict phone number matcher by default. -->
    <bool name="config_use_strict_phone_number_comparation">true</bool>

    <!-- Whether to use the strict phone number matcher in Russia. -->
    <bool name="config_use_strict_phone_number_comparation_for_russia">true</bool>

    <!-- Whether to use the strict phone number matcher in Kazakhstan. -->
    <bool name="config_use_strict_phone_number_comparation_for_kazakhstan">true</bool>

    <!-- The character count of the minimum match for comparison phone numbers -->
    <integer name="config_phonenumber_compare_min_match">7</integer>

    <!-- Display low battery warning when battery level dips to this value.
         Also, the battery stats are flushed to disk when we hit this level.  -->
    <integer name="config_criticalBatteryWarningLevel">5</integer>

    <!-- Shutdown if the battery temperature exceeds (this value * 0.1) Celsius. -->
    <integer name="config_shutdownBatteryTemperature">680</integer>

    <!-- Display low battery warning when battery level dips to this value -->
    <integer name="config_lowBatteryWarningLevel">15</integer>

    <!-- The default suggested battery % at which we enable battery saver automatically.  -->
    <integer name="config_lowBatteryAutoTriggerDefaultLevel">15</integer>

    <!-- The app which will handle routine based automatic battery saver, if empty the UI for
         routine based battery saver will be hidden -->
    <string name="config_batterySaverScheduleProvider"></string>

    <!-- Close low battery warning when battery level reaches the lowBatteryWarningLevel
         plus this -->
    <integer name="config_lowBatteryCloseWarningBump">5</integer>

    <!-- Default color for notification LED. -->
    <color name="config_defaultNotificationColor">#ffffffff</color>

    <!-- Default LED on time for notification LED in milliseconds. -->
    <integer name="config_defaultNotificationLedOn">500</integer>

    <!-- Default LED off time for notification LED in milliseconds. -->
    <integer name="config_defaultNotificationLedOff">2000</integer>

    <!-- Default value for led color when battery is low on charge -->
    <integer name="config_notificationsBatteryLowARGB">0xFFFF0000</integer>

    <!-- Default value for led color when battery is medium charged -->
    <integer name="config_notificationsBatteryMediumARGB">0xFFFFFF00</integer>

    <!-- Default value for led color when battery is fully charged -->
    <integer name="config_notificationsBatteryFullARGB">0xFF00FF00</integer>

    <!-- Default value for LED on time when the battery is low on charge in miliseconds -->
    <integer name="config_notificationsBatteryLedOn">125</integer>

    <!-- Is the notification LED intrusive? Used to decide if there should be a disable option -->
    <bool name="config_intrusiveNotificationLed">true</bool>

    <!-- De we do icon badges? Used to decide if there should be a disable option-->
    <bool name="config_notificationBadging">true</bool>

    <!-- Default value for LED off time when the battery is low on charge in miliseconds -->
    <integer name="config_notificationsBatteryLedOff">2875</integer>

    <!-- If true, only colorized CallStyle notifications will apply custom colors -->
    <bool name="config_callNotificationActionColorsRequireColorized">true</bool>

    <!-- Number of notifications to keep in the notification service historical archive -->
    <integer name="config_notificationServiceArchiveSize">100</integer>

    <!-- Allow the menu hard key to be disabled in LockScreen on some devices -->
    <bool name="config_disableMenuKeyInLockScreen">false</bool>

    <!-- Don't show lock screen before unlock screen (PIN/pattern/password) -->
    <bool name="config_enableLockBeforeUnlockScreen">true</bool>

    <!-- Disable lockscreen rotation by default -->
    <bool name="config_enableLockScreenRotation">true</bool>

    <!-- Is the device capable of hot swapping an UICC Card -->
    <bool name="config_hotswapCapable">true</bool>

    <!-- Component name of the ICC hotswap prompt for restart dialog -->
    <string name="config_iccHotswapPromptForRestartDialogComponent" translatable="false">@null</string>

    <!-- Enable puk unlockscreen by default.
         If unlock screen is disabled, the puk should be unlocked through Emergency Dialer -->
    <bool name="config_enable_puk_unlock_screen">true</bool>

    <!-- Enable emergency call when sim is locked or puk locked. Some countries/carriers do not
         allow emergency calls to be placed without the IMSI, which is locked in the SIM.
         If so, this should be set to 'false' in an overlay. -->
    <bool name="config_enable_emergency_call_while_sim_locked">true</bool>

    <!-- Is the lock-screen disabled for new users by default -->
    <bool name="config_disableLockscreenByDefault">false</bool>

    <!-- If true, enables verification of the lockscreen credential in the factory reset protection
        flow. This should be true if gatekeeper / weaver credentials can still be checked after a
        factory reset. -->
    <bool name="config_enableCredentialFactoryResetProtection">true</bool>

    <!-- Control the behavior when the user long presses the home button.
            0 - Nothing
            1 - Launch all apps intent
            2 - Launch assist intent
            3 - Launch notification panel
         This needs to match the constants in
         policy/src/com/android/internal/policy/impl/PhoneWindowManager.java
    -->
    <integer name="config_longPressOnHomeBehavior">2</integer>

    <!-- Control the behavior when the user double-taps the home button.
            0 - Nothing
            1 - Recent apps view in SystemUI
         This needs to match the constants in
         policy/src/com/android/internal/policy/impl/PhoneWindowManager.java
    -->
    <integer name="config_doubleTapOnHomeBehavior">1</integer>

    <!-- Note: This setting is deprecated, please use
    config_screenBrightnessSettingMinimumFloat instead -->
    <integer name="config_screenBrightnessSettingMinimum">10</integer>

    <!-- Note: This setting is deprecated, please use
    config_screenBrightnessSettingMaximumFloat instead -->
    <integer name="config_screenBrightnessSettingMaximum">255</integer>

    <!-- Note: This setting is deprecated, please use
    config_screenBrightnessSettingDefaultFloat instead -->
    <integer name="config_screenBrightnessSettingDefault">102</integer>

    <!-- Minimum screen brightness setting allowed by power manager.
         -2 is invalid so setting will resort to int value specified above.
         Set this to 0.0 to allow screen to go to minimal brightness.
         The user is forbidden from setting the brightness below this level. -->
    <item name="config_screenBrightnessSettingMinimumFloat" format="float" type="dimen">-2</item>

    <!-- Maximum screen brightness allowed by the power manager.
         -2 is invalid so setting will resort to int value specified above.
         Set this to 1.0 for maximum brightness range.
         The user is forbidden from setting the brightness above this level. -->
    <item name="config_screenBrightnessSettingMaximumFloat" format="float" type="dimen">-2</item>

    <!-- Default screen brightness setting set.
         -2 is invalid so setting will resort to int value specified above.
         Must be in the range specified by minimum and maximum. -->
    <item name="config_screenBrightnessSettingDefaultFloat" format="float" type="dimen">-2</item>

    <!-- Note: This setting is deprecated, please use
    config_screenBrightnessSettingForVrDefaultFloat instead -->
    <integer name="config_screenBrightnessForVrSettingDefault">86</integer>

    <!-- Note: This setting is deprecated, please use
    config_screenBrightnessSettingForVrMinimumFloat instead -->
    <integer name="config_screenBrightnessForVrSettingMinimum">79</integer>

    <!-- Note: This setting is deprecated, please use
    config_screenBrightnessSettingForVrMaximumFloat instead -->
    <integer name="config_screenBrightnessForVrSettingMaximum">255</integer>

    <!-- Default screen brightness for VR setting as a float.
    Equivalent to 86/255-->
    <item name="config_screenBrightnessSettingForVrDefaultFloat" format="float" type="dimen">0.33464</item>

    <!-- Minimum screen brightness setting allowed for VR. Device panels start increasing pulse
     width as brightness decreases below this threshold as float.
     Equivalent to 79/255 -->
    <item name="config_screenBrightnessSettingForVrMinimumFloat" format="float" type="dimen">0.307087</item>

    <!-- Maximum screen brightness setting allowed for VR as float. -->
    <item name="config_screenBrightnessSettingForVrMaximumFloat" format="float" type="dimen">1.0</item>

    <!-- Screen brightness used to dim the screen while dozing in a very low power state.
         May be less than the minimum allowed brightness setting
         that can be set by the user. -->
    <integer name="config_screenBrightnessDoze">1</integer>
    <item name="config_screenBrightnessDozeFloat" format="float" type="dimen">0.0</item>

    <!-- Delay that allows some content to arrive at the display before switching
         from DOZE to ON. -->
    <integer name="config_wakeUpDelayDoze">0</integer>

    <!-- Whether or not to skip the initial brightness ramps when the display transitions to
         STATE_ON. Setting this to true will skip the brightness ramp to the last stored active
         brightness value and will repeat for the following ramp if autobrightness is enabled. -->
    <bool name="config_skipScreenOnBrightnessRamp">false</bool>

    <!-- Allow automatic adjusting of the screen brightness while dozing in low power state. -->
    <bool name="config_allowAutoBrightnessWhileDozing">true</bool>

    <!-- Stability requirements in milliseconds for accepting a new brightness level.  This is used
         for debouncing the light sensor.  Different constants are used to debounce the light sensor
         when adapting to brighter or darker environments.  This parameter controls how quickly
         brightness changes occur in response to an observed change in light level that exceeds the
         hysteresis threshold. -->
    <integer name="config_autoBrightnessBrighteningLightDebounce">4000</integer>
    <integer name="config_autoBrightnessDarkeningLightDebounce">8000</integer>

    <!-- Initial light sensor event rate in milliseconds for automatic brightness control. This is
         used for obtaining the first light sample when the device stops dozing.

         Set this to -1 to disable this feature. -->
    <integer name="config_autoBrightnessInitialLightSensorRate">-1</integer>

    <!-- Light sensor event rate in milliseconds for automatic brightness control. -->
    <integer name="config_autoBrightnessLightSensorRate">250</integer>

    <!-- The maximum range of gamma adjustment possible using the screen
         auto-brightness adjustment setting. -->
    <fraction name="config_autoBrightnessAdjustmentMaxGamma">300%</fraction>

    <!-- If we allow automatic adjustment of screen brightness while dozing, how many times we want
         to reduce it to preserve the battery. Value of 100% means no scaling. -->
    <fraction name="config_screenAutoBrightnessDozeScaleFactor">100%</fraction>

    <!-- When the screen is turned on, the previous estimate of the ambient light level at the time
         the screen was turned off is restored and is used to determine the initial screen
         brightness.

         If this flag is true, then the ambient light level estimate will be promptly recomputed
         after the warm-up interface and the screen brightness will be adjusted immediately.

         If this flag is false, then the ambient light level estimate will be adjusted more
         gradually in the same manner that normally happens when the screen is on according to the
         brightening or dimming debounce thresholds.  As a result, it may take somewhat longer to
         adapt to the environment.  This mode may be better suited for watches. -->
    <bool name="config_autoBrightnessResetAmbientLuxAfterWarmUp">true</bool>

    <!-- Screen brightness used to dim the screen when the user activity
         timeout expires.  May be less than the minimum allowed brightness setting
         that can be set by the user. -->
    <integer name="config_screenBrightnessDim">10</integer>
    <item name="config_screenBrightnessDimFloat" format="float" type="dimen">0.05</item>

    <!-- If the screen brightness is already set at or below config_screenBrightnessDim, and the
         user activity timeout expires, we still want to dim the screen slightly to indicate that
         the device is about to go to sleep. The screen will dim by this amount in that case.
         -->
    <item name="config_screenBrightnessMinimumDimAmountFloat" format="float" type="dimen">0.04</item>

    <!-- Minimum allowable screen brightness to use in a very dark room.
         This value sets the floor for the darkest possible auto-brightness
         adjustment.  It is expected to be somewhat less than the first entry in
         config_autoBrightnessLcdBacklightValues so as to allow the user to have
         some range of adjustment to dim the screen further than usual in very
         dark rooms. The contents of the screen must still be clearly visible
         in darkness (although they may not be visible in a bright room). -->
    <integer name="config_screenBrightnessDark">1</integer>

    <!-- Array of lux values to define the minimum brightness curve, which guarantees that any
         brightness curve that dips below it is rejected by the system.
         This prevents auto-brightness from setting the screen so dark as to prevent the user from
         resetting or disabling it.

         The values must be non-negative and strictly increasing, and correspond to the values in
         the config_minimumBrightnessCurveNits array. -->
    <array name="config_minimumBrightnessCurveLux">
        <item>0.0</item>
        <item>2000.0</item>
        <item>4000.0</item>
    </array>

    <!-- Array of nits values to define the minimum brightness curve, which guarantees that any
         brightness curve that dips below it is rejected by the system.
         This should map lux to the absolute minimum nits that are still readable in that ambient
         brightness.

         The values must be non-negative and non-decreasing, and correspond to the values in the
         config_minimumBrightnessCurveLux array. -->
    <array name="config_minimumBrightnessCurveNits">
        <item>0.0</item>
        <item>50.0</item>
        <item>90.0</item>
    </array>

    <!-- Array of light sensor lux values to define our levels for auto backlight brightness support.
         The N entries of this array define N + 1 control points as follows:
         (1-based arrays)

         Point 1:            (0, value[1]):             lux <= 0
         Point 2:     (level[1], value[2]):  0        < lux <= level[1]
         Point 3:     (level[2], value[3]):  level[2] < lux <= level[3]
         ...
         Point N+1: (level[N], value[N+1]):  level[N] < lux

         The control points must be strictly increasing.  Each control point
         corresponds to an entry in the brightness backlight values arrays.
         For example, if lux == level[1] (first element of the levels array)
         then the brightness will be determined by value[2] (second element
         of the brightness values array).

         Spline interpolation is used to determine the auto-brightness
         backlight values for lux levels between these control points.

         Must be overridden in platform specific overlays -->
    <integer-array name="config_autoBrightnessLevels">
    </integer-array>

    <!-- Timeout (in milliseconds) after which we remove the effects any user interactions might've
         had on the brightness mapping. This timeout doesn't start until we transition to a
         non-interactive display policy so that we don't reset while users are using their devices,
         but also so that we don't erroneously keep the short-term model if the device is dozing
         but the display is fully on. -->
    <integer name="config_autoBrightnessShortTermModelTimeout">300000</integer>

    <!-- Array of output values for LCD backlight corresponding to the lux values
         in the config_autoBrightnessLevels array.  This array should have size one greater
         than the size of the config_autoBrightnessLevels array.
         The brightness values must be between 0 and 255 and be non-decreasing.
         This must be overridden in platform specific overlays -->
    <integer-array name="config_autoBrightnessLcdBacklightValues">
    </integer-array>

    <!-- Array of desired screen brightness in nits corresponding to the lux values
         in the config_autoBrightnessLevels array. As with config_screenBrightnessMinimumNits and
         config_screenBrightnessMaximumNits, the display brightness is defined as the measured
         brightness of an all-white image.

         If this is defined then:
            - config_autoBrightnessLcdBacklightValues should not be defined
            - config_screenBrightnessNits must be defined
            - config_screenBrightnessBacklight must be defined

         This array should have size one greater than the size of the config_autoBrightnessLevels
         array. The brightness values must be non-negative and non-decreasing. This must be
         overridden in platform specific overlays -->
    <array name="config_autoBrightnessDisplayValuesNits">
    </array>

    <!-- Array of output values for button backlight corresponding to the luX values
         in the config_autoBrightnessLevels array.  This array should have size one greater
         than the size of the config_autoBrightnessLevels array.
         The brightness values must be between 0 and 255 and be non-decreasing.
         This must be overridden in platform specific overlays -->
    <integer-array name="config_autoBrightnessButtonBacklightValues">
    </integer-array>

    <!-- Array of output values for keyboard backlight corresponding to the lux values
         in the config_autoBrightnessLevels array.  This array should have size one greater
         than the size of the config_autoBrightnessLevels array.
         The brightness values must be between 0 and 255 and be non-decreasing.
         This must be overridden in platform specific overlays -->
    <integer-array name="config_autoBrightnessKeyboardBacklightValues">
    </integer-array>

    <!-- An array describing the screen's backlight values corresponding to the brightness
         values in the config_screenBrightnessNits array.

         This array should be equal in size to config_screenBrightnessBacklight. -->
    <integer-array name="config_screenBrightnessBacklight">
    </integer-array>

    <!-- An array of floats describing the screen brightness in nits corresponding to the backlight
         values in the config_screenBrightnessBacklight array.  On OLED displays these  values
         should be measured with an all white image while the display is in the fully on state.
         Note that this value should *not* reflect the maximum brightness value for any high
         brightness modes but only the maximum brightness value obtainable in a sustainable manner.

         This array should be equal in size to config_screenBrightnessBacklight -->
    <array name="config_screenBrightnessNits">
    </array>

    <!-- Array of ambient lux threshold values. This is used for determining hysteresis constraint
         values by calculating the index to use for lookup and then setting the constraint value
         to the corresponding value of the array. The new brightening hysteresis constraint value
         is the n-th element of config_ambientBrighteningThresholds, and the new darkening
         hysteresis constraint value is the n-th element of config_ambientDarkeningThresholds.

         The (zero-based) index is calculated as follows: (MAX is the largest index of the array)
         condition                       calculated index
         value < level[0]                0
         level[n] <= value < level[n+1]  n+1
         level[MAX] <= value             MAX+1 -->
    <integer-array name="config_ambientThresholdLevels">
    </integer-array>

    <!-- Array of hysteresis constraint values for brightening, represented as tenths of a
         percent. The length of this array is assumed to be one greater than
         config_ambientThresholdLevels. The brightening threshold is calculated as
         lux * (1.0f + CONSTRAINT_VALUE). When the current lux is higher than this threshold,
         the screen brightness is recalculated. See the config_ambientThresholdLevels
         description for how the constraint value is chosen. -->
    <integer-array name="config_ambientBrighteningThresholds">
        <item>100</item>
    </integer-array>

    <!-- Array of hysteresis constraint values for darkening, represented as tenths of a
         percent. The length of this array is assumed to be one greater than
         config_ambientThresholdLevels. The darkening threshold is calculated as
         lux * (1.0f - CONSTRAINT_VALUE). When the current lux is lower than this threshold,
         the screen brightness is recalculated. See the config_ambientThresholdLevels
         description for how the constraint value is chosen. -->
    <integer-array name="config_ambientDarkeningThresholds">
        <item>200</item>
    </integer-array>

    <!-- Array of screen brightness threshold values. This is used for determining hysteresis
         constraint values by calculating the index to use for lookup and then setting the
         constraint value to the corresponding value of the array. The new brightening hysteresis
         constraint value is the n-th element of config_screenBrighteningThresholds, and the new
         darkening hysteresis constraint value is the n-th element of
         config_screenDarkeningThresholds.

         The (zero-based) index is calculated as follows: (MAX is the largest index of the array)
         condition                       calculated index
         value < level[0]                0
         level[n] <= value < level[n+1]  n+1
         level[MAX] <= value             MAX+1 -->
    <integer-array name="config_screenThresholdLevels">
    </integer-array>

    <!-- Array of hysteresis constraint values for brightening, represented as tenths of a
         percent. The length of this array is assumed to be one greater than
         config_screenThresholdLevels. The brightening threshold is calculated as
         screenBrightness * (1.0f + CONSTRAINT_VALUE). When the new screen brightness is higher
         than this threshold, it is applied. See the config_screenThresholdLevels description for
         how the constraint value is chosen. -->
    <integer-array name="config_screenBrighteningThresholds">
        <item>100</item>
    </integer-array>

    <!-- Array of hysteresis constraint values for darkening, represented as tenths of a
         percent. The length of this array is assumed to be one greater than
         config_screenThresholdLevels. The darkening threshold is calculated as
         screenBrightness * (1.0f - CONSTRAINT_VALUE). When the new screen brightness is lower than
         this threshold, it is applied. See the config_screenThresholdLevels description for how
         the constraint value is chosen. -->
    <integer-array name="config_screenDarkeningThresholds">
        <item>200</item>
    </integer-array>

    <!-- Amount of time it takes for the light sensor to warm up in milliseconds.
         For this time after the screen turns on, the Power Manager
         will not debounce light sensor readings -->
    <integer name="config_lightSensorWarmupTime">0</integer>

    <!-- Enables swipe versus poly-finger touch disambiguation in the KeyboardView -->
    <bool name="config_swipeDisambiguation">true</bool>

    <!-- Specifies the amount of time to disable virtual keys after the screen is touched
         in order to filter out accidental virtual key presses due to swiping gestures
         or taps near the edge of the display.  May be 0 to disable the feature.
         It is recommended that this value be no more than 250 ms.
         This feature should be disabled for most devices. -->
    <integer name="config_virtualKeyQuietTimeMillis">0</integer>

    <!-- A list of potential packages, in priority order, that may contain an
         ephemeral resolver. Each package will be be queried for a component
         that has been granted the PACKAGE_EPHEMERAL_AGENT permission.
         This may be empty if ephemeral apps are not supported. -->
    <string-array name="config_ephemeralResolverPackage" translatable="false">
        <!-- Add packages here -->
    </string-array>

    <!-- The set of system packages on device that are queryable by any app regardless of the
         contents of its manifest. -->
    <string-array name="config_forceQueryablePackages" translatable="false">
        <item>com.android.settings</item>
        <item>com.android.providers.settings</item>
        <!-- Add packages here -->
    </string-array>

    <!-- If true, will force all packages on any system partition as queryable by any app regardless
         of the contents of its manifest. -->
    <bool name="config_forceSystemPackagesQueryable">true</bool>

    <!-- Component name of the default wallpaper. This will be ImageWallpaper if not
         specified -->
    <string name="default_wallpaper_component" translatable="false">@null</string>

    <!-- By default a product has no distinct default lock wallpaper -->
    <item name="default_lock_wallpaper" type="drawable">@null</item>

    <!-- Component name of the built in wallpaper used to display bitmap wallpapers. This must not be null. -->
    <string name="image_wallpaper_component" translatable="false">com.android.systemui/com.android.systemui.ImageWallpaper</string>

    <!-- True if WallpaperService is enabled -->
    <bool name="config_enableWallpaperService">true</bool>

    <!-- True if the device should block turning display on at boot until wallpaper is ready -->
    <bool name="config_checkWallpaperAtBoot">false</bool>

    <!-- Class name of WallpaperManagerService. -->
    <string name="config_wallpaperManagerServiceName" translatable="false">com.android.server.wallpaper.WallpaperManagerService</string>

    <!-- Specifies priority of automatic time sources. Suggestions from higher entries in the list
         take precedence over lower ones.
         See com.android.server.timedetector.TimeDetectorStrategy for available sources. -->
    <string-array name="config_autoTimeSourcesPriority">
        <item>network</item>
        <item>telephony</item>
    </string-array>

    <!-- Enables the GnssTimeUpdate service. This is the global switch for enabling Gnss time based
         suggestions to TimeDetector service. See also config_autoTimeSourcesPriority. -->
    <bool name="config_enableGnssTimeUpdateService">false</bool>

    <!-- Enables the TimeZoneRuleManager service. This is the global switch for the updateable time
         zone update mechanism. -->
    <bool name="config_enableUpdateableTimeZoneRules">false</bool>

    <!-- Enables APK-based time zone update triggering. Set this to false when updates are triggered
         via external events and not by APK updates. For example, if an updater checks with a server
         on a regular schedule.
         [This is only used if config_enableUpdateableTimeZoneRules is true.] -->
    <bool name="config_timeZoneRulesUpdateTrackingEnabled">false</bool>

    <!-- The package of the time zone rules updater application. Expected to be the same
         for all Android devices that support APK-based time zone rule updates.
         A package-targeted com.android.intent.action.timezone.TRIGGER_RULES_UPDATE_CHECK intent
         will be sent to the updater app if the system server detects an update to the updater or
         data app packages.
         The package referenced here must have the android.permission.UPDATE_TIME_ZONE_RULES
         permission.
         [This is only used if config_enableUpdateableTimeZoneRules and
         config_timeZoneRulesUpdateTrackingEnabled are true.] -->
    <string name="config_timeZoneRulesUpdaterPackage" translatable="false">com.android.timezone.updater</string>

    <!-- The package of the time zone rules data application. Expected to be configured
         by OEMs to reference their own priv-app APK package.
         A package-targeted com.android.intent.action.timezone.TRIGGER_RULES_UPDATE_CHECK intent
         will be sent to the updater app if the system server detects an update to the updater or
         data app packages.
         [This is only used if config_enableUpdateableTimeZoneRules and
         config_timeZoneRulesUpdateTrackingEnabled are true.] -->
    <string name="config_timeZoneRulesDataPackage" translatable="false"></string>

    <!-- The allowed time in milliseconds between an update check intent being broadcast and the
         response being considered overdue. Reliability triggers will not fire in this time.
         [This is only used if config_enableUpdateableTimeZoneRules and
         config_timeZoneRulesUpdateTrackingEnabled are true.] -->
    <!-- 5 minutes -->
    <integer name="config_timeZoneRulesCheckTimeMillisAllowed">300000</integer>

    <!-- The number of times a time zone update check is allowed to fail before the system will stop
         reacting to reliability triggers.
         [This is only used if config_enableUpdateableTimeZoneRules and
         config_timeZoneRulesUpdateTrackingEnabled are true.] -->
    <integer name="config_timeZoneRulesCheckRetryCount">5</integer>

    <!-- Whether the geolocation time zone detection feature is enabled. Setting this to false means
         the feature cannot be used. Setting this to true means system server components can be
         tested and location time zone detection may be used if other configuration allows (see
         location time zone provider configuration settings below). -->
    <bool name="config_enableGeolocationTimeZoneDetection" translatable="false">true</bool>

    <!-- Whether the primary location time zone provider is enabled.
         This setting is ignored if config_enableGeolocationTimeZoneDetection is false.

         AOSP does not configure a primary location time zone provider. -->
    <bool name="config_enablePrimaryLocationTimeZoneProvider" translatable="false">false</bool>

    <!-- The package hosting the primary location time zone provider.
         Only used when config_enableGeolocationTimeZoneDetection and
         config_enablePrimaryLocationTimeZoneProvider are true.

         See android.service.timezone.TimeZoneProviderService for how to host location time zone
         provider services. -->
    <string name="config_primaryLocationTimeZoneProviderPackageName" translatable="false"></string>

    <!-- Whether the secondary location time zone provider is enabled.
         This setting is ignored if config_enableGeolocationTimeZoneDetection is false.

         AOSP does not configure a secondary location time zone provider. -->
    <bool name="config_enableSecondaryLocationTimeZoneProvider" translatable="false">false</bool>

    <!-- The package hosting the secondary location time zone provider.
         Only used when config_enableGeolocationTimeZoneDetection and
         config_enableSecondaryLocationTimeZoneProvider are true.

         See android.service.timezone.TimeZoneProviderService for how to host location time zone
         provider services. -->
    <string name="config_secondaryLocationTimeZoneProviderPackageName" translatable="false"></string>

    <!-- Whether to enable network location overlay which allows network location provider to be
         replaced by an app at run-time. When disabled, only the
         config_networkLocationProviderPackageName package will be searched for network location
         provider, otherwise any system package is eligible. Anyone who wants to disable the overlay
         mechanism can set it to false. -->
    <bool name="config_enableNetworkLocationOverlay" translatable="false">true</bool>
    <!-- Package name providing network location support. Used only when
         config_enableNetworkLocationOverlay is false. -->
    <string name="config_networkLocationProviderPackageName" translatable="false">@null</string>

    <!-- Whether to enable fused location provider overlay which allows fused location provider to
         be replaced by an app at run-time. When disabled, only the
         config_fusedLocationProviderPackageName package will be searched for fused location
         provider, otherwise any system package is eligible. Anyone who wants to disable the overlay
         mechanism can set it to false. -->
    <bool name="config_enableFusedLocationOverlay" translatable="false">true</bool>
    <!-- Package name providing fused location support. Used only when
         config_enableFusedLocationOverlay is false. -->
    <string name="config_fusedLocationProviderPackageName" translatable="false">com.android.location.fused</string>

    <!-- Default value for the ADAS GNSS Location Enabled setting if this setting has never been
         set before. -->
    <bool name="config_defaultAdasGnssLocationEnabled" translatable="false">false</bool>

    <string-array name="config_locationExtraPackageNames" translatable="false"></string-array>

    <!-- The package name of the default network recommendation app.
         A network recommendation provider must:
             * Be granted the SCORE_NETWORKS permission.
             * Be granted the ACCESS_COARSE_LOCATION permission.
             * Include a Service for the android.net.scoring.RECOMMEND_NETWORKS action
               protected by the BIND_NETWORK_RECOMMENDATION_SERVICE permission.

         This must be set to a valid network recommendation app or empty.
     -->
    <string name="config_defaultNetworkRecommendationProviderPackage" translatable="false"></string>

    <!-- Whether to enable geocoder overlay which allows geocoder to be replaced
         by an app at run-time. When disabled, only the
         config_geocoderProviderPackageName package will be searched for
         geocoder, otherwise any system package is eligible. Anyone who wants to
         disable the overlay mechanism can set it to false.
         -->
    <bool name="config_enableGeocoderOverlay" translatable="false">true</bool>
    <!-- Package name providing geocoder API support. Used only when
         config_enableGeocoderOverlay is false. -->
    <string name="config_geocoderProviderPackageName" translatable="false">@null</string>

    <!-- Whether to enable geofence overlay which allows geofence to be replaced
         by an app at run-time. When disabled, only the
         config_geofenceProviderPackageName package will be searched for
         geofence implementation, otherwise any system package is eligible. Anyone who
         wants to disable the overlay mechanism can set it to false.
         -->
    <bool name="config_enableGeofenceOverlay" translatable="false">true</bool>
    <!-- Package name providing geofence API support. Used only when
         config_enableGeofenceOverlay is false. -->
    <string name="config_geofenceProviderPackageName" translatable="false">@null</string>

    <!-- Whether to enable Hardware Activity-Recognition overlay which allows Hardware
         Activity-Recognition to be replaced by an app at run-time. When disabled, only the
         config_activityRecognitionHardwarePackageName package will be searched for
         its implementation, otherwise any system package is eligible. Anyone who
         wants to disable the overlay mechanism can set it to false.
         -->
    <bool name="config_enableActivityRecognitionHardwareOverlay" translatable="false">true</bool>
    <!-- Package name providing Hardware Activity-Recognition API support. Used only when
         config_enableActivityRecognitionHardwareOverlay is false. -->
    <string name="config_activityRecognitionHardwarePackageName" translatable="false">@null</string>

    <!-- Package name(s) containing location provider support. These packages will be auto-granted
         several permissions by the system, and should be system packages. -->
    <string-array name="config_locationProviderPackageNames" translatable="false">
        <!-- The standard AOSP fused location provider -->
        <item>com.android.location.fused</item>
    </string-array>

    <!-- Package name(s) of Advanced Driver Assistance applications. These packages have additional
    management of access to location, specific to driving assistance use-cases. They must be system
    packages. This configuration is only applicable to devices that declare
    PackageManager.FEATURE_AUTOMOTIVE. -->
    <string-array name="config_locationDriverAssistancePackageNames" translatable="false">
    </string-array>

    <!-- This string array can be overriden to enable test location providers initially. -->
    <!-- Array of "[locationProviderName],[requiresNetwork],
         [requiresSatellite],[requiresCell],[hasMonetaryCost],
         [supportAltitute],[supportsSpeed],[supportsBearing],
         [powerRequirement],[accuracy]" -->
    <!-- powerRequirement is defined in android.location.Criteria
         0 = NO_REQUIREMENT / 1 = POWER_LOW / 2 = POWER_MEDIUM / 3 = POWER_HIGH -->
    <!-- accuracy is defined in anroid.location.Criteria
         1 = ACCURACY_FINE / 2 = ACCURACY_COARSE -->
    <string-array name="config_testLocationProviders" translatable="false">
        <!-- Example test network location provider
        <item>network,false,false,false,false,true,true,true,1,2</item>
        -->
    </string-array>

    <!-- Optional IPsec algorithms enabled by this device, defaulting to empty. OEMs can override
         it by providing a list of algorithm names in an overlay config.xml file.

         As Android releases new versions, more algorithms are becoming mandatory. Mandatory
         algorithms will be automatically enabled on the device. Optional algorithms need
         to be explicitly declared in this resource to be enabled.
             * SDK level 28 makes the following algorithms mandatory : "cbc(aes)", "hmac(md5)",
               "hmac(sha1)", "hmac(sha256)", "hmac(sha384)", "hmac(sha512)", "rfc4106(gcm(aes))"
             * SDK level 31 makes the following algorithms mandatory : "rfc3686(ctr(aes))",
               "xcbc(aes)", "cmac(aes)", "rfc7539esp(chacha20,poly1305)"
     -->
    <string-array name="config_optionalIpSecAlgorithms" translatable="false">
        <!-- Add algorithm here -->
    </string-array>

    <!-- Boolean indicating if placing the phone face down will result in a screen off. -->
    <bool name="config_flipToScreenOffEnabled">true</bool>

    <!-- Integer to set a max latency the accelerometer will batch sensor requests with. -->
    <integer name="config_flipToScreenOffMaxLatencyMicros">2000000</integer>

    <!-- Boolean indicating if current platform supports bluetooth SCO for off call
    use cases -->
    <bool name="config_bluetooth_sco_off_call">true</bool>

    <!-- Boolean indicating if current platform supports bluetooth wide band
         speech -->
    <bool name="config_bluetooth_wide_band_speech">true</bool>

    <!-- Boolean indicating if current platform need do one-time bluetooth address
         re-validation -->
    <bool name="config_bluetooth_address_validation">false</bool>

    <!-- Boolean indicating if current platform supports BLE peripheral mode -->
    <bool name="config_bluetooth_le_peripheral_mode_supported">true</bool>

    <!-- Boolean indicating if current platform supports HFP inband ringing -->
    <bool name="config_bluetooth_hfp_inband_ringing_support">true</bool>

    <!-- Max number of scan filters supported by blutooth controller. 0 if the
         device does not support hardware scan filters-->
    <integer translatable="false" name="config_bluetooth_max_scan_filters">0</integer>

    <!-- Max number of advertisers supported by bluetooth controller. 0 if the
         device does not support multiple advertisement-->
    <integer translatable="false" name="config_bluetooth_max_advertisers">0</integer>

    <!-- Idle current for bluetooth controller. 0 by default-->
    <integer translatable="false" name="config_bluetooth_idle_cur_ma">0</integer>

    <!-- Rx current for bluetooth controller. 0 by default-->
    <integer translatable="false" name="config_bluetooth_rx_cur_ma">0</integer>

    <!-- Tx current for bluetooth controller. 0 by default-->
    <integer translatable="false" name="config_bluetooth_tx_cur_ma">0</integer>

    <!-- Operating volatage for bluetooth controller. 0 by default-->
    <integer translatable="false" name="config_bluetooth_operating_voltage_mv">0</integer>

    <!-- Max number of connected audio devices supported by Bluetooth stack -->
    <integer name="config_bluetooth_max_connected_audio_devices">5</integer>

    <!-- Whether supported profiles should be reloaded upon enabling bluetooth -->
    <bool name="config_bluetooth_reload_supported_profiles_when_enabled">true</bool>

    <!-- Enabling autoconnect over pan -->
    <bool name="config_bluetooth_pan_enable_autoconnect">true</bool>

    <!-- The default data-use polling period. -->
    <integer name="config_datause_polling_period_sec">600</integer>

    <!-- The default data-use threshold in bytes. 0 disables-->
    <integer name="config_datause_threshold_bytes">0</integer>

    <!-- The default reduced-datarate value in kilobits per sec -->
    <integer name="config_datause_throttle_kbitsps">300</integer>

    <!-- The default iface on which to monitor data use -->
    <string name="config_datause_iface" translatable="false">rmnet0</string>

    <!-- The default reduced-datarate notification mask -->
    <!-- 2 means give warning -->
    <integer name="config_datause_notification_type">2</integer>

    <!-- If Voice Radio Technology is RIL_RADIO_TECHNOLOGY_LTE:14 or
         RIL_RADIO_TECHNOLOGY_UNKNOWN:0 this is the value that should be used instead.
         A configuration value of RIL_RADIO_TECHNOLOGY_UNKNOWN:0 means
         there is no replacement value and that the default assumption
         for phone type (GSM) should be used. -->
    <integer name="config_volte_replacement_rat">0</integer>

    <!-- Flag indicating whether the current device is "voice capable".
         If true, this means that the device supports circuit-switched
         (i.e. voice) phone calls over the telephony network, and is
         allowed to display the in-call UI while a cellular voice call is
         active.  This can be overridden to false for "data only" devices
         which can't make voice calls and don't support any in-call UI.

         Note: this flag is subtly different from the
         PackageManager.FEATURE_TELEPHONY system feature, which is
         available on *any* device with a telephony radio, even if the
         device is data-only. -->
    <bool name="config_voice_capable">true</bool>

    <!-- Flag indicating whether all audio streams should be mapped to
         one single stream. If true, all audio streams are mapped to
         STREAM_MUSIC as if it's on TV platform. -->
    <bool name="config_single_volume">false</bool>

    <!-- Flag indicating whether platform level volume adjustments are enabled for remote sessions
         on grouped devices. -->
    <bool name="config_volumeAdjustmentForRemoteGroupSessions">true</bool>

    <!-- Flag indicating that an outbound call must have a call capable phone account
         that has declared it can process the call's handle. -->
    <bool name="config_requireCallCapableAccountForHandle">false</bool>

    <!-- Flag indicating if the user is notified when the mobile network access is restricted -->
    <bool name="config_user_notification_of_restrictied_mobile_access">true</bool>

    <!-- Flag indicating whether the current device allows sms service.
         If true, this means that the device supports both sending and
         receiving sms via the telephony network.
         This can be overridden to false for "data only" devices
         which can't send and receive sms message.

         Note: Disable SMS also disable voicemail waiting sms,
               cell broadcasting sms, and MMS. -->
    <bool name="config_sms_capable">true</bool>

    <!-- Default SMS Application. This will be the default SMS application when
         the phone first boots. The user can then change the default app to one
         of their choosing.
         This can be overridden for devices where a different default SMS
         application is desired.

         If this string is empty or the specified package does not exist, then
         the platform will search for an SMS app and use that (if there is one)

         Note: This config is deprecated, please use config_defaultSms instead. -->
    <string name="default_sms_application" translatable="false">com.android.messaging</string>

    <!-- Flag indicating whether the current device supports "Ask every time" for sms-->
    <bool name="config_sms_ask_every_time_support">true</bool>

    <!-- Flag indicating whether the current device allows data.
         If true, this means that the device supports data connectivity through
         the telephony network.
         This can be overridden to false for devices that support voice and/or sms . -->
    <bool name="config_mobile_data_capable">true</bool>

    <!-- Default web browser.  This is the package name of the application that will
         be the default browser when the device first boots.  Afterwards the user
         can select whatever browser app they wish to use as the default.

         If this string is empty or the specified package does not exist, then
         the behavior will be as though no app was named as an explicit default.

         Note: This config is deprecated, please use config_defaultBrowser instead. -->
    <string name="default_browser" translatable="false"></string>

    <!-- The name of the package that will hold the assistant role by default. -->
    <string name="config_defaultAssistant" translatable="false" />
    <!-- Whether the default assistant settings should be shown. -->
    <bool name="config_showDefaultAssistant">true</bool>
    <!-- The name of the package that will hold the browser role by default. -->
    <string name="config_defaultBrowser" translatable="false">@string/default_browser</string>
    <!-- The name of the package that will hold the dialer role by default. -->
    <string name="config_defaultDialer" translatable="false">com.android.dialer</string>
    <!-- The name of the package that will hold the SMS role by default. -->
    <string name="config_defaultSms" translatable="false">@string/default_sms_application</string>
    <!-- Whether the default emergency settings should be shown. -->
    <bool name="config_showDefaultEmergency">true</bool>
    <!-- Whether the default home settings should be shown. -->
    <bool name="config_showDefaultHome">true</bool>
    <!-- The name of the package that will hold the call redirection role by default. -->
    <string name="config_defaultCallRedirection" translatable="false"></string>
    <!-- The name of the package that will hold the call screening role by default. -->
    <string name="config_defaultCallScreening" translatable="false"></string>
    <!-- The name of the package that will hold the system gallery role. -->
    <string name="config_systemGallery" translatable="false">com.android.gallery3d</string>
    <!-- The names of the packages that will hold the automotive projection role. -->
    <string name="config_systemAutomotiveProjection" translatable="false"></string>
    <!-- The name of the package that will hold the system cluster service role. -->
    <string name="config_systemAutomotiveCluster" translatable="false"></string>
    <!-- The name of the package that will hold the system shell role. -->
    <string name="config_systemShell" translatable="false">com.android.shell</string>
    <!-- The name of the package that will hold the system contacts role. -->
    <string name="config_systemContacts" translatable="false">com.android.contacts</string>
    <!-- The name of the package that will hold the speech recognizer role by default. -->
    <string name="config_systemSpeechRecognizer" translatable="false"></string>
    <!-- The name of the package that will hold the system Wi-Fi coex manager role. -->
    <string name="config_systemWifiCoexManager" translatable="false"></string>
    <!-- The name of the package that will hold the wellbeing role. -->
    <string name="config_systemWellbeing" translatable="false"></string>
    <!-- The name of the package that will hold the television notification handler role -->
    <string name="config_systemTelevisionNotificationHandler" translatable="false"></string>
    <!-- The name of the package that will hold the system activity recognizer role. -->
    <string name="config_systemActivityRecognizer" translatable="false"></string>
    <!-- The name of the package that will hold the system ui role -->
    <string name="config_systemUi" translatable="false">com.android.systemui</string>
    <!-- The name of the package that will hold the television remote service role.
        TODO(b/189347385) make this a @SystemAPI -->
    <string name="config_systemTelevisionRemoteService" translatable="false">@string/config_tvRemoteServicePackage</string>

    <!-- The name of the package that will be allowed to change its components' label/icon. -->
    <string name="config_overrideComponentUiPackage" translatable="false">com.android.stk</string>

    <!-- Enable/disable default bluetooth profiles:
        HSP_AG, ObexObjectPush, Audio, NAP -->
    <bool name="config_bluetooth_default_profiles">true</bool>

    <!-- IP address of the dns server to use if nobody else suggests one -->
    <string name="config_default_dns_server" translatable="false">8.8.8.8</string>

    <!-- The default mobile provisioning apn. Empty by default, maybe overridden by
         an mcc/mnc specific config.xml -->
    <string name="mobile_provisioning_apn" translatable="false"></string>

    <!-- The default mobile provisioning url. Empty by default, maybe overridden by
         an mcc/mnc specific config.xml -->
    <string name="mobile_provisioning_url" translatable="false"></string>

    <!-- The default character set for GsmAlphabet -->
    <!-- Empty string means MBCS is not considered -->
    <string name="gsm_alphabet_default_charset" translatable="false"></string>

    <!-- Enables SIP on WIFI only -->
    <bool name="config_sip_wifi_only">false</bool>

    <!-- Enables built-in SIP phone capability -->
    <bool name="config_built_in_sip_phone">true</bool>

    <!-- Boolean indicating if restoring network selection should be skipped -->
    <!-- The restoring is handled by modem if it is true-->
    <bool translatable="false" name="skip_restoring_network_selection">false</bool>

    <!-- Maximum number of database connections opened and managed by framework layer
         to handle queries on each database when using Write-Ahead Logging. -->
    <integer name="db_connection_pool_size">4</integer>

    <!-- The default journal mode to use use when Write-Ahead Logging is not active.
         Choices are: OFF, DELETE, TRUNCATE, PERSIST and MEMORY.
         PERSIST may improve performance by reducing how often journal blocks are
         reallocated (compared to truncation) resulting in better data block locality
         and less churn of the storage media.

         The PERSIST mode results in data persisting in the journal beyond the life of
         a transaction, so it interacts poorly with SECURE_DELETE. -->
    <string name="db_default_journal_mode" translatable="false">TRUNCATE</string>

    <!-- Maximum size of the persistent journal file in bytes.
         If the journal file grows to be larger than this amount then SQLite will
         truncate it after committing the transaction. -->
    <integer name="db_journal_size_limit">524288</integer>

    <!-- When opening a database with WAL enabled and if the wal file already exists and larger
         than this size in bytes, we'll truncate it. -->
    <integer name="db_wal_truncate_size">1048576</integer>

    <!-- The database synchronization mode when using the default journal mode.
         FULL is safest and preserves durability at the cost of extra fsyncs.
         NORMAL also preserves durability in non-WAL modes and uses checksums to ensure
         integrity although there is a small chance that an error might go unnoticed.
         Choices are: FULL, NORMAL, OFF. -->
    <string name="db_default_sync_mode" translatable="false">FULL</string>

    <!-- The database synchronization mode when using Write-Ahead Logging.
         From https://www.sqlite.org/pragma.html#pragma_synchronous:
         WAL mode is safe from corruption with synchronous=NORMAL, and probably DELETE mode is safe
         too on modern filesystems. WAL mode is always consistent with synchronous=NORMAL, but WAL
         mode does lose durability. A transaction committed in WAL mode with
         synchronous=NORMAL might roll back following a power loss or system crash.
         Transactions are durable across application crashes regardless of the synchronous setting
         or journal mode. The synchronous=NORMAL setting is a good choice for most applications
         running in WAL mode.
         Choices are: FULL, NORMAL, OFF. -->
    <string name="db_wal_sync_mode" translatable="false">NORMAL</string>

    <!-- The Write-Ahead Log auto-checkpoint interval in database pages (typically 1 to 4KB).
         The log is checkpointed automatically whenever it exceeds this many pages.
         When a database is reopened, its journal mode is set back to the default
         journal mode, which may cause a checkpoint operation to occur.  Checkpoints
         can also happen at other times when transactions are committed.
         The bigger the WAL file, the longer a checkpoint operation takes, so we try
         to keep the WAL file relatively small to avoid long delays.
         The size of the WAL file is also constrained by 'db_journal_size_limit'. -->
    <integer name="db_wal_autocheckpoint">100</integer>

    <!-- The number of milliseconds that SQLite connection is allowed to be idle before it
         is closed and removed from the pool -->
    <integer name="db_default_idle_connection_timeout">30000</integer>

    <!-- Max space (in MB) allocated to DownloadManager to store the downloaded
         files if they are to be stored in DownloadManager's data dir,
         which typically is /data/data/com.android.providers.downloads/files -->
    <integer name="config_downloadDataDirSize">200</integer>

    <!-- Max number of downloads allowed to proceed concurrently -->
    <integer name="config_MaxConcurrentDownloadsAllowed">5</integer>

    <!-- When the free space available in DownloadManager's data dir falls
         below the percentage value specified by this param, DownloadManager
         starts removing files to try to make percentage of available
         free space above this threshold value. -->
    <integer name="config_downloadDataDirLowSpaceThreshold">10</integer>

    <!-- The URL that should be sent in an x-wap-profile header with an HTTP request,
         as defined in the Open Mobile Alliance User Agent Profile specification
         OMA-TS-UAProf-V2_0-20060206-A Section 8.1.1.1. If the URL contains a '%s'
         format string then that substring will be replaced with the value of
         Build.MODEL. The format string shall not be escaped. -->
    <string name="config_useragentprofile_url" translatable="false"></string>

    <!-- When a database query is executed, the results returned are paginated
         in pages of size (in KB) indicated by this value -->
    <integer name="config_cursorWindowSize">2048</integer>

    <!-- Sets whether menu shortcuts should be displayed on panel menus when
         a keyboard is present. -->
    <bool name="config_showMenuShortcutsWhenKeyboardPresent">true</bool>

    <!-- Do not translate. Defines the slots is Two Digit Number for dialing normally not USSD.

         Note: This config is deprecated, please use carrier config which is
               CarrierConfigManager.KEY_MMI_TWO_DIGIT_NUMBER_PATTERN_STRING_ARRAY instead. -->
    <string-array name="config_twoDigitNumberPattern" translatable="false">
    </string-array>

    <!-- If this value is true, Sms encoded as octet is decoded by utf8 decoder.
         If false, decoded by Latin decoder. -->
    <bool name="config_sms_utf8_support">false</bool>

    <!-- If this value is true, The mms content-disposition field is supported correctly.
         If false, Content-disposition fragments are ignored -->
    <bool name="config_mms_content_disposition_support">true</bool>

    <!-- MMS user agent string -->
    <string name="config_mms_user_agent" translatable="false"></string>

    <!-- MMS user agent prolfile url -->
    <string name="config_mms_user_agent_profile_url" translatable="false"></string>

    <!-- National Language Identifier codes for the following two config items.
         (from 3GPP TS 23.038 V9.1.1 Table 6.2.1.2.4.1):
          0  - reserved
          1  - Turkish
          2  - Spanish (single shift table only)
          3  - Portuguese
          4  - Bengali
          5  - Gujarati
          6  - Hindi
          7  - Kannada
          8  - Malayalam
          9  - Oriya
         10  - Punjabi
         11  - Tamil
         12  - Telugu
         13  - Urdu
         14+ - reserved -->

    <!-- National language single shift tables to enable for SMS encoding.
         Decoding is always enabled. 3GPP TS 23.038 states that this feature
         should not be enabled until a formal request is issued by the relevant
         national regulatory body. Array elements are codes from the table above.
         Example 1: devices sold in Turkey must include table 1 to conform with
           By-Law Number 27230. (http://www.btk.gov.tr/eng/pdf/2009/BY-LAW_SMS.pdf)
         Example 2: devices sold in India should include tables 4 through 13
           to enable use of the new Release 9 tables for Indic languages. -->
    <integer-array name="config_sms_enabled_single_shift_tables"></integer-array>

    <!-- National language locking shift tables to enable for SMS encoding.
         Decoding is always enabled. 3GPP TS 23.038 states that this feature
         should not be enabled until a formal request is issued by the relevant
         national regulatory body. Array elements are codes from the table above.
         Example 1: devices sold in Turkey must include table 1 after the
           Turkish Telecommunication Authority requires locking shift encoding
           to be enabled (est. July 2012). (http://www.btk.gov.tr/eng/pdf/2009/BY-LAW_SMS.pdf)
           See also: http://www.mobitech.com.tr/tr/ersanozturkblog_en/index.php?entry=entry090223-160014
         Example 2: devices sold in India should include tables 4 through 13
         to enable use of the new Release 9 tables for Indic languages. -->
    <integer-array name="config_sms_enabled_locking_shift_tables"></integer-array>

    <!-- Set to true if the RSSI should always display CDMA signal strength even on EVDO -->
    <bool name="config_alwaysUseCdmaRssi">false</bool>


    <!-- If this value is true, duplicate Source/Destination port fields
         in WDP header of some carriers OMADM wap push are supported.
         ex: MSGTYPE-TotalSegments-CurrentSegment
             -SourcePortDestPort-SourcePortDestPort-OMADM PDU
         If false, not supported. -->
    <bool name="config_duplicate_port_omadm_wappush">false</bool>

    <!-- Maximum numerical value that will be shown in a status bar
         notification icon or in the notification itself. Will be replaced
         with @string/status_bar_notification_info_overflow when shown in the
         UI. -->
    <integer name="status_bar_notification_info_maxnum">999</integer>

    <!-- Path to an ISO image to be shared with via USB mass storage.
         This is intended to allow packaging drivers or tools for installation on a PC. -->
    <string translatable="false" name="config_isoImagePath"></string>

    <!-- Whether the system enables per-display focus. If the system has the input method for each
         display, this value should be true. -->
    <bool name="config_perDisplayFocusEnabled">false</bool>

    <!-- Whether a software navigation bar should be shown. NOTE: in the future this may be
         autodetected from the Configuration. -->
    <bool name="config_showNavigationBar">true</bool>

    <!-- Whether action menu items should be displayed in ALLCAPS or not.
         Defaults to true. If this is not appropriate for specific locales
         it should be disabled in that locale's resources. -->
    <bool name="config_actionMenuItemAllCaps">true</bool>

    <!-- Remote server that can provide NTP responses. -->
    <string translatable="false" name="config_ntpServer">time.android.com</string>
    <!-- Normal polling frequency in milliseconds -->
    <integer name="config_ntpPollingInterval">86400000</integer>
    <!-- Try-again polling interval in milliseconds, in case the network request failed -->
    <integer name="config_ntpPollingIntervalShorter">60000</integer>
    <!-- Number of times to try again with the shorter interval, before backing
         off until the normal polling interval. A value < 0 indicates infinite. -->
    <integer name="config_ntpRetry">3</integer>
    <!-- Timeout to wait for NTP server response in milliseconds. -->
    <integer name="config_ntpTimeout">5000</integer>

    <!-- Default network policy warning threshold, in megabytes. -->
    <integer name="config_networkPolicyDefaultWarning">2048</integer>

    <!-- Set and Unsets WiMAX -->
    <bool name="config_wimaxEnabled">true</bool>
    <!-- Location of the wimax framwork jar location -->
    <string name="config_wimaxServiceJarLocation" translatable="false"></string>
    <!-- Location of the wimax native library locaiton -->
    <string name="config_wimaxNativeLibLocation" translatable="false"></string>
    <!-- Name of the wimax manager class -->
    <string name="config_wimaxManagerClassname" translatable="false"></string>
    <!-- Name of the wimax service class -->
    <string name="config_wimaxServiceClassname" translatable="false"></string>
    <!-- Name of the wimax state tracker clas -->
    <string name="config_wimaxStateTrackerClassname" translatable="false"></string>

    <!-- Specifies whether the dreams feature should be supported.
         When true, the system will allow the user to configure dreams (screensavers)
         to launch when a user activity timeout occurs or the system is told to nap.
         When false, the dreams feature will be disabled (this does not affect dozing).

         Consider setting this resource to false or disabling dreams by default when a
         doze component is specified below since dreaming will supercede dozing and
         will prevent the system from entering a low power state until the dream ends. -->
    <bool name="config_dreamsSupported">true</bool>

    <!-- If supported, are dreams enabled? (by default) -->
    <bool name="config_dreamsEnabledByDefault">true</bool>
    <!-- If supported and enabled, are dreams activated when docked? (by default) -->
    <bool name="config_dreamsActivatedOnDockByDefault">true</bool>
    <!-- If supported and enabled, are dreams activated when asleep and charging? (by default) -->
    <bool name="config_dreamsActivatedOnSleepByDefault">true</bool>
    <!-- ComponentName of the default dream (Settings.Secure.DEFAULT_SCREENSAVER_COMPONENT) -->
    <string name="config_dreamsDefaultComponent" translatable="false">com.google.android.deskclock/com.android.deskclock.Screensaver</string>

    <!-- Are we allowed to dream while not plugged in? -->
    <bool name="config_dreamsEnabledOnBattery">true</bool>
    <!-- Minimum battery level to allow dreaming when powered.
         Use -1 to disable this safety feature. -->
    <integer name="config_dreamsBatteryLevelMinimumWhenPowered">-1</integer>
    <!-- Minimum battery level to allow dreaming when not powered.
         Use -1 to disable this safety feature. -->
    <integer name="config_dreamsBatteryLevelMinimumWhenNotPowered">15</integer>
    <!-- If the battery level drops by this percentage and the user activity timeout
         has expired, then assume the device is receiving insufficient current to charge
         effectively and terminate the dream.  Use -1 to disable this safety feature.  -->
    <integer name="config_dreamsBatteryLevelDrainCutoff">5</integer>
    <!-- Limit of how long the device can remain unlocked due to attention checking.  -->
    <integer name="config_attentionMaximumExtension">900000</integer> <!-- 15 minutes.  -->

    <!-- ComponentName of a dream to show whenever the system would otherwise have
         gone to sleep.  When the PowerManager is asked to go to sleep, it will instead
         try to start this dream if possible.  The dream should typically call startDozing()
         to put the display into a low power state and allow the application processor
         to be suspended.  When the dream ends, the system will go to sleep as usual.
         Specify the component name or an empty string if none.

         Note that doze dreams are not subject to the same start conditions as ordinary dreams.
         Doze dreams will run whenever the power manager is in a dozing state. -->
    <string name="config_dozeComponent" translatable="false"></string>

    <!-- If true, the doze component is not started until after the screen has been
         turned off and the screen off animation has been performed. -->
    <bool name="config_dozeAfterScreenOffByDefault">true</bool>

    <!-- Doze: should the TYPE_PICK_UP_GESTURE sensor be used as a pulse signal. -->
    <bool name="config_dozePulsePickup">true</bool>

    <!-- Type of the double tap sensor. Empty if double tap is not supported. -->
    <string name="config_dozeDoubleTapSensorType" translatable="false"></string>

    <!-- Type of the tap sensor. Empty if tap is not supported. -->
    <string name="config_dozeTapSensorType" translatable="false"></string>

    <!-- Type of the ambient tap sensor per device posture (defined by WM Jetpack posture).
         Unspecified values use config_dozeTapSensor -->
    <string-array name="config_dozeTapSensorPostureMapping" translatable="false">
    </string-array>

    <!-- Type of the long press sensor. Empty if long press is not supported. -->
    <string name="config_dozeLongPressSensorType" translatable="false"></string>

    <!-- Type of the udfps long press sensor. Empty if long press is not supported. -->
    <string name="config_dozeUdfpsLongPressSensorType" translatable="false"></string>

    <!-- If the sensor that wakes up the lock screen is available or not. -->
    <bool name="config_dozeWakeLockScreenSensorAvailable">true</bool>
    <integer name="config_dozeWakeLockScreenDebounce">300</integer>

    <!-- Type of the quick pickup sensor. Empty if quick pickup is not supported. -->
    <string name="config_quickPickupSensorType" translatable="false"></string>

    <!-- Control whether the always on display mode is available. This should only be enabled on
         devices where the display has been tuned to be power efficient in DOZE and/or DOZE_SUSPEND
         states. -->
    <bool name="config_dozeAlwaysOnDisplayAvailable">true</bool>

    <!-- Control whether the always on display mode is enabled by default. This value will be used
         during initialization when the setting is still null. -->
    <bool name="config_dozeAlwaysOnEnabled">true</bool>

    <!-- If AOD can show an ambient version of the wallpaper -->
    <bool name="config_dozeSupportsAodWallpaper">true</bool>

    <!-- Whether the display blanks itself when transitioning from a doze to a non-doze state -->
    <bool name="config_displayBlanksAfterDoze">true</bool>

    <!-- True if the display hardware only has brightness buckets rather than a full range of
         backlight values -->
    <bool name="config_displayBrightnessBucketsInDoze">false</bool>

    <!-- Power Management: Specifies whether to decouple the auto-suspend state of the
         device from the display on/off state.

         When false, autosuspend_disable() will be called before the display is turned on
         and autosuspend_enable() will be called after the display is turned off.
         This mode provides best compatibility for devices using legacy power management
         features such as early suspend / late resume.

         When true, autosuspend_display() and autosuspend_enable() will be called
         independently of whether the display is being turned on or off.  This mode
         enables the power manager to suspend the application processor while the
         display is on.

         This resource should be set to "true" when a doze component has been specified
         to maximize power savings but not all devices support it.

         Refer to autosuspend.h for details.
    -->
    <bool name="config_powerDecoupleAutoSuspendModeFromDisplay">true</bool>

    <!-- Power Management: Specifies whether to decouple the interactive state of the
         device from the display on/off state.

         When false, setInteractive(..., true) will be called before the display is turned on
         and setInteractive(..., false) will be called after the display is turned off.
         This mode provides best compatibility for devices that expect the interactive
         state to be tied to the display state.

         When true, setInteractive(...) will be called independently of whether the display
         is being turned on or off.  This mode enables the power manager to reduce
         clocks and disable the touch controller while the display is on.

         This resource should be set to "true" when a doze component has been specified
         to maximize power savings but not all devices support it.

         Refer to power.h for details.
    -->
    <bool name="config_powerDecoupleInteractiveModeFromDisplay">true</bool>

    <!-- User activity timeout: Minimum screen off timeout in milliseconds.

         Sets a lower bound for the {@link Settings.System#SCREEN_OFF_TIMEOUT} setting
         which determines how soon the device will go to sleep when there is no
         user activity.

         This value must be greater than zero, otherwise the device will immediately
         fall asleep again as soon as it is awoken.
    -->
    <integer name="config_minimumScreenOffTimeout">10000</integer>

    <!-- User activity timeout: Maximum screen dim duration in milliseconds.

         Sets an upper bound for how long the screen will dim before the device goes
         to sleep when there is no user activity.  The dim duration is subtracted from
         the overall screen off timeout to determine the screen dim timeout.
         When the screen dim timeout expires, the screen will dim, shortly thereafter
         the device will go to sleep.

         If the screen off timeout is very short, the dim duration may be reduced
         proportionally.  See config_maximumScreenDimRatio.

         This value may be zero in which case the screen will not dim before the
         device goes to sleep.
    -->
    <integer name="config_maximumScreenDimDuration">7000</integer>

    <!-- User activity timeout: Maximum screen dim duration as a percentage of screen off timeout.

         This resource is similar to config_maximumScreenDimDuration but the maximum
         screen dim duration is defined as a ratio of the overall screen off timeout
         instead of as an absolute value in milliseconds.  This is useful for reducing
         the dim duration when the screen off timeout is very short.

         When computing the screen dim duration, the power manager uses the lesser
         of the effective durations expressed by config_maximumScreenDimDuration and
         config_maximumScreenDimRatio.

         This value must be between 0% and 100%.  If the value is zero, the screen will not
         dim before the device goes to sleep.
    -->
    <fraction name="config_maximumScreenDimRatio">20%</fraction>

    <!-- Minimum size of the scrollbar thumb's touch target. -->
    <dimen name="config_minScrollbarTouchTarget">48dp</dimen>

    <!-- Base "touch slop" value used by ViewConfiguration as a
         movement threshold where scrolling should begin. -->
    <dimen name="config_viewConfigurationTouchSlop">8dp</dimen>

    <!-- Base "hover slop" value used by ViewConfiguration as a
         movement threshold under which hover is considered "stationary". -->
    <dimen name="config_viewConfigurationHoverSlop">4dp</dimen>

    <!-- Multiplier for gesture thresholds when a MotionEvent classification is ambiguous. -->
    <item name="config_ambiguousGestureMultiplier" format="float" type="dimen">2.0</item>

    <!-- Minimum velocity to initiate a fling, as measured in dips per second. -->
    <dimen name="config_viewMinFlingVelocity">50dp</dimen>

    <!-- Maximum velocity to initiate a fling, as measured in dips per second. -->
    <dimen name="config_viewMaxFlingVelocity">8000dp</dimen>

    <!-- Amount of time in ms the user needs to press the relevant key to bring up the
         global actions dialog -->
    <integer name="config_globalActionsKeyTimeout">500</integer>

    <!-- Amount of time in ms the user needs to press the relevant keys to trigger the
         screenshot chord -->
    <integer name="config_screenshotChordKeyTimeout">0</integer>

    <!-- Default width of a vertical scrollbar and height of a horizontal scrollbar.
         Takes effect only if the scrollbar drawables have no intrinsic size. -->
    <dimen name="config_scrollbarSize">4dp</dimen>

    <!-- Distance that should be scrolled, per axis value, in response to a horizontal
         {@link MotionEvent#ACTION_SCROLL} event. -->
    <dimen name="config_horizontalScrollFactor">64dp</dimen>

    <!-- Distance that should be scrolled, per axis value, in response to a vertical
         {@link MotionEvent#ACTION_SCROLL} event. -->
    <dimen name="config_verticalScrollFactor">64dp</dimen>

    <!-- Obsolete. Distance that should be scrolled, per axis value, in response to a
         {@link MotionEvent#ACTION_SCROLL} event. -->
    <dimen name="config_scrollFactor">64dp</dimen>

    <!-- Maximum number of grid columns permitted in the ResolverActivity
         used for picking activities to handle an intent. -->
    <integer name="config_maxResolverActivityColumns">3</integer>

    <!-- Array of OEM specific USB mode override config.
         OEM can override a certain USB mode depending on ro.bootmode.
         Specify an array of below items to set override rule.
         [bootmode]:[original USB mode]:[USB mode used]-->
    <integer-array translatable="false" name="config_oemUsbModeOverride">
    </integer-array>

    <!-- Set to true to add links to Cell Broadcast app from Settings and MMS app. -->
    <bool name="config_cellBroadcastAppLinks">true</bool>

    <!-- The default value if the SyncStorageEngine should sync automatically or not -->
    <bool name="config_syncstorageengine_masterSyncAutomatically">true</bool>

    <!--  Maximum number of supported users -->
    <integer name="config_multiuserMaximumUsers">1</integer>

    <!-- Maximum number of users we allow to be running at a time -->
    <integer name="config_multiuserMaxRunningUsers">3</integer>

    <!-- Whether to delay user data locking for background user.
         If false, user switched-out from user switching will still be in running state until
         config_multiuserMaxRunningUsers is reached. Once config_multiuserMaxRunningUsers is
         reached, user will be stopped and user data is locked.
         If true, user switched out from user switching will always be stopped but its user data
         is not locked. Total number of unlocked users will be limited by
         config_multiuserMaxRunningUsers. Once that limit is reached, least recently stopped user
         will be locked. -->
    <bool name="config_multiuserDelayUserDataLocking">false</bool>

    <!-- Whether to only install system packages on a user if they're allowlisted for that user
         type. These are flags and can be freely combined.
         0  - disable allowlist (install all system packages; no logging)
         1  - enforce (only install system packages if they are allowlisted)
         2  - log (log non-allowlisted packages)
         4  - any package not mentioned in the allowlist file is implicitly allowlisted on all users
         8  - same as 4, but just for the SYSTEM user
         16 - ignore OTAs (don't install system packages during OTAs)
         Common scenarios:
          - to enable feature (fully enforced) for a complete allowlist: 1
          - to enable feature for an incomplete allowlist (so use implicit allowlist mode): 5
          - to enable feature but implicitly allowlist for SYSTEM user to ease local development: 9
          - to disable feature completely if it had never been enabled: 16
          - to henceforth disable feature and try to undo its previous effects: 0
        Note: This list must be kept current with PACKAGE_WHITELIST_MODE_PROP in
        frameworks/base/services/core/java/com/android/server/pm/UserSystemPackageInstaller.java -->
    <integer name="config_userTypePackageWhitelistMode">13</integer> <!-- 1+4+8 -->

    <!-- Whether UI for multi user should be shown -->
    <bool name="config_enableMultiUserUI">true</bool>

    <!-- Whether the new Auto Selection Network UI should be shown -->
    <bool name="config_enableNewAutoSelectNetworkUI">true</bool>

    <!-- If true, then we do not ask user for permission for apps to connect to USB devices.
         Do not set this to true for production devices. Doing so will cause you to fail CTS. -->
    <bool name="config_disableUsbPermissionDialogs">false</bool>

    <!-- Activity to handle Usb Device connection in USB Host side. Keeping it to null value will
         lead into handling it inside system using Intent resolution. Non-null contents will have
         format of package-name/ActivityClassName. -->
    <string name="config_UsbDeviceConnectionHandling_component" translatable="false">@null</string>

    <!-- Minimum span needed to begin a touch scaling gesture.
         If the span is equal to or greater than this size, a scaling gesture
         will begin, where supported. (See android.view.ScaleGestureDetector)

         This also takes into account the size of any active touch points.
         Devices with screens that deviate too far from their assigned density
         bucket should consider tuning this value in a device-specific overlay.
         For best results, care should be taken such that this value remains
         larger than the minimum reported touchMajor/touchMinor values
         reported by the hardware. -->
    <dimen name="config_minScalingSpan">27mm</dimen>

    <!-- Minimum accepted value for touchMajor while scaling. This may be tuned
         per-device in overlays. -->
    <dimen name="config_minScalingTouchMajor">48dp</dimen>

    <!-- Safe headphone volume index. When music stream volume is below this index
    the SPL on headphone output is compliant to EN 60950 requirements for portable music
    players. -->
    <integer name="config_safe_media_volume_index">10</integer>

    <!-- Safe USB headset gain. This value is used to ensure that the SPL on the USB
    headset output is compliant to EN 60950 requirements for portable music players. -->
    <integer name="config_safe_media_volume_usb_mB">-3700</integer>

    <!-- Configure mobile network MTU. The standard default is set here but each carrier
         may have a specific value set in an overlay config.xml file. -->
    <integer name="config_mobile_mtu">1500</integer>

    <!-- Configure mobile tcp buffer sizes in the form:
         rat-name:rmem_min,rmem_def,rmem_max,wmem_min,wmem_def,wmem_max
         If no value is found for the rat-name in use, the system default will be applied.
    -->
    <string-array name="config_mobile_tcp_buffers">
    </string-array>

    <!-- Configure ethernet tcp buffersizes in the form:
         rmem_min,rmem_def,rmem_max,wmem_min,wmem_def,wmem_max -->
    <string name="config_ethernet_tcp_buffers" translatable="false">524288,1048576,3145728,524288,1048576,2097152</string>

    <!-- What source to use to estimate link upstream and downstream bandwidth capacities.
         Default is bandwidth_estimator.
         Values are bandwidth_estimator, carrier_config and modem. -->
    <string name="config_bandwidthEstimateSource">bandwidth_estimator</string>

    <!-- Whether WiFi display is supported by this device.
         There are many prerequisites for this feature to work correctly.
         Here are a few of them:
         * The WiFi radio must support WiFi P2P.
         * The WiFi radio must support concurrent connections to the WiFi display and
           to an access point.
         * The Audio Server audio_policy_configuration.xml file must specify a rule for
           the "r_submix" remote submix module.  This module is used to record and stream system
           audio output to the WiFi display encoder in the media server.
         * The remote submix module "audio.r_submix.default" must be installed on the device.
         * The device must be provisioned with HDCP keys (for protected content).
    -->
    <bool name="config_enableWifiDisplay">true</bool>

    <!-- When true, local displays that do not contain any of their own content will automatically
         mirror the content of the default display. -->
    <bool name="config_localDisplaysMirrorContent">true</bool>

    <!-- Controls if local secondary displays should be private or not. Value specified in the array
         represents physical port address of each display and display in this list will be marked
         as private. {@see android.view.Display#FLAG_PRIVATE} -->
    <integer-array translatable="false" name="config_localPrivateDisplayPorts"></integer-array>

    <!-- The default mode for the default display. One of the following values (See Display.java):
             0 - COLOR_MODE_DEFAULT
             7 - COLOR_MODE_SRGB
    -->
    <integer name="config_defaultDisplayDefaultColorMode">7</integer>

    <!-- When true use the linux /dev/input/event subsystem to detect the switch changes
         on the headphone/microphone jack. When false use the older uevent framework. -->
    <bool name="config_useDevInputEventForAudioJack">true</bool>

    <!-- Whether safe headphone volume is enabled or not (country specific). -->
    <bool name="config_safe_media_volume_enabled">true</bool>

    <!-- Whether safe headphone volume warning dialog is disabled on Vol+ (operator specific). -->
    <bool name="config_safe_media_disable_on_volume_up">true</bool>

    <!-- Set to true if the wifi display supports compositing content stored
         in gralloc protected buffers.  For this to be true, there must exist
         a protected hardware path for surface flinger to composite and send
         protected buffers to the wifi display video encoder.

         If this flag is false, we advise applications not to use protected
         buffers (if possible) when presenting content to a wifi display because
         the content may be blanked.

         This flag controls whether the {@link Display#FLAG_SUPPORTS_PROTECTED_BUFFERS}
         flag is set for wifi displays.
    -->
    <bool name="config_wifiDisplaySupportsProtectedBuffers">true</bool>

    <!-- Whether camera shutter sound is forced or not  (country specific). -->
    <bool name="config_camera_sound_forced">false</bool>

    <!-- Set to true if we need to not prefer an APN.
         This is being added to enable a simple scenario of pre-paid
         provisioning on some carriers, working around a bug (7305641)
         where if the preferred is used we don't try the others. -->
    <bool name="config_dontPreferApn">true</bool>

    <!-- Set to true if after a provisioning apn the radio should be restarted -->
    <bool name="config_restartRadioAfterProvisioning">true</bool>

    <!-- Vibrator pattern to be used as the default for notifications
         that specify DEFAULT_VIBRATE.
     -->
    <integer-array name="config_defaultNotificationVibePattern">
        <item>0</item>
        <item>350</item>
        <item>250</item>
        <item>350</item>
    </integer-array>

    <!-- A vibration waveform for notifications that specify DEFAULT_VIBRATE.
         This value is a float array with values grouped as
         { targetAmplitude (within [0,1]), targetFrequency [-1,1], duration (in milliseconds) }
         This is only applied on devices with vibration frequency control. If the device doesn't
         support frequency control, then the vibration specified in
         config_defaultNotificationVibePattern is used instead.
     -->
    <array name="config_defaultNotificationVibeWaveform">
    </array>

    <!-- Vibrator pattern to be used as the default for notifications
         that do not specify vibration but vibrate anyway because the device
         is in vibrate mode.
     -->
    <integer-array name="config_notificationFallbackVibePattern">
        <item>0</item>
        <item>100</item>
        <item>150</item>
        <item>100</item>
    </integer-array>

    <!-- A vibration waveform for notifications that do not specify vibration but vibrate anyway,
         because the device is in vibrate mode. This value is a float array with values grouped as
         { targetAmplitude (within [0,1]), targetFrequency [-1,1], duration (in milliseconds) }
         This is only applied on devices with vibration frequency control. If the device doesn't
         support frequency control, then the vibration specified in
         config_notificationFallbackVibePattern is used instead.
     -->
    <array name="config_notificationFallbackVibeWaveform">
    </array>

    <!-- Flag indicating if the speed up audio on mt call code should be executed -->
    <bool name="config_speed_up_audio_on_mt_calls">false</bool>

    <!-- Class name of the framework account picker activity.
         Can be customized for other product types -->
    <string name="config_chooseAccountActivity" translatable="false"
            >android/android.accounts.ChooseAccountActivity</string>
    <!-- Class name of the account type and account picker activity.
         Can be customized for other product types -->
    <string name="config_chooseTypeAndAccountActivity" translatable="false"
            >android/android.accounts.ChooseTypeAndAccountActivity</string>
    <!-- Name of the activity that will handle requests to the system to choose an activity for
         the purposes of resolving an intent. -->
    <string name="config_chooserActivity" translatable="false"
            >com.android.systemui/com.android.systemui.chooser.ChooserActivity</string>
    <!-- Component name of a custom ResolverActivity (Intent resolver) to be used instead of
         the default framework version. If left empty, then the framework version will be used.
         Example: com.google.android.myapp/.resolver.MyResolverActivity  -->
    <string name="config_customResolverActivity" translatable="false"></string>

    <!-- Name of the activity or service that prompts the user to reject, accept, or allowlist
         an adb host's public key, when an unwhitelisted host connects to the local adbd.
         Can be customized for other product types -->
    <string name="config_customAdbPublicKeyConfirmationComponent"
            >com.android.systemui/com.android.systemui.usb.UsbDebuggingActivity</string>

    <!-- Name of the activity that prompts the secondary user to acknowledge they need to
         switch to the primary user to enable USB debugging.
         Can be customized for other product types -->
    <string name="config_customAdbPublicKeyConfirmationSecondaryUserComponent"
            >com.android.systemui/com.android.systemui.usb.UsbDebuggingSecondaryUserActivity</string>

    <!-- Name of the activity or service that prompts the user to reject, accept, or allowlist
         a wireless network for wireless debugging.
         Can be customized for other product types -->
    <string name="config_customAdbWifiNetworkConfirmationComponent"
            >com.android.systemui/com.android.systemui.wifi.WifiDebuggingActivity</string>

    <!-- Name of the activity that prompts the secondary user to acknowledge they need to
         switch to the primary user to enable wireless debugging.
         Can be customized for other product types -->
    <string name="config_customAdbWifiNetworkConfirmationSecondaryUserComponent"
            >com.android.systemui/com.android.systemui.wifi.WifiDebuggingSecondaryUserActivity</string>

    <!-- Component name of the activity that shows the usb containment status. -->
    <string name="config_usbContaminantActivity" translatable="false"
            >com.android.systemui/com.android.systemui.usb.UsbContaminantActivity</string>

    <!-- Component name of the activity that shows the request for access to a usb device. -->
    <string name="config_usbPermissionActivity" translatable="false"
            >com.android.systemui/com.android.systemui.usb.UsbPermissionActivity</string>

    <!-- Component name of the activity that shows more information about a usb accessory. -->
    <string name="config_usbAccessoryUriActivity" translatable="false"
            >com.android.systemui/com.android.systemui.usb.UsbAccessoryUriActivity</string>

    <!-- Component name of the activity that confirms the activity to start when a usb device is
         plugged in. -->
    <string name="config_usbConfirmActivity" translatable="false"
            >com.android.systemui/com.android.systemui.usb.UsbConfirmActivity</string>

    <!-- Component name of the activity to select the activity to start when a usb device is plugged
         in. -->
    <string name="config_usbResolverActivity" translatable="false"
            >com.android.systemui/com.android.systemui.usb.UsbResolverActivity</string>

    <!-- Component name of the activity used to inform a user about a sensory being blocked because
     of privacy settings. -->
    <string name="config_sensorUseStartedActivity" translatable="false"
            >com.android.systemui/com.android.systemui.sensorprivacy.SensorUseStartedActivity</string>

    <!-- Name of the dialog that is used to request the user's consent for a Platform VPN -->
    <string name="config_platformVpnConfirmDialogComponent" translatable="false"
            >com.android.vpndialogs/com.android.vpndialogs.PlatformVpnConfirmDialog</string>

    <!-- Name of the dialog that is used to request the user's consent for a VpnService VPN -->
    <string name="config_customVpnConfirmDialogComponent" translatable="false"
            >com.android.vpndialogs/com.android.vpndialogs.ConfirmDialog</string>

    <!-- Name of the dialog that is used to inform the user that always-on VPN is disconnected -->
    <string name="config_customVpnAlwaysOnDisconnectedDialogComponent" translatable="false"
            >com.android.vpndialogs/com.android.vpndialogs.AlwaysOnDisconnectedDialog</string>

    <!-- Name of the dialog that is used to install the carrier app when the SIM is inserted -->
    <string name="config_carrierAppInstallDialogComponent" translatable="false"
            >com.android.simappdialog/com.android.simappdialog.InstallCarrierAppActivity</string>

    <!-- Apps that are authorized to access shared accounts, overridden by product overlays -->
    <string name="config_appsAuthorizedForSharedAccounts" translatable="false">;com.android.settings;</string>

    <!-- Flag indicating that the media framework should not allow changes or mute on any
         stream or global volumes. -->
    <bool name="config_useFixedVolume">false</bool>

    <!-- The list of IMEs which should be disabled until used.
         This function suppresses update notifications for these pre-installed apps.
         We need to set this configuration carefully that they should not have functionarities
         other than "IME" or "Spell Checker". In InputMethodManagerService,
         the listed IMEs are disabled until used when all of the following conditions are met.
         1. Not selected as an enabled IME in the Settings
         2. Not selected as a spell checker in the Settings
         3. Installed
         4. A pre-installed IME
         5. Not enabled
         And the disabled_until_used state for an IME is released by InputMethodManagerService
         when the IME is selected as an enabled IME. -->
    <string-array name="config_disabledUntilUsedPreinstalledImes" translatable="false">
        <item>com.android.inputmethod.latin</item>
    </string-array>

    <!-- The list of classes that should be added to the notification ranking pipeline.
     See {@link com.android.server.notification.NotificationSignalExtractor}
      If you add a new extractor to this list make sure to update
      NotificationManagerService.handleRankingSort()-->
    <string-array name="config_notificationSignalExtractors">
        <!-- many of the following extractors depend on the notification channel, so this
        extractor must come first -->
        <item>com.android.server.notification.NotificationChannelExtractor</item>
        <item>com.android.server.notification.NotificationAdjustmentExtractor</item>
        <item>com.android.server.notification.BubbleExtractor</item>
        <!-- depends on AdjustmentExtractor-->
        <item>com.android.server.notification.ValidateNotificationPeople</item>
        <item>com.android.server.notification.PriorityExtractor</item>
        <!-- depends on PriorityExtractor -->
        <item>com.android.server.notification.ZenModeExtractor</item>
        <item>com.android.server.notification.ImportanceExtractor</item>
        <!-- depends on ImportanceExtractor-->
        <item>com.android.server.notification.NotificationIntrusivenessExtractor</item>
        <item>com.android.server.notification.VisibilityExtractor</item>
        <!-- Depends on ZenModeExtractor -->
        <item>com.android.server.notification.BadgeExtractor</item>
        <item>com.android.server.notification.CriticalNotificationExtractor</item>

    </string-array>

    <!-- Default Gravity setting for the system Toast view. Equivalent to: Gravity.CENTER_HORIZONTAL | Gravity.BOTTOM -->
    <integer name="config_toastDefaultGravity">0x00000051</integer>

    <!-- set to false if we need to show user confirmation
         when alpha identifier is not provided by the UICC -->
    <bool name="config_stkNoAlphaUsrCnf">true</bool>

    <!-- Threshold (in ms) under which a screen off / screen on will be considered a reset of the
         immersive mode confirmation prompt.-->
    <integer name="config_immersive_mode_confirmation_panic">5000</integer>

    <!-- For some operators, PDU has garbages. To fix it, need to use valid index -->
    <integer name="config_valid_wappush_index">-1</integer>

    <!-- call barring MMI code from TS 22.030 Annex B -->
    <string-array translatable="false" name="config_callBarringMMI">
        <item>33</item>
        <item>331</item>
        <item>332</item>
        <item>35</item>
        <item>351</item>
        <item>330</item>
        <item>333</item>
        <item>353</item>
    </string-array>

    <!-- Ims supported call barring MMI code -->
    <string-array translatable="false" name="config_callBarringMMI_for_ims">
        <item>33</item>
        <item>331</item>
        <item>332</item>
        <item>35</item>
        <item>351</item>
        <item>330</item>
        <item>333</item>
        <item>353</item>
    </string-array>

    <!-- Override the default detection behavior for the framework method
         android.view.ViewConfiguration#hasPermanentMenuKey().
         Valid settings are:
         0 - No change. Use the default autodetection behavior.
         1 - The device DOES have a permanent menu key; ignore autodetection.
         2 - The device DOES NOT have a permanent menu key; ignore autodetection. -->
    <integer name="config_overrideHasPermanentMenuKey">0</integer>

    <!-- Override the DPad detection behavior for configuration purposes -->
    <bool name="config_hasPermanentDpad">false</bool>

    <!-- default window inset isRound property -->
    <bool name="config_windowIsRound">false</bool>

    <!-- Override this value if the device has a chin, i.e. area that is not actual part of the
         screen but you would like to be treated as a real display. The value is the height of the
         chin. -->
    <integer name="config_windowOutsetBottom">0</integer>

    <!-- Package name for default network scorer app; overridden by product overlays. -->
    <string name="config_defaultNetworkScorerPackageName"></string>

    <!-- The amount to scale fullscreen snapshots for Overview and snapshot starting windows. -->
    <item name="config_highResTaskSnapshotScale" format="float" type="dimen">1.0</item>

    <!-- The amount to scale reduced scale snapshots for Overview and snapshot starting windows.
         Reduced scale snapshots are loaded before full screen snapshots to improve load times and
         minimize the chance the user will see an empty task card. If set to 0, reduced scale
         snapshots are disabled, and snapshots will only be stored at config_highResTaskSnapshotScale
         -->
    <item name="config_lowResTaskSnapshotScale" format="float" type="dimen">0.5</item>

    <!-- Feature flag to store TaskSnapshot in 16 bit pixel format to save memory. -->
    <bool name="config_use16BitTaskSnapshotPixelFormat">false</bool>

    <!-- Determines whether recent tasks are provided to the user. Default device has recents
         property. If this is false, then the following recents config flags are ignored. -->
    <bool name="config_hasRecents">true</bool>

    <!-- Component name for the activity that will be presenting the Recents UI, which will receive
         special permissions for API related to fetching and presenting recent tasks. The default
         configuration uses Launcehr3QuickStep as default launcher and points to the corresponding
         recents component. When using a different default launcher, change this appropriately or
         use the default systemui implementation: com.android.systemui/.recents.RecentsActivity -->
    <string name="config_recentsComponentName" translatable="false"
            >com.android.launcher3/com.android.quickstep.RecentsActivity</string>

    <!-- SystemUi service component -->
    <string name="config_systemUIServiceComponent" translatable="false"
            >com.android.systemui/com.android.systemui.SystemUIService</string>

    <!-- Package handling Quick controls -->
    <string name="config_controlsPackage" translatable="false"
            >com.android.systemui</string>

    <!-- Keyguard component -->
    <string name="config_keyguardComponent" translatable="false"
            >com.android.systemui/com.android.systemui.keyguard.KeyguardService</string>

    <!-- Screen record dialog component -->
    <string name="config_screenRecorderComponent" translatable="false"
            >com.android.systemui/com.android.systemui.screenrecord.ScreenRecordDialog</string>

    <!-- The component name of a special dock app that merely launches a dream.
         We don't want to launch this app when docked because it causes an unnecessary
         activity transition.  We just want to start the dream. -->
    <string name="config_somnambulatorComponent" translatable="false"
            >com.android.systemui/com.android.systemui.Somnambulator</string>

    <!-- The component name of a special dock app that merely launches a dream.
         We don't want to launch this app when docked because it causes an unnecessary
         activity transition.  We just want to start the dream.. -->
    <string name="config_screenshotServiceComponent" translatable="false"
            >com.android.systemui/com.android.systemui.screenshot.TakeScreenshotService</string>

    <!-- The component notified when there is an error while taking a screenshot. -->
    <string name="config_screenshotErrorReceiverComponent" translatable="false"
            >com.android.systemui/com.android.systemui.screenshot.ScreenshotServiceErrorReceiver</string>

    <!-- The component for the activity shown to grant permissions for a slice. -->
    <string name="config_slicePermissionComponent" translatable="false"
            >com.android.systemui/com.android.systemui.SlicePermissionActivity</string>

    <!-- The minimum number of visible recent tasks to be presented to the user through the
         SystemUI. Can be -1 if there is no minimum limit. -->
    <integer name="config_minNumVisibleRecentTasks_grid">-1</integer>

    <!-- The maximum number of visible recent tasks to be presented to the user through the
         SystemUI. Can be -1 if there is no maximum limit. -->
    <integer name="config_maxNumVisibleRecentTasks_grid">9</integer>

    <!-- The minimum number of visible recent tasks to be presented to the user through the
         SystemUI. Can be -1 if there is no minimum limit. -->
    <integer name="config_minNumVisibleRecentTasks_lowRam">-1</integer>

    <!-- The maximum number of visible recent tasks to be presented to the user through the
         SystemUI. Can be -1 if there is no maximum limit. -->
    <integer name="config_maxNumVisibleRecentTasks_lowRam">9</integer>

    <!-- The minimum number of visible recent tasks to be presented to the user through the
         SystemUI. Can be -1 if there is no minimum limit. -->
    <integer name="config_minNumVisibleRecentTasks">5</integer>

    <!-- The maximum number of visible recent tasks to be presented to the user through the
         SystemUI. Can be -1 if there is no maximum limit. -->
    <integer name="config_maxNumVisibleRecentTasks">-1</integer>

    <!-- The duration in which a recent task is considered in session and should be visible. -->
    <integer name="config_activeTaskDurationHours">6</integer>

    <!-- default window ShowCircularMask property -->
    <bool name="config_windowShowCircularMask">false</bool>

    <!-- default value for whether circular emulators (ro.emulator.circular)
         should show a display overlay on the screen -->
    <bool name="config_windowEnableCircularEmulatorDisplayOverlay">false</bool>

    <!-- Defines the default set of global actions. Actions may still be disabled or hidden based
         on the current state of the device.
         Each item must be one of the following strings:
         "power" = Power off
         "settings" = An action to launch settings
         "airplane" = Airplane mode toggle
         "bugreport" = Take bug report, if available
         "silent" = silent mode
         "users" = list of users
         "restart" = restart device
         "emergency" = Launch emergency dialer
         "lockdown" = Lock down device until the user authenticates
         "logout" =  Logout the current user
         -->
    <string-array translatable="false" name="config_globalActionsList">
        <item>airplane</item>
        <item>bugreport</item>
        <item>emergency</item>
        <item>lockdown</item>
        <item>logout</item>
        <item>power</item>
        <item>restart</item>
        <item>screenshot</item>
        <item>settings</item>
        <item>silent</item>
        <item>users</item>
    </string-array>

    <!-- Number of milliseconds to hold a wake lock to ensure that drawing is fully
         flushed to the display while dozing.  This value needs to be large enough
         to account for processing and rendering time plus a frame or two of latency
         in the display pipeline plus some slack just to be sure. -->
    <integer name="config_drawLockTimeoutMillis">120</integer>

    <!-- An array of device capabilities defined by GSMA SGP.22 v2.0.
         The first item is the capability name that the device supports. The second item is the
         major version. The minor and revision versions are default to 0s.
         The device capabilities and their definition in the spec are:
             gsm : gsmSupportedRelease
             utran : utranSupportedRelease
             cdma1x : cdma2000onexSupportedRelease
             hrpd : cdma2000hrpdSupportedRelease
             ehrpd : cdma2000ehrpdSupportedRelease
             eutran : eutranSupportedRelease
             nfc : contactlessSupportedRelease
             crl : rspCrlSupportedVersion
             nrepc : nrEpcSupportedRelease
             nr5gc : nr5gcSupportedRelease
             eutran5gc : eutran5gcSupportedRelease
    -->
    <string-array translatable="false" name="config_telephonyEuiccDeviceCapabilities">
        <!-- Example:
        <item>"gsm,11"</item>
        <item>"utran,11"</item>
        <item>"cdma1x,1"</item>
        <item>"hrpd,3"</item>
        <item>"ehrpd,12"</item>
        <item>"eutran,11"</item>
        <item>"nfc,1"</item>
        <item>"crl,1"</item>
        <item>"nrepc,15"</item>
        <item>"nr5gc,15"</item>
        <item>"eutran5gc,15"</item>
        -->
    </string-array>

    <!-- default telephony hardware configuration for this platform.
    -->
    <!-- this string array should be overridden by the device to present a list
         telephony hardware resource.  this is used by the telephony device controller
         (TDC) to offer the basic capabilities of the hardware to the telephony
         framework
    -->
    <!-- an array of "[hardware type],[hardware-uuid],[state],[[hardware-type specific]]"
         with, [[hardware-type specific]] in:
            - "[[ril-model],[rat],[max-active-voice],[max-active-data],[max-active-standby]]"
              for 'modem' hardware
            - "[[associated-modem-uuid]]"
              for 'sim' hardware.
         refer to HardwareConfig in com.android.internal.telephony for specific details/values
         those elements can carry.
    -->
    <string-array translatable="false" name="config_telephonyHardware">
        <!-- modem -->
        <item>0,modem,0,0,0,1,1,1</item>
        <!-- sim -->
        <item>1,sim,0,modem</item>
    </string-array>

    <!-- This string array can be overriden to add an additional DRM support for WebView EME. -->
    <!-- Array of "[keySystemName],[UuidOfMediaDrm]" -->
    <string-array name="config_keySystemUuidMapping" translatable="false">
        <!-- Example:
        <item>"x-com.microsoft.playready,9A04F079-9840-4286-AB92-E65BE0885F95"</item>
        -->
    </string-array>

    <!-- Flag indicating which package name can access the persistent data partition -->
    <string name="config_persistentDataPackageName" translatable="false"></string>

    <!-- Flag indicating which package name can access DeviceConfig table -->
    <string name="config_deviceConfiguratorPackageName" translatable="false"></string>

    <!-- Flag indicating apps will skip sending hold request before merge. In this case
        IMS service implementation will do both.i.e.hold followed by merge. -->
    <bool name="skipHoldBeforeMerge">true</bool>

    <!-- Flag indicating whether the IMS service can be turned off. If false then
        the service will not be turned-off completely (the ImsManager.turnOffIms() will
        be disabled) but individual Features can be disabled using ImsConfig.setFeatureValue() -->
    <bool name="imsServiceAllowTurnOff">true</bool>

    <!-- Flag specifying whether VoLTE is available on device -->
    <bool name="config_device_volte_available">true</bool>

    <!-- Flag specifying whether VoLTE should be available for carrier: independent of
         carrier provisioning. If false: hard disabled. If true: then depends on carrier
         provisioning, availability etc -->
    <bool name="config_carrier_volte_available">true</bool>

    <!-- Flag specifying whether VoLTE TTY is supported -->
    <bool name="config_carrier_volte_tty_supported">true</bool>

    <!-- Flag specifying whether VT is available on device -->
    <bool name="config_device_vt_available">true</bool>

    <!-- Flag specifying whether the device will use the "allow_hold_in_ims_call" carrier config
         option.  When false, the device will support holding of IMS calls, regardless of the
         carrier config setting. -->
    <bool name="config_device_respects_hold_carrier_config">true</bool>

    <!-- Flag specifying whether VT should be available for carrier: independent of
         carrier provisioning. If false: hard disabled. If true: then depends on carrier
         provisioning, availability etc -->
    <bool name="config_carrier_vt_available">true</bool>

    <!-- Flag specifying whether WFC over IMS is available on device -->
        <bool name="config_device_wfc_ims_available">true</bool>

    <!-- Flag specifying whether WFC over IMS should be available for carrier: independent of
         carrier provisioning. If false: hard disabled. If true: then depends on carrier
         provisioning, availability etc -->
    <bool name="config_carrier_wfc_ims_available">true</bool>

    <!-- Whether to use voip audio mode for ims call -->
    <bool name="config_use_voip_mode_for_ims">true</bool>

    <!-- Boolean indicating USSD over IMS is allowed.
     If it is not supported due to modem limitations, USSD send over the CS pipe instead.-->
    <bool name="config_allow_ussd_over_ims">true</bool>

    <!-- String array containing numbers that shouldn't be logged. Country-specific. -->
    <string-array name="unloggable_phone_numbers" />

    <!-- Cellular data service package name to bind to by default. If none is specified in an overlay, an
         empty string is passed in -->
    <string name="config_wwan_data_service_package" translatable="false">com.android.phone</string>

    <!-- IWLAN data service package name to bind to by default. If none is specified in an overlay, an
         empty string is passed in -->
    <string name="config_wlan_data_service_package" translatable="false"></string>

    <!-- Boolean indicating whether the Iwlan data service supports persistence of iwlan ipsec
         tunnels across service restart. If iwlan tunnels are not persisted across restart,
         Framework will clean up dangling data connections when service restarts -->
    <bool name="config_wlan_data_service_conn_persistence_on_restart">true</bool>

    <!-- Cellular data service class name to bind to by default. If none is specified in an overlay, an
         empty string is passed in -->
    <string name="config_wwan_data_service_class" translatable="false"></string>

    <!-- IWLAN data service class name to bind to by default. If none is specified in an overlay, an
         empty string is passed in -->
    <string name="config_wlan_data_service_class" translatable="false"></string>

    <bool name="config_networkSamplingWakesDevice">true</bool>

    <!--From SmsMessage-->
    <!--Support decoding the user data payload as pack GSM 8-bit (a GSM alphabet
        string that's stored in 8-bit unpacked format) characters.-->
    <bool translatable="false" name="config_sms_decode_gsm_8bit_data">false</bool>

    <!-- Configures encoding type to parse the User Data of an SMS for reserved TP-DCS value.
         Refer to SmsConstants.java
         ENCODING_UNKNOWN = 0;
         ENCODING_7BIT = 1;
         ENCODING_8BIT = 2;
         ENCODING_16BIT = 3;
         ENCODING_KSC5601 = 4;
         -->
    <integer name="default_reserved_data_coding_scheme">2</integer>

    <!-- If EMS is not supported, framework breaks down EMS into single segment SMS
         and adds page info " x/y". This config is used to set which carrier doesn't
         support EMS and whether page info should be added at the beginning or the end.
         We use tag 'prefix' for position beginning and 'suffix' for position end.
         And use gid to distinguish different carriers which using same mcc and mnc.
         Examples: <item>simOperatorNumber;position;gid(optional)</item>>
    -->
    <string-array translatable="false" name="no_ems_support_sim_operators">
        <!-- VZW -->
        <item>20404;suffix;BAE0000000000000</item>
    </string-array>

    <bool name="config_auto_attach_data_on_creation">true</bool>

    <!-- Sprint need a 70 ms delay for 3way call -->
    <integer name="config_cdma_3waycall_flash_delay">0</integer>

    <!-- If there is no preload VM number in the sim card, carriers such as
         Verizon require to load a default vm number from the configurantion.
         Define config_default_vm_number for this purpose. And there are two
         optional formats for this configuration as below:
         (1)<item>voicemail number</item>
         (2)<item>voicemail number;gid</item>
         The logic to pick up the correct voicemail number:
         (1) If the config_default_vm_number array has no gid special item, the last one will be
         picked
         (2) If the config_default_vm_number array has gid special item and  it matches the current
         sim's gid, it will be picked.
         (3) If the config_default_vm_number array has gid special item but it doesn't match the
         current sim's gid, the last one without gid will be picked -->
    <string-array translatable="false" name="config_default_vm_number" />

    <!--SIM does not save, but the voice mail number to be changed. -->
    <bool name="editable_voicemailnumber">true</bool>

    <!-- service number convert map in roaming network. -->
    <!-- [dialstring],[replacement][,optional gid] -->
    <string-array translatable="false" name="dial_string_replace">
    </string-array>

    <!-- Flag indicating whether radio is to be restarted on the error of
         PDP_FAIL_REGULAR_DEACTIVATION/0x24 -->
    <bool name="config_restart_radio_on_pdp_fail_regular_deactivation">false</bool>

    <!-- networks that don't want data deactivate when shutdown the phone
         note this is dependent on the operator of the network we're on,
         not operator on the SIM -->
    <string-array translatable="false" name="networks_not_clear_data">
        <item>71203</item>
        <item>71606</item>
        <item>71610</item>
        <item>732101</item>
    </string-array>

    <!-- Config determines whether to update phone object when voice registration
         state changes. Voice radio tech change will always trigger an update of
         phone object irrespective of this config -->
    <bool name="config_switch_phone_on_voice_reg_state_change">true</bool>

    <bool name="config_sms_force_7bit_encoding">false</bool>

    <!-- Number of physical SIM slots on the device. This includes both eSIM and pSIM slots, and
         is not necessarily the same as the number of phones/logical modems supported by the device.
         For example, a multi-sim device can have 2 phones/logical modems, but 3 physical slots,
         or a single SIM device can have 1 phones/logical modems, but 2 physical slots (one eSIM
         and one pSIM) -->
    <integer name="config_num_physical_slots">1</integer>

    <!-- When a radio power off request is received, we will delay completing the request until
         either IMS moves to the deregistered state or the timeout defined by this configuration
         elapses. If 0, this feature is disabled and we do not delay radio power off requests.-->
    <integer name="config_delay_for_ims_dereg_millis">0</integer>

    <!--Thresholds for LTE dbm in status bar-->
    <integer-array translatable="false" name="config_lteDbmThresholds">
        <item>-140</item>    <!-- SIGNAL_STRENGTH_NONE_OR_UNKNOWN -->
        <item>-128</item>    <!-- SIGNAL_STRENGTH_POOR -->
        <item>-118</item>    <!-- SIGNAL_STRENGTH_MODERATE -->
        <item>-108</item>    <!-- SIGNAL_STRENGTH_GOOD -->
        <item>-98</item>     <!-- SIGNAL_STRENGTH_GREAT -->
        <item>-44</item>
    </integer-array>

    <!-- Enabled built-in zen mode condition providers -->
    <string-array translatable="false" name="config_system_condition_providers">
        <item>countdown</item>
        <item>schedule</item>
        <item>event</item>
    </string-array>

    <!-- Priority repeat caller threshold, in minutes -->
    <integer name="config_zen_repeat_callers_threshold">15</integer>

    <!-- Flags enabling default window features. See Window.java -->
    <bool name="config_defaultWindowFeatureOptionsPanel">true</bool>
    <bool name="config_defaultWindowFeatureContextMenu">true</bool>

    <!-- If true, the transition for a RemoteViews is read from a resource instead of using the
         default scale-up transition. -->
    <bool name="config_overrideRemoteViewsActivityTransition">false</bool>

    <!-- The maximum bitmap size that can be written to a MediaMetadata object. This value
         is the max width/height allowed in dips.-->
    <dimen name="config_mediaMetadataBitmapMaxSize">320dp</dimen>

    <string translatable="false" name="prohibit_manual_network_selection_in_gobal_mode">false</string>

    <!-- An array of CDMA roaming indicators which means international roaming -->
    <integer-array translatable="false" name="config_cdma_international_roaming_indicators" />

    <!-- flag to indicate if EF LI/EF PL should be used for system language -->
    <bool name="config_use_sim_language_file">true</bool>

    <!-- Use ERI text for network name on CDMA LTE -->
    <bool name="config_LTE_eri_for_network_name">true</bool>

    <!-- Whether to start in touch mode -->
    <bool name="config_defaultInTouchMode">true</bool>

    <!-- Time adjustment, in milliseconds, applied to the default double tap threshold
         used for gesture detection by the screen magnifier. -->
    <integer name="config_screen_magnification_multi_tap_adjustment">-50</integer>

    <!-- Scale factor threshold used by the screen magnifier to determine when to switch from
         panning to scaling the magnification viewport. -->
    <item name="config_screen_magnification_scaling_threshold" format="float" type="dimen">0.3</item>

    <!-- Whether to support magnification area. If not enabled, it would hide the entry in
         magnification settings and adjust the default magnification capability.  -->
    <bool name="config_magnification_area">true</bool>

    <!-- If true, the display will be shifted around in ambient mode. -->
    <bool name="config_enableBurnInProtection">true</bool>

    <!-- Specifies the maximum burn-in offset displacement from the center. If -1, no maximum value
         will be used. -->
    <integer name="config_burnInProtectionMaxRadius">-1</integer>

    <!-- Specifies the minimum burn-in offset horizontally. -->
    <integer name="config_burnInProtectionMinHorizontalOffset">0</integer>

    <!-- Specifies the maximum burn-in offset horizontally. -->
    <integer name="config_burnInProtectionMaxHorizontalOffset">0</integer>

    <!-- Specifies the minimum burn-in offset vertically. -->
    <integer name="config_burnInProtectionMinVerticalOffset">0</integer>

    <!-- Specifies the maximum burn-in offset vertically. -->
    <integer name="config_burnInProtectionMaxVerticalOffset">0</integer>

    <!-- Limit for the number of face templates per user -->
    <integer name="config_faceMaxTemplatesPerUser">1</integer>

    <!-- For performance and storage reasons, limit the number of fingerprints per user -->
    <integer name="config_fingerprintMaxTemplatesPerUser">5</integer>

    <!-- Specify if the fingerprint hardware support gestures-->
    <bool name="config_fingerprintSupportsGestures">true</bool>

    <!-- This config is used to force VoiceInteractionService to start on certain low ram devices.
         It declares the package name of VoiceInteractionService that should be started. -->
    <string translatable="false" name="config_forceVoiceInteractionServicePackage"></string>

    <!-- This config is ued to determine whether animations are allowed in low power mode. -->
    <bool name="config_allowAnimationsInLowPowerMode">true</bool>

    <!-- Whether device supports double tap to wake -->
    <bool name="config_supportDoubleTapWake">true</bool>

    <!-- The RadioAccessFamilies supported by the device.
         Empty is viewed as "all".  Only used on devices which
         don't support RIL_REQUEST_GET_RADIO_CAPABILITY
         format is UMTS|LTE|... -->
    <string translatable="false" name="config_radio_access_family"></string>

    <!-- Whether the main built-in display is round. This will affect
         Configuration.screenLayout's SCREENLAYOUT_ROUND_MASK flags for Configurations on the
         main built-in display. Change this in device-specific overlays.
         Defaults to the older, deprecated config_windowIsRound already used in
         some existing device-specific resource overlays. -->
    <bool name="config_mainBuiltInDisplayIsRound">@bool/config_windowIsRound</bool>

    <!-- The bounding path of the cutout region of the main built-in display.
         Must either be empty if there is no cutout region, or a string that is parsable by
         {@link android.util.PathParser}.

         The path is assumed to be specified in display coordinates with pixel units and in
         the display's native orientation, with the origin of the coordinate system at the
         center top of the display. Optionally, you can append either `@left` or `@right` to the
         end of the path string, in order to change the path origin to either the top left,
         or top right of the display.

         To facilitate writing device-independent emulation overlays, the marker `@dp` can be
         appended after the path string to interpret coordinates in dp instead of px units.
         Note that a physical cutout should be configured in pixels for the best results.

         Example for a 10px x 10px square top-center cutout:
                <string ...>M -5,0 L -5,10 L 5,10 L 5,0 Z</string>
         Example for a 10dp x 10dp square top-center cutout:
                <string ...>M -5,0 L -5,10 L 5,10 L 5,0 Z @dp</string>

         @see https://www.w3.org/TR/SVG/paths.html#PathData
         -->
    <string translatable="false" name="config_mainBuiltInDisplayCutout"></string>

    <!-- Like config_mainBuiltInDisplayCutout, but this path is used to report the
         one single bounding rect per device edge to the app via
         {@link DisplayCutout#getBoundingRect}. Note that this path should try to match the visual
         appearance of the cutout as much as possible, and may be smaller than
         config_mainBuiltInDisplayCutout
         -->
    <string translatable="false" name="config_mainBuiltInDisplayCutoutRectApproximation">@string/config_mainBuiltInDisplayCutout</string>

    <!-- Whether the display cutout region of the main built-in display should be forced to
         black in software (to avoid aliasing or emulate a cutout that is not physically existent).
         -->
    <bool name="config_fillMainBuiltInDisplayCutout">false</bool>

    <!-- If true, and there is a cutout on the main built in display, the cutout will be masked
         by shrinking the display such that it does not overlap the cutout area. -->
    <bool name="config_maskMainBuiltInDisplayCutout">false</bool>

    <!-- Ultrasound support for Mic/speaker path -->
    <!-- Whether the default microphone audio source supports near-ultrasound frequencies
         (range of 18 - 21 kHz). -->
    <bool name="config_supportMicNearUltrasound">true</bool>
    <!-- Whether the default speaker audio output path supports near-ultrasound frequencies
         (range of 18 - 21 kHz). -->
    <bool name="config_supportSpeakerNearUltrasound">true</bool>

    <!-- Whether the Unprocessed audio source supports the required frequency range and level -->
    <bool name="config_supportAudioSourceUnprocessed">true</bool>

    <!-- Flag indicating device support for EAP SIM, AKA, AKA' -->
    <bool name="config_eap_sim_based_auth_supported">true</bool>

    <!-- How long history of previous vibrations should be kept for the dumpsys. -->
    <integer name="config_previousVibrationsDumpLimit">50</integer>

    <!-- The default vibration strength, must be between 1 and 255 inclusive. -->
    <integer name="config_defaultVibrationAmplitude">255</integer>

    <!-- The max vibration strength allowed in audio haptic channels, must be positive or zero if
         limit is unknown. -->
    <item name="config_hapticChannelMaxVibrationAmplitude" format="float" type="dimen">0</item>

    <!-- If the device should still vibrate even in low power mode, for certain priority vibrations
     (e.g. accessibility, alarms). This is mainly for Wear devices that don't have speakers. -->
    <bool name="config_allowPriorityVibrationsInLowPowerMode">true</bool>

    <!-- The duration (in milliseconds) that should be used to convert vibration ramps to a sequence
         of fixed amplitude steps on devices without PWLE support. -->
    <integer name="config_vibrationWaveformRampStepDuration">5</integer>

    <!-- The duration (in milliseconds) that should be applied to waveform vibrations that ends in
         non-zero amplitudes, to bring the vibrator amplitude down to zero using this timing. -->
    <integer name="config_vibrationWaveformRampDownDuration">0</integer>

    <!-- Number of retries Cell Data should attempt for a given error code before
         restarting the modem.
         Error codes not listed will not lead to modem restarts.
         Array of "code#,retry#"  -->
    <string-array name="config_cell_retries_per_error_code">
    </string-array>

    <!-- Set initial MaxRetry value for operators -->
    <integer name="config_mdc_initial_max_retry">1</integer>

    <!-- The OEM specified sensor type for the gesture to launch the camera app. -->
    <integer name="config_cameraLaunchGestureSensorType">-1</integer>
    <!-- The OEM specified sensor string type for the gesture to launch camera app, this value
         must match the value of config_cameraLaunchGestureSensorType in OEM's HAL -->
    <string translatable="false" name="config_cameraLaunchGestureSensorStringType"></string>

    <!-- Allow the gesture to double tap the power button twice to start the camera while the device
         is non-interactive. -->
    <bool name="config_cameraDoubleTapPowerGestureEnabled">true</bool>

    <!-- Allow the gesture to quick tap the power button multiple times to start the emergency sos
         experience while the device is non-interactive. -->
    <bool name="config_emergencyGestureEnabled">true</bool>

    <!-- Allow the gesture power + volume up to change the ringer mode while the device
         is interactive. -->
    <bool name="config_volumeHushGestureEnabled">true</bool>

    <!-- Name of the component to handle network policy notifications. If present,
         disables NetworkPolicyManagerService's presentation of data-usage notifications. -->
    <string translatable="false" name="config_networkPolicyNotificationComponent"></string>

    <!-- The BT name of the keyboard packaged with the device. If this is defined, SystemUI will
         automatically try to pair with it when the device exits tablet mode. -->
    <string translatable="false" name="config_packagedKeyboardName"></string>

    <!-- The device supports freeform window management. Windows have title bars and can be moved
         and resized. If you set this to true, you also need to add
         PackageManager.FEATURE_FREEFORM_WINDOW_MANAGEMENT feature to your device specification.
         The duplication is necessary, because this information is used before the features are
         available to the system.-->
    <bool name="config_freeformWindowManagement">true</bool>

    <!-- If set, this will force all windows to draw the status bar background, including the apps
         that have not requested doing so (via the WindowManager.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS
         flag). -->
    <bool name="config_forceWindowDrawsStatusBarBackground">true</bool>

    <!-- Controls the opacity of the navigation bar depending on the visibility of the
         various workspace stacks.
         0 - Nav bar is always opaque when either the freeform stack or docked stack is visible.
         1 - Nav bar is always translucent when the freeform stack is visible, otherwise always
             opaque.
         2 - Nav bar is never forced opaque.
         -->
    <integer name="config_navBarOpacityMode">0</integer>

    <!-- Controls the navigation bar interaction mode:
         0: 3 button mode (back, home, overview buttons)
         1: 2 button mode (back, home buttons + swipe up for overview)
         2: gestures only for back, home and overview -->
    <integer name="config_navBarInteractionMode">0</integer>

    <!-- Controls whether the nav bar can move from the bottom to the side in landscape.
         Only applies if the device display is not square. -->
    <bool name="config_navBarCanMove">true</bool>

    <!-- Controls whether the navigation bar lets through taps. -->
    <bool name="config_navBarTapThrough">true</bool>

    <!-- Controls whether the side edge gestures can always trigger the transient nav bar to
         show. -->
    <bool name="config_navBarAlwaysShowOnSideEdgeGesture">true</bool>

    <!-- Controls the size of the back gesture inset. -->
    <dimen name="config_backGestureInset">0dp</dimen>

    <!-- Array of values used in Gesture Navigation settings page to reduce/increase the back
     gesture's inset size. These values will be multiplied into the default width, read from the
     gesture navigation overlay package, in order to create 3 different sizes which are selectable
     via a slider component. -->
    <array name="config_backGestureInsetScales">
        <item>0.60</item>
        <item>1.00</item>
        <item>1.33</item>
    </array>

    <!-- Controls whether the navbar needs a scrim with
         {@link Window#setEnsuringNavigationBarContrastWhenTransparent}. -->
    <bool name="config_navBarNeedsScrim">true</bool>

    <!-- Controls whether seamless rotation should be allowed even though the navbar can move
         (which normally prevents seamless rotation). -->
    <bool name="config_allowSeamlessRotationDespiteNavBarMoving">true</bool>

    <!-- Controls whether hints for gestural navigation are shown when the device is setup.
         This should only be set when the device has gestural navigation enabled by default. -->
    <bool name="config_showGesturalNavigationHints">true</bool>

    <!-- Controls the free snap mode for the docked stack divider. In this mode, the divider can be
         snapped to any position between the first target and the last target. -->
    <bool name="config_dockedStackDividerFreeSnapMode">true</bool>

    <!-- Default insets [LEFT/RIGHTxTOP/BOTTOM] from the screen edge for picture-in-picture windows.
         These values are in DPs and will be converted to pixel sizes internally. -->
    <string translatable="false" name="config_defaultPictureInPictureScreenEdgeInsets">16x16</string>

    <!-- The percentage of the screen width to use for the default width or height of
         picture-in-picture windows. Regardless of the percent set here, calculated size will never
         be smaller than @dimen/default_minimal_size_pip_resizable_task. -->
    <item name="config_pictureInPictureDefaultSizePercent" format="float" type="dimen">0.23</item>

    <!-- The default aspect ratio for picture-in-picture windows. -->
    <item name="config_pictureInPictureDefaultAspectRatio" format="float" type="dimen">1.777778</item>

    <!-- This is the limit for the max and min aspect ratio (1 / this value) at which the min size
         will be used instead of an adaptive size based loosely on area. -->
    <item name="config_pictureInPictureAspectRatioLimitForMinSize" format="float" type="dimen">1.777778</item>

    <!-- The default gravity for the picture-in-picture window.
         Currently, this maps to Gravity.BOTTOM | Gravity.RIGHT -->
    <integer name="config_defaultPictureInPictureGravity">0x55</integer>

    <!-- The minimum aspect ratio (width/height) that is supported for picture-in-picture.  Any
         ratio smaller than this is considered too tall and thin to be usable. Currently, this
         is the inverse of the max landscape aspect ratio (1:2.39), but this is an extremely
         skinny aspect ratio that is not expected to be widely used. -->
    <item name="config_pictureInPictureMinAspectRatio" format="float" type="dimen">0.41841004184</item>

    <!-- The maximum aspect ratio (width/height) that is supported for picture-in-picture. Any
         ratio larger than this is considered to wide and short to be usable. Currently 2.39:1. -->
    <item name="config_pictureInPictureMaxAspectRatio" format="float" type="dimen">2.39</item>

    <!-- The maximum number of actions that is supported for picture-in-picture. This number
         must be no less than 3 for back compatibility. -->
    <integer name="config_pictureInPictureMaxNumberOfActions">3</integer>

    <!-- Controls the snap mode for the docked stack divider
             0 - 3 snap targets: left/top has 16:9 ratio, 1:1, and right/bottom has 16:9 ratio
             1 - 3 snap targets: fixed ratio, 1:1, (1 - fixed ratio)
             2 - 1 snap target: 1:1
    -->
    <integer name="config_dockedStackDividerSnapMode">0</integer>

    <!-- The maximum aspect ratio (longerSide/shorterSide) that is treated as close-to-square. The
         orientation requests from apps would be ignored if the display is close-to-square. -->
    <item name="config_closeToSquareDisplayMaxAspectRatio" format="float" type="dimen">1.333</item>

    <!-- List of comma separated package names for which we the system will not show crash, ANR,
         etc. dialogs. -->
    <string translatable="false" name="config_appsNotReportingCrashes"></string>

    <!-- Inactivity threshold (in milliseconds) used in JobScheduler. JobScheduler will consider
         the device to be "idle" after being inactive for this long. -->
    <integer name="config_jobSchedulerInactivityIdleThreshold">1860000</integer>
    <!-- The alarm window (in milliseconds) that JobScheduler uses to enter the idle state -->
    <integer name="config_jobSchedulerIdleWindowSlop">300000</integer>

    <!-- If true, jobs from background user will be restricted -->
    <bool name="config_jobSchedulerRestrictBackgroundUser">true</bool>
    <!-- The length of grace period after user becomes background user -->
    <integer name="config_jobSchedulerUserGracePeriod">60000</integer>

    <!-- If true, all guest users created on the device will be ephemeral. -->
    <bool name="config_guestUserEphemeral">true</bool>

    <!-- Whether device should always have a guest user available. If true, guest user will be
         created on boot, and a new guest user will be created in the background anytime the current
         guest user is removed. Instead of showing "Add guest" and "Remove guest", the UI will show
         "Guest" and "Reset guest". -->
    <bool name="config_guestUserAutoCreated">true</bool>

    <!-- Enforce strong auth on boot. Setting this to false represents a security risk and should
         not be ordinarily done. The only case in which this might be permissible is in a car head
         unit where there are hardware mechanisms to protect the device (physical keys) and not
         much in the way of user data.
    -->
    <bool name="config_strongAuthRequiredOnBoot">true</bool>

    <!-- Wallpaper cropper package. Used as the default cropper if the active launcher doesn't
         handle wallpaper cropping.
    -->
    <string name="config_wallpaperCropperPackage" translatable="false">com.android.wallpapercropper</string>

    <!-- True if the device supports at least one form of multi-window.
         E.g. freeform, split-screen, picture-in-picture. -->
    <bool name="config_supportsMultiWindow">true</bool>

    <!-- True if the device supports split screen as a form of multi-window. -->
    <bool name="config_supportsSplitScreenMultiWindow">true</bool>

    <!-- Whether the device supports non-resizable activity in multi windowing modes.
         -1: The device doesn't support non-resizable in multi windowing modes.
          0: The device supports non-resizable in multi windowing modes only if this is a large
             screen (smallest width >= {@link config_largeScreenSmallestScreenWidthDp}).
          1: The device always supports non-resizable in multi windowing modes.
    -->
    <integer name="config_supportsNonResizableMultiWindow">0</integer>

    <!-- Whether the device checks the activity min width/height to determine if it can be shown in
         multi windowing modes.
         -1: The device ignores the activity min width/height when determining if it can be shown in
             multi windowing modes.
          0: If this is a small screen (smallest width <
             {@link config_largeScreenSmallestScreenWidthDp}), the device compares the activity min
             width/height with the min multi windowing modes dimensions the device supports to
             determine if the activity can be shown in multi windowing modes
          1: The device always compare the activity min width/height with the min multi windowing
             modes dimensions {@link config_minPercentageMultiWindowSupportWidth} the device
             supports to determine if the activity can be shown in multi windowing modes.
    -->
    <integer name="config_respectsActivityMinWidthHeightMultiWindow">0</integer>

    <!-- This value is only used when the device checks activity min height to determine if it
         can be shown in multi windowing modes.
         If the activity min height is greater than this percentage of the display height in
         portrait, it will not be allowed to be shown in multi windowing modes.
         The value should be between [0 - 1].
    -->
    <item name="config_minPercentageMultiWindowSupportHeight" format="float" type="dimen">0.3</item>

    <!-- This value is only used when the device checks activity min width to determine if it
         can be shown in multi windowing modes.
         If the activity min width is greater than this percentage of the display width in
         landscape, it will not be allowed to be shown in multi windowing modes.
         The value should be between [0 - 1].
    -->
    <item name="config_minPercentageMultiWindowSupportWidth" format="float" type="dimen">0.5</item>

    <!-- If the display smallest screen width is greater or equal to this value, we will treat it
         as a large screen device, which will have some multi window features enabled by default.
    -->
    <integer name="config_largeScreenSmallestScreenWidthDp">600</integer>

    <!-- True if the device is using legacy split. -->
    <bool name="config_useLegacySplit">false</bool>

    <!-- True if the device supports running activities on secondary displays. -->
    <bool name="config_supportsMultiDisplay">true</bool>

    <!-- True if the device has no home screen. That is a launcher activity
         where the user can launch other applications from.  -->
    <bool name="config_noHomeScreen">false</bool>

    <!-- True if the device supports system decorations on secondary displays. -->
    <bool name="config_supportsSystemDecorsOnSecondaryDisplays">true</bool>

    <!-- True if the device supports insecure lock screen. -->
    <bool name="config_supportsInsecureLockScreen">true</bool>

    <!-- True if the device requires AppWidgetService even if it does not have
         the PackageManager.FEATURE_APP_WIDGETS feature -->
    <bool name="config_enableAppWidgetService">true</bool>

    <!-- True if the device supports Sustained Performance Mode-->
    <bool name="config_sustainedPerformanceModeSupported">true</bool>

    <!-- File used to enable the double touch gesture.
         TODO: move to input HAL once ready. -->
    <string name="config_doubleTouchGestureEnableFile"></string>

    <!-- Comma-separated list of unbundled packages which can connect to the
         tv remote provider. The tv remote service is an example of such a
         service. -->
    <string name="config_tvRemoteServicePackage" translatable="false"></string>

    <!-- The package name of the package implementing the custom notification panel -->
    <string name="config_notificationHandlerPackage" translatable="false"></string>

    <!-- True if the device supports persisting security logs across reboots.
         This requires the device's kernel to have pstore and pmsg enabled,
         and DRAM to be powered and refreshed through all stages of reboot. -->
    <bool name="config_supportPreRebootSecurityLogs">false</bool>

    <!-- Default files to pin via Pinner Service -->
    <string-array translatable="false" name="config_defaultPinnerServiceFiles">
    </string-array>

    <!-- True if camera app should be pinned via Pinner Service -->
    <bool name="config_pinnerCameraApp">true</bool>

    <!-- True if home app should be pinned via Pinner Service -->
    <bool name="config_pinnerHomeApp">true</bool>

    <!-- True if assistant app should be pinned via Pinner Service -->
    <bool name="config_pinnerAssistantApp">true</bool>

    <!-- Number of days preloaded file cache should be preserved on a device before it can be
         deleted -->
    <integer name="config_keepPreloadsMinDays">7</integer>

    <!-- Flag indicating whether round icons should be parsed from the application manifest. -->
    <bool name="config_useRoundIcon">true</bool>

    <!-- Flag indicating whether the assist disclosure can be disabled using
         ASSIST_DISCLOSURE_ENABLED. -->
    <bool name="config_allowDisablingAssistDisclosure">true</bool>

    <!-- True if the device supports system navigation keys. -->
    <bool name="config_supportSystemNavigationKeys">false</bool>

    <!-- emergency call number for the emergency affordance -->
    <string name="config_emergency_call_number" translatable="false">112</string>

    <!-- Package name that provides Emergency Dialer -->
    <string name="config_emergency_dialer_package" translatable="false">com.android.phone</string>

    <!-- Do not translate. Mcc codes whose existence trigger the presence of emergency
         affordances-->
    <string-array name="config_emergency_iso_country_codes" translatable="false">
        <item>in</item>
    </string-array>

    <!-- Package name for the device provisioning package. -->
    <string name="config_deviceProvisioningPackage"></string>

    <!-- Colon separated list of package names that should be granted DND access -->
    <string name="config_defaultDndAccessPackages" translatable="false">com.android.camera2</string>

    <!-- User restrictions set when the first user is created.
         Note: Also update appropriate overlay files. -->
    <string-array translatable="false" name="config_defaultFirstUserRestrictions">
    </string-array>

    <!-- Specifies whether certain permissions should be individually controlled. -->
    <bool name="config_permissionsIndividuallyControlled">true</bool>

    <!-- Specifies whether the user has to give consent to manage wireless (wifi + bluetooth). -->
    <bool name="config_wirelessConsentRequired">true</bool>

    <!-- Default value for android:focusableInTouchMode for some framework scrolling containers.
         ListView/GridView are notably absent since this is their default anyway.
         Set to true for watch devices. -->
    <bool name="config_focusScrollContainersInTouchMode">false</bool>

    <string name="config_networkOverLimitComponent" translatable="false">com.android.systemui/com.android.systemui.net.NetworkOverLimitActivity</string>
    <string name="config_dataUsageSummaryComponent" translatable="false">com.android.settings/com.android.settings.Settings$DataUsageSummaryActivity</string>

    <!-- Flag specifying whether user-switch operations have custom UI. When false, user-switch
         UI is handled by ActivityManagerService -->
    <bool name="config_customUserSwitchUi">false</bool>

    <!-- A array of regex to treat a SMS as VVM SMS if the message body matches.
         Each item represents an entry, which consists of two parts:
         a comma (,) separated list of MCCMNC the regex applies to, followed by a semicolon (;), and
         then the regex itself. -->
    <string-array translatable="false" name="config_vvmSmsFilterRegexes">
        <!-- Verizon requires any SMS that starts with //VZWVVM to be treated as a VVM SMS-->
        <item>310004,310010,310012,310013,310590,310890,310910,311110,311270,311271,311272,311273,311274,311275,311276,311277,311278,311279,311280,311281,311282,311283,311284,311285,311286,311287,311288,311289,311390,311480,311481,311482,311483,311484,311485,311486,311487,311488,311489;^//VZWVVM.*</item>
    </string-array>

    <!-- This config is holding calling number conversion map - expected to convert to emergency
         number. Formats for this config as below:
         <item>[dialstring1],[dialstring2],[dialstring3]:[replacement]</item>

         E.g. for Taiwan Type Approval, 110 and 119 should be converted to 112.
         <item>110,119:112</item>
    -->
    <string-array translatable="false" name="config_convert_to_emergency_number_map" />

    <!-- An array of packages for which notifications cannot be blocked.
         Should only be used for core device functionality that must not be
         rendered inoperative for safety reasons, like the phone dialer and
         SMS handler. -->
    <string-array translatable="false" name="config_nonBlockableNotificationPackages">
        <item>com.android.dialer</item>
        <item>com.android.messaging</item>
    </string-array>

    <!-- An array of packages that can make sound on the ringer stream in priority-only DND
     mode -->
    <string-array translatable="false" name="config_priorityOnlyDndExemptPackages">
        <item>com.android.dialer</item>
        <item>com.android.server.telecom</item>
        <item>com.android.systemui</item>
        <item>android</item>
    </string-array>

    <!-- The default value for transition animation scale found in developer settings.
         1.0 corresponds to 1x animator scale, 0 means that there will be no transition
         animations. Note that this is only a default and will be overridden by a
         user-set value if toggled by settings so the "Transition animation scale" setting
         should also be hidden if intended to be permanent. -->
    <item name="config_appTransitionAnimationDurationScaleDefault" format="float" type="dimen">1.0</item>

    <!-- Flag indicates that whether non-system apps can be installed on internal storage. -->
    <bool name="config_allow3rdPartyAppOnInternal">true</bool>

    <!-- Specifies the path that is used by AdaptiveIconDrawable class to crop launcher icons. -->
    <string name="config_icon_mask" translatable="false">"M50,0L92,0C96.42,0 100,4.58 100 8L100,92C100, 96.42 96.42 100 92 100L8 100C4.58, 100 0 96.42 0 92L0 8 C 0 4.42 4.42 0 8 0L50 0Z"</string>

    <!-- The component name, flattened to a string, for the default accessibility service to be
         enabled by the accessibility shortcut. This service must be trusted, as it can be activated
         without explicit consent of the user. If no accessibility service with the specified name
         exists on the device, the accessibility shortcut will be disabled by default. -->
    <string name="config_defaultAccessibilityService" translatable="false"></string>

    <!-- Flag indicates that whether escrow token API is enabled for TrustAgent -->
    <!-- Warning: This API can be dangerous when not implemented properly. In particular,
         escrow token must NOT be retrievable from device storage. In other words, either
         escrow token is not stored on device or its ciphertext is stored on device while
         the decryption key is not. Before enabling this feature, please ensure you've read
         and followed the pertinent sections of the escrow tokens section of the CDD <link>-->
    <!-- TODO(b/35230407) complete the link field -->
    <bool name="config_allowEscrowTokenForTrustAgent">false</bool>

    <!-- A flattened ComponentName which corresponds to the only trust agent that should be enabled
         by default. If the default value is used, or set to an empty string, the restriction will
         not be applied. -->
    <string name="config_defaultTrustAgent" translatable="false"></string>

    <!-- Colon separated list of package names that should be granted Notification Listener access -->
    <string name="config_defaultListenerAccessPackages" translatable="false"></string>

    <!-- Maximum size, specified in pixels, to restrain the display space width to. Height and
         density will be scaled accordingly to maintain aspect ratio. A value of 0 indicates no
         constraint will be enforced. -->
    <integer name="config_maxUiWidth">0</integer>

    <!-- Whether the device supports quick settings and its associated APIs -->
    <bool name="config_quickSettingsSupported">true</bool>

    <!-- The component name, flattened to a string, for the default autofill service
         to  enabled for an user. This service must be trusted, as it can be activated
         without explicit consent of the user. If no autofill service with the
          specified name exists on the device, autofill will be disabled by default.
    -->
    <string name="config_defaultAutofillService" translatable="false"></string>

    <!-- The package name for the OEM custom system textclassifier service.
         This service must be trusted, as it can be activated without explicit consent of the user.
         Example: "com.android.textclassifier"
         If this is empty, the default textclassifier service (i.e. config_servicesExtensionPackage)
         will be used.

         See android.view.textclassifier.TextClassificationManager.
    -->
    <string name="config_defaultTextClassifierPackage" translatable="false"></string>


    <!-- The package name for the system companion device manager service.
         This service must be trusted, as it can be activated without explicit consent of the user.
         Example: "com.android.companiondevicemanager"
         See android.companion.CompanionDeviceManager.
    -->
    <string name="config_companionDeviceManagerPackage" translatable="false"></string>

    <!-- A list of packages managing companion device(s) by the same manufacturers as the main
         device. It will fall back to showing a prompt if the association has been called multiple
         times in a short period.
         Note that config_companionDeviceManagerPackage and config_companionDeviceCerts are
         parallel arrays.
     -->
    <string-array name="config_companionDevicePackages" translatable="false"></string-array>

    <!-- A list of SHA256 Certificates managing companion device(s) by the same manufacturers as
         the main device. It will fall back to showing a prompt if the association has been called
         multiple times in a short period.
         Note that config_companionDeviceCerts and config_companionDeviceManagerPackage are parallel
         arrays.
         Example: "1A:2B:3C:4D"
     -->
    <string-array name="config_companionDeviceCerts" translatable="false"></string-array>

    <!-- The package name for the default wellbeing app.
         This package must be trusted, as it has the permissions to control other applications
         on the device.
         Example: "com.android.wellbeing"
     -->
    <string name="config_defaultWellbeingPackage" translatable="false"></string>

    <!-- The component name for the default system attention service.
         This service must be trusted, as it can be activated without explicit consent of the user.
         See android.attention.AttentionManagerService.
    -->
    <string name="config_defaultAttentionService" translatable="false"></string>

    <!-- The component name for the default system rotation resolver service.
        This service must be trusted, as it can be activated without explicit consent of the user.
        See android.service.rotationresolver.RotationResolverService.
   -->
    <string name="config_defaultRotationResolverService" translatable="false"></string>

    <!-- The component name for the system-wide captions service.
         This service must be trusted, as it controls part of the UI of the volume bar.
         Example: "com.android.captions/.SystemCaptionsService"
    -->
    <string name="config_defaultSystemCaptionsService" translatable="false"></string>

    <!-- The component name for the system-wide captions manager service.
         This service must be trusted, as the system binds to it and keeps it running.
         Example: "com.android.captions/.SystemCaptionsManagerService"
    -->
    <string name="config_defaultSystemCaptionsManagerService" translatable="false"></string>

    <!-- The package name for the incident report approver app.
        This app is usually PermissionController or an app that replaces it.  When
        a bugreport or incident report with EXPLICT-level sharing flags is going to be
        shared, this app will be sent the PENDING_INCIDENT_REPORTS_CHANGED broadcast.
    -->
    <string name="config_incidentReportApproverPackage" translatable="false">com.android.permissioncontroller</string>

    <!-- The package name for the system's content capture service.
         This service must be trusted, as it can be activated without explicit consent of the user.
         If no service with the specified name exists on the device, content capture will be
         disabled.
         Example: "com.android.contentcapture/.ContentcaptureService"
    -->
    <string name="config_defaultContentCaptureService" translatable="false"></string>

    <!-- The package name for the system's augmented autofill service.
         This service must be trusted, as it can be activated without explicit consent of the user.
         If no service with the specified name exists on the device, augmented autofill wil be
         disabled.
         Example: "com.android.augmentedautofill/.AugmentedAutofillService"
    -->
    <string name="config_defaultAugmentedAutofillService" translatable="false"></string>

    <!-- The package name for the system's translation service.
     This service must be trusted, as it can be activated without explicit consent of the user.
     If no service with the specified name exists on the device, translation wil be
     disabled.
     Example: "com.android.translation/.TranslationService"
-->
    <string name="config_defaultTranslationService" translatable="false"></string>

    <!-- The package name for the system's app prediction service.
         This service must be trusted, as it can be activated without explicit consent of the user.
         Example: "com.android.intelligence/.AppPredictionService"
    -->
    <string name="config_defaultAppPredictionService" translatable="false"></string>

    <!-- The package name for the system's content suggestions service.
         Provides suggestions for text and image selection regions in snapshots of apps and should
         be able to classify the type of entities in those selections.

         This service must be trusted, as it can be activated without explicit consent of the user.
         If no service with the specified name exists on the device, content suggestions wil be
         disabled.
         Example: "com.android.contentsuggestions/.ContentSuggestionsService"
    -->
    <string name="config_defaultContentSuggestionsService" translatable="false"></string>

    <!-- The package name for the system's search ui service.
     This service returns search results when provided with an input string.

     This service must be trusted, as it can be activated without explicit consent of the user.
     If no service with the specified name exists on the device, on device search wil be
     disabled.
     Example: "com.android.intelliegence/.SearchUiService"
-->
    <string name="config_defaultSearchUiService" translatable="false"></string>

    <!-- The package name for the system's smartspace service.
     This service returns smartspace results.

     This service must be trusted, as it can be activated without explicit consent of the user.
     If no service with the specified name exists on the device, smartspace will be disabled.
     Example: "com.android.intelligence/.SmartspaceService"
-->
    <string name="config_defaultSmartspaceService" translatable="false"></string>

    <!-- The package name for the system's speech recognition service.
         This service must be trusted, as it can be activated without explicit consent of the user.
         Example: "com.android.speech/.RecognitionService"
    -->
    <string name="config_defaultOnDeviceSpeechRecognitionService" translatable="false"></string>

    <string name="config_defaultMusicRecognitionService" translatable="false"></string>

    <!-- The package name for the default retail demo app.
         This package must be trusted, as it has the permissions to query the usage stats on the
         device.
         Example: "com.google.android.retaildemo"
     -->
    <string name="config_retailDemoPackage" translatable="false"></string>

    <!-- The package signature hash for the default retail demo app.
         This package must be trusted, as it has the permissions to query the usage stats on the
         device.
     -->
    <string name="config_retailDemoPackageSignature" translatable="false"></string>

    <!-- Whether the device uses the default focus highlight when focus state isn't specified. -->
    <bool name="config_useDefaultFocusHighlight">true</bool>

    <!-- Flag indicating that the entire notification header can be clicked to expand the
         notification. If false, then the expand icon has to be clicked in order for the expand
         to occur. The expand button will have increased touch boundaries to accomodate this. -->
    <bool name="config_notificationHeaderClickableForExpand">true</bool>

    <!-- Default data warning level in mb -->
    <integer name="default_data_warning_level_mb">2048</integer>

    <!-- When true, indicates that the vendor's IMS implementation requires a workaround when
     sending a request to enable or disable the camera while the video session is also
     paused. -->
    <bool name="config_useVideoPauseWorkaround">false</bool>

    <!-- Whether to send a custom package name with the PSD.-->
    <bool name="config_sendPackageName">false</bool>

    <!-- Name for the set of keys associating package names -->
    <string name="config_helpPackageNameKey" translatable="false"></string>

    <!-- Name for the set of values of package names -->
    <string name="config_helpPackageNameValue" translatable="false"></string>

    <!-- Intent key for the package name keys -->
    <string name="config_helpIntentExtraKey" translatable="false"></string>

    <!-- Intent key for package name values -->
    <string name="config_helpIntentNameKey" translatable="false"></string>

    <!-- Intent key for the package name keys -->
    <string name="config_feedbackIntentExtraKey" translatable="false"></string>

    <!-- Intent key for package name values -->
    <string name="config_feedbackIntentNameKey" translatable="false"></string>

    <!-- The apps that need to be hidden when they are disabled -->
    <string-array name="config_hideWhenDisabled_packageNames"></string-array>

    <!-- Additional non-platform defined global settings exposed to Instant Apps -->
    <string-array name="config_allowedGlobalInstantAppSettings"></string-array>

    <!-- Additional non-platform defined system settings exposed to Instant Apps -->
    <string-array name="config_allowedSystemInstantAppSettings"></string-array>

    <!-- Additional non-platform defined secure settings exposed to Instant Apps -->
    <string-array name="config_allowedSecureInstantAppSettings"></string-array>

    <!-- Handle volume keys directly in Window Manager without passing them to the foreground app -->
    <bool name="config_handleVolumeKeysInWindowManager">true</bool>

    <!-- Rely or not on hardcoded aliased streams table within AudioService -->
    <bool name="config_handleVolumeAliasesUsingVolumeGroups">true</bool>

    <!-- Volume level of in-call notification tone playback [0..1] -->
    <item name="config_inCallNotificationVolume" format="float" type="dimen">.10</item>

    <!-- URI for in call notification sound -->
    <string translatable="false" name="config_inCallNotificationSound">/product/media/audio/ui/InCallNotification.ogg</string>

    <!-- URI for default ringtone sound file to be used for silent ringer vibration -->
    <string translatable="false" name="config_defaultRingtoneVibrationSound"></string>

    <!-- Default number of notifications from the same app before they are automatically grouped by the OS -->
    <integer translatable="false" name="config_autoGroupAtCount">4</integer>

    <!-- The OEM specified sensor type for the lift trigger to launch the camera app. -->
    <integer name="config_cameraLiftTriggerSensorType">-1</integer>
    <!-- The OEM specified sensor string type for the gesture to launch camera app, this value
        must match the value of config_cameraLiftTriggerSensorType in OEM's HAL -->
    <string translatable="false" name="config_cameraLiftTriggerSensorStringType"></string>

    <!-- Default number of days to retain for the automatic storage manager. -->
    <integer translatable="false" name="config_storageManagerDaystoRetainDefault">90</integer>

    <!-- Name of a font family to use for headlines. If empty, falls back to platform default -->
    <string name="config_headlineFontFamily" translatable="false"></string>
    <!-- Allows setting custom fontFeatureSettings on specific text. -->
    <string name="config_headlineFontFeatureSettings" translatable="false"></string>

    <!-- An array of packages that need to be treated as type system in battery settings -->
    <string-array translatable="false" name="config_batteryPackageTypeSystem">
        <item>com.android.providers.calendar</item>
        <item>com.android.providers.media</item>
        <item>com.android.systemui</item>
    </string-array>

    <!-- An array of packages that need to be treated as type service in battery settings -->
    <string-array translatable="false" name="config_batteryPackageTypeService"/>

    <!-- Flag indicating whether or not to enable night mode detection. -->
    <bool name="config_enableNightMode">true</bool>

    <!-- Flag indicating that the actions buttons for a notification should be tinted with by the
         color supplied by the Notification.Builder if present. -->
    <bool name="config_tintNotificationActionButtons">true</bool>

    <!-- Show area update info settings in CellBroadcastReceiver and information in SIM status in Settings app -->
    <bool name="config_showAreaUpdateInfoSettings">true</bool>

    <!-- Enable the RingtonePickerActivity in 'com.android.providers.media'. -->
    <bool name="config_defaultRingtonePickerEnabled">true</bool>

    <!-- Allow SystemUI to show the shutdown dialog -->
    <bool name="config_showSysuiShutdown">true</bool>

    <!-- The stable device width and height in pixels. If these aren't set to a positive number
         then the device will use the width and height of the default display the first time it's
         booted.  -->
    <integer name="config_stableDeviceDisplayWidth">-1</integer>
    <integer name="config_stableDeviceDisplayHeight">-1</integer>

    <!-- List of countries in which we display 'No service' on status bar
         instead of 'Emergency calls only' when SIM is unready. -->
    <string-array translatable="false" name="config_display_no_service_when_sim_unready">
        <item>"DE"</item>
        <item>"GB"</item>
        <item>"JP"</item>
    </string-array>

    <!-- Class names of device specific services inheriting com.android.server.SystemService. The
         classes are instantiated in the order of the array. -->
    <string-array translatable="false" name="config_deviceSpecificSystemServices"></string-array>

    <!-- Class name of the device specific implementation to replace the DevicePolicyManagerService
         or empty if the default should be used. -->
    <string translatable="false" name="config_deviceSpecificDevicePolicyManagerService"></string>

    <!-- Class name of the device specific implementation to replace the AudioService
         or empty if the default should be used. -->
    <string translatable="false" name="config_deviceSpecificAudioService"></string>

    <!-- Class name of the device specific implementation of DisplayAreaPolicy.Provider
         or empty if the default should be used. -->
    <string translatable="false" name="config_deviceSpecificDisplayAreaPolicyProvider"></string>

    <!-- Component name of media projection permission dialog -->
    <string name="config_mediaProjectionPermissionDialogComponent" translatable="false">com.android.systemui/com.android.systemui.media.MediaProjectionPermissionActivity</string>

    <!-- Corner radius of system dialogs -->
    <dimen name="config_dialogCornerRadius">2dp</dimen>
    <!-- Corner radius of system buttons -->
    <dimen name="config_buttonCornerRadius">@dimen/control_corner_material</dimen>
    <!-- Corner radius for bottom sheet system dialogs -->
    <dimen name="config_bottomDialogCornerRadius">@dimen/config_dialogCornerRadius</dimen>
    <!-- Corner radius of system progress bars -->
    <dimen name="config_progressBarCornerRadius">@dimen/progress_bar_corner_material</dimen>
    <!-- Controls whether system buttons use all caps for text -->
    <bool name="config_buttonTextAllCaps">true</bool>
    <!-- Name of the font family used for system surfaces where the font should use medium weight -->
    <string name="config_headlineFontFamilyMedium" translateable="false">@string/font_family_button_material</string>
    <!-- Name of a font family to use for body text. -->
    <string name="config_bodyFontFamily" translatable="false">sans-serif</string>
    <!-- Name of a font family to use for medium body text. -->
    <string name="config_bodyFontFamilyMedium" translatable="false">sans-serif-medium</string>

    <!-- Size of icon shown beside a preference locked by admin -->
    <dimen name="config_restrictedIconSize">@dimen/restricted_icon_size_material</dimen>

    <string translatable="false" name="config_batterySaverDeviceSpecificConfig"></string>

    <!-- Component name that should be granted Notification Assistant access -->
    <string name="config_defaultAssistantAccessComponent" translatable="false">android.ext.services/android.ext.services.notification.Assistant</string>

    <bool name="config_supportBluetoothPersistedState">true</bool>

    <bool name="config_keepRestrictedProfilesInBackground">true</bool>

    <!-- Cellular network service package name to bind to by default. -->
    <string name="config_wwan_network_service_package" translatable="false">com.android.phone</string>

    <!-- Cellular network service class name to bind to by default.-->
    <string name="config_wwan_network_service_class" translatable="false"></string>

    <!-- IWLAN network service package name to bind to by default. If none is specified in an overlay, an
         empty string is passed in -->
    <string name="config_wlan_network_service_package" translatable="false"></string>

    <!-- IWLAN network service class name to bind to by default. If none is specified in an overlay, an
         empty string is passed in -->
    <string name="config_wlan_network_service_class" translatable="false"></string>
    <!-- Telephony qualified networks service package name to bind to by default. -->
    <string name="config_qualified_networks_service_package" translatable="false"></string>

    <!-- Telephony qualified networks service class name to bind to by default. -->
    <string name="config_qualified_networks_service_class" translatable="false"></string>
    <!-- Wear devices: Controls the radios affected by Activity Mode. -->
    <string-array name="config_wearActivityModeRadios">
        <item>"wifi"</item>
    </string-array>

    <!-- Default hyphenation frequency setting (0=NONE, 1=NORMAL, 2=FULL). -->
    <item name="config_preferredHyphenationFrequency" format="integer" type="dimen">0</item>

    <!-- Package name for ManagedProvisioning which is responsible for provisioning work profiles. -->
    <string name="config_managed_provisioning_package" translatable="false">com.android.managedprovisioning</string>

    <!-- Whether or not swipe up gesture's opt-in setting is available on this device -->
    <bool name="config_swipe_up_gesture_setting_available">true</bool>

    <!-- Applications which are disabled unless matching a particular sku -->
    <string-array name="config_disableApksUnlessMatchedSku_apk_list" translatable="false" />
    <string-array name="config_disableApkUnlessMatchedSku_skus_list" translatable="false" />

    <!-- Whether or not we should show the option to show battery percentage -->
    <bool name="config_battery_percentage_setting_available">true</bool>

    <!-- Whether or not battery saver should be "sticky" when manually enabled. -->
    <bool name="config_batterySaverStickyBehaviourDisabled">false</bool>

    <!-- Config flag to track default disable threshold for Dynamic power savings enabled battery saver. -->
    <integer name="config_dynamicPowerSavingsDefaultDisableThreshold">80</integer>

    <!-- Model of potentially misprovisioned devices. If none is specified in an overlay, an
         empty string is passed in. -->
    <string name="config_misprovisionedDeviceModel" translatable="false"></string>

    <!-- Brand value for attestation of misprovisioned device. -->
    <string name="config_misprovisionedBrandValue" translatable="false"></string>

    <!-- Pre-scale volume at volume step 1 for Absolute Volume -->
    <fraction name="config_prescaleAbsoluteVolume_index1">60%</fraction>

    <!-- Pre-scale volume at volume step 2 for Absolute Volume -->
    <fraction name="config_prescaleAbsoluteVolume_index2">80%</fraction>

    <!-- Pre-scale volume at volume step 3 for Absolute Volume -->
    <fraction name="config_prescaleAbsoluteVolume_index3">90%</fraction>

    <!-- Whether or not the "SMS app service" feature is enabled -->
    <bool name="config_useSmsAppService">true</bool>

    <!-- Class name for the InputEvent compatibility processor override.
         Empty string means use the default compatibility processor
         (android.view.InputEventCompatProcessor). -->
    <string name="config_inputEventCompatProcessorOverrideClassName" translatable="false"></string>

    <!-- Component name for the default module metadata provider on this device -->
    <string name="config_defaultModuleMetadataProvider" translatable="false">com.android.modulemetadata</string>

    <!-- This is the default launcher package with an activity to use on secondary displays that
         support system decorations.
         This launcher package must have an activity that supports multiple instances and has
         corresponding launch mode set in AndroidManifest.
         {@see android.view.Display#FLAG_SHOULD_SHOW_SYSTEM_DECORATIONS} -->
    <string name="config_secondaryHomePackage" translatable="false">com.android.launcher3</string>

    <!-- Force secondary home launcher specified in config_secondaryHomePackage always. If this is
         not set, secondary home launcher can be replaced by user. -->
    <bool name ="config_useSystemProvidedLauncherForSecondary">false</bool>

    <!-- If device supports corner radius on windows.
         This should be turned off on low-end devices to improve animation performance. -->
    <bool name="config_supportsRoundedCornersOnWindows">true</bool>

    <!-- If the sensor that skips media is available or not. -->
    <bool name="config_skipSensorAvailable">true</bool>

    <!-- If the sensor that silences alerts is available or not. -->
    <bool name="config_silenceSensorAvailable">true</bool>

    <!-- Enable Zram writeback feature to allow unused pages in zram be written to flash. -->
    <bool name="config_zramWriteback">true</bool>

    <!-- Whether cbrs is supported on the device or not -->
    <bool translatable="false" name="config_cbrs_supported">true</bool>

    <!-- Whether or not aware is enabled by default -->
    <bool name="config_awareSettingAvailable">true</bool>

    <!-- Display White-Balance -->

    <!-- See AmbientSensor.AmbientBrightnessSensor.
         The ambient brightness sensor rate (in milliseconds). Must be positive. -->
    <integer name="config_displayWhiteBalanceBrightnessSensorRate">250</integer>

    <!-- See AmbientFilter.
         How long ambient brightness changes are kept and taken into consideration
         (in milliseconds). Must be positive. -->
    <integer name="config_displayWhiteBalanceBrightnessFilterHorizon">10000</integer>

    <!-- See AmbientFilter.WeightedMovingAverageAmbientFilter.
         Recent changes are prioritised by integrating their duration over y = x + intercept
         (the higher it is, the less prioritised recent changes are). Must be a non-negative
         number, or NaN to avoid this implementation. -->
    <item name="config_displayWhiteBalanceBrightnessFilterIntercept" format="float" type="dimen">10.0</item>

    <!-- See AmbientSensor.AmbientColorTemperatureSensor.
         The ambient color temperature sensor name. -->
    <string name="config_displayWhiteBalanceColorTemperatureSensorName">com.google.sensor.color</string>

    <!-- See AmbientSensor.AmbientColorTemperatureSensor.
         The ambient color temperature sensor rate (in milliseconds). Must be positive. -->
    <integer name="config_displayWhiteBalanceColorTemperatureSensorRate">250</integer>

    <!-- See AmbientFilter.
         How long ambient color temperature changes are kept and taken into consideration
         (in milliseconds). Must be positive. -->
    <integer name="config_displayWhiteBalanceColorTemperatureFilterHorizon">10000</integer>

    <!-- See AmbientFilter.WeightedMovingAverageAmbientFilter.
         Recent changes are prioritised by integrating their duration over y = x + intercept
         (the higher it is, the less prioritised recent changes are). Must be a non-negative
         number, or NaN to avoid this implementation. -->
    <item name="config_displayWhiteBalanceColorTemperatureFilterIntercept" format="float"
            type="dimen">10.0</item>

    <!-- See DisplayWhiteBalanceThrottler.
         The debounce time (in milliseconds) for increasing the screen color temperature, throttled
         if time > lastTime + debounce. Must be non-negative. -->
    <integer name="config_displayWhiteBalanceIncreaseDebounce">5000</integer>

    <!-- See DisplayWhiteBalanceThrottler.
         The debounce time (in milliseconds) for decreasing the screen color tempearture, throttled
         if time < lastTime - debounce. Must be non-negative. -->
    <integer name="config_displayWhiteBalanceDecreaseDebounce">5000</integer>

    <!-- See DisplayWhiteBalanceThrottler.
         The ambient color temperature values used to determine the threshold as the corresponding
         value in config_displayWhiteBalance{Increase,Decrease}Threholds. Must be non-empty, the
         same length as config_displayWhiteBalance{Increase,Decrease}Thresholds, and contain
         non-negative, strictly increasing numbers.

         For example, if:

         - baseThresolds = [0, 100, 1000];
         - increaseThresholds = [0.1, 0.15, 0.2];
         - decreaseThresholds = [0.1, 0.05, 0.0];

         Then, given the ambient color temperature INCREASED from X to Y (so X < Y):
         - If 0 <= Y < 100, we require Y > (1 + 0.1) * X = 1.1X;
         - If 100 <= Y < 1000, we require Y > (1 + 0.15) * X = 1.15X;
         - If 1000 <= Y, we require Y > (1 + 0.2) * X = 1.2X.

         Or, if the ambient color temperature DECREASED from X to Y (so X > Y):
         - If 0 <= Y < 100, we require Y < (1 - 0.1) * X = 0.9X;
         - If 100 <= Y < 1000, we require Y < (1 - 0.05) * X = 0.95X;
         - If 1000 <= Y, we require Y < (1 - 0) * X = X.

         NOTE: the numbers in this example are made up, and don't represent how actual base,
               increase or decrease thresholds would look like. -->
    <array name="config_displayWhiteBalanceBaseThresholds">
        <item>0.0</item>
    </array>

    <!-- See DisplayWhiteBalanceThrottler.
         The increase threshold values, throttled if value < value * (1 + threshold). Must be
         non-empty, the same length as config_displayWhiteBalanceBaseThresholds, and contain
         non-negative numbers. -->
    <array name="config_displayWhiteBalanceIncreaseThresholds">
        <item>0.1</item>
    </array>

    <!-- See DisplayWhiteBalanceThrottler.
         The decrease threshold values, throttled if value > value * (1 - threshold). Must be
         non-empty, the same length as config_displayWhiteBalanceBaseThresholds, and contain
         non-negative numbers. -->
    <array name="config_displayWhiteBalanceDecreaseThresholds">
        <item>0.1</item>
    </array>

    <!-- See DisplayWhiteBalanceController.
         A float array containing a list of ambient brightnesses, in Lux. This array,
         together with config_displayWhiteBalanceLowLightAmbientBiases, is used to generate a
         lookup table used in DisplayWhiteBalanceController. This lookup table is used to map
         ambient brightness readings to a bias, where the bias is used to linearly interpolate
         between ambient color temperature and
         config_displayWhiteBalanceLowLightAmbientColorTemperature.
         This table is optional. If used, this array must,
         1) Contain at least two entries
         2) Be the same length as config_displayWhiteBalanceLowLightAmbientBiases. -->
    <array name ="config_displayWhiteBalanceLowLightAmbientBrightnesses">
        <item>10.0</item>
        <item>10.0</item>
    </array>

    <!-- See DisplayWhiteBalanceController.
         An array containing a list of biases. See
         config_displayWhiteBalanceLowLightAmbientBrightnesses for additional details.
         This array must be in the range of [0.0, 1.0]. -->
    <array name ="config_displayWhiteBalanceLowLightAmbientBiases">
        <item>0.0</item>
        <item>1.0</item>
    </array>

    <!-- See DisplayWhiteBalanceController.
         The ambient color temperature (in cct) to which we interpolate towards using the
         the look up table generated by config_displayWhiteBalanceLowLightAmbientBrightnesses
         and config_displayWhiteBalanceLowLightAmbientBiases. -->
    <item name="config_displayWhiteBalanceLowLightAmbientColorTemperature" format="float" type="dimen">6500.0</item>

    <!-- See DisplayWhiteBalanceController.
         A float array containing a list of ambient brightnesses, in Lux. This array,
         together with config_displayWhiteBalanceHighLightAmbientBiases, is used to generate a
         lookup table used in DisplayWhiteBalanceController. This lookup table is used to map
         ambient brightness readings to a bias, where the bias is used to linearly interpolate
         between ambient color temperature and
         config_displayWhiteBalanceHighLightAmbientColorTemperature.
         This table is optional. If used, this array must,
         1) Contain at least two entries
         2) Be the same length as config_displayWhiteBalanceHighLightAmbientBiases. -->
    <array name ="config_displayWhiteBalanceHighLightAmbientBrightnesses">
    </array>

    <!-- See DisplayWhiteBalanceController.
         An array containing a list of biases. See
         config_displayWhiteBalanceHighLightAmbientBrightnesses for additional details.
         This array must be in the range of [0.0, 1.0]. -->
    <array name ="config_displayWhiteBalanceHighLightAmbientBiases">
    </array>

    <!-- See DisplayWhiteBalanceController.
         The ambient color temperature (in cct) to which we interpolate towards using the
         the look up table generated by config_displayWhiteBalanceHighLightAmbientBrightnesses
         and config_displayWhiteBalanceHighLightAmbientBiases. -->
    <item name="config_displayWhiteBalanceHighLightAmbientColorTemperature" format="float" type="dimen">8000.0</item>

    <!-- See DisplayWhiteBalanceController.
         A float array containing a list of ambient color temperatures, in Kelvin. This array,
         together with config_displayWhiteBalanceDisplayColorTemperatures, is used to generate a
         lookup table used in DisplayWhiteBalanceController. This lookup table is used to map
         ambient color temperature readings to a target color temperature for the display.
         This table is optional. If used, this array must,
         1) Contain at least two entries
         2) Be the same length as config_displayWhiteBalanceDisplayColorTemperatures. -->
    <array name="config_displayWhiteBalanceAmbientColorTemperatures">
    </array>

    <!-- See DisplayWhiteBalanceController.
         An array containing a list of display color temperatures, in Kelvin. See
         config_displayWhiteBalanceAmbientColorTemperatures for additional details.
         The same restrictions apply to this array. -->
    <array name="config_displayWhiteBalanceDisplayColorTemperatures">
    </array>

    <!-- All of the paths defined for the batterymeter are defined on a 12x20 canvas, and must
     be parsable by android.utill.PathParser -->
    <string name="config_batterymeterPerimeterPath" translatable="false">
                M3.5,2 v0 H1.33 C0.6,2 0,2.6 0,3.33 V13v5.67 C0,19.4 0.6,20 1.33,20 h9.33 C11.4,20 12,19.4 12,18.67 V13V3.33 C12,2.6 11.4,2 10.67,2 H8.5 V0 H3.5 z M2,18v-7V4h8v9v5H2L2,18z
    </string>
    <string name="config_batterymeterErrorPerimeterPath" translatable="false">@string/config_batterymeterPerimeterPath</string>
    <string name="config_batterymeterFillMask" translatable="false">
        M2,18 v-14 h8 v14 z
    </string>
    <string name="config_batterymeterBoltPath" translatable="false">
        M5,17.5 V12 H3 L7,4.5 V10 h2 L5,17.5 z
    </string>
    <string name="config_batterymeterPowersavePath" translatable="false">
        M9,10l-2,0l0,-2l-2,0l0,2l-2,0l0,2l2,0l0,2l2,0l0,-2l2,0z
    </string>

    <!-- Attribution path for SignalDrawable as defined on a 24x24 canvas. -->
    <string name="config_signalAttributionPath" translatable="false">
        M20,10h2v8h-2z M20,20h2v2h-2z
    </string>
    <!-- config_signalCutout{Height,Width}Fraction define fraction of the 24x24 canvas that
         should be cut out to display config_signalAttributionPath. -->
    <item name="config_signalCutoutWidthFraction" format="float" type="dimen">7</item>
    <item name="config_signalCutoutHeightFraction" format="float" type="dimen">17</item>

    <!-- A dual tone battery meter draws the perimeter path twice - once to define the shape
     and a second time clipped to the fill level to indicate charge -->
    <bool name="config_batterymeterDualTone">true</bool>

    <!-- The default refresh rate for a given device. Change this value to set a higher default
         refresh rate. If the hardware composer on the device supports display modes with a higher
         refresh rate than the default value specified here, the framework may use those higher
         refresh rate modes if an app chooses one by setting preferredDisplayModeId or calling
         setFrameRate().
         If a non-zero value is set for config_defaultPeakRefreshRate, then
         config_defaultRefreshRate may be set to 0, in which case the value set for
         config_defaultPeakRefreshRate will act as the default frame rate. -->
    <integer name="config_defaultRefreshRate">60</integer>

    <!-- The default peak refresh rate for a given device. Change this value if you want to prevent
         the framework from using higher refresh rates, even if display modes with higher refresh
         rates are available from hardware composer. Only has an effect if the value is
         non-zero. -->
    <integer name="config_defaultPeakRefreshRate">0</integer>

    <!-- The display uses different gamma curves for different refresh rates. It's hard for panel
         vendor to tune the curves to have exact same brightness for different refresh rate. So
         flicker could be observed at switch time. The issue is worse at the gamma lower end.
         In addition, human eyes are more sensitive to the flicker at darker environment.
         To prevent flicker, we only support higher refresh rates if the display brightness is above
         a threshold. And the darker environment could have higher threshold.
         For example, no higher refresh rate if
             display brightness <= disp0 && ambient brightness <= amb0
             || display brightness <= disp1 && ambient brightness <= amb1 -->
    <integer-array translatable="false" name="config_brightnessThresholdsOfPeakRefreshRate">
         <!--
           <item>disp0</item>
           <item>disp1</item>
        -->
    </integer-array>
    <integer-array translatable="false" name="config_ambientThresholdsOfPeakRefreshRate">
         <!--
           <item>amb0</item>
           <item>amb1</item>
        -->
    </integer-array>

    <!-- Default refresh rate in the zone defined by brightness and ambient thresholds.
         If non-positive, then the refresh rate is unchanged even if thresholds are configured. -->
    <integer name="config_defaultRefreshRateInZone">0</integer>

    <!-- The display uses different gamma curves for different refresh rates. It's hard for panel
         vendor to tune the curves to have exact same brightness for different refresh rate. So
         flicker could be observed at switch time. The issue can be observed on the screen with
         even full white content at the high brightness. To prevent flickering, we support fixed
         refresh rates if the display and ambient brightness are equal to or above the provided
         thresholds. You can define multiple threshold levels as higher brightness environments
         may have lower display brightness requirements for the flickering is visible. And the
         high brightness environment could have higher threshold.
         For example, fixed refresh rate if
             display brightness >= disp0 && ambient brightness >= amb0
             || display brightness >= disp1 && ambient brightness >= amb1 -->
    <integer-array translatable="false" name="config_highDisplayBrightnessThresholdsOfFixedRefreshRate">
         <!--
           <item>disp0</item>
           <item>disp1</item>
        -->
    </integer-array>

    <integer-array translatable="false" name="config_highAmbientBrightnessThresholdsOfFixedRefreshRate">
         <!--
           <item>amb0</item>
           <item>amb1</item>
        -->
    </integer-array>

    <!-- Default refresh rate in the high zone defined by brightness and ambient thresholds.
         If non-positive, then the refresh rate is unchanged even if thresholds are configured. -->
    <integer name="config_fixedRefreshRateInHighZone">0</integer>

    <!-- Default refresh rate while the device has high brightness mode enabled for Sunlight.
         This value overrides values from DisplayDeviceConfig -->
    <integer name="config_defaultRefreshRateInHbmSunlight">0</integer>

    <!-- Default refresh rate while the device has high brightness mode enabled for HDR. -->
    <integer name="config_defaultRefreshRateInHbmHdr">0</integer>

    <!-- The type of the light sensor to be used by the display framework for things like
         auto-brightness. If unset, then it just gets the default sensor of type TYPE_LIGHT. -->
    <string name="config_displayLightSensorType" translatable="false" />

    <!-- Whether or not to enable automatic heap dumps for the system server on debuggable builds. -->
    <bool name="config_debugEnableAutomaticSystemServerHeapDumps">false</bool>

    <!-- Trigger a heap dump if the system server pss usage exceeds this threshold. 400 MB -->
    <integer name="config_debugSystemServerPssThresholdBytes">419430400</integer>

    <!-- See DropBoxManagerService.
         The minimum period in milliseconds between broadcasts for entries with low priority
         dropbox tags. -->
    <integer name="config_dropboxLowPriorityBroadcastRateLimitPeriod">2000</integer>

    <!-- See DropBoxManagerService.
         An array of dropbox entry tags to marked as low priority. Low priority broadcasts will be
         rated limited to a period defined by config_dropboxLowPriorityBroadcastRateLimitPeriod
         (high frequency broadcasts for the tag will be dropped) -->
    <string-array name="config_dropboxLowPriorityTags" translatable="false">
        <item>data_app_strictmode</item>
        <item>data_app_wtf</item>
        <item>keymaster</item>
        <item>netstats</item>
        <item>system_app_strictmode</item>
        <item>system_app_wtf</item>
        <item>system_server_strictmode</item>
        <item>system_server_wtf</item>
    </string-array>

    <!-- Which binder services to include in incident reports containing restricted images. -->
    <string-array name="config_restrictedImagesServices" translatable="false"/>

    <string name="config_biometric_prompt_ui_package">com.android.systemui</string>
    <!-- List of biometric sensors on the device, in decreasing strength. Consumed by AuthService
         when registering authenticators with BiometricService. Format must be ID:Modality:Strength,
         where: IDs are unique per device, Modality as defined in BiometricAuthenticator.java,
         and Strength as defined in Authenticators.java -->
    <string-array name="config_biometric_sensors" translatable="false" >
        <!-- <item>0:2:15</item>  ID0:Fingerprint:Strong -->
    </string-array>
    <!--If true, allows the device to load udfps components on older HIDL implementations -->
    <bool name="allow_test_udfps" translatable="false" >false</bool>

    <!-- The properties of a UDFPS sensor in pixels, in the order listed below: -->
    <integer-array name="config_udfps_sensor_props" translatable="false" >
      <!--
        <item>sensorLocationX</item>
        <item>sensorLocationY</item>
        <item>sensorRadius</item>
      -->
    </integer-array>

    <!-- An array of arrays of side fingerprint sensor properties relative to each display.
         Note: this value is temporary and is expected to be queried directly
         from the HAL in the future. -->
    <array name="config_sfps_sensor_props" translatable="false">
        <!--
            <array>
                <item>displayId</item>
                <item>sensorLocationX</item>
                <item>sensorLocationY</item>
                <item>sensorRadius</item>
            <array>
        -->
    </array>

    <!-- How long it takes for the HW to start illuminating after the illumination is requested. -->
    <integer name="config_udfps_illumination_transition_ms">50</integer>

    <!-- Indicates whether device has a power button fingerprint sensor. -->
    <bool name="config_is_powerbutton_fps" translatable="false" >false</bool>

    <!-- When each intermediate UDFPS enroll stage ends, as a fraction of total progress. -->
    <string-array name="config_udfps_enroll_stage_thresholds" translatable="false">
        <item>0.25</item>
        <item>0.5</item>
        <item>0.75</item>
    </string-array>

    <!-- Messages that should not be shown to the user during face auth enrollment. This should be
         used to hide messages that may be too chatty or messages that the user can't do much about.
         Entries are defined in android.hardware.biometrics.face@1.0 types.hal -->
    <integer-array name="config_face_acquire_enroll_ignorelist" translatable="false" >
    </integer-array>
    <!-- Same as the above, but are defined by vendorCodes -->
    <integer-array name="config_face_acquire_vendor_enroll_ignorelist" translatable="false" >
    </integer-array>

    <!-- Messages that should not be shown to the user during face authentication, on keyguard.
         This includes both lockscreen and bouncer. This should be used to hide messages that may be
         too chatty or messages that the user can't do much about. Entries are defined in
         android.hardware.biometrics.face@1.0 types.hal -->
    <integer-array name="config_face_acquire_keyguard_ignorelist" translatable="false" >
    </integer-array>
    <!-- Same as the above, but are defined by vendorCodes -->
    <integer-array name="config_face_acquire_vendor_keyguard_ignorelist" translatable="false" >
    </integer-array>

    <!-- Messages that should not be shown to the user during face authentication, on
         BiometricPrompt. This should be used to hide messages that may be too chatty or messages
         that the user can't do much about. Entries are defined in
         android.hardware.biometrics.face@1.0 types.hal -->
    <integer-array name="config_face_acquire_biometricprompt_ignorelist" translatable="false" >
    </integer-array>
    <!-- Same as the above, but are defined by vendorCodes -->
    <integer-array name="config_face_acquire_vendor_biometricprompt_ignorelist" translatable="false" >
    </integer-array>

    <!-- True if the sensor is able to provide self illumination in dark secnarios, without  support
         from above the HAL. This configuration is only applicable to IBiometricsFace@1.0 and its
         minor revisions. -->
    <bool name="config_faceAuthSupportsSelfIllumination">true</bool>

    <!-- If face auth sends the user directly to home/last open app, or stays on keyguard -->
    <bool name="config_faceAuthDismissesKeyguard">true</bool>

    <!-- The component name for the default profile supervisor, which can be set as a profile owner
    even after user setup is complete. The defined component should be used for supervision purposes
    only. The component must be part of a system app. -->
    <string name="config_defaultSupervisionProfileOwnerComponent" translatable="false"></string>

    <!-- Trigger a warning for notifications with RemoteView objects that are larger in bytes than
    this value (default 1MB)-->
    <integer name="config_notificationWarnRemoteViewSizeBytes">2000000</integer>

    <!-- Strip notification RemoteView objects that are larger in bytes than this value (also log)
    (default 2MB) -->
    <integer name="config_notificationStripRemoteViewSizeBytes">5000000</integer>

    <!-- List of packages that can use the Conversation space for their category messages
    notifications until they target R -->
    <string-array name="config_notificationMsgPkgsAllowedAsConvos" translatable="false"/>

    <!-- Sharesheet: define a max number of targets per application for new shortcuts-based direct share introduced in Q -->
    <integer name="config_maxShortcutTargetsPerApp">3</integer>

    <!-- The package name for the vendor implementation of ACTION_FACTORY_RESET. For some vendors,
    the default implementation of ACTION_FACTORY_RESET does not work, so it is needed to re-route
    this intent to this package. This is being used in MasterClearReceiver.java. -->
    <string name="config_factoryResetPackage" translatable="false"></string>

    <!-- The list of packages to automatically opt out of refresh rates higher than 60hz because
         of known compatibility issues. -->
    <string-array name="config_highRefreshRateBlacklist"></string-array>

    <!-- Whether or not to hide the navigation bar when the soft keyboard is visible in order to
         create additional screen real estate outside beyond the keyboard. Note that the user needs
         to have a confirmed way to dismiss the keyboard when desired. -->
    <bool name="config_automotiveHideNavBarForKeyboard">false</bool>

    <!-- Whether or not to show the built-in charging animation when the device begins charging
         wirelessly. -->
    <bool name="config_showBuiltinWirelessChargingAnim">true</bool>

    <!-- A list of potential packages, in priority order, that can supply rules to
         AppIntegrityManager. These need to be apps on the system partition. -->
    <string-array name="config_integrityRuleProviderPackages" translatable="false">
        <!-- Add packages here -->
    </string-array>

    <!-- Whether or not wcg (wide color gamut) should be enabled on this device,
         we only enabled it while the device has ability of mixed color spaces composition -->
    <bool name="config_enableWcgMode">true</bool>

    <!-- When true, enables the allowlisted app to handle bug reports from power menu short press. -->
    <bool name="config_bugReportHandlerEnabled">true</bool>

    <!-- The package name for the default bug report handler app from power menu short press. This app must be allowlisted. -->
    <string name="config_defaultBugReportHandlerApp" translatable="false"></string>

    <!-- When true, enables the allowlisted app to upload profcollect reports. -->
    <bool name="config_profcollectReportUploaderEnabled">true</bool>

    <!-- The package name for the default profcollect report uploader app. This app must be allowlisted. -->
    <string name="config_defaultProfcollectReportUploaderApp" translatable="false"></string>

    <!-- The action name for the default profcollect report uploader app. -->
    <string name="config_defaultProfcollectReportUploaderAction" translatable="false"></string>

    <!-- The default value used for RawContacts.ACCOUNT_NAME when contacts are inserted without this
         column set. These contacts are stored locally on the device and will not be removed even
         if no android.account.Account with this name exists. A null string will be used if the
         value is left empty. When this is non-empty then config_rawContactsLocalAccountType
         should also be non-empty.  -->
    <string name="config_rawContactsLocalAccountName" translatable="false"></string>

    <!-- The default value used for RawContacts.ACCOUNT_TYPE when contacts are inserted without this
         column set. These contacts are stored locally on the device and will not be removed even
         if no android.account.Account with this type exists. A null string will be used if the
         value is left empty.  When this is non-empty then config_rawContactsLocalAccountName
         should also be non-empty.-->
    <string name="config_rawContactsLocalAccountType" translatable="false"></string>

    <!-- Whether or not to use assistant stream volume separately from music volume -->
    <bool name="config_useAssistantVolume">true</bool>

    <!-- Whether to use a custom Bugreport handling. When true, ACTION_CUSTOM_BUGREPORT_REQUESTED
         intent is broadcasted on bugreporting chord (instead of the default full bugreport
         generation). -->
    <bool name="config_customBugreport">false</bool>

    <!-- Names of packages that should not be suspended when personal use is blocked by policy. -->
    <string-array name="config_packagesExemptFromSuspension" translatable="false">
        <!-- Add packages here, example: -->
        <!-- <item>com.android.settings</item> -->
    </string-array>


    <!-- Class name of the custom country detector to be used. -->
    <string name="config_customCountryDetector" translatable="false">com.android.server.location.ComprehensiveCountryDetector</string>

    <!-- Package name of the required service extension package. -->
    <string name="config_servicesExtensionPackage" translatable="false">android.ext.services</string>

    <!-- Retention policy: number of records to kept for the historical exit info per package. -->
    <integer name="config_app_exit_info_history_list_size">16</integer>

    <!-- Packages that can't be killed even if it's requested to be killed on imperceptible -->
    <string-array name="config_defaultImperceptibleKillingExemptionPkgs" translatable="false" />

    <!-- Proc States that can't be killed even if it's requested to be killed on imperceptible -->
    <integer-array name="config_defaultImperceptibleKillingExemptionProcStates">
      <item>0</item> <!-- PROCESS_STATE_PERSISTENT -->
      <item>1</item> <!-- PROCESS_STATE_PERSISTENT_UI -->
      <item>2</item> <!-- PROCESS_STATE_TOP -->
      <item>4</item> <!-- PROCESS_STATE_FOREGROUND_SERVICE -->
      <item>12</item> <!-- PROCESS_STATE_TOP_SLEEPING -->
    </integer-array>

    <!-- Component name that accepts ACTION_SEND intents for nearby (proximity-based) sharing.
         Used by ChooserActivity. -->
    <string translatable="false" name="config_defaultNearbySharingComponent"></string>

    <!-- Boolean indicating whether frameworks needs to reset cell broadcast geo-fencing
         check after reboot or airplane mode toggling -->
    <bool translatable="false" name="reset_geo_fencing_check_after_boot_or_apm">true</bool>

    <!-- Boolean indicating whether all CB messages should be disabled on this device. This config
         is intended to be used by OEMs who need to disable CB messages for regulatory requirements,
         (e.g. the device is a tablet in a country where tablets should not receive CB messages) -->
    <bool translatable="false" name="config_disable_all_cb_messages">false</bool>

    <!-- Screen Wake Keys
         Determines whether the specified key groups can be used to wake up the device. -->
    <bool name="config_wakeOnDpadKeyPress">true</bool>
    <bool name="config_wakeOnAssistKeyPress">true</bool>
    <bool name="config_wakeOnBackKeyPress">true</bool>

    <!-- Whether to default to an expanded list of users on the lock screen user switcher. -->
    <bool name="config_expandLockScreenUserSwitcher">true</bool>

    <!-- Toasts posted from these packages will be shown to the current user, regardless of the user
         the process belongs to. This is useful for packages that run under a single user but serve
         multiple users, e.g. the system.
         These packages MUST be able to add flag SYSTEM_FLAG_SHOW_FOR_ALL_USERS to a window. -->
    <string-array name="config_toastCrossUserPackages" translatable="false">
        <item>android</item>
        <item>com.android.systemui</item>
    </string-array>

    <!-- Component name of custom media key dispatcher class used by MediaSessionService. -->
    <string name="config_customMediaKeyDispatcher"></string>

    <!-- Component name of custom media session policy provider class used by
         MediaSessionService. -->
    <string name="config_customMediaSessionPolicyProvider"></string>

    <!-- The max scale for the wallpaper when it's zoomed in -->
    <item name="config_wallpaperMaxScale" format="float" type="dimen">1.10</item>

    <!-- Package name that will receive an explicit manifest broadcast for
         android.os.action.POWER_SAVE_MODE_CHANGED. -->
    <string name="config_powerSaveModeChangedListenerPackage" translatable="false"></string>

    <!-- Set to true to enable the user switcher on the keyguard. -->
    <bool name="config_keyguardUserSwitcher">true</bool>

    <!-- If true, show multiuser switcher by default unless the user specifically disables it. -->
    <bool name="config_showUserSwitcherByDefault">true</bool>

    <!-- Set to true to make assistant show in front of the dream/screensaver. -->
    <bool name="config_assistantOnTopOfDream">true</bool>

    <!-- pdp data retry for cause 29, 33 and 55 -->
    <bool name="config_pdp_reject_enable_retry">false</bool>
    <!-- pdp data reject retry delay in ms -->
    <integer name="config_pdp_reject_retry_delay_ms">-1</integer>

    <!-- Whether or not to enable the binder heavy hitter watcher by default -->
    <bool name="config_defaultBinderHeavyHitterWatcherEnabled">true</bool>

    <!-- The default batch size for the binder heavy hitter watcher -->
    <integer name="config_defaultBinderHeavyHitterWatcherBatchSize">2000</integer>

    <!-- The default threshold for the binder heavy hitter watcher -->
    <item name="config_defaultBinderHeavyHitterWatcherThreshold" format="float" type="dimen">
        0.333
    </item>

    <!-- Whether or not to enable the binder heavy hitter auto sampler by default -->
    <bool name="config_defaultBinderHeavyHitterAutoSamplerEnabled">true</bool>

    <!-- The default batch size for the binder heavy hitter auto sampler -->
    <integer name="config_defaultBinderHeavyHitterAutoSamplerBatchSize">400</integer>

    <!-- The default threshold for the binder heavy hitter auto sampler -->
    <item name="config_defaultBinderHeavyHitterAutoSamplerThreshold" format="float" type="dimen">
        0.333
    </item>

    <!-- Component names of the services which will keep critical code path warm -->
    <string-array name="config_keep_warming_services" translatable="false" />

    <!-- WindowsManager JetPack display features -->
    <string name="config_display_features" translatable="false" />

    <!-- Map of System DeviceState supplied by DeviceStateManager to WM Jetpack posture. Must be in
         the format [System DeviceState]:[WM Jetpack Posture], for example: "0:1". -->
    <string-array name="config_device_state_postures" translatable="false" />

    <!-- Aspect ratio of letterboxing for fixed orientation. Values <= 1.0 will be ignored.
         Note: Activity min/max aspect ratio restrictions will still be respected.
         Therefore this override can control the maximum screen area that can be occupied by
         the app in the letterbox mode. -->
    <item name="config_fixedOrientationLetterboxAspectRatio" format="float" type="dimen">0.0</item>

    <!-- Corners radius for activity presented the letterbox mode. Values < 0 enable rounded
         corners with radius equal to min between device bottom corner radii. Default 0 value turns
         off rounded corners logic in LetterboxUiController. -->
    <integer name="config_letterboxActivityCornersRadius">0</integer>

    <!-- Blur radius for the Option 3 in R.integer.config_letterboxBackgroundType. Values < 0 are
        ignored and 0 is used. -->
    <dimen name="config_letterboxBackgroundWallpaperBlurRadius">31dp</dimen>

    <!-- Alpha of a black translucent scrim showed over wallpaper letterbox background when
        the Option 3 is selected for R.integer.config_letterboxBackgroundType.
        Values < 0 or >= 1 are ignored and 0.0 (transparent) is used instead. -->
    <item name="config_letterboxBackgroundWallaperDarkScrimAlpha" format="float" type="dimen">
        0.5
    </item>

    <!-- Corners appearance of the letterbox background.
            0 - Solid background using color specified in R.color.config_letterboxBackgroundColor.
            1 - Color specified in R.attr.colorBackground for the letterboxed application.
            2 - Color specified in R.attr.colorBackgroundFloating for the letterboxed application.
            3 - Wallpaper with dimmed with blur or/and dark scrim. At least one of the following
            parameters should be > 0: config_letterboxBackgroundWallpaperBlurRadius,
            config_letterboxBackgroundWallaperDarkScrimAlpha. If it's not the case or blur radius
            provided but blur isn't supported by the device and this option
            is selected then implementation will default to option 0.
        If given value is outside of this range, the option 0 will be assummed. -->
    <integer name="config_letterboxBackgroundType">0</integer>

    <!-- Color of the letterbox background if one following conditions is true
            - Option 0 is selected for R.integer.config_letterboxBackgroundType.
            - Option 1 is selected for R.integer.config_letterboxBackgroundType and
            R.attr.colorBackground isn't specified for the app.
            - Option 2 is selected for R.integer.config_letterboxBackgroundType and
            R.attr.colorBackgroundFloating isn't specified for the app.
            - Option 3 is selected for R.integer.config_letterboxBackgroundType and blur requested
            but isn't supported on the device or both dark scrim alpha and blur radius aren't
            provided.
     -->
    <color name="config_letterboxBackgroundColor">@android:color/system_neutral2_900</color>

    <!-- Horizonal position of a center of the letterboxed app window.
        0 corresponds to the left side of the screen and 1 to the right side. If given value < 0
        or > 1, it is ignored and central positionis used (0.5). -->
    <item name="config_letterboxHorizontalPositionMultiplier" format="float" type="dimen">0.5</item>

    <!-- Whether reachability repositioning is allowed for letterboxed fullscreen apps in landscape
        device orientation. -->
    <bool name="config_letterboxIsReachabilityEnabled">true</bool>

    <!-- Default horizonal position of the letterboxed app window when reachability is
        enabled and an app is fullscreen in landscape device orientation. When reachability is
        enabled, the position can change between left, center and right. This config defines the
        default one:
            - Option 0 - Left.
            - Option 1 - Center.
            - Option 2 - Right.
        If given value is outside of this range, the option 1 (center) is assummed. -->
    <integer name="config_letterboxDefaultPositionForReachability">1</integer>

    <!-- If true, hide the display cutout with display area -->
    <bool name="config_hideDisplayCutoutWithDisplayArea">false</bool>

    <!-- The timeout value in milliseconds used by SelectionActionModeHelper for each selections
     when TextClassifier has been initialized. -->
    <integer name="config_smartSelectionInitializedTimeoutMillis">200</integer>

    <!-- The timeout value in milliseconds used by SelectionActionModeHelper for each selections
         when TextClassifier has not been initialized. -->
    <integer name="config_smartSelectionInitializingTimeoutMillis">500</integer>

    <!-- Indicates that default fitness tracker app needs to request sensor and location permissions. -->
    <bool name="config_trackerAppNeedsPermissions">false</bool>

    <!-- Package with global data query permissions for AppSearch -->
    <string name="config_globalAppSearchDataQuerierPackage" translatable="false"></string>

    <!-- If true, attach the navigation bar to the app during app transition -->
    <bool name="config_attachNavBarToAppDuringTransition">true</bool>

    <!-- Flag indicating that the media framework should play a back sound when a back-transition
         happens that doesn't result in bringing the home task to the front.
         This is currently only used on TV. -->
    <bool name="config_enableBackSound">true</bool>

    <!-- Chooser image editing activity.  Must handle ACTION_EDIT image/png intents.
         If omitted, image editing will not be offered via Chooser.
         This name is in the ComponentName flattened format (package/class) [DO NOT TRANSLATE]  -->
    <string name="config_systemImageEditor" translatable="false"></string>

    <!-- Whether to force WindowOrientationListener to keep listening to its sensor, even when
         dreaming. This allows the AoD to rotate on devices without a wake device_orientation
         sensor. Note that this flag should only be enabled for development/testing use. -->
    <bool name="config_forceOrientationListenerEnabledWhileDreaming">true</bool>

    <!-- Whether the device enable the standalone (SA) mode of 5G NR.-->
    <bool name="config_telephony5gStandalone">false</bool>
    <!-- Whether the device enable the non-standalone (NSA) mode of 5G NR.-->
    <bool name="config_telephony5gNonStandalone">true</bool>

    <!-- Whether to select voice/data/sms preference without user confirmation -->
    <bool name="config_voice_data_sms_auto_fallback">true</bool>

    <!-- Whether to enable dynamic keyguard positioning for wide screen devices (e.g. only using
         half of the screen, to be accessible using only one hand). -->
    <bool name="config_enableDynamicKeyguardPositioning">true</bool>

    <!-- Whether to allow the caching of the SIM PIN for verification after unattended reboot -->
    <bool name="config_allow_pin_storage_for_unattended_reboot">true</bool>

    <!-- CEC Configuration -->
    <bool name="config_cecHdmiCecEnabled_userConfigurable">true</bool>
    <bool name="config_cecHdmiCecControlEnabled_allowed">true</bool>
    <bool name="config_cecHdmiCecControlEnabled_default">true</bool>
    <bool name="config_cecHdmiCecControlDisabled_allowed">true</bool>
    <bool name="config_cecHdmiCecControlDisabled_default">false</bool>

    <bool name="config_cecHdmiCecVersion_userConfigurable">true</bool>
    <bool name="config_cecHdmiCecVersion14b_allowed">true</bool>
    <bool name="config_cecHdmiCecVersion14b_default">true</bool>
    <bool name="config_cecHdmiCecVersion20_allowed">true</bool>
    <bool name="config_cecHdmiCecVersion20_default">false</bool>

    <bool name="config_cecPowerControlMode_userConfigurable">true</bool>
    <bool name="config_cecPowerControlModeTv_allowed">true</bool>
    <bool name="config_cecPowerControlModeTv_default">true</bool>
    <bool name="config_cecPowerControlModeBroadcast_allowed">true</bool>
    <bool name="config_cecPowerControlModeBroadcast_default">false</bool>
    <bool name="config_cecPowerControlModeNone_allowed">true</bool>
    <bool name="config_cecPowerControlModeNone_default">false</bool>

    <bool name="config_cecPowerStateChangeOnActiveSourceLost_userConfigurable">true</bool>
    <bool name="config_cecPowerStateChangeOnActiveSourceLostNone_allowed">true</bool>
    <bool name="config_cecPowerStateChangeOnActiveSourceLostNone_default">true</bool>
    <bool name="config_cecPowerStateChangeOnActiveSourceLostStandbyNow_allowed">true</bool>
    <bool name="config_cecPowerStateChangeOnActiveSourceLostStandbyNow_default">false</bool>

    <bool name="config_cecSystemAudioModeMuting_userConfigurable">true</bool>
    <bool name="config_cecSystemAudioModeMutingEnabled_allowed">true</bool>
    <bool name="config_cecSystemAudioModeMutingEnabled_default">true</bool>
    <bool name="config_cecSystemAudioModeMutingDisabled_allowed">true</bool>
    <bool name="config_cecSystemAudioModeMutingDisabled_default">false</bool>

    <bool name="config_cecVolumeControlMode_userConfigurable">true</bool>
    <bool name="config_cecVolumeControlModeEnabled_allowed">true</bool>
    <bool name="config_cecVolumeControlModeEnabled_default">true</bool>
    <bool name="config_cecVolumeControlModeDisabled_allowed">true</bool>
    <bool name="config_cecVolumeControlModeDisabled_default">false</bool>

    <bool name="config_cecTvWakeOnOneTouchPlay_userConfigurable">true</bool>
    <bool name="config_cecTvWakeOnOneTouchPlayEnabled_allowed">true</bool>
    <bool name="config_cecTvWakeOnOneTouchPlayEnabled_default">true</bool>
    <bool name="config_cecTvWakeOnOneTouchPlayDisabled_allowed">true</bool>
    <bool name="config_cecTvWakeOnOneTouchPlayDisabled_default">false</bool>

    <bool name="config_cecTvSendStandbyOnSleep_userConfigurable">true</bool>
    <bool name="config_cecTvSendStandbyOnSleepEnabled_allowed">true</bool>
    <bool name="config_cecTvSendStandbyOnSleepEnabled_default">true</bool>
    <bool name="config_cecTvSendStandbyOnSleepDisabled_allowed">true</bool>
    <bool name="config_cecTvSendStandbyOnSleepDisabled_default">false</bool>

    <bool name="config_cecRcProfileTv_userConfigurable">true</bool>
    <bool name="config_cecRcProfileTvNone_allowed">true</bool>
    <bool name="config_cecRcProfileTvNone_default">true</bool>
    <bool name="config_cecRcProfileTvOne_allowed">true</bool>
    <bool name="config_cecRcProfileTvOne_default">false</bool>
    <bool name="config_cecRcProfileTvTwo_allowed">true</bool>
    <bool name="config_cecRcProfileTvTwo_default">false</bool>
    <bool name="config_cecRcProfileTvThree_allowed">true</bool>
    <bool name="config_cecRcProfileTvThree_default">false</bool>
    <bool name="config_cecRcProfileTvFour_allowed">true</bool>
    <bool name="config_cecRcProfileTvFour_default">false</bool>

    <bool name="config_cecRcProfileSourceRootMenu_userConfigurable">true</bool>
    <bool name="config_cecRcProfileSourceRootMenuHandled_allowed">true</bool>
    <bool name="config_cecRcProfileSourceRootMenuHandled_default">true</bool>
    <bool name="config_cecRcProfileSourceRootMenuNotHandled_allowed">true</bool>
    <bool name="config_cecRcProfileSourceRootMenuNotHandled_default">false</bool>

    <bool name="config_cecRcProfileSourceSetupMenu_userConfigurable">true</bool>
    <bool name="config_cecRcProfileSourceSetupMenuHandled_allowed">true</bool>
    <bool name="config_cecRcProfileSourceSetupMenuHandled_default">true</bool>
    <bool name="config_cecRcProfileSourceSetupMenuNotHandled_allowed">true</bool>
    <bool name="config_cecRcProfileSourceSetupMenuNotHandled_default">false</bool>

    <bool name="config_cecRcProfileSourceContentsMenu_userConfigurable">true</bool>
    <bool name="config_cecRcProfileSourceContentsMenuHandled_allowed">true</bool>
    <bool name="config_cecRcProfileSourceContentsMenuHandled_default">false</bool>
    <bool name="config_cecRcProfileSourceContentsMenuNotHandled_allowed">true</bool>
    <bool name="config_cecRcProfileSourceContentsMenuNotHandled_default">true</bool>

    <bool name="config_cecRcProfileSourceTopMenu_userConfigurable">true</bool>
    <bool name="config_cecRcProfileSourceTopMenuHandled_allowed">true</bool>
    <bool name="config_cecRcProfileSourceTopMenuHandled_default">false</bool>
    <bool name="config_cecRcProfileSourceTopMenuNotHandled_allowed">true</bool>
    <bool name="config_cecRcProfileSourceTopMenuNotHandled_default">true</bool>

    <bool name="config_cecRcProfileSourceMediaContextSensitiveMenu_userConfigurable">true</bool>
    <bool name="config_cecRcProfileSourceMediaContextSensitiveMenuHandled_allowed">true</bool>
    <bool name="config_cecRcProfileSourceMediaContextSensitiveMenuHandled_default">false</bool>
    <bool name="config_cecRcProfileSourceMediaContextSensitiveMenuNotHandled_allowed">true</bool>
    <bool name="config_cecRcProfileSourceMediaContextSensitiveMenuNotHandled_default">true</bool>

    <!-- Whether app hibernation deletes OAT artifact files as part of global hibernation. -->
    <bool name="config_hibernationDeletesOatArtifactsEnabled">true</bool>

    <!-- Package name of the on-device intelligent processor for system UI
         features. Examples include the search functionality or the app
         predictor. -->
    <string name="config_systemUiIntelligence" translatable="false"></string>
    <!-- Package name of the on-device intelligent processor for ambient audio.
         Ambient audio is the sound surrounding the device captured by the DSP
         or the microphone. In other words, the device is continuously
         processing audio data in background. -->
    <string name="config_systemAmbientAudioIntelligence" translatable="false"></string>
    <!-- Package name of the on-device intelligent processor for audio. The
         difference of 'ambient audio' and 'audio' is that in 'audio', the
         user intentionally and consciously aware that the device is recording
         or using the microphone.
         -->
    <string name="config_systemAudioIntelligence" translatable="false"></string>
    <!-- Package name of the on-device intelligent processor for notification.
         -->
    <string name="config_systemNotificationIntelligence" translatable="false"></string>
    <!-- Package name of the on-device intelligent processor for text. Examples
        include providing autofill functionality based on incoming text
        messages. -->
    <string name="config_systemTextIntelligence" translatable="false"></string>
    <!-- Package name of the on-device intelligent processor for visual
         features. Examples include the autorotate feature. -->
    <string name="config_systemVisualIntelligence" translatable="false"></string>
    <!-- On-device package for providing companion device associations. -->
    <string name="config_systemCompanionDeviceProvider" translatable="false"></string>

    <!-- Whether this device is supporting the microphone toggle -->
    <bool name="config_supportsMicToggle">true</bool>
    <!-- Whether this device is supporting the camera toggle -->
    <bool name="config_supportsCamToggle">true</bool>

    <!-- List containing the allowed install sources for accessibility service. -->
    <string-array name="config_accessibility_allowed_install_source" translatable="false"/>

    <!-- Default value for Settings.ASSIST_LONG_PRESS_HOME_ENABLED -->
    <bool name="config_assistLongPressHomeEnabledDefault">true</bool>
    <!-- Default value for Settings.ASSIST_TOUCH_GESTURE_ENABLED -->
    <bool name="config_assistTouchGestureEnabledDefault">true</bool>

    <!-- The maximum byte size of the information contained in the bundle of
    HotwordDetectedResult. -->
    <integer translatable="false" name="config_hotwordDetectedResultMaxBundleSize">0</integer>

    <!-- The amount of dimming to apply to wallpapers with mid range luminance. 0 displays
         the wallpaper at full brightness. 1 displays the wallpaper as fully black. -->
    <item name="config_wallpaperDimAmount" format="float" type="dimen">0.05</item>

    <!-- The default number of times per second that the seconds hand on AnalogClock ticks. If set
         to 0, the seconds hand will be disabled. -->
    <integer name="config_defaultAnalogClockSecondsHandFps">1</integer>

    <!-- the number of the max cached processes in the system. -->
    <integer name="config_customizedMaxCachedProcesses">32</integer>

    <!-- The display cutout configs for secondary built-in display. -->
    <string name="config_secondaryBuiltInDisplayCutout" translatable="false"></string>
    <string name="config_secondaryBuiltInDisplayCutoutRectApproximation" translatable="false">
        @string/config_secondaryBuiltInDisplayCutout
    </string>
    <bool name="config_fillSecondaryBuiltInDisplayCutout">false</bool>
    <bool name="config_maskSecondaryBuiltInDisplayCutout">false</bool>

    <!-- An array contains unique ids of all built-in displays and the unique id of a display can be
         obtained from {@link Display#getUniqueId}. This array should be set for multi-display
         devices if there are different display related configs(e.g. display cutout, rounded corner)
         between each built-in display.
         It is used as an index for multi-display related configs:
         First look up the index of the unique id of the given built-in display unique id in this
         array and use this index to get the info in corresponding config arrays such as:
           - config_displayCutoutPathArray
           - config_displayCutoutApproximationRectArray
           - config_fillBuiltInDisplayCutoutArray
           - config_maskBuiltInDisplayCutoutArray
           - config_waterfallCutoutArray
           - config_roundedCornerRadiusArray
           - config_roundedCornerTopRadiusArray
           - config_roundedCornerBottomRadiusArray
           - config_builtInDisplayIsRoundArray (config in SystemUI resource)
           - config_roundedCornerMultipleRadiusArray (config in SystemUI resource)
           - config_roundedCornerDrawableArray (config in SystemUI resource)
           - config_roundedCornerTopDrawableArray (config in SystemUI resource)
           - config_roundedCornerBottomDrawableArray (config in SystemUI resource)

         Leave this array empty for single display device and the system will load the default main
         built-in related configs.
         -->
    <string-array name="config_displayUniqueIdArray" translatable="false">
        <!-- Example:
        <item>"local:1234567891"</item> // main built-in display
        <item>"local:1234567892"</item> // secondary built-in display
        -->
    </string-array>

    <!-- The display cutout path config for each display in a multi-display device. -->
    <string-array name="config_displayCutoutPathArray" translatable="false">
        <item>@string/config_mainBuiltInDisplayCutout</item>
        <item>@string/config_secondaryBuiltInDisplayCutout</item>
    </string-array>

    <!-- The display cutout approximation rect config for each display in a multi-display device.
         -->
    <string-array name="config_displayCutoutApproximationRectArray" translatable="false">
        <item>@string/config_mainBuiltInDisplayCutoutRectApproximation</item>
        <item>@string/config_secondaryBuiltInDisplayCutoutRectApproximation</item>
    </string-array>

    <!-- The maskBuiltInDisplayCutout config for each display in a multi-display device. -->
    <array name="config_maskBuiltInDisplayCutoutArray" translatable="false">
        <item>@bool/config_maskMainBuiltInDisplayCutout</item>
        <item>@bool/config_maskSecondaryBuiltInDisplayCutout</item>
    </array>

    <!-- The fillBuiltInDisplayCutout config for each display in a multi-display device. -->
    <array name="config_fillBuiltInDisplayCutoutArray" translatable="false">
        <item>@bool/config_fillMainBuiltInDisplayCutout</item>
        <item>@bool/config_fillSecondaryBuiltInDisplayCutout</item>
    </array>

    <array name="config_mainBuiltInDisplayWaterfallCutout" translatable="false">
        <item>@dimen/waterfall_display_left_edge_size</item>
        <item>@dimen/waterfall_display_top_edge_size</item>
        <item>@dimen/waterfall_display_right_edge_size</item>
        <item>@dimen/waterfall_display_bottom_edge_size</item>
    </array>

    <array name="config_secondaryBuiltInDisplayWaterfallCutout" translatable="false">
        <item>@dimen/secondary_waterfall_display_left_edge_size</item>
        <item>@dimen/secondary_waterfall_display_top_edge_size</item>
        <item>@dimen/secondary_waterfall_display_right_edge_size</item>
        <item>@dimen/secondary_waterfall_display_bottom_edge_size</item>
    </array>

    <!-- The waterfall cutout config for each display in a multi-display device. -->
    <array name="config_waterfallCutoutArray" translatable="false">
        <item>@array/config_mainBuiltInDisplayWaterfallCutout</item>
        <item>@array/config_secondaryBuiltInDisplayWaterfallCutout</item>
    </array>

    <!-- The component name of the activity for the companion-device-manager notification access
     confirmation. -->
    <string name="config_notificationAccessConfirmationActivity" translatable="false">
        com.android.settings/com.android.settings.notification.NotificationAccessConfirmationActivity
    </string>

    <!-- Whether the airplane mode should be reset when device boots in non-safemode after exiting
         from safemode.
         This flag should be enabled only when the product does not have any UI to toggle airplane
         mode like automotive devices.-->
    <bool name="config_autoResetAirplaneMode">true</bool>

    <bool name="config_secondaryBuiltInDisplayIsRound">@bool/config_windowIsRound</bool>

    <!-- The display round config for each display in a multi-display device. -->
    <array name="config_builtInDisplayIsRoundArray" translatable="false">
        <item>@bool/config_mainBuiltInDisplayIsRound</item>
        <item>@bool/config_secondaryBuiltInDisplayIsRound</item>
    </array>

    <!-- The rounded corner radius for each display in a multi-display device. -->
    <array name="config_roundedCornerRadiusArray" translatable="false">
        <item>@dimen/rounded_corner_radius</item>
        <item>@dimen/secondary_rounded_corner_radius</item>
    </array>

    <!-- The top rounded corner radius for each display in a multi-display device. -->
    <array name="config_roundedCornerTopRadiusArray" translatable="false">
        <item>@dimen/rounded_corner_radius_top</item>
        <item>@dimen/secondary_rounded_corner_radius_top</item>
    </array>

    <!-- The bottom rounded corner radius for each display in a multi-display device. -->
    <array name="config_roundedCornerBottomRadiusArray" translatable="false">
        <item>@dimen/rounded_corner_radius_bottom</item>
        <item>@dimen/secondary_rounded_corner_radius_bottom</item>
    </array>

    <!-- The rounded corner radius adjustment for each display in a multi-display device. -->
    <array name="config_roundedCornerRadiusAdjustmentArray" translatable="false">
        <item>@dimen/rounded_corner_radius_adjustment</item>
        <item>@dimen/secondary_rounded_corner_radius_adjustment</item>
    </array>

    <!-- The rounded corner radius top adjustment for each display in a multi-display device. -->
    <array name="config_roundedCornerTopRadiusAdjustmentArray" translatable="false">
        <item>@dimen/rounded_corner_radius_top_adjustment</item>
        <item>@dimen/secondary_rounded_corner_radius_top_adjustment</item>
    </array>

    <!-- The rounded corner radius bottom adjustment for each display in a multi-display device. -->
    <array name="config_roundedCornerBottomRadiusAdjustmentArray" translatable="false">
        <item>@dimen/rounded_corner_radius_bottom_adjustment</item>
        <item>@dimen/secondary_rounded_corner_radius_bottom_adjustment</item>
    </array>

    <!-- Shape of the work badge icon for viewport size 24. -->
    <string name="config_work_badge_path_24" translatable="false">
        M20,6h-4L16,4c0,-1.11 -0.89,-2 -2,-2h-4c-1.11,0 -2,0.89 -2,2v2L4,6c-1.11,0 -1.99,0.89 -1.99,2L2,19c0,1.11 0.89,2 2,2h16c1.11,0 2,-0.89 2,-2L22,8c0,-1.11 -0.89,-2 -2,-2zM14,6h-4L10,4h4v2z
    </string>

    <integer name="config_chooser_max_targets_per_row">4</integer>
</resources>

EOF