#!/bin/bash

# Usage: getimg.sh filename
#   stdin url list with newline
#   File created for each url at tmp dir with provided name, file path printed each time
# e.g. playerctl -p spotify -F metadata mpris:artUrl | scripts/getimg.sh cover
# will download the cover url each time a new track is played on spotify

tmp_dir="/tmp/eww/images/"

if [ ! -d $tmp_dir ]; then
    mkdir -p $tmp_dir
fi

filename=$1

while read -r url; do
    path=$tmp_dir$filename
    curl $url > $path
    echo $path
done