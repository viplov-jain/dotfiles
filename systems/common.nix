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
    ../nvim/nvim.nix
  ];
  home.packages = with pkgs; [
    gnumake
    killall
    zip
    unzip
    gzip
    gnutar

    # Fonts and themes
    (nerdfonts.override {
      fonts = [
        "Hack"
        "FiraCode"
      ];
    })
    monaspace

    # Cmds
    wget
    curl
    jq

    # Media
    youtube-music

    docker_27
  ];
}
