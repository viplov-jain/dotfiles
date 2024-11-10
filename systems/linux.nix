{ pkgs, ... }:
{
  imports = [
    ./common.nix
    ../notifications/dunst.nix
  ];

  home.packages = with pkgs; [
    qemu

    libgcc

    # Utils
    xdg-utils
    socat

    playerctl

    papirus-icon-theme
    # File explorer
    xfce.thunar

    # Hyprland
    hyprpaper
    hyprlock
    hypridle
    rofi-wayland
    wl-clipboard

    # GUI
    cava
    waybar
    eww

    # Browsers
    firefox
    librewolf
    ungoogled-chromium

    vlc
  ];

  home.file = {
    ".config/hypr".source = ../hypr;
    ".config/eww".source = ../eww;
    ".config/waybar".source = ../waybar;
    ".config/btop".source = ../btop;
  };
}