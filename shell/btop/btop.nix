{ pkgs, ... }:
{
  home.packages = with pkgs; [
    btop
  ];

  home.file = {
    ".config/btop".source = ./.;
  };
}
