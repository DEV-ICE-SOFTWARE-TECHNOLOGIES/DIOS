#!/bin/bash
set -eu

# --------------------------------------------------------------------------------------------------
# Copyright © 2022 Marius Kopp
# --------------------------------------------------------------------------------------------------

if [ ! -d ~/dios/device/generic/dios/dios/system_ext/etc/permissions ]; then
    mkdir -p ~/dios/device/generic/dios/dios/system_ext/etc/permissions
fi

echo ""
echo "D!OS PERMISSIONS XML..."
echo ""
cat <<\EOF >~/dios/device/generic/dios/dios/system_ext/etc/permissions/privapp-permissions-dios.xml
<?xml version="1.0" encoding="utf-8"?>

<permissions>
    <privapp-permissions package="com.android.systemui">
        <permission name="android.permission.WRITE_EMBEDDED_SUBSCRIPTIONS"/>
        <permission name="android.permission.SET_WALLPAPER_COMPONENT"/>
        <permission name="android.permission.LOCATION_HARDWARE"/>
        <permission name="android.permission.ACCESS_CONTEXT_HUB"/>
        <permission name="android.permission.REGISTER_STATS_PULL_ATOM"/>
        <permission name="android.permission.REQUEST_NETWORK_SCORES"/>
    </privapp-permissions>

    <privapp-permissions package="com.android.settings">
        <permission name="android.permission.INSTALL_DYNAMIC_SYSTEM"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.storagemanager">
        <permission name="android.permission.DELETE_PACKAGES"/>
        <permission name="android.permission.INTERACT_ACROSS_USERS"/>
        <permission name="android.permission.MANAGE_USERS"/>
        <permission name="android.permission.PACKAGE_USAGE_STATS"/>
        <permission name="android.permission.USE_RESERVED_DISK"/>
        <permission name="android.permission.WRITE_SECURE_SETTINGS"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.volta">
        <permission name="android.permission.BATTERY_STATS"/>
        <permission name="android.permission.CHANGE_APP_IDLE_STATE"/>
        <permission name="android.permission.DUMP"/>
        <permission name="android.permission.INTERACT_ACROSS_USERS"/>
        <permission name="android.permission.PACKAGE_USAGE_STATS"/>
        <permission name="android.permission.QUERY_ALL_PACKAGES"/>
        <permission name="android.permission.REAL_GET_TASKS"/>
        <permission name="android.permission.REBOOT"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.apps.nexuslauncher">
        <permission name="android.permission.VIEW_INSTANT_APPS" />
        <permission name="com.google.android.apps.nexuslauncher.permission.QSB" />
        <permission name="com.google.android.launcher.permission.READ_SETTINGS" />
        <permission name="com.google.android.as.allapps.SUGGESTION_CONSUMER" />
        <permission name="android.permission.GET_PEOPLE_TILE_PREVIEW" />
        <permission name="android.permission.GET_TOP_ACTIVITY_INFO" />
        <permission name="com.google.android.apps.nexuslauncher.permission.HOTSEAT_EDU" />
        <permission name="android.permission.REGISTER_STATS_PULL_ATOM" />
        <permission name="android.permission.BROADCAST_CLOSE_SYSTEM_DIALOGS" />
        <permission name="android.permission.CONTROL_REMOTE_APP_TRANSITION_ANIMATIONS" />
        <permission name="android.permission.VIBRATE" />
        <permission name="android.permission.QUERY_ALL_PACKAGES" />
        <permission name="android.permission.START_TASKS_FROM_RECENTS" />
        <permission name="android.permission.REMOVE_TASKS" />
        <permission name="android.permission.WRITE_SECURE_SETTINGS" />
        <permission name="android.permission.MANAGE_ACTIVITY_TASKS" />
        <permission name="android.permission.STATUS_BAR" />
        <permission name="android.permission.STOP_APP_SWITCHES" />
        <permission name="android.permission.SET_ORIENTATION" />
        <permission name="android.permission.READ_FRAME_BUFFER" />
        <permission name="android.permission.MANAGE_ACCESSIBILITY" />
        <permission name="android.permission.MONITOR_INPUT" />
        <permission name="android.permission.ALLOW_SLIPPERY_TOUCHES" />
        <permission name="android.permission.SYSTEM_APPLICATION_OVERLAY" />
        <permission name="android.permission.CALL_PHONE" />
        <permission name="android.permission.SET_WALLPAPER" />
        <permission name="android.permission.SET_WALLPAPER_HINTS" />
        <permission name="android.permission.BIND_APPWIDGET" />
        <permission name="android.permission.READ_EXTERNAL_STORAGE" />
        <permission name="android.permission.RECEIVE_BOOT_COMPLETED" />
        <permission name="android.permission.REQUEST_DELETE_PACKAGES" />
        <permission name="android.permission.READ_DEVICE_CONFIG" />
        <permission name="android.permission.ROTATE_SURFACE_FLINGER" />
        <permission name="com.google.android.apps.nexuslauncher.permission.READ_SETTINGS" />
        <permission name="com.google.android.apps.nexuslauncher.permission.WRITE_SETTINGS" />
    </privapp-permissions>

    <privapp-permissions package="com.google.android.gsf">
        <permission name="android.permission.ACCESS_CACHE_FILESYSTEM"/>
        <permission name="android.permission.BACKUP"/>
        <permission name="android.permission.CHANGE_COMPONENT_ENABLED_STATE"/>
        <permission name="android.permission.DUMP"/>
        <permission name="android.permission.INTERACT_ACROSS_USERS"/>
        <permission name="android.permission.INVOKE_CARRIER_SETUP"/>
        <permission name="android.permission.MANAGE_USERS"/>
        <permission name="android.permission.MASTER_CLEAR"/>
        <permission name="android.permission.READ_DREAM_STATE"/>
        <permission name="android.permission.READ_LOGS"/>
        <permission name="android.permission.READ_NETWORK_USAGE_HISTORY"/>
        <permission name="android.permission.REBOOT"/>
        <permission name="android.permission.RECEIVE_DATA_ACTIVITY_CHANGE"/>
        <permission name="android.permission.RECOVERY"/>
        <permission name="android.permission.SET_TIME"/>
        <permission name="android.permission.STATUS_BAR"/>
        <permission name="android.permission.UPDATE_DEVICE_STATS"/>
        <permission name="android.permission.WRITE_GSERVICES"/>
        <permission name="android.permission.WRITE_SECURE_SETTINGS"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.partnersetup">
        <permission name="android.permission.CHANGE_COMPONENT_ENABLED_STATE"/>
        <permission name="android.permission.CHANGE_CONFIGURATION"/>
        <permission name="android.permission.READ_PRIVILEGED_PHONE_STATE"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.carriersetup">
        <permission name="android.permission.CONNECTIVITY_USE_RESTRICTED_NETWORKS"/>
        <permission name="android.permission.MODIFY_PHONE_STATE"/>
        <permission name="android.permission.READ_PRIVILEGED_PHONE_STATE"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.apps.wallpaper">
        <permission name="android.permission.BIND_WALLPAPER"/>
        <permission name="android.permission.CHANGE_OVERLAY_PACKAGES"/>
        <permission name="android.permission.READ_WALLPAPER_INTERNAL"/>
        <permission name="android.permission.SET_WALLPAPER_COMPONENT"/>
        <permission name="android.permission.WRITE_SECURE_SETTINGS"/>
        <permission name="android.permission.MODIFY_DAY_NIGHT_MODE"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.feedback">
        <permission name="android.permission.READ_LOGS"/>
        <permission name="android.permission.PACKAGE_USAGE_STATS"/>
    </privapp-permissions>

    <privapp-permissions package="com.android.yadayada">
        <permission name="android.permission.START_ACTIVITIES_FROM_BACKGROUND"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.pixel.setupwizard">
        <permission name="android.permission.CHANGE_CONFIGURATION"/>
        <permission name="android.permission.GET_ACCOUNTS_PRIVILEGED"/>
        <permission name="android.permission.MANAGE_USERS"/>
        <permission name="android.permission.STATUS_BAR"/>
        <permission name="android.permission.WRITE_SECURE_SETTINGS"/>
        <permission name="android.permission.SHUTDOWN"/>
        <permission name="android.permission.START_ACTIVITIES_FROM_BACKGROUND"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.grilservice">
        <permission name="android.permission.INTERACT_ACROSS_USERS"/>
        <permission name="android.permission.READ_PRIVILEGED_PHONE_STATE"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.connectivitymonitor">
        <permission name="android.permission.DUMP"/>
        <permission name="android.permission.INTERACT_ACROSS_USERS_FULL"/>
        <permission name="android.permission.MODIFY_PHONE_STATE"/>
        <permission name="android.permission.READ_PRECISE_PHONE_STATE"/>
        <permission name="android.permission.READ_PRIVILEGED_PHONE_STATE"/>
        <permission name="android.permission.BATTERY_STATS"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.connectivitythermalpowermanager">
        <permission name="android.permission.MODIFY_PHONE_STATE"/>
        <permission name="android.permission.READ_PRIVILEGED_PHONE_STATE"/>
        <permission name="android.permission.READ_NETWORK_USAGE_HISTORY"/>
        <permission name="android.permission.REGISTER_STATS_PULL_ATOM"/>
        <permission name="android.permission.READ_PRECISE_PHONE_STATE"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.gnsspixelmonitor">
        <permission name="android.permission.MODIFY_PHONE_STATE"/>
        <permission name="android.permission.ACCESS_FINE_LOCATION"/>
        <permission name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
        <permission name="android.permission.DUMP"/>
        <permission name="android.permission.REGISTER_STATS_PULL_ATOM"/>
    </privapp-permissions>

    <privapp-permissions package="com.android.refreshratecontrol">
        <permission name="android.permission.INTERACT_ACROSS_USERS_FULL"/>
        <permission name="android.permission.MANAGE_USERS"/>
    </privapp-permissions>

    <privapp-permissions package="com.android.hbmsvmanager">
        <permission name="android.permission.INTERACT_ACROSS_USERS_FULL"/>
        <permission name="android.permission.MANAGE_USERS"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.oslo">
        <permission name="android.permission.ACCESS_CONTEXT_HUB"/>
        <permission name="android.permission.CAPTURE_AUDIO_HOTWORD"/>
        <permission name="android.permission.MANAGE_SOUND_TRIGGER"/>
        <permission name="android.permission.MANAGE_USERS"/>
        <permission name="android.permission.MEDIA_CONTENT_CONTROL"/>
        <permission name="android.permission.MODIFY_AUDIO_ROUTING"/>
        <permission name="android.permission.MODIFY_PHONE_STATE"/>
        <permission name="android.permission.RECORD_AUDIO"/>
        <permission name="android.permission.RECEIVE_BOOT_COMPLETED"/>
        <permission name="android.permission.START_ACTIVITIES_FROM_BACKGROUND"/>
        <permission name="android.permission.USER_ACTIVITY"/>
        <permission name="android.permission.WRITE_SECURE_SETTINGS"/>
    </privapp-permissions>

    <privapp-permissions package="com.android.emergency">
        <!-- Required to place emergency calls from emergency info screen. -->
        <permission name="android.permission.CALL_PRIVILEGED"/>
        <permission name="android.permission.MANAGE_USERS"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.devicedropmonitor">
        <permission name="android.permission.ACCESS_CONTEXT_HUB"/>
        <permission name="android.permission.READ_DEVICE_CONFIG"/>
        <permission name="android.permission.RECEIVE_BOOT_COMPLETED"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.uvexposurereporter">
        <permission name="android.permission.ACCESS_CONTEXT_HUB"/>
        <permission name="android.permission.RECEIVE_BOOT_COMPLETED"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.iphealthmonitor">
        <permission name="android.permission.ACCESS_CONTEXT_HUB"/>
        <permission name="android.permission.RECEIVE_BOOT_COMPLETED"/>
    </privapp-permissions>

    <privapp-permissions package="com.google.android.turboadapter">
        <permission name="android.permission.DUMP"/>
    </privapp-permissions>
</permissions>
EOF
