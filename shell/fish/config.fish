if status is-interactive
    starship init fish | source
    zoxide init fish --cmd cd | source
    alias cat="bat"
    export MANPAGER='nvim +Man!'
    if test -e ~/init_config.fish
        source ~/init_config.fish
    end
    if test -e /nix/var/nix/profiles/default/bin
        export PATH="$PATH:/nix/var/nix/profiles/default/bin"
    end
    export PATH="$PATH:$HOME/.local/bin"
end
