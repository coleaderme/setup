#!/usr/bin/sh
action="$(printf "write\nread" | dmenu -i -l 5)"
case "$action" in
    write) xsel >> ~/.cache/cliptest.txt ;;
    read) dmenu -i -l 10 < ~/.cache/cliptest.txt | xsel -ib ;;
    *) exit ;;
esac