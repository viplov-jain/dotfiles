{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vim
    tree-sitter
  ];
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      telescope-fzf-native-nvim
    ];

    initLua = builtins.readFile ./nvim-init.lua;
    withRuby = true;
    withPython3 = false;
  };
  home.file = {
    ".vimrc".source = ./settings.vim;
  };
}
