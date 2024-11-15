{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vim
    neovim-unwrapped
  ];
  home.file = {
    ".vimrc".source = ./settings.vim;
    ".config/nvim".source = ./.;
  };
}
