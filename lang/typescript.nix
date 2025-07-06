{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_24
    vtsls
    nodePackages.prettier
    nodePackages.typescript-language-server
    oxlint
  ];
}
