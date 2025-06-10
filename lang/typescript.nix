{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_24
    bun
    vscode-langservers-extracted
    nodePackages.prettier
    nodePackages.typescript-language-server
    oxlint
  ];
}
