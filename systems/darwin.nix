{ pkgs, lib, ... }:

{
  imports = [
    ./common.nix
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "terraform"
    ];

  home.packages = with pkgs; [
    (terraform.withPlugins (plugin: [ plugin.aws ]))
    postgresql_16
    mongosh
    circleci-cli
  ];
}
