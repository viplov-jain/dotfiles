{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    starship
  ];

  home.file = {
    ".config/kitty/kitty.conf".source = ./kitty.conf;
  };

  home.sessionVariables = {
    STARSHIP_CONFIG = ./starship.toml;
  };
}
