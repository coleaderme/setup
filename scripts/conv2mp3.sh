#!/usr/bin/env sh

for f in ./inputf/*.flac; do
    # echo ffmpeg -i \""$f"\" -acodec libmp3lame -b:a 320k \""${f%.*}.mp3\""
    ffmpeg -i "$f" -acodec libmp3lame -b:a 320k "${f%.*}".mp3
done
