#!/usr/bin/sh
qrencode -t ansiutf8 "$(xsel -b)"
