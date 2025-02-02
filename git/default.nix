{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    gh
    git
    delta
    lazygit
  ];

  home.file = {
    ".gitconfig".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/git/.gitconfig";
    ".config/lazygit/config.yml".source = ./lazygit.yml;
  };
}
