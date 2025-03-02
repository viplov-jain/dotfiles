{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_23
    vscode-langservers-extracted
    nodePackages.prettier
    nodePackages.typescript-language-server
  ];
}
