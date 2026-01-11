{ pkgs, ... }:
{
  imports = [
    ./common.nix
    ../dunst
    ../eww
  ];

  home.packages = with pkgs; [
    vscodium
    libllvm
    perf

    # Utils
    xdg-utils
    socat

    playerctl

    papirus-icon-theme
    # File explorer
    nautilus
    kdePackages.dolphin

    # Hyprland
    hyprpaper
    hyprlock
    hypridle
    rofi
    wl-clipboard

    transmission_4-qt
    # GUI
    waybar

    # Browsers
    firefox
    librewolf
    ungoogled-chromium
    brave

    vlc
    geeqie

    ghostty
  ];

  home.file = {
    ".config/hypr".source = ../hypr;
    ".config/waybar".source = ../waybar;
  };
}
