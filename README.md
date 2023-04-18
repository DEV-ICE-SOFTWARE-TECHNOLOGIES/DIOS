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

5.  Set these Variables for Your needs (Don't use My Identity) inside of ADIOS.cfg:

- BRANCH=$(curl -s "$URL" | grep -o 'Pixel 7 Pro: android-[0-9]\+\.[0-9]\+\.[0-9]\+_r[0-9]\+' | awk '{print $2}' | sort -V | tail -n 1)

- EMAIL=mariuskopp517@gmail.com (GitHub Email example)

- LUNCH_CHOICE=DIOS_cheetah-userdebug (Replace cheetah with Your Device like panther)

- NAME=M1U5T0N3 (GitHub Username example)

- PIXEL_IMAGE=cheetah-tq2a.230405.003.e1-factory-1f04869e.zip (Place another Filename from a Download Link if needed)

- SWAP_SIZE=32G (U need to use a SWAP File with any RAM Size)

- XPERIA_IMAGE=notset (For later Use)


BRANCH can be changed by replacing 'Pixel 7 Pro: with eg. 'Pixel 6 Pro: or 'Pixel 7:


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