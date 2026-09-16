#!/usr/bin/env python3
##################################
## Copyright © 2026 Marius Kopp ##
##################################

import sys
import os
import argparse
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
TOOLS_DIR = SCRIPT_DIR / "tools" / "extract-utils"
if TOOLS_DIR.exists():
    sys.path.insert(0, str(TOOLS_DIR))

try:
    from extract_utils.extract import extract_dump
    from extract_utils.extract_context import ExtractContext
except ImportError:
    print("ERROR: extract_utils WAS NOT FOUND.")
    print("PLEASE ENSURE THAT tools/extract-utils IS PRESENT.")
    sys.exit(1)

def main():
    parser = argparse.ArgumentParser(
        description="D!OS UNIVERSAL FIRMWARE UNPACKER. EXTRACTS EVERYTHING (super.img, EROFS, TGZ, ZIP) WITHOUT REQUIRING A SPECIFIC DEVICE TREE OR CONFIGURATION."
    )
    parser.add_argument("firmware", help="Pfad zum Firmware-Archiv (.tgz, .zip, .img)")
    parser.add_argument("output_dir", help="Zielverzeichnis für den vollständigen Dump")
    
    args = parser.parse_args()

    firmware_path = Path(args.firmware).resolve()
    output_dir = Path(args.output_dir).resolve()

    if not firmware_path.exists():
        print(f"ERROR: FILE '{firmware_path}' DOES NOT EXIST!")
        sys.exit(1)

    output_dir.mkdir(parents=True, exist_ok=True)

    print(f"\n==========================================")
    print(f" D!OS UNPACKING FIRMWARE")
    print(f" FIRMWARE: {firmware_path.name}")
    print(f" OUTPUT DIR:  {output_dir}")
    print(f"==========================================\n")

    ctx = ExtractContext(
        source=str(firmware_path),
        dump_dir=str(output_dir),
    )

    try:
        extract_dump(str(output_dir), ctx)
        print(f"\n[SUCCESS] FIRMWARE SUCCESFULLY UNPACKED TO '{output_dir}'!")
    except Exception as e:
        print(f"\n[ERROR] FIRMWARE UNPACKING FAILED: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()