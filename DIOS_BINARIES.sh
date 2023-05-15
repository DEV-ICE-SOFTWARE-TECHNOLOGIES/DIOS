#!/usr/bin/env bash -i
##################################
## Copyright © 2023 Marius Kopp ##
##################################

set -eu

source ./ADIOS.cfg

if [ ! -f $DIOS_VENDOR/$PIXEL_BINARIES ]; then

    echo ""
    echo "DOWNLOADING D!OS PIXEL BINARIES..."
    echo ""

    pushd "$DIOS_VENDOR" >/dev/null

    curl --output - https://dl.google.com/dl/android/aosp/$PIXEL_BINARIES | tar -xzvf -

    for file in extract*.sh; do mv "$file" extract.sh; done

    tail -n +315 extract.sh | tar -zxvf -

    popd >/dev/null

    echo ""
    echo "PIXEL BINARIES DOWNLOADED AND EXTRACTED..."
    echo ""

fi
