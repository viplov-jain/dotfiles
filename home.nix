{ ... }:
let
  user = "viplov";
in
{
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ./systems/linux.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
