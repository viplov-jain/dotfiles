{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    shfmt
    nodePackages.bash-language-server

    kitty

    starship
    fastfetch
    ripgrep
    btop
    fzf
    fd
    yazi-unwrapped

    eza # ls
    zoxide # cd
    bat # cat
  ];

  home.file = {
    ".config/starship.toml".source = ./starship.toml;
    ".config/kitty/kitty.conf".source = ./kitty.conf;
    ".config/fish".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/shell/fish";
  };

}
