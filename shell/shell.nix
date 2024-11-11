{ pkgs, ... }:
{
  home.packages = with pkgs; [
    shfmt
    nodePackages.bash-language-server

    kitty

    starship
    fastfetch
    ripgrep
    btop
    fzf
    fd
    yazi-unwrapped

    eza # ls
    zoxide # cd
    bat # cat
  ];

  home.file = {
    ".config/kitty/kitty.conf".source = ./kitty.conf;
    ".zshrc".source = ../.zshrc;
  };

  home.sessionVariables = {
    STARSHIP_CONFIG = ./starship.toml;
  };
}
