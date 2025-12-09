# ~/.zlogout
# Este archivo se ejecuta cuando sales de un LOGIN shell
# Usado para limpieza y tareas finales

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
