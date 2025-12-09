# ~/.zshrc
# Este archivo se carga en INTERACTIVE shells

# ============================================================================
# Performance profiling (descomenta para debug)
# ============================================================================
# zmodload zsh/zprof

# ============================================================================
# Prezto - Debe ir primero
# ============================================================================
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ============================================================================
# Additional Settings (después de Prezto)
# ============================================================================

# Vi mode - Override si Prezto no lo configura
bindkey -v
bindkey -rM vicmd ':'  # Deshabilitar : en vi mode
export KEYTIMEOUT=1

# ============================================================================
# Modern CLI Tools (si los instalaste)
# ============================================================================

# eza (mejor ls)
if (( $+commands[eza] )); then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza --icons --group-directories-first -l'
  alias la='eza --icons --group-directories-first -la'
  alias lt='eza --tree --icons --level=2'
  alias tree='eza --tree --icons'
fi

# bat (mejor cat)
if (( $+commands[bat] )); then
  alias cat='bat --style=plain --paging=never'
  alias batl='bat --style=numbers,changes'
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export BAT_THEME="Dracula"
fi

# fd (mejor find)
if (( $+commands[fd] )); then
  alias find='fd'
fi

# ripgrep config
if (( $+commands[rg] )); then
  export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
fi

# zoxide (cd inteligente)
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
  alias cd='z'
fi

# ============================================================================
# FZF Configuration
# ============================================================================
if (( $+commands[fzf] )); then
  # Use fd for fzf if available
  if (( $+commands[fd] )); then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
  fi
  
  # Dracula theme for fzf
  export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border \
    --color=fg:#F8F8F2,bg:#0B0D0F,hl:#9580FF \
    --color=fg+:#F8F8F2,bg+:#414D58,hl+:#FF80BF \
    --color=info:#80FFEA,prompt:#8AFF80,pointer:#FF80BF \
    --color=marker:#FFFF80,spinner:#80FFEA,header:#9580FF"
  
  # FZF keybindings
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  
  # Custom FZF functions
  # Ctrl-R replacement with preview
  fzf-history-widget-with-preview() {
    local selected num
    setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
    selected=( $(fc -rl 1 | awk '{ cmd=$0; sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd); if (!seen[cmd]++) print $0 }' |
      FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" fzf) )
    local ret=$?
    if [ -n "$selected" ]; then
      num=$selected[1]
      if [ -n "$num" ]; then
        zle vi-fetch-history -n $num
      fi
    fi
    zle reset-prompt
    return $ret
  }
  zle -N fzf-history-widget-with-preview
  bindkey '^R' fzf-history-widget-with-preview
fi

# ============================================================================
# Custom Aliases (además de los de Prezto)
# ============================================================================

# Lazygit
alias lg="lazygit"
alias lzg="lazygit"

# Yazi (file manager)
alias ya="yazi"
alias yy="yazi"

# Neovim
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

# Dotfiles management
alias dotfiles="$HOME/.dotfiles/dotfiles"
alias dots="dotfiles status"
alias dotsync="dotfiles sync"
alias dotedit="dotfiles edit"

# Quick edit configs
alias zshconfig="nvim ~/.zshrc"
alias prezconfig="nvim ~/.zpreztorc"
alias nvimconfig="cd ~/.config/nvim && nvim"
alias ghosttyconfig="nvim ~/.config/ghostty/config"
alias starshipconfig="nvim ~/.config/starship.toml"

# Navigation shortcuts (además de los de Prezto)
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Prezto ya provee estos, pero los dejo comentados por referencia:
# alias -g G='| grep'
# alias -g L='| less'
# alias -g H='| head'
# alias -g T='| tail'

# Git (complementos a los de Prezto)
alias gaa='git add --all'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gpsup='git push --set-upstream origin $(git-branch-current 2>/dev/null || git symbolic-ref --short HEAD)'
alias gundo='git reset HEAD~1 --mixed'
alias gwip='git add -A && git commit -m "WIP"'

# Docker (si usas Docker)
if (( $+commands[docker] )); then
  alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
  alias dclean='docker system prune -af --volumes'
  alias dlog='docker logs -f'
fi

# System
alias update='brew update && brew upgrade && brew cleanup'
alias myip='curl -s https://api.ipify.org && echo'

# Better defaults
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -h'
alias free='free -h'

# ============================================================================
# PHP Development
# ============================================================================

# Composer aliases
if (( $+commands[composer] )); then
  alias c='composer'
  alias ci='composer install'
  alias cu='composer update'
  alias cr='composer require'
  alias cda='composer dump-autoload'
  alias cgu='composer global update'
fi

# Laravel/Artisan (si existe en el proyecto)
if [[ -f artisan ]]; then
  alias art='php artisan'
  alias artisan='php artisan'
  alias tinker='php artisan tinker'
  alias migrate='php artisan migrate'
  alias seed='php artisan db:seed'
  alias fresh='php artisan migrate:fresh --seed'
fi

# PHP Unit
if [[ -f vendor/bin/phpunit ]]; then
  alias phpunit='vendor/bin/phpunit'
  alias pu='vendor/bin/phpunit'
  alias puf='vendor/bin/phpunit --filter'
fi

# Pest (alternativa moderna a PHPUnit)
if [[ -f vendor/bin/pest ]]; then
  alias pest='vendor/bin/pest'
  alias pt='vendor/bin/pest'
  alias ptf='vendor/bin/pest --filter'
fi

# PHP CS Fixer
if (( $+commands[php-cs-fixer] )); then
  alias pfix='php-cs-fixer fix'
fi

# PHPStan
if (( $+commands[phpstan] )); then
  alias pstan='phpstan analyse'
fi

# Laravel Valet 
if (( $+commands[valet] )); then
  alias vs='valet start'
  alias vst='valet stop'
  alias vr='valet restart'
  alias vl='valet link'
  alias vul='valet unlink'
  alias vopen='valet open'
fi

# ============================================================================
# Custom Functions
# ============================================================================

# Create and enter directory
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract any archive
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz) tar xzf "$1" ;;
      *.bz2) bunzip2 "$1" ;;
      *.rar) unrar x "$1" ;;
      *.gz) gunzip "$1" ;;
      *.tar) tar xf "$1" ;;
      *.tbz2) tar xjf "$1" ;;
      *.tgz) tar xzf "$1" ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress "$1" ;;
      *.7z) 7z x "$1" ;;
      *) echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Quick backup
backup() {
  cp "$1" "$1.backup-$(date +%Y%m%d-%H%M%S)"
}

# Find in files
fif() {
  if (( $+commands[rg] )); then
    rg --files-with-matches --no-messages "$1" | fzf --preview "rg --pretty --context 10 '$1' {}"
  else
    grep -r "$1" . | cut -d: -f1 | sort -u
  fi
}

# ============================================================================
# PHP Functions
# ============================================================================

# Yazi wrapper para cambiar directorio al salir
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# ============================================================================
# PHP Functions (resto de las funciones PHP)
# ============================================================================

# Crear nuevo proyecto Laravel
lnew() {
  if (( $+commands[laravel] )); then
    laravel new "$1"
    cd "$1" || return
  else
    echo "Laravel installer not found. Install with: composer global require laravel/installer"
  fi
}

# Serve PHP built-in server
serve() {
  local port="${1:-8000}"
  php -S localhost:"$port"
}

# Run PHP interactively with PsySH
phpi() {
  if (( $+commands[psysh] )); then
    psysh
  else
    php -a
  fi
}

# Cambiar versión de PHP (si tienes múltiples instaladas)
phpv() {
  if [[ -z "$1" ]]; then
    echo "Current PHP version:"
    php -v | head -n 1
    echo ""
    echo "Available versions:"
    brew list | grep "php@"
  else
    brew unlink php
    brew link --force --overwrite "php@$1"
    echo "Switched to PHP $1"
    php -v | head -n 1
  fi
}

# Composer require con autocompletado de paquetes populares
creq() {
  if [[ -z "$1" ]]; then
    echo "Popular packages:"
    echo "  Laravel: laravel/sanctum, laravel/horizon, laravel/telescope"
    echo "  Testing: pestphp/pest, phpunit/phpunit, mockery/mockery"
    echo "  Tools: spatie/laravel-permission, barryvdh/laravel-debugbar"
    echo ""
    echo "Usage: creq package/name"
  else
    composer require "$@"
  fi
}

# PHP Stan con nivel progresivo
pstan() {
  local level="${1:-5}"
  if [[ -f vendor/bin/phpstan ]]; then
    vendor/bin/phpstan analyse --level="$level"
  elif (( $+commands[phpstan] )); then
    phpstan analyse --level="$level"
  else
    echo "PHPStan not found"
  fi
}

# Limpiar cache de Laravel
lclear() {
  if [[ -f artisan ]]; then
    php artisan cache:clear
    php artisan config:clear
    php artisan route:clear
    php artisan view:clear
    echo "✅ All Laravel caches cleared"
  else
    echo "❌ Not a Laravel project"
  fi
}

# ============================================================================
# Starship Prompt (debe ir al final)
# ============================================================================
if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi

# ============================================================================
# Local/Private Config (si tienes configs que no quieres en git)
# ============================================================================
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# ============================================================================
# Performance profiling (descomenta para debug)
# ============================================================================
# zprof
