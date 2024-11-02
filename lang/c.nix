{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    libgcc
    clang-tools
  ];
}
