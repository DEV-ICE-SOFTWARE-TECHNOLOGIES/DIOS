#!/usr/bin/env bash -i
##################################
## Copyright © 2024 Marius Kopp ##
##################################

set -eu

source ./ADIOS.cfg

echo ""
echo "STARTING D!OS INIT..."
echo ""

echo ""
echo ""
echo "INSTALLING DEPENDENCIES..."
echo ""

sudo pacman -Syu

reqSpace=400000000
availSpace=$(df "$DIOS_PATH" | awk 'NR==2 { print $4 }')
if ((availSpace < reqSpace)); then
    echo -e "${RED}NOT ENOUGH FREE SPACE!" >&2
    exit 1
fi

if [ ! -d ~/bin ]; then
    mkdir -p ~/bin
fi

curl http://commondatastorage.googleapis.com/git-repo-downloads/repo >~/bin/repo
chmod a+x ~/bin/repo

if ! grep -qxF '# DIOS' ~/.bashrc; then

    echo '' >>~/.bashrc
    echo '# DIOS' >>~/.bashrc
    echo 'export PATH=~/bin:$PATH' >>~/.bashrc
    echo 'export USE_CCACHE=1' >>~/.bashrc
    echo 'export CCACHE_EXEC=/usr/bin/ccache' >>~/.bashrc
    echo 'export CCACHE_DIR=/mnt/ccache' >>~/.bashrc
    echo 'export ALLOW_MISSING_DEPENDENCIES=true' >>~/.bashrc

fi

echo ""
echo "CREATING CCACHE..."
echo ""

source ~/.bashrc

if [ ! -d /mnt/ccache ]; then

    sudo mkdir /mnt/ccache

fi

if [ ! -d ~/.ccache ]; then

    mkdir ~/.ccache

fi

if ! grep -qxF '~/.ccache                                 /mnt/ccache    none    defaults,bind,users,noauto 0 0' /etc/fstab; then

    echo '~/.ccache                                 /mnt/ccache    none    defaults,bind,users,noauto 0 0' | sudo tee -a /etc/fstab >/dev/null
    echo '' >>~/.profile
    echo 'export mount /mnt/ccache' >>~/.profile

fi

sudo mount -a

sudo mount --bind ~/.ccache /mnt/ccache

sudo ccache -M $CCACHE_SIZE -F 0

if swapon --show | grep -Eq '/swapfile|/dev/'; then
    echo "SWAP ALREADY EXISTS. RESIZING..."

    sudo swapoff -a

    sudo fallocate -l $SWAP_SIZE /swapfile

    sudo mkswap /swapfile

    sudo swapon /swapfile

    systemctl daemon-reload

    echo ""
    echo "SWAP FILE RESIZED SUCCESSFULLY"
    echo ""

else

    echo "SWAP NOT FOUND. CREATING A NEW $SWAP_SIZE SWAP FILE..."

    sudo fallocate -l $SWAP_SIZE /swapfile
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile

    echo '/swapfile none swap sw 0 0' | sudo tee  

    -a /etc/fstab

    systemctl daemon-reload

    echo ""
    echo "SWAP FILE CREATED SUCCESSFULLY"
    echo ""
fi

git config --global user.email $EMAIL

git config --global user.name $NAME

repo init -u $REPO -b $BRANCH

sh DIOS_MANIFEST_XMLS.sh

echo 'DOWNLOADING CODE...'

repo sync -j$(nproc) -c -q || true

sh DIOS_BINARIES.sh

sh DIOS_DEVICE_TARGETS.sh

echo ""
echo -e "${RED}PREPARED! RESTART THE SCRIPT TO START BUILDING..."

sed -i 's/^INITIALIZED=.*/INITIALIZED=true/' $DIOS_PATH/ADIOS.cfg

echo ""
echo "D!OS INIT COMPLETED..."
echo ""

exit
