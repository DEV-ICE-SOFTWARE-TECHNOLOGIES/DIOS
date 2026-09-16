#!/usr/bin/env bash -i
##################################
## Copyright © 2026 Marius Kopp ##
##################################

set -eu

source ADIOS.cfg

echo ""
echo "STARTING D!OS XIAOMI FORK..."
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_FIRMWARE_PATH="$DIOS_FORKS/$XIAOMI_IMAGE"
TMP_EXTRACT_DIR="$SCRIPT_DIR/tmp_extract"

mkdir -p "$DIOS_FORKS" "$TMP_EXTRACT_DIR"

if [ -f "$TARGET_FIRMWARE_PATH" ]; then
    echo "FIRMWARE  ($XIAOMI_IMAGE) ALREADY EXISTS IN $DIOS_FORKS"
else
    read -n 1 -p "DO YOU WANT TO DOWNLOAD XIAOMI FIRMWARE (Y/N)? " fork
    echo

    if [[ "$fork" =~ ^[Nn]$ ]]; then
        exit 1
    fi

    echo ""
    echo "DOWNLOADING XIAOMI FIRMWARE..."
    wget -c -O "$TARGET_FIRMWARE_PATH" "$XIAOMI_FIRMWARE"
fi

echo ""
echo "EXTRACTING FIRMWARE BLOBS VIA DIOS_UNPACK.PY..."
echo ""

TMPDIR="$TMP_EXTRACT_DIR" "$SCRIPT_DIR/DIOS_UNPACK.py" \
    "$TARGET_FIRMWARE_PATH" \
    "$SCRIPT_DIR/DIOS_FORK_XIAOMI_DUMP"

echo ""
echo "D!OS XIAOMI FORK COMPLETED..."
echo ""