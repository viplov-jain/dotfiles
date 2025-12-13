{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # TOML
    taplo
    # YAML
    yamllint

    # JSON
    gron

    # Markdown
    vale
  ];
}
