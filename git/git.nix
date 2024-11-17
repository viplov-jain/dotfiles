{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gh
    git
    delta
    lazygit
  ];

  home.file = {
    ".gitconfig".source = ../.gitconfig;
    ".config/lazygit/config.yml".source = ./lazygit.yml;
  };
}
