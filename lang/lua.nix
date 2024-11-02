{ pkgs, ... }:
{
  home.packages = with pkgs; [
    luajitPackages.luarocks
    stylua
    lua-language-server
  ];
}
