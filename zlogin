# ~/.zlogin
# Este archivo se carga DESPUÉS de zshrc en login shells
# Usado para tareas finales y mensajes de bienvenida

# ============================================================================
# Compile zcompdump in background (for faster startup)
# ============================================================================
{
  # Prezto's zcompdump location
  zcompdump="${ZDOTDIR:-$HOME}/.zprezto/.zcompdump"
  
  # Si no existe, usar ubicación estándar
  [[ ! -f "$zcompdump" ]] && zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
  
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    if command mkdir "${zcompdump}.zwc.lock" 2>/dev/null; then
      zcompile "$zcompdump"
      command rmdir "${zcompdump}.zwc.lock" 2>/dev/null
    fi
  fi
} &!
