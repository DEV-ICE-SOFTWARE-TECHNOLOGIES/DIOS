# sodp

Helper scripts to be used with sodp.

Main script is a build script to build aosp 11 for xperia devices using linux kernel 4.14 and including opengapps.

A usage description of the scripts can be displayed via:
```
build.sh -h|--help
```

Please be aware that these scripts are not appropriate for a developer aosp tree that contains
changes but should only be used on clean trees, since the script will do things like:
- delete files
- git hard resets
- git checkouts

For general build instructions how to setup and build aosp for xperia see:\
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

