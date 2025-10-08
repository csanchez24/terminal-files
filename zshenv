# Ensure that a non-login, non-interactive shell has a defined environment.

export LANG=en_US.UTF-8
export KEYTIMEOUT=1

export TERMINAL="Kitty"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

export PATH="$PATH:/opt/homebrew/opt/llvm/bin"
export PATH="$PATH:/opt/homebrew/bin/"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH=$PATH:$HOME/go/bin/
export PATH="${HOME}/.pyenv/shims:${PATH}"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"


if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
. "$HOME/.cargo/env"
