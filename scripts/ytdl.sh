#!/usr/bin/sh
url=$(xsel -o)

herbe "Requested" "$url"

dl(){
    herbe "Downloading Video: " "$url"
    id=$(yt-dlp -F "$1" | dmenu -i -l 20 | choose 0)
    [ -z $id ] && exit
    yt-dlp -f "$id" --restrict-filenames --downloader aria2c "$url"
    herbe "Completed"
}

case "$url" in
    *http*) dl "$url" ;;
    *) exit;;
esac