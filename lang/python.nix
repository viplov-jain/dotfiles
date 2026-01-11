{ pkgs, ... }:
{
  home.packages = with pkgs; [

    (python313.withPackages (
      ps: with ps; [
        pip
        requests
        mypy
        debugpy
        sympy
        numpy
        scipy
      ]
    ))

    pyright
    ruff
  ];
}
