{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_24
    bun
    vtsls
    nodePackages.prettier
    nodePackages.typescript-language-server
    oxlint
  ];
}
