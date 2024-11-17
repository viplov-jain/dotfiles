if status is-interactive
    bash ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    starship init fish | source
    fzf --fish | source
    zoxide init fish | source

    if test -e ~/init_config.fish
        source ~/init_config.fish
    end
end
