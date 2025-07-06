{ pkgs, ... }:
{
  imports = [
    ../lang/c.nix
    ../lang/config_files.nix
    ../lang/go.nix
    ../lang/lua.nix
    ../lang/nix.nix
    ../lang/python.nix
    ../lang/rust.nix
    ../lang/typescript.nix

    ../shell
    ../git
    ../nvim
  ];
  home.packages = with pkgs; [
    gnumake
    killall
    zip
    unzip
    gzip
    gnutar
    xz
    tealdeer

    # Fonts and themes
    nerd-fonts.hack
    nerd-fonts.fira-mono
    nerd-fonts.fira-code
    nerd-fonts.dejavu-sans-mono
    monaspace

    # Cmds
    wget
    curl
    jq

    # Media
    youtube-music

  ];
}
