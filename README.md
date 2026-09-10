<p align="center">

# DIOS - Dev Ice Operating System

![DIOS IMAGE](https://github.com/DEV-ICE-SOFTWARE-TECHNOLOGIES/DIOS/blob/obsolete/DIOS.png)

D!OS BUILD A.I.

</p>

# WHAT DOES IT DO? FULLY AUTOMATED ANDROID BUILDING! ALMOST...

- It does initialize preferred Android Code and Device Trees

- Optimizes Android Build Times with:
- CCACHE Setup and Mounting
- SWAP check and creation

- Downloads and adds Pixel and Xiaomi Firmware Parts

- Optimizes Android Code further

- Builds DIOS. The OS aimed by This Project

- Builds Android for You with desired Changes

- Flashs DIOS/Android to Your Device

- And even more...


# QUICK START GUIDE

1. Use a Distro based on UBUNTU like KUBUNTU

2. Download / clone this Repo https://github.com/DEV-ICE-SOFTWARE-TECHNOLOGIES/DIOS

3. Create the DIOS Directory: mkdir ~/dios

4. Move all the DIOS Files You have cloned in Step 2 into ~/dios

5.  Set these Variables for Your needs (Don't use My Identity) inside of ADIOS.cfg:


- LUNCH_CHOICE=DIOS_DEVICE-userdebug (Replace "DEVICE" with Your Target like myron)

- BRANCH=lineage-24.0

- PIXEL_IMAGE=cheetah-tq2a.230505.002-factory-fe44ced0.zip (Replace with another Filename from Google if needed)

- XIAOMI_IMAGE=myron_images_OS3.0.306.0.WPMCNXM_20260519.0000.00_16.0_cn_142ab138fb.tgz (Important for Trees)

- EMAIL=mariuskopp517@gmail.com (GitHub Email (My example))

- NAME=miustone (GitHub Username (My example))

- SWAP_SIZE=32G (32G Minimum!)



6. Run the BUILD A.I. from the DIOS Folder...
```
cd ~/dios
bash DIOS.sh -i
```

7. Run a DIOS build with:
```
sh DIOS.sh -fp -p
```
# DEBUG

bash -x DIOS.sh

# TO-DO

- IBM Design Language integration (Android UI Overhaul Overlay)
- DIOS Settings Entry (Unifying non AOSP UI Options)
- DIOS OnDevIce A.I. (Offline A.I. Assistant)
- Generate Fork File Lists for the build Process (WIP)
- Cleanup Scripts
