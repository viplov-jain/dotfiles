{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    vim
    tree-sitter
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      telescope-fzf-native-nvim # Nix handles the 'make' step during installation
      telescope-nvim
      plenary-nvim
    ];

    initLua = builtins.readFile ./init.lua;
  };
  home.file = {
    ".vimrc".source = ./settings.vim;
  };
}
