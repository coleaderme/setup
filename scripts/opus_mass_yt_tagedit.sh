#!/usr/bin/env bash
# Mass tag editor for opus YT rips.
# best for mass editing for single artist/album
#
for f in *.sh
do
    title="${f%.*}"                                   ##<<----- removes  file.ext
    echo "$title"
    # opustags -a title="$title" -i "$f"
    # opustags -a artist="FarooqGotAudio" -i "$f"     ##<<------ can be used on same line.
done
