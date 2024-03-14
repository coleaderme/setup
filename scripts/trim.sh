#!/usr/bin/env bash
[ -z "$1" ] && printf " USAGE:\n    ./trim.sh file s_time end_time\n    ./trim.sh file 00:00 47:52\n    ./trim.sh file 12:45 30:10\n" && exit
[ -z "$2" ] && printf " USAGE:\n    ./trim.sh file s_time end_time\n    ./trim.sh file 00:00 47:52\n    ./trim.sh file 12:45 30:10\n" && exit
[ -z "$3" ] && printf " USAGE:\n    ./trim.sh file s_time end_time\n    ./trim.sh file 00:00 47:52\n    ./trim.sh file 12:45 30:10\n" && exit

printf "[+] processing..\n"
case "$4" in
    "") ffmpeg -i "$1" -ss 00:"$2" -t 00:"$3" -loglevel warning -c:v copy -c:a copy "short_$1" ;;
    *) ffmpeg -i "$1" -ss 00:"$2" -t 00:"$3" -loglevel warning -c:v copy -c:a copy "$4.mp4" ;;
esac
printf "[+] done\n"
