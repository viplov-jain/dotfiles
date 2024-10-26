{ config, pkgs, ... }:
  let
    user = "viplov";
    home = "/home/${user}";
    mkConfig = dir: config.lib.file.mkOutOfStoreSymlink "${home}/dotfiles/${dir}";
  in {
  home.username = "${user}";
  home.homeDirectory = "${home}";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [

    qemu
    
    # Dev
    gcc
    libgcc
    clang-tools
    (python3.withPackages(ps: with ps; [ pip requests black isort mypy flake8 ]))
    gnumake

    rustup
    nodejs_22

    # Utils
    xdg-utils
    socat
    killall
    fzf
    fd
    yazi-unwrapped
    zip
    unzip
    gzip
    gnutar
    playerctl

    # Editors
    vim
    neovim-unwrapped

    # Fonts
    (nerdfonts.override { fonts = [ "Hack" "FiraCode" "DroidSansMono" ]; })
   
    # Browsers
    firefox
    librewolf
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

    # Media
    youtube-music
    vlc

    # Source control
    gh
    git
    delta
    lazygit


    # Nvim Plugin dependencies
    luajitPackages.luarocks
    stylua
    lua-language-server
    clang-tools
    pyright
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    ".gitconfig".source = mkConfig ".gitconfig";
    ".zshrc".source = mkConfig ".zshrc";

    ".config/hypr".source = mkConfig "hypr";
    ".config/nvim".source = mkConfig "nvim";
    ".config/eww".source = mkConfig "eww";
    ".config/waybar".source = mkConfig "waybar";
    ".config/kitty".source = mkConfig "kitty";
    ".config/dunst".source = mkConfig "dunst";
    ".config/starship.toml".source = mkConfig "starship/config.toml";
    ".config/neofetch".source = mkConfig "neofetch";
    ".config/btop".source = mkConfig "btop";
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
