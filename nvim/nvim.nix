{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vim
    neovim-unwrapped
  ];
  home.file = {
    ".config/nvim".source = ./.;
  };
}
