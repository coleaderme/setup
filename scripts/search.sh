#!/usr/bin/sh
f="$(fd -H | dmenu -p "_>" -i -l 30 -fn InconsolataSemiCondensedBold)"
## thunar can locate files/Dirs.
# [ -z "$f" ] || thunar "$f" #|| thunar "$(dirname "$f")"

[ -z "$f" ] && exit # exit if none selected.

case "$f" in
  *\.sh|*\.py|*\.c|*\.h|*\.rs|*\.js) subl "$f" ;;
  *\.flac|*\.m4a|*\.ogg|*\.opus|*\.mp3|*\.webm|*\.mkv|*\.mp4|*\.m4v) mpv "$f" ;;
  *)     thunar "$f" ;;
esac