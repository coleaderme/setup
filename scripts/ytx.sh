#!/usr/bin/env sh
url=$(xsel -o)
herbe "Downlaoding Audio: " "$url"
yt-dlp -x --restrict-filenames "$url"
herbe "Completed"