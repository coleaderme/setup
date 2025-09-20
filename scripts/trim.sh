#!/usr/bin/env sh
[ -z "$3" ] && printf " USAGE:\n    ./trim.sh file s_time end_time\n    ./trim.sh file MM:SS MM:SS\n    ./trim.sh file 12:45 30:10\n" && exit
printf "[+] processing..\n"

ffmpeg -i "$1" -ss 00:"$2" -t 00:"$3" -loglevel warning -c:v copy -c:a copy "short_$1"

printf "[+] done\n"
