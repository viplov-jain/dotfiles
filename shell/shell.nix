{ pkgs, config, ... }:
{

  imports = [
    ./btop/btop.nix
  ];
  home.packages = with pkgs; [
    shfmt
    nodePackages.bash-language-server

    fish
    kitty

    starship
    fastfetch
    ripgrep
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
    ".config/bat".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/shell/bat";
  };

}
