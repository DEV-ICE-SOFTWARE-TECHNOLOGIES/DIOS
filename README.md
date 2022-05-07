# D!OS

Automated Superuser Scripts to be used for building D!OS

Main Script is a build Script to build D!OS 12.1 for XPERIA Devices using Linux Kernel 4.19/5.4 and includes Google Apps...

A usage Description of the Scripts can be displayed via:
```
build.sh -h|--help
```

WARNING:
The Script will use Superuser rights and does things like...
- Deleting Files
- Creating Files
- Eating much Storage
- Git hard resets
- Git checkouts
...Therefore the Script must not be used in a developers AOSP Tree with changed Files and/or local Commits. Both might get lost whe running this Scripts!

For general build Instructions how to setup and build AOSP for Xperias see:\
https://developer.sony.com/develop/open-devices/guides/aosp-build-instructions

The script contains following variables that can be set from outside.
The value after the colon is the default value.
```
SOURCE=${SOURCE:-~/android/source}
LUNCH_CHOICE=
```

To build bahamut following script call has to be done:
```
env LUNCH_CHOICE=aosp_j9210-userdebug ./build.sh
```

To switch to a different branch before building, call the script as follows:
```
./build.sh -b android-11.0.0_rXX
```

To switch to the 2020-10-05 branch while keeping the `.repo/local_manifests/` on the current
branch (e.g. android-11.0.0_r4) and building aosp 11 use:
```
./build.sh -b android-11.0.0_r4 -k
```

Please be aware that switching the aosp branch and keeping the local manifests branch is **not**
officially supported by the sodp (Sony Open Device Project).

An overview of available branches can be found here:\
https://source.android.com/setup/start/build-numbers

