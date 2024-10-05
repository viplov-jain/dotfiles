{ config, pkgs, ... }:

{
  home.username = "viplov";
  home.homeDirectory = "/home/viplov";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    
    # Base
    gcc
    libgcc
    clang-tools
    (python3.withPackages(ps: with ps; [ pip requests ]))
    xdg-utils
    socat

    # Hardware
    playerctl

    # Editors
    vim
    neovim

    # Fonts
    (nerdfonts.override { fonts = [ "Hack" "FiraCode" "DroidSansMono" ]; })
   
    # Browsers
    firefox
    ungoogled-chromium
    
    # Console
    kitty
    
    # File explorer
    xfce.thunar 
    
    # Hyprland
    hyprpaper
    hyprlock
    rofi-wayland
    wl-clipboard

    # GUI
    starship
    cava
    waybar 
    eww
    dunst

    # Cmds
    wget
    curl
    jq
    btop
    neofetch
    ripgrep

    # Music
    youtube-music

    # Source control
    gh
    delta
    
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    ".gitconfig".source = ./.gitconfig;
    ".zsh"

    ".config/hypr".source = ./hypr;
    ".config/nvim".source = ./nvim;
    ".config/eww".source = ./eww;
    ".config/waybar".source = ./waybar;
    ".config/kitty".source = ./kitty;
    ".config/dunst".source = ./dunst;
    ".config/starship".source = ./starship;
    ".config/neofetch".source = ./neofetch;
    ".config/btop".source = ./btop;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/viplov/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
