#!/usr/bin/sh
f="$(fd -tf -e mp3 -e opus -e m4a -e flac -e wav -e mkv -e webm -e mp4 -e m4v -a | dmenu -i -l 20 -fn InconsolataSemiCondensedBold)"
[ -z $f ] || mpv --replaygain=album --no-audio-display "$f"
# empty OR not empty - simple.
# if file is empty, don't do anything.
# otherwise pass it to mpv.