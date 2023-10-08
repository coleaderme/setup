#!/usr/bin/sh
# .config/fd/ignore <= items to ignore.
#
f="$(fd -H | dmenu -p "_>" -i -l 30 -fn InconsolataSemiCondensedBold)"
killall fd
killall dmenu
[ -z "$f" ] && exit
case "$f" in
  *\.sh|*\.py|*\.c|*\.h|*\.rs|*\.js|*\.txt|*\.toml|*\.conf|*rc) subl "$f" ;;
  # *\.flac|*\.m4a|*\.gif|*\.ogg|*\.opus|*\.mp3|*\.webm|*\.mkv|*\.mp4|*\.m4v) mpv "$f" ;;
  *\.gif|*\.webm|*\.mkv|*\.mp4|*\.m4v) mpv --no-audio-display --replaygain=album "$f" ;;
  *\.flac|*\.m4a|*\.ogg*\.opus|*\.mp3) audacious "$f" ;;
  *\.jpg|*\.png|*\.webp) viewnior "$f" ;;
  *) thunar "$f" ;;
esac