#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

echo ""
echo "D!OS SETTINGS APP XML..."
echo ""
if [ ! -d ~/dios/backups/apps/Settings/res/values ]; then
    mkdir -p ~/dios/backups/apps/Settings/res/values
fi
cp -afnrp ~/dios/packages/apps/Settings/res/values/config.xml ~/dios/backups/apps/Settings/res/values
cat <<\EOF >~/dios/packages/apps/Settings/res/values/config.xml
<?xml version="1.0" encoding="utf-8"?>
<!-- Copyright (C) 2007 The Android Open Source Project

     Licensed under the Apache License, Version 2.0 (the "License");
     you may not use this file except in compliance with the License.
     You may obtain a copy of the License at

          http://www.apache.org/licenses/LICENSE-2.0

     Unless required by applicable law or agreed to in writing, software
     distributed under the License is distributed on an "AS IS" BASIS,
     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
     See the License for the specific language governing permissions and
     limitations under the License.
-->

<resources xmlns:xliff="urn:oasis:names:tc:xliff:document:1.2">

    <!-- If false, MIN is displayed. If true, MSID is displayed. -->
    <bool name="config_msid_enable" translatable="false">false</bool>

    <string name="additional_system_update" translatable="false"></string>
    <string name="additional_system_update_menu" translatable="false"></string>

    <!-- TODO: This is purely enforced by the interface, and does not affect what
         strings may be inserted into the actual content provider.
         With the addition of shortcuts, it seems more likely that users will
         find this limiting; it would be good to have the interface work with
         very long strings too. -->
    <integer name="maximum_user_dictionary_word_length" translatable="false">48</integer>

    <!-- Dashboard number of columns -->
    <integer name="dashboard_num_columns">1</integer>

    <!-- Carrier_enabled editable -->
    <bool name="config_allow_edit_carrier_enabled" translatable="false">false</bool>

    <!-- When true enable color temperature setting. -->
    <bool name="config_enableColorTemperature">true</bool>

    <!-- Whether to show Camera laser sensor switch in Developer Options -->
    <bool name="config_show_camera_laser_sensor">true</bool>

    <!-- Fully-qualified class name for the implementation of the FeatureFactory to be instantiated. -->
    <string name="config_featureFactory" translatable="false">com.android.settings.overlay.FeatureFactoryImpl</string>

    <!-- Package name and fully-qualified class name for the wallpaper picker activity. -->
    <string name="config_wallpaper_picker_package" translatable="false">com.android.settings</string>
    <string name="config_wallpaper_picker_class" translatable="false">com.android.settings.Settings$WallpaperSettingsActivity</string>
    <!-- Fully-qualified class name for the styles & wallpaper picker activity. -->
    <string name="config_styles_and_wallpaper_picker_class" translatable="false"></string>
    <!-- Intent extra for wallpaper picker activity. -->
    <string name="config_wallpaper_picker_launch_extra" translatable="false">com.android.wallpaper.LAUNCH_SOURCE</string>

    <!-- Manufacturer backup settings to launch -->
    <string name="config_backup_settings_intent" translatable="false"></string>

    <!-- Manufacturer backup settings label -->
    <string name="config_backup_settings_label" translatable="true"></string>

    <!-- Double twist sensor type and vendor used by gesture setting -->
    <string name="gesture_double_twist_sensor_type" translatable="false"></string>
    <string name="gesture_double_twist_sensor_vendor" translatable="false"></string>

    <!-- When true enable gesture setting. -->
    <bool name="config_gesture_settings_enabled">true</bool>

    <!-- If the Storage Manager settings are enabled. -->
    <bool name="config_storage_manager_settings_enabled">true</bool>

    <!-- If the support features are enabled. -->
    <bool name="config_support_enabled">true</bool>

    <!-- Whether to enable "show operator name in the status bar" setting -->
    <bool name="config_showOperatorNameInStatusBar">true</bool>

    <!-- List containing the component names of pre-installed screen reader services. -->
    <string-array name="config_preinstalled_screen_reader_services" translatable="false">
        <!--
        <item>com.example.package.first/com.example.class.FirstService</item>
        <item>com.example.package.second/com.example.class.SecondService</item>
        -->
    </string-array>

    <!-- List containing the component names of pre-installed captioning services. -->
    <string-array name="config_preinstalled_captions_services" translatable="false">
        <!--
        <item>com.example.package.first/com.example.class.FirstService</item>
        <item>com.example.package.second/com.example.class.SecondService</item>
        -->
    </string-array>

    <!-- List containing the component names of pre-installed audio and captioning services. -->
    <string-array name="config_preinstalled_audio_services" translatable="false">
        <!--
        <item>com.example.package.first/com.example.class.FirstService</item>
        <item>com.example.package.second/com.example.class.SecondService</item>
        -->
    </string-array>

    <!-- List containing the component names of pre-installed display services. -->
    <string-array name="config_preinstalled_display_services" translatable="false">
        <!--
        <item>com.example.package.first/com.example.class.FirstService</item>
        <item>com.example.package.second/com.example.class.SecondService</item>
        -->
    </string-array>

    <!-- List containing the component names of pre-installed interaction control services. -->
    <string-array name="config_preinstalled_interaction_control_services" translatable="false">
        <!--
        <item>com.example.package.first/com.example.class.FirstService</item>
        <item>com.example.package.second/com.example.class.SecondService</item>
        -->
    </string-array>

    <!-- List containing the order of services in screen reader category by componentname.
         All componentnames in a category need to be specified to guarantee correct behavior.-->
    <string-array name="config_order_screen_reader_services" translatable="false">
        <!--
        <item>com.example.package.first/com.example.class.FirstService</item>
        <item>com.example.package.second/com.example.class.SecondService</item>
        -->
    </string-array>

    <!-- List containing the order of services in captions category by preference key or
         componentname. All preference keys in a category need to be specified to guarantee correct
         behavior.-->
    <string-array name="config_order_captions_services" translatable="false">
        <!--
        <item>com.example.package.first/com.example.class.FirstService</item>
        <item>com.example.package.second/com.example.class.SecondService</item>
        <item>captioning_preference_screen</item>
        <item>rtt_setting</item>
        <item>...</item>
        -->
    </string-array>

    <!-- List containing the order of services in audio and caption category by preference key
         or componentname. All preference keys in a category need to be specified to guarantee
         correct behavior.-->
    <string-array name="config_order_audio_services" translatable="false">
        <!--
        <item>com.example.package.first/com.example.class.FirstService</item>
        <item>com.example.package.second/com.example.class.SecondService</item>
        <item>toggle_primary_mono</item>
        <item>seekbar_primary_balance</item>
        <item>...</item>
        -->
    </string-array>

    <!-- List containing the order of services in display category by preference key
         or componentname. All preference keys in a category need to be specified to guarantee
         correct behavior.-->
    <string-array name="config_order_display_services" translatable="false">
        <!--
        <item>com.example.package.first/com.example.class.FirstService</item>
        <item>com.example.package.second/com.example.class.SecondService</item>
        <item>font_size_preference_screen</item>
        <item>dark_ui_mode_accessibility</item>
        <item>...</item>
        -->
    </string-array>

    <!-- List containing the order of services in interaction control category by preference key
         or componentname. All preference keys in a category need to be specified to guarantee
         correct behavior.-->
    <string-array name="config_order_interaction_control_services" translatable="false">
        <!--
        <item>com.example.package.first/com.example.class.FirstService</item>
        <item>com.example.package.second/com.example.class.SecondService</item>
        <item>autoclick_preference</item>
        <item>toggle_power_button_ends_call_preference</item>
        <item>...</item>
        -->
    </string-array>

    <!-- List of packages that should be allowlisted for slice uri access. Do not translate -->
    <string-array name="slice_allowlist_package_names" translatable="false"/>

    <!-- Whether or not App & Notification screen should display recently used apps -->
    <bool name="config_display_recent_apps">true</bool>

    <!-- Package name for the storage manager to use from Settings search. -->
    <string name="config_deletion_helper_package" translatable="false">com.android.storagemanager</string>
    <!-- Class name for the storage manager's deletion helper class. -->
    <string name="config_deletion_helper_class" translatable="false">com.android.storagemanager.deletionhelper.DeletionHelperActivity</string>

    <!-- Whether to use a UI variant that minimizes the number of UI elements on screen. This is
         typically used when there is not enough space to display everything, because pattern view
         doesn't interact well with scroll view -->
    <bool name="config_lock_pattern_minimal_ui">true</bool>

    <!-- List of a11y components on the device allowed to be enabled by Settings Slices -->
    <string-array name="config_settings_slices_accessibility_components" translatable="false"/>

    <!-- Whether or not to show the night light suggestion. -->
    <bool name="config_night_light_suggestion_enabled">true</bool>

    <!-- Whether or not the device is capable of multiple levels of vibration intensity.
         Note that this is different from whether it can control the vibration amplitude as some
         devices will be able to vary their amplitude but do not possess enough dynamic range to
         have distinct intensity levels -->
    <bool name="config_vibration_supports_multiple_intensities">true</bool>

    <!--
        Whether or not the homepage should be powered by legacy suggestion (versus contextual cards)
        Default to true as not all devices support contextual cards.
    -->
    <bool name="config_use_legacy_suggestion">true</bool>

    <!-- Whether or not homepage should display user's account avatar -->
    <bool name="config_show_avatar_in_homepage">true</bool>

    <!-- Whether or not emergency info tile should display in device info page -->
    <bool name="config_show_emergency_info_in_device_info">true</bool>

    <!-- Whether or not branded account info tile should display in device info page -->
    <bool name="config_show_branded_account_in_device_info">true</bool>

    <!-- Whether or not device header widget tile should display in device info page -->
    <bool name="config_show_device_header_in_device_info">true</bool>

    <!-- Whether or not TopLevelSettings should force rounded icon for injected tiles -->
    <bool name="config_force_rounded_icon_TopLevelSettings">true</bool>

    <!-- Whether dismissal timestamp should be kept before deletion -->
    <bool name="config_keep_contextual_card_dismissal_timestamp">false</bool>

    <!-- Settings intelligence package name -->
    <string name="config_settingsintelligence_package_name" translatable="false">
        com.android.settings.intelligence
    </string>

    <!-- Whether the confirmation for sim deletion is defaulted to be on or off-->
    <bool name="config_sim_deletion_confirmation_default_on">true</bool>

    <!-- Package Installer package name -->
    <string name="config_package_installer_package_name" translatable="false">
        com.android.packageinstaller
    </string>

    <!-- Settings intelligence interaction log intent action -->
    <string name="config_settingsintelligence_log_action" translatable="false"></string>

    <!-- AOSP Emergency app package name -->
    <string name="config_aosp_emergency_package_name" translatable="false">
        com.android.emergency
    </string>

    <!-- AOSP Emergency app intent action -->
    <string name="config_aosp_emergency_intent_action" translatable="false">
        android.settings.EDIT_EMERGENCY_INFO
    </string>

    <!-- Emergency app package name -->
    <string name="config_emergency_package_name" translatable="false">
        com.android.emergency
    </string>

    <!-- Emergency app intent action -->
    <string name="config_emergency_intent_action" translatable="false">
        android.settings.EDIT_EMERGENCY_INFO
    </string>

    <!-- Email address for the homepage contextual cards feedback -->
    <string name="config_contextual_card_feedback_email" translatable="false"></string>

    <!-- ComponentName to launch a vendor-specific enrollment activity if available -->
    <string name="config_face_enroll" translatable="false"></string>

    <!-- Whether to show the "less secure" info section on the face enroll intro screen -->
    <bool name="config_face_intro_show_less_secure">true</bool>

    <!-- Whether to show the "require eyes" info section on the face enroll intro screen -->
    <bool name="config_face_intro_show_require_eyes">true</bool>

    <!-- Whether to use the Lottie animation for the face education enrollment screen -->
    <bool name="config_face_education_use_lottie">true</bool>

    <!-- App intent -->
    <string name="config_account_intent_uri" translatable="false"></string>

    <!-- Whether or not the dock settings are to be displayed for this device when docked -->
    <bool name="has_dock_settings">true</bool>
    <!-- Whether there is a boot sounds checkbox -->
    <bool name="has_boot_sounds">true</bool>
    <!-- Whether there is a silent mode checkbox  -->
    <bool name="has_silent_mode">true</bool>

    <!-- Display additional System Update menu if true -->
    <bool name="config_additional_system_update_setting_enable">true</bool>

    <!-- Whether the bluetooth activation confirmation dialogs should be auto dismissed.
         Can be overridden for specific product builds. -->
    <bool name="auto_confirm_bluetooth_activation_dialog">true</bool>

    <!-- Whether the device name is shown in About device or not -->
    <bool name="config_show_device_name">true</bool>

    <!-- Whether to show a preference item for the manual in About phone -->
    <bool name="config_show_manual">true</bool>
    <!-- Whether to show a preference item for regulatory information in About phone -->
    <bool name="config_show_regulatory_info">true</bool>

    <!-- Whether to show a preference item for mobile plan -->
    <bool name="config_show_mobile_plan">true</bool>

    <!-- Whether none security option is hide or not  (country specific). -->
    <bool name="config_hide_none_security_option">false</bool>

    <!-- Whether swipe security option is hidden or not -->
    <bool name="config_hide_swipe_security_option">false</bool>

    <!--Whether help links are defined. -->
    <bool name="config_has_help">true</bool>

    <!-- Whether Wi-Fi settings should be shown or not.
    This also controls whether Wi-fi related sub-settings (e.g. Wi-Fi preferences) will
    surface in search results or not.-->
    <bool name="config_show_wifi_settings">true</bool>

    <!-- Whether toggle_airplane is available or not. -->
    <bool name="config_show_toggle_airplane">true</bool>

    <!-- Whether private_dns_settings is available or not. -->
    <bool name="config_show_private_dns_settings">true</bool>

    <!-- Whether memory from app_info_settings is available or not. -->
    <bool name="config_show_app_info_settings_memory">true</bool>

    <!-- Whether battery from app_info_settings is available or not. -->
    <bool name="config_show_app_info_settings_battery">true</bool>

    <!-- Whether location mode is available or not. -->
    <bool name="config_location_mode_available">true</bool>

    <!-- Whether location scanning is available or not. -->
    <bool name="config_show_location_scanning">true</bool>

    <!-- Whether high_power_apps should be shown or not. -->
    <bool name="config_show_high_power_apps">true</bool>

    <!-- Whether media_volume should be shown or not. -->
    <bool name="config_show_media_volume">true</bool>

    <!-- Whether alarm_volume should be shown or not. -->
    <bool name="config_show_alarm_volume">true</bool>

    <!-- Whether call_volume should be shown or not. -->
    <bool name="config_show_call_volume">true</bool>

    <!-- Whether notification_volume should be shown or not. -->
    <bool name="config_show_notification_volume">true</bool>

    <!-- Whether notification_ringtone should be shown or not. -->
    <bool name="config_show_notification_ringtone">true</bool>

    <!-- Whether screen_locking_sounds should be shown or not. -->
    <bool name="config_show_screen_locking_sounds">true</bool>

    <!-- Whether charging_sounds should be shown or not. -->
    <bool name="config_show_charging_sounds">true</bool>

    <!-- Whether touch_sounds should be shown or not. -->
    <bool name="config_show_touch_sounds">true</bool>

    <!-- Whether encryption_and_credentials_encryption_status should be shown or not. -->
    <bool name="config_show_encryption_and_credentials_encryption_status">true</bool>

    <!-- Whether premium_sms should be shown or not. -->
    <bool name="config_show_premium_sms">true</bool>

    <!-- Whether data_saver should be shown or not. -->
    <bool name="config_show_data_saver">true</bool>

    <!-- Whether enabled_vr_listeners should be shown or not. -->
    <bool name="config_show_enabled_vr_listeners">true</bool>

    <!-- Whether phone_language should be shown or not. -->
    <bool name="config_show_phone_language">true</bool>

    <!-- Whether virtual_keyboard_pref should be shown or not. -->
    <bool name="config_show_virtual_keyboard_pref">true</bool>

    <!-- Whether physical_keyboard_pref should be shown or not. -->
    <bool name="config_show_physical_keyboard_pref">true</bool>

    <!-- Whether spellcheckers_settings should be shown or not. -->
    <bool name="config_show_spellcheckers_settings">true</bool>

    <!-- Whether tts_settings_summary should be shown or not. -->
    <bool name="config_show_tts_settings_summary">true</bool>

    <!-- Whether pointer_speed should be shown or not. -->
    <bool name="config_show_pointer_speed">true</bool>

    <!-- Whether vibrate_input_devices should be shown or not. -->
    <bool name="config_show_vibrate_input_devices">true</bool>

    <!-- Whether manage_device_admin should be shown or not. -->
    <bool name="config_show_manage_device_admin">true</bool>

    <!-- Whether unlock_set_or_change should be shown or not. -->
    <bool name="config_show_unlock_set_or_change">true</bool>

    <!-- Whether screen_pinning_settings should be shown or not. -->
    <bool name="config_show_screen_pinning_settings">true</bool>

    <!-- Whether manage_trust_agents should be shown or not. -->
    <bool name="config_show_manage_trust_agents">true</bool>

    <!-- Whether show_password should be shown or not. -->
    <bool name="config_show_show_password">true</bool>

    <!-- Whether trust_agent_click_intent should be shown or not. -->
    <bool name="config_show_trust_agent_click_intent">true</bool>

    <!-- Whether wallpaper attribution should be shown or not. -->
    <bool name="config_show_wallpaper_attribution">true</bool>

    <!-- Whether assist_and_voice_input should be shown or not. -->
    <bool name="config_show_assist_and_voice_input">true</bool>

    <!-- Whether reset_dashboard should be shown or not. -->
    <bool name="config_show_reset_dashboard">true</bool>

    <!-- Whether system_update_settings should be shown or not. -->
    <bool name="config_show_system_update_settings">true</bool>

    <!-- Whether device_model should be shown or not. -->
    <bool name="config_show_device_model">true</bool>

    <!-- Whether top_level_accessibility should be shown or not. -->
    <bool name="config_show_top_level_accessibility">true</bool>

    <!-- Whether top_level_battery should be shown or not. -->
    <bool name="config_show_top_level_battery">true</bool>

    <!-- Whether top_level_connected_devices should be shown or not. -->
    <bool name="config_show_top_level_connected_devices">true</bool>

    <!-- Whether top_level_display should be shown or not. -->
    <bool name="config_show_top_level_display">true</bool>

    <!-- Whether wifi_ip_address should be shown or not. -->
    <bool name="config_show_wifi_ip_address">true</bool>

    <!-- Whether wifi_mac_address should be shown or not. -->
    <bool name="config_show_wifi_mac_address">true</bool>

    <!-- Whether to disable "Uninstall Updates" menu item for System apps or not. -->
    <bool name="config_disable_uninstall_update">false</bool>

    <!-- Whether or not extra preview panels should be used for screen zoom setting. -->
    <bool name="config_enable_extra_screen_zoom_preview">true</bool>

    <!-- Slice Uri to query nearby devices. -->
    <string name="config_nearby_devices_slice_uri" translatable="false">content://com.google.android.gms.nearby.fastpair/device_status_list_item</string>

    <!-- Grayscale settings intent -->
    <string name="config_grayscale_settings_intent" translatable="false"></string>

    <!-- List containing the injected tile keys which are suppressed. -->
    <string-array name="config_suppress_injected_tile_keys" translatable="false"/>

    <!-- Reset application package name -->
    <string-array name="config_skip_reset_apps_package_name" translatable="false">
        <item>android</item>
        <item>com.android.providers.downloads</item>
        <item>com.android.systemui</item>
        <item>com.android.vending</item>
    </string-array>

    <!-- Settings panel keeps observe this uri -->
    <string-array name="config_panel_keep_observe_uri" translatable="false">
        <item>content://com.android.settings.slices/intent/media_output_indicator</item>
    </string-array>

    <!-- Uri to query non-public Slice Uris. -->
    <string name="config_non_public_slice_query_uri" translatable="false"></string>

    <!-- RTT setting intent action -->
    <string name="config_rtt_setting_intent_action" translatable="false"></string>

    <!-- Package name of dialer supports RTT setting-->
    <string name="config_rtt_setting_package_name" translatable="false"></string>

    <!-- Whether nfc detection point preview image is available or not. -->
    <bool name="config_nfc_detection_point">true</bool>

    <!-- Whether to show Smooth Display feature in Settings Options -->
    <bool name="config_show_smooth_display">true</bool>

    <!-- Whether to show emergency gesture in Settings -->
    <bool name="config_show_emergency_gesture_settings">true</bool>

    <!-- Optional package name if another 1p app wants to take over the emergency gesture settings UI -->
    <string name="emergency_gesture_settings_package"></string>

    <!-- Whether to show the Preference for Adaptive connectivity -->
    <bool name="config_show_adaptive_connectivity">true</bool>

    <!-- Authority of advanced device battery prediction -->
    <string name="config_battery_prediction_authority" translatable="false"></string>

    <!-- Whether to handle slot change events -->
    <bool name="config_handle_sim_slot_change">true</bool>

    <!-- whether use partner overlay theme for outside setupwizard flow -->
    <bool name="config_suc_use_partner_resource">false</bool>

    <!-- Cell broacast receiver package name -->
    <string name="config_cell_broadcast_receiver_package" translatable="false">com.android.cellbroadcastreceiver.module</string>

    <!-- TODO(b/174964885): These media Uri are not defined in framework yet. Replace with framework defined variables once it's available. -->
    <!-- Media Uri to view images storage category. -->
    <string name="config_images_storage_category_uri" translatable="false">content://com.android.providers.media.documents/root/images_root</string>

    <!-- Media Uri to view videos storage category. -->
    <string name="config_videos_storage_category_uri" translatable="false">content://com.android.providers.media.documents/root/videos_root</string>

    <!-- Media Uri to view audio storage category. -->
    <string name="config_audio_storage_category_uri" translatable="false">content://com.android.providers.media.documents/root/audio_root</string>

    <!-- Media Uri to view documents & other storage category. -->
    <string name="config_documents_and_other_storage_category_uri" translatable="false">content://com.android.providers.media.documents/root/documents_root</string>

    <!-- Whether to show Smart Storage toggle -->
    <bool name="config_show_smart_storage_toggle">true</bool>

    <!-- Whether suw to support two panes -->
    <bool name="config_suw_supported_two_panes">true</bool>

    <!-- Whether to support large screen -->
    <bool name="config_supported_large_screen">true</bool>

    <!-- Display settings screen, Color mode options. Must be the same length and order as
         config_color_mode_options_values below. Only the values that also appear in
         frameworks/base/core/res/res/values/config.xml's config_availableColorModes are shown. -->
    <string-array name="config_color_mode_options_strings" translatable="false">
        <item>@string/color_mode_option_natural</item>
        <item>@string/color_mode_option_boosted</item>
        <item>@string/color_mode_option_saturated</item>
        <item>@string/color_mode_option_automatic</item>
    </string-array>

    <!-- Display settings screen, Color mode options. Must be the same length and order as
         config_color_mode_options_strings above. Only the values that also appear in
         frameworks/base/core/res/res/values/config.xml's config_availableColorModes are shown. -->
    <integer-array name="config_color_mode_options_values" translatable="false">
        <item>0</item>
        <item>1</item>
        <item>2</item>
        <item>3</item>
    </integer-array>

    <!-- Whether to aggregate for network selection list-->
    <bool name="config_network_selection_list_aggregation_enabled">true</bool>
</resources>
EOF
