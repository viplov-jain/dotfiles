{ pkgs, ... }:

{
  imports = [
    ./common.nix
  ];
  home.packages = with pkgs; [
    uv
    postgresql_16
    mongosh
    circleci_cli
  ];
}
