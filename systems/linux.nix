{ pkgs, ... }:
{
  imports = [
    ./common.nix
    ../dunst
    ../eww
  ];

  home.packages = with pkgs; [
    qemu

    # Utils
    xdg-utils
    socat

    playerctl

    papirus-icon-theme
    # File explorer
    nautilus
    dolphin

    # Hyprland
    hyprpaper
    hyprlock
    hypridle
    rofi-wayland
    wl-clipboard

    # GUI
    waybar

    # Browsers
    firefox
    librewolf
    ungoogled-chromium
    brave

    vlc
    geeqie
  ];

  home.file = {
    ".config/hypr".source = ../hypr;
    ".config/waybar".source = ../waybar;
  };
}
