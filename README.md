<p align="center">

# D!OS

![DIOS IMAGE](https://github.com/DEV-ICE-SOFTWARE-TECHNOLOGIES/DIOS/blob/main/DIOS.png)

ANDROID BUILD A.I.

</p>

# WHAT DOES IT DO? FULLY AUTOMATED ANDROID BUILDING! ALMOST...

- It does initialize preferred Android Code and Device Trees

- Optimizes Android Build Times with:
- CCACHE Setup and Mounting
- SWAP File check and creation

- Downloads and adds Pixel and Xpiera Firmware Parts

- Optimizes Android Code further

- Makes DIOS. The OS aimed by This Project

- Builds Android for You with desired Changes

- Flashs Android to Your Device

- And even more...


# QUICK START GUIDE

1. Use a Distro with KDE Plasma (For unified Development and kdialog)

2. Use Discover to download GitHub Desktop and clone this Repo with it

3. Create the DIOS Directory: mkdir ~/dios

4. Move all the DIOS Files You cloned before into ~/dios

5. Inside of ADIOS.cfg:

- BRANCH=android-13.0.0_r16 (For Example)

- REPO=https://android.googlesource.com/platform/manifest  (For Example)

- EMAIL=mariuskopp517@gmail.com  (For Example)

- LUNCH_CHOICE=aosp_xqbc52-userdebug  (For Example)

- NAME=M1U5T0N3  (For Example)


Set these Variables for Your needs (Don't use My Identity)

NAME is which Identity we use on Git


6. Run the BUILD A.I. from the DIOS Folder...
```
cd ~/dios
bash ./DIOS.sh -i
```

7. Run a DIOS build with:
```
bash ./DIOS.sh -fp -p
```
# DEBUG

adb logcat -v long > DIOS.txt 
You can also do "set -euv" on top of the Scripts

# TO-DO

- Including of Google Binary Device File Downloads (WIP)
- Generate Fork File Lists for the build Process (WIP)
- Cleanup Scripts
