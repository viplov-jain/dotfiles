{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_23
    nodePackages.prettier
    nodePackages.typescript-language-server
    nodePackages.eslint
  ];
}
