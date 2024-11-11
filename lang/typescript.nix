{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_22
    nodePackages.prettier
    nodePackages.typescript-language-server
    nodePackages.eslint
  ];
}
