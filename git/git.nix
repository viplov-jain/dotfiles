{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gh
    git
    delta
    lazygit
  ];

  home.sessionVariables = {
    LG_CONFIG_FILE = ./lazygit.yml;
  };

  home.file = {
    ".gitconfig".source = ../.gitconfig;
  };
}
