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

# ============================================================================
# Welcome Message (opcional)
# ============================================================================
if [[ -o INTERACTIVE && -t 2 ]]; then
  
  # Fortune cookie (si está instalado)
  if command -v fortune >/dev/null 2>&1; then
    echo ""
    fortune -s
    echo ""
  fi
  
  # O mensaje personalizado
  # echo "Welcome back! 👋"
  # echo "Today is $(date '+%A, %B %d, %Y')"
  # echo ""
  
  # Mostrar pendientes (si usas algún task manager)
  # if command -v task >/dev/null 2>&1; then
  #   task next limit:5
  # fi
  
fi >&2

# ============================================================================
# System Health Check (opcional)
# ============================================================================
# Uncomment para verificar estado del sistema al login

# # Check disk space
# if command -v df >/dev/null 2>&1; then
#   disk_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
#   if [[ $disk_usage -gt 90 ]]; then
#     echo "⚠️  Warning: Disk usage is at ${disk_usage}%" >&2
#   fi
# fi

# # Check for system updates (macOS)
# if [[ "$OSTYPE" == darwin* ]]; then
#   if [[ $(softwareupdate -l 2>&1 | grep -c "restart") -gt 0 ]]; then
#     echo "⚠️  System updates available" >&2
#   fi
# fi

# ============================================================================
# Development Environment Check
# ============================================================================
# Verificar versiones de herramientas importantes (opcional)

# if [[ -o INTERACTIVE ]]; then
#   # Check Node version in package.json
#   if [[ -f "package.json" ]] && command -v node >/dev/null 2>&1; then
#     required_version=$(jq -r '.engines.node // empty' package.json 2>/dev/null)
#     if [[ -n "$required_version" ]]; then
#       current_version=$(node -v | sed 's/v//')
#       # Aquí podrías agregar lógica para verificar versión
#     fi
#   fi
# fi
