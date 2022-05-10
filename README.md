# D!OS

Automated Superuser Script to be used for building D!OS (or AOSP)

Welcome to the Android Revolution...

A usage Description of the Script can be displayed via:
```
build.sh -h|--help
```

WARNING:
The Script will use Superuser rights and does things like...
- Deleting Files
- Creating Files
- Downloading Files
- Mounting Images
- Creating Folders
- Removing Folders
- Eating much Storage
- Flashing Your Xperia
- Git Updates and Repo Syncs
...Therefore the Script must not be used in a developers AOSP Tree with changed Files and/or local Commits. Both might get lost when running this Script!


The Script contains the following Variables that can be set from outside.
The Value after the Colon is the default Value...
```
LUNCH_CHOICE=
```

To build Bahamut following Script call has to be done:
```
env LUNCH_CHOICE=aosp_j9210-userdebug bash ./build.sh
```

To build AOSP for whatever Reason:
```
env LUNCH_CHOICE=aosp_j9210-userdebug bash ./build.sh -a
```


An overview of available branches can be found here:\
https://source.android.com/setup/start/build-numbers

HOW TO SET IT UP:

- Open a Terminal and type:
```
cd
```
Make the Main Folder for the whole Process:
```
mkdir ~/dios
```
Download this Repo as Zip File or clone with GitHub Desktop and place the build.sh
into the ~/dios Folder. Run the Script from there with Your Device Flags which You
can find in /home/yourusername/dios/device/sony/ after the first Init run.

### MAKE SURE
To set up:
- EMAIL=YOURACTUAL@EMAIL.XXX
- IMAGE_NAME=GRABFROMGOOGLE
- NAME=YOURREAL NAME
- USERNAME=${USERNAME:-~YOURUSERNAME}