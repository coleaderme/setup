#!/usr/bin/sh
# .config/fd/ignore <= items to ignore.
#
f="$(fd | dmenu -p "_>" -i -l 35)"
killall fd
killall dmenu
[ -z "$f" ] && exit # exit if none selected.

action=$(echo "open\nopen_with\nopen_in_explorer\nrename\ndelete" | dmenu -p "_>" -i -l 7)
[ -z "$action" ] && exit # exit if none selected.

open(){
case "$1" in
    *\.sh|*\.py|*\.c|*\.h|*\.rs|*\.js|*\.txt|*\.toml|*\.conf|*rc|*\.md) subl "$1" ;;
    *\.gif|*\.webm|*\.mkv|*\.mp4|*\.m4v) mpv --no-audio-display --volume=85 "$1" ;;
    *\.flac|*\.m4a|*\.ogg|*\.opus|*\.wav|*\.mp3) audacious -e "$1" ;;
    *\.jpg|*\.png|*\.webp) viewnior "$1" ;;
    *) echo "Unknown filetype: '$1'" | dmenu -p "_>" -i -l 1 ;;
esac
}

open_with(){
app=$(echo "audacious\nmpv\nspek\nviewnior" | dmenu -p "_>" -i -l 7)
[ -z "$app" ] && exit
case "$app" in
    audacious) audacious "$1" ;;
    mpv) mpv --no-audio-display --volume=85 "$1" ;;
    spek) spek "$1" ;;
    viewnior) viewnior "$1" ;;
esac
}

open_in_explorer(){
    thunar "$1"
}

rename(){
    fpath="$(dirname "$1")"
    ext="$(echo "$1" | choose -f '\.' -1)"
    new_name="$(echo "$1" | dmenu -p "Rename as:" -i -l 1)"
    mv "$1" "$fpath/$new_name.$ext"
}

delete(){
    echo "$1" | dmenu -p "Deleted:" -l 1
    rm "$1"
}

case "$action" in
    open) open "$f" ;;
    open_with) open_with "$f" ;;
    open_in_explorer) open_in_explorer "$f" ;;
    rename) rename "$f" ;;
    delete) delete "$f" ;;
esac