#!/bin/sh

toggle() {
    if eww state | grep USERNAME; then
        eww close $1
    else 
        eww open $1
    fi
}

case $(hyprctl activeworkspace -j | jq '.["monitorID"]') in 
    0) toggle "widgetbox0" ;;
    1) toggle "widgetbox1" ;;
esac
