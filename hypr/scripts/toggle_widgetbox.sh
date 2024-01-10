#!/bin/sh

toggle() {
    if [[ $(eww windows | grep $1) == "*"* ]]; then
        eww close $1
    else 
        eww open $1
    fi
}

case $(hyprctl activeworkspace -j | jq '.["monitorID"]') in 
    0) toggle "widgetbox0" ;;
    1) toggle "widgetbox1" ;;
esac