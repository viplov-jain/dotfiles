{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    vim
    neovim-unwrapped
  ];
  home.file = {
    ".config/nvim".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
  };
}
