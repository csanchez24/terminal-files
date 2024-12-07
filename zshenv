# Ensure that a non-login, non-interactive shell has a defined environment.

export LANG=en_US.UTF-8
export KEYTIMEOUT=1

export TERMINAL="Kitty"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"


if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
