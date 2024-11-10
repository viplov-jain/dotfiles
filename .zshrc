autoload -Uz compinit
compinit

source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
eval "$(starship init zsh)"
source <(fzf --zsh)

if type "uv" >/dev/null; then
  eval "$(uv generate-shell-completion zsh)"
  eval "$(uvx --generate-shell-completion zsh)"
fi

alias dostop="(docker compose down)"
alias doclean_v="(docker volume prune -af)"
alias doclean="(dostop && doclean_v)"

if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi
