{ pkgs, ... }:
{
  imports = [
    ./common.nix
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

    transmission_4-qt
    # Browsers
    ungoogled-chromium
    brave

    vlc
    geeqie

  ];

  home.file = {
  };
}
