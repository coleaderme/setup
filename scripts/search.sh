#!/usr/bin/sh
# .config/fd/ignore <= items to ignore.
#
f="$(fd | dmenu -p "_>" -i -l 35 -fn InconsolataSemiCondensedBold)"
killall fd
killall dmenu
[ -z "$f" ] && exit # exit if none selected.

action=$(echo "open\nopen in explorer\nrename\ndelete" | dmenu -p "_>" -i -l 35 -fn InconsolataSemiCondensedBold)
[ -z "$action" ] && exit # exit if none selected.

open(){
case "$1" in
    *\.sh|*\.py|*\.c|*\.h|*\.rs|*\.js|*\.txt|*\.toml|*\.conf|*rc|*\.md) subl "$1" ;;
    *\.gif|*\.webm|*\.mkv|*\.mp4|*\.m4v) mpv --no-audio-display --volume=85 --replaygain-clip=yes --replaygain=album "$1" ;;
    *\.flac|*\.m4a|*\.ogg|*\.opus|*\.mp3) audacious ;;
    *\.jpg|*\.png|*\.webp) viewnior "$1" ;;
    *) echo "Unknown filetype: '$1'" | dmenu -p "_>" -l 1 -fn InconsolataSemiCondensedBold ;;
esac
}

open_in_explorer(){
    thunar "$1"
}

rename(){
    new_name=$(echo "$1" | dmenu -p "Rename as:" -l 1 -fn InconsolataSemiCondensedBold)
    mv "$1" "$new_name"
}

delete(){
    echo "$1" | dmenu -p "Deleted:" -l 1 -fn InconsolataSemiCondensedBold
    rm "$1"
}

case "$action" in
    open) open "$f" ;;
    *explorer) open_in_explorer "$f" ;;
    rename) rename "$f" ;;
    delete) delete "$f" ;;
esac