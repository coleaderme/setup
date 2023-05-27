#!/usr/bin/env python

###########################################################
## What it does?
# - FIX "error reading header" in your mp4/m4a files.

## Requirement
# - Arch linux: sudo pacman -S gpac
###########################################################

from glob import glob
from subprocess import run

## file format
EXT = ".m4a" # ".mp4"

# Destination for fixed files.
run(['mkdir', 'fix_tracks'])

for i in glob(f"*{EXT}"):
    print(f"{i}...", end='')
    run([
        "MP4Box",
        "-add",
        f"{i}",
        "-new",
        f"fix_tracks/{i}"
        ])
    print("FIXED.")

print('ALL Done.')