{ pkgs, ... }:
{
  home.packages = with pkgs; [
    shfmt
    nodePackages.bash-language-server

    kitty
    starship
    fzf
    fd
    yazi-unwrapped

    eza
    zoxide
  ];

  home.file = {
    ".config/kitty/kitty.conf".source = ./kitty.conf;
    ".zshrc".source = ../.zshrc;
  };

  home.sessionVariables = {
    STARSHIP_CONFIG = ./starship.toml;
  };
}
