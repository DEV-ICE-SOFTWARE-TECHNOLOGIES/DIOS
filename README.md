# D!OS

![DIOS IMAGE](https://github.com/DEV-ICE-SOFTWARE-TECHNOLOGIES/DIOS/blob/main/DIOS.png)


BUILD A.I. that makes Android for Humans with ease...

Welcome to the Android Revolution!

# WHAT DOES IT DO?

Simple. 

It does initialize preferred Android Code and Device Trees

Optimizes Android Build Times

Adds Pixel and Xpiera Firmware Parts

Optimizes Android Code further

Makes DIOS. The OS made by This Project

Builds Android for You with desired Changes

Flashs Android to Your Device

And even more...


# QUICK START GUIDE

1. Install AOSP-DEVL AUR Package to get the needed Build Tools

2. Use ARCH/Manjaro Linux and download Discover to download GitHub Desktop.

3. Download https://github.com/DEV-ICE-SOFTWARE-TECHNOLOGIES/DIOS_INSTALLER with it. 

4. You may also like Visual Studio Code as Editor and Flatseal.

5. Run the Installer:
```
zsh ./INSTALL_DIOS.sh
```


6. Inside of DIOS.sh:

- BRANCH=android-13.0.0_r16

- REPO=https://android.googlesource.com/platform/manifest

- TREE=https://github.com/sonyxperiadev/local_manifests

- EMAIL=mariuskopp517@gmail.com

- LUNCH_CHOICE=aosp_xqbc52-userdebug

- NAME=M1U5T0N3

- USERNAME=miustone

Set these Variables for Your needs (Don't use My Identity)

NAME is what we use on Git while USERNAME is Your OS Username

Download the Sony Xperia Software Binaries and place the Zip Content on ~/dios

Rename the Software Binaries to "oem_sagami" or the platform You are using

7. Run the BUILD A.I. from the DIOS Folder...

A usage Description of the DIOS BUILD A.I. can be displayed via:
```
cd ~/dios
zsh ./DIOS.sh -h
```

# DEBUG

adb logcat -v long > DIOS.txt 

# TO-DO

- Cleanup Scripts
- More Logical Scripts
- Make ccache Mount at Boot
- Give Build Output Infos to the Scripts
