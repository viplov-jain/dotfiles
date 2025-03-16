{ pkgs, config, ... }:
{

  imports = [
    ./btop
  ];
  home.packages = with pkgs; [
    shfmt
    nodePackages.bash-language-server

    fish

    tmux
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
    ".config/ghostty/config".source = ./ghostty.conf;
    ".config/fish".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/shell/fish";
    ".config/bat".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/shell/bat";
  };
}
