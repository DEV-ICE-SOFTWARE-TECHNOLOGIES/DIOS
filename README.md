<p align="center">

# DIOS - Dev Ice Operating System

![DIOS IMAGE](https://github.com/DEV-ICE-SOFTWARE-TECHNOLOGIES/DIOS/blob/main/DIOS.png)

D!OS BUILD A.I.

</p>

# WHAT DOES IT DO? FULLY AUTOMATED ANDROID BUILDING! ALMOST...

- It does initialize preferred Android Code and Device Trees

- Optimizes Android Build Times with:
- CCACHE Setup and Mounting
- SWAP check and creation

- Downloads and adds Pixel and Xpiera Firmware Parts

- Optimizes Android Code further

- Makes DIOS. The OS aimed by This Project

- Builds Android for You with desired Changes

- Flashs Android to Your Device

- And even more...


# QUICK START GUIDE

1. Use a Distro based on ARCH like Manjaro / Install the base-devel and aosp-devel AUR Packages

2. Download / clone this Repo https://github.com/DEV-ICE-SOFTWARE-TECHNOLOGIES/DIOS

3. Create the DIOS Directory: mkdir ~/dios

4. Move all the DIOS Files You have cloned before into ~/dios

5.  Set these Variables for Your needs (Don't use My Identity) inside of ADIOS.cfg:


- LUNCH_CHOICE=DIOS_cheetah-userdebug (Replace cheetah with Your Device like panther)

- BRANCH=android-13.0.0_r43

- PIXEL_BINARIES=google_devices-cheetah-tq2a.230505.002-e488f4d8.tgz (Replace with another Filename from Google if needed)

- PIXEL_IMAGE=cheetah-tq2a.230505.002-factory-fe44ced0.zip (Replace with another Filename from Google if needed)

- XPERIA_IMAGE=xperia.zip (For later Use)

- EMAIL=mariuskopp517@gmail.com (GitHub Email example)

- NAME=miustone (GitHub Username example)

- SWAP_SIZE=32G (U need to use SWAP with any RAM Size!)



6. Run the BUILD A.I. from the DIOS Folder...
```
cd ~/dios
sh DIOS.sh -i
```

7. Run a DIOS build with:
```
sh DIOS.sh -fp -p
```
# DEBUG

adb logcat -v long > DIOS.txt 
You can also do "set -euv" on top of the Scripts

# TO-DO

- IBM Design Language integration (Android UI Overhaul Overlay)
- DIOS Settings Entry (Unifying non AOSP UI Options)
- Generate Fork File Lists for the build Process (WIP)
- Cleanup Scripts
