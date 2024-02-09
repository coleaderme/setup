#!/usr/bin/env bash
# Mass tag editor for opus YT rips.
# best for mass editing for single artist/album
#
for f in ./*.opus
do 
    title="$(echo "${f%.*}" | cut -b3-)"              ##<<----- removes "./" & ".opus"
    opustags -a title="$title" -i "$f"
    # opustags -a artist="FarooqGotAudio" -i "$f"     ##<<------ can be used on same line.
done