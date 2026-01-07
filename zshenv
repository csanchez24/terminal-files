# ~/.zshenv
# Este archivo se carga SIEMPRE (login, non-login, interactive, non-interactive)
# Solo debe contener variables de entorno esenciales

# ============================================================================
# XDG Base Directory Specification
# ============================================================================
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# ============================================================================
# Locale & Language
# ============================================================================
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ============================================================================
# Default Applications
# ============================================================================
export TERMINAL="ghostty"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export BROWSER="open"

# ============================================================================
# Less configuration
# ============================================================================
export LESS="-R -F -X -i -M"
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# ============================================================================
# History Configuration
# ============================================================================
export HISTFILE="${XDG_DATA_HOME}/zsh/history"
export HISTSIZE=50000
export SAVEHIST=50000

# ============================================================================
# Vi mode
# ============================================================================
export KEYTIMEOUT=1

# ============================================================================
# PATH Construction (evitar duplicados)
# ============================================================================
# Función helper para agregar a PATH sin duplicar
_prepend_path() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) export PATH="$1:$PATH" ;;
  esac
}

_append_path() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) export PATH="$PATH:$1" ;;
  esac
}

# Homebrew (debe ir primero)
if [[ -d "/opt/homebrew/bin" ]]; then
  _prepend_path "/opt/homebrew/bin"
  _prepend_path "/opt/homebrew/sbin"
fi

# LLVM (si necesitas clang/llvm de brew)
if [[ -d "/opt/homebrew/opt/llvm/bin" ]]; then
  _append_path "/opt/homebrew/opt/llvm/bin"
fi

# User binaries
[[ -d "$HOME/.local/bin" ]] && _prepend_path "$HOME/.local/bin"

# Cargo (Rust)
[[ -d "$HOME/.cargo/bin" ]] && _append_path "$HOME/.cargo/bin"

# Go
[[ -d "$HOME/go/bin" ]] && _append_path "$HOME/go/bin"
export GOPATH="${GOPATH:-$HOME/go}"

# Composer (PHP)
[[ -d "$HOME/.composer/vendor/bin" ]] && _append_path "$HOME/.composer/vendor/bin"

# Python/Pyenv
if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  _prepend_path "$PYENV_ROOT/bin"
fi

# Limpiar funciones helper
unfunction _prepend_path _append_path

# ============================================================================
# Development Tools
# ============================================================================

# Node/NVM (path setup, lazy load en zshrc)
export NVM_DIR="$HOME/.nvm"

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# FZF
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# Ripgrep
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"

# BAT
export BAT_THEME="Dracula"
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf"

# ============================================================================
# Load zprofile if this is a login shell (fallback)
# ============================================================================
if [[ ("$SHLVL" -eq 1 && ! -o LOGIN) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
