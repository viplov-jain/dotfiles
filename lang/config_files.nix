{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # TOML
    taplo
    # YAML
    yamlfmt
    yamllint

    # JSON
    nodePackages.jsonlint
    nodePackages.fixjson
    gron

    # Markdown
    vale
  ];
}
