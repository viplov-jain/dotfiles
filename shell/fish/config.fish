if status is-interactive
    starship init fish | source
    zoxide init fish --cmd cd | source
    alias cat="bat"
    if test -e ~/init_config.fish
        source ~/init_config.fish
    end
end
