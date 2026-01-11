{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    (lib.hiPrio clang-tools)
    cmake
    clang
  ];
}
