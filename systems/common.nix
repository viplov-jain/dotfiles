{ pkgs, ... }:
{
  imports = [
    ../lang/c.nix
    ../lang/rust.nix
    ../lang/python.nix
    ../lang/lua.nix
    ../lang/nix.nix
    ../lang/typescript.nix
    ../lang/config_files.nix

    ../shell/shell.nix
    ../git/git.nix
  ];
  home.packages = with pkgs; [
    gnumake
    killall
    fzf
    fd
    yazi-unwrapped
    zip
    unzip
    gzip
    gnutar

    # Editors
    vim
    neovim-unwrapped

    # Fonts and themes
    (nerdfonts.override {
      fonts = [
        "Hack"
        "FiraCode"
      ];
    })
    monaspace

    # Browsers
    firefox
    librewolf
    ungoogled-chromium

    # Cmds
    wget
    curl
    jq
    btop
    fastfetch
    ripgrep

    # Media
    youtube-music
    vlc

    docker_27
  ];
  home.file = {
    ".gitconfig".source = ../.gitconfig;
    ".zshrc".source = ../.zshrc;
    ".config/nvim".source = ../nvim;
  };
}
