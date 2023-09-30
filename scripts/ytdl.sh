#!/usr/bin/sh
t=$(echo "Audio\nVideo" | dmenu -b -i -l 10 -fn InconsolataSemiCondensedBold)
[ -z $t ] && exit || [ $t = "Audio" ] && yt-dlp -x --restrict-filenames "$(xsel -o)" && exit ||  [ $t = "Video" ] && yt-dlp -f 'bestvideo[height<=1080]+251' --restrict-filenames --downloader aria2c "$(xsel -o)" && exit

# [ -z $t ] && exit || [ $t = "Audio" ] && echo "DL: Audio" && exit ||  [ $t = "Video" ] && echo "DL: Video" && exit
## much confused? let's break it down!

## First [ ]: checks for empty $t, if yes then EXIT.
## After first  ||, the [ ]: checks $t equal "Audio", if yes then DL:Audio, and then EXIT.
## After second ||, the [ ]: checks $t equal "Video", if yes then DL:Video, and then EXIT.
