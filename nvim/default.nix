{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    vim
    neovim-unwrapped
  ];
  home.file = {
    ".vimrc".source = ./settings.vim;
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
  };
}
