# ~/.zlogout
# Este archivo se ejecuta cuando sales de un LOGIN shell
# Usado para limpieza y tareas finales

# ============================================================================
# Clear screen (opcional)
# ============================================================================
# clear

# ============================================================================
# History Backup (opcional pero recomendado)
# ============================================================================
# Backup del historial antes de salir
if [[ -f "${HISTFILE:-$HOME/.zsh_history}" ]]; then
  history_backup="${HISTFILE}.backup-$(date +%Y%m%d)"
  
  # Solo hacer backup una vez al día
  if [[ ! -f "$history_backup" ]]; then
    cp "${HISTFILE}" "$history_backup" 2>/dev/null
    
    # Mantener solo últimos 7 días de backups
    find "$(dirname "$HISTFILE")" -name "*.backup-*" -mtime +7 -delete 2>/dev/null
  fi
fi

# ============================================================================
# Clean Temporary Files
# ============================================================================
# Limpiar archivos temporales de zsh
[[ -d "${TMPDIR:-/tmp}" ]] && {
  find "${TMPDIR:-/tmp}" -maxdepth 1 -name 'zsh*' -user "$USER" -mtime +7 -delete 2>/dev/null
}

# ============================================================================
# SSH Agent Cleanup
# ============================================================================
# Si iniciaste ssh-agent en esta sesión, mátalos
if [[ -n "$SSH_AGENT_PID" ]]; then
  # kill "$SSH_AGENT_PID" 2>/dev/null
  # Comentado porque generalmente quieres mantener el agente corriendo
  :
fi

# ============================================================================
# Development Cleanup
# ============================================================================
# Matar procesos de desarrollo si quedaron corriendo
# Ejemplo: kill leftover node/php servers

# Buscar servidores node locales
# pkill -f "node.*localhost" 2>/dev/null

# Buscar servidores PHP
# pkill -f "php.*-S.*localhost" 2>/dev/null

# ============================================================================
# Goodbye Message (opcional)
# ============================================================================
if [[ -o INTERACTIVE && -t 2 ]]; then
  echo ""
  echo "👋 See you later!"
  echo ""
fi >&2

# ============================================================================
# Session Stats (opcional)
# ============================================================================
# Mostrar estadísticas de la sesión
# if [[ -n "$SECONDS" ]]; then
#   session_time=$SECONDS
#   hours=$((session_time / 3600))
#   minutes=$(((session_time % 3600) / 60))
#   
#   if [[ $hours -gt 0 ]]; then
#     echo "Session duration: ${hours}h ${minutes}m" >&2
#   elif [[ $minutes -gt 0 ]]; then
#     echo "Session duration: ${minutes}m" >&2
#   fi
# fi
