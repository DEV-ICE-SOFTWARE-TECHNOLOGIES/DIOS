#!/usr/bin/env bash -i
##################################
## Copyright © 2026 Marius Kopp ##
##################################

set -eu

source ADIOS.cfg

echo ""
echo "STARTING D!OS XIAOMI FORK..."
echo ""

rm -rf "$XIAOMI_FORKS"

if [ ! -d "$XIAOMI_FORKS" ]; then

    mkdir -p "$XIAOMI_FORKS"

fi

if [ ! -f "$XIAOMI_FILE" ]; then

    read -n 1 -p "DO YOU WANT TO DOWNLOAD XIAOMI FIRMWARE (Y/N)?" fork
    echo

    if [[ "$fork" =~ ^[Nn]$ ]]; then

        exit 1

    fi

    echo ""

    pushd "$DIOS_FORKS" >/dev/null

    wget https://xm04.space/MyUrLiwlJzsOOD0BMz8GIywRNEEOFTAINBUpIzE/KzUOPDJBGyEELhsQMDUxIS0eGz8dLzE/Hx4OFQRBDjwfDDQ8Kw8bFQQeNBIuAA4KBCYzPC0wMQofHg4KHwwxED0kQh4nLycSIh4nFjkvJxIXPEIJMBYDLTUfDhEwFywKPS88ES0jORU0LSwwPSRCHicvJxIiHicWOS8nEhc8QgkwFgMtNR88HgdBJwI5QR8DCRcOAh1BJxYdLycWGhwnAzkvJwQ9AjEtOgAfFkA1OQIJHgUhGwEOICsgCyAAOicDLCIFAwkRJx4pACdBExM=

    popd >/dev/null

fi

if [ -d "$XIAOMI_TMP" ]; then

    rm -rf "$XIAOMI_TMP"

fi

mkdir -p "$XIAOMI_TMP"

pushd "$XIAOMI_TMP" >/dev/null

notify-send "DIOS A.I. MAY REQUIRE ROOT!"

echo ""
echo "UNZIPPING XIAOMI FIRMWARE..."
echo ""

tar -xzvf "$XIAOMI_FILE" --strip-components=1

SUPER_IMG=$(find . -name "super.img" | head -n 1)

if [ -z "$SUPER_IMG" ]; then
    echo "Fehler: super.img nicht gefunden!" >&2
    exit 1
fi

if command -v simg2img >/dev/null 2>&1; then
    simg2img "$SUPER_IMG" super.raw.img 2>/dev/null || cp "$SUPER_IMG" super.raw.img
else
    cp "$SUPER_IMG" super.raw.img
fi

lpunpack super.raw.img .

echo ""
echo "EXTRACTING XIAOMI FIRMWARE..."
echo ""

mkdir -p "$XIAOMI_PRODUCT_TMP"

sudo mount -o ro product.img "$XIAOMI_PRODUCT_TMP"

mkdir -p "$XIAOMI_SYSTEM_TMP"

sudo mount -o ro system.img "$XIAOMI_SYSTEM_TMP"

mkdir -p "$XIAOMI_VENDOR_TMP"

sudo mount -o ro vendor.img "$XIAOMI_VENDOR_TMP"

mkdir -p "$XIAOMI_SYSTEM_EXT_TMP"

sudo mount -o ro system_ext.img "$XIAOMI_SYSTEM_EXT_TMP"

wait

echo ""
echo "PREPARING XIAOMI FIRMWARE..."
echo ""

cp -rf "$XIAOMI_PRODUCT_TMP" "$XIAOMI_PRODUCT" || true
cp -rf "$XIAOMI_SYSTEM_TMP" "$XIAOMI_SYSTEM" || true
cp -rf "$XIAOMI_SYSTEM_EXT_TMP" "$XIAOMI_SYSTEM_EXT" || true
cp -rf "$XIAOMI_VENDOR_TMP" "$XIAOMI_VENDOR" || true

notify-send "DIOS A.I. MAY REQUIRE ROOT!"

sudo umount "$XIAOMI_PRODUCT_TMP"
sudo umount "$XIAOMI_SYSTEM_TMP"
sudo umount "$XIAOMI_SYSTEM_EXT_TMP"
sudo umount "$XIAOMI_VENDOR_TMP"

popd >/dev/null

rm -rf "$XIAOMI_TMP"

echo ""
echo "D!OS XIAOMI FORK COMPLETED..."
echo ""