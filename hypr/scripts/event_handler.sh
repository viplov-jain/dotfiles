#!/bin/sh

handle_focusedmon() {
    readarray -td, a <<<"$1"
    case $a in 
        eDP-1) eww update focused_monitor=0 ;;
        DP-2) eww update focused_monitor=1 ;;
    esac
}

handle() {
  case $1 in
    focusedmon*) handle_focusedmon "${1#focusedmon>>*}" ;;
    monitoradded*) killall waybar && waybar& ;;
    monitorremoved*) killall waybar && waybar& ;;
  esac
}

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done