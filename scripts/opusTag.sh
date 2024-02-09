#!/usr/bin/env sh
# simple opus tag manager sh
#
reading(){
    ## manually checking title and artist, one by one
    for i in ./*.opus
    do
        echo "OPEN: $i"
        T=$(ffprobe -hide_banner -loglevel 32 "$i" 2>&1 | rg -i "title" | cut -d ":" -f2 | sd -s '_' ' ')
        A=$(ffprobe -hide_banner -loglevel 32 "$i" 2>&1 | rg -i "artist" | cut -d ":" -f2 | sd -s '_' ' ')
        echo $T - $A
        read -p "STOP: " ans
    done
}
# reading

writing(){
    file="$1"
    echo "OPEN: $file"
    w_artist=$(echo "$file" | cut -d "-" -f1 | choose -c 6:-2)
    w_title=$(echo "$file" | cut -d "-" -f2 | choose -c 1:-6)
    ## check if tags written already.
    T=$(ffprobe -hide_banner -loglevel 32 "$file" 2>&1 | rg -i "title")
    [ -z "$T" ] && opustags -a title="$w_title" -a artist="$w_artist" -i "$file" && ffprobe -hide_banner -loglevel 32 "$file" || echo "title is already written"
}

for i in ./*.opus
do
    writing "$i"
done
