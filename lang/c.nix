{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clang-tools
    gcc14
  ];
}
