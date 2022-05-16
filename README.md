# D!OS

Automated Superuser Script to be used for building 
█▀▄ █ ▄▀▄ ▄▀▀ 
█▄▀ █ ▀▄▀ ▄█▀ 

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


To Initialize the Script:
```
env LUNCH_CHOICE=aosp_j9210-userdebug bash ./build.sh -i
```

To build Bahamut following Script call has to be done:
```
env LUNCH_CHOICE=aosp_j9210-userdebug bash ./build.sh
```

To apply Changes after the Script got updated use:
```
env LUNCH_CHOICE=aosp_j9210-userdebug bash ./build.sh -c -u
```

You can also combine Variables like:
```
env LUNCH_CHOICE=aosp_j9210-userdebug bash ./build.sh c -u
```

An overview of the latest branches can be found here:\
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
KEEP IN MIND. After updating and cleaning do You have to run the Script a second Time.
The Clean removes Content of DIOS which needs to get re-placed with a second "make"!

### MAKE SURE
To set up the Script, open it and edit:
- DEVICE=bahamut (Your Devices target out Location)
- EMAIL=YOURACTUAL@EMAIL.XXX
- IMAGE_NAME=GRABFROMGOOGLE (dont change that unless You are a GOD)
- NAME=YOURREAL NAME (or your DevName)
- USERNAME=${USERNAME:-~YOURUSERNAME} (Your Linux Username)
