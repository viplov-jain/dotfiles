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
    jsonnet

    # Markdown
    vale
  ];
}
