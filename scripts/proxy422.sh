#!/usr/bin/sh
# ./proxy422.sh input.mp4 240
#  quality as in 240p-----^
[ -z "$1" ] && echo "[usage] ./proxy422.sh video.mp4 240" && exit

## faster (now 7.7x), original (4x)
ffmpeg -i "$1" -filter:v scale="$2":-1 -c:v prores_ks -profile:v 0 -vendor apl0 -q 4 -pix_fmt yuv422p10le "$1_$2.mov"
##############################################################
## OG: 1280x720: 3.5MB, 20s (cropped version)
## pro res 422 proxy
## original
# ffmpeg -i Chiropractors.mp4 -c:v prores_ks -profile:v 0 -vendor apl0 -bits_per_mb 8000 -pix_fmt yuv422p10le output.mov

## Downscale (auto)
# FileSize:7.71x # ffmpeg -i Chiropractors.mp4 -filter:v scale=480:-1 -c:v prores_ks -profile:v 0 -vendor apl0 -bits_per_mb 8000 -pix_fmt yuv422p10le down480p.mov
# FileSize:3.14x # ffmpeg -i Chiropractors.mp4 -filter:v scale=240:-1 -c:v prores_ks -profile:v 0 -vendor apl0 -bits_per_mb 8000 -pix_fmt yuv422p10le aaaa240p.mov
# FileSize:1.31x # ffmpeg -i Chiropractors.mp4 -filter:v scale=120:-1 -c:v prores_ks -profile:v 0 -vendor apl0 -bits_per_mb 8000 -pix_fmt yuv422p10le bbbb120p.mov
##############################################################