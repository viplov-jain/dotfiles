{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_24
    vtsls
    prettier
    typescript-language-server
    oxlint
  ];
}
