#!/usr/bin/sh
# .config/fd/ignore <= items to ignore.
#
f="$(fd -H | dmenu -p "_>" -i -l 30 -fn InconsolataSemiCondensedBold)"
[ -z "$f" ] && exit
## case is amazing!!
case "$f" in
  *\.sh|*\.py|*\.c|*\.h|*\.rs|*\.js) subl "$f" ;;
  *\.flac|*\.m4a|*\.ogg|*\.opus|*\.mp3|*\.webm|*\.mkv|*\.mp4|*\.m4v) mpv "$f" ;;
  *)     thunar "$f" ;;
esac
