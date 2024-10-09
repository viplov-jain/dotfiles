#!/bin/sh

handle_focusedmon() {
    readarray -td, a <<<"$1"
    case $a in 
        eDP-1) eww update focused_monitor=0 ;;
        DP-2) eww update focused_monitor=1 ;;
    esac
}

handle_monitoradd() {
    killall waybar && waybar& ;;
    for i in $(seq 2 9);
    do  
        hyprctl dispatch moveworkspacetomonitor "$i DP-2"
    done
}

handle() {
  case $1 in
    focusedmon*) handle_focusedmon "${1#focusedmon>>*}" ;;
    monitoradded*) handle_monitoradd() ;;
    monitorremoved*) killall .waybar-wrapped && waybar& ;;
  esac
}

socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock"| while read -r line; do handle "$line"; done$line"; done
