if status is-interactive
    starship init fish | source
    zoxide init fish --cmd cd | source
    alias cat="bat"
    alias npm="pnpm"
    export MANPAGER='nvim +Man!'
    fish_add_path $HOME/.cargo/bin
    if test -e ~/init_config.fish
        source ~/init_config.fish
    end
end
