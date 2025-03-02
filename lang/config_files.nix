{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # TOML
    taplo
    # YAML
    yamllint

    # JSON
    nodePackages.jsonlint
    gron

    # Markdown
    vale
  ];
}
