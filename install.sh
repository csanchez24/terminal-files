#!/usr/bin/env bash

# ============================================================================
# Dotfiles Installation Script
# ============================================================================
#
# This script automates the installation of:
# - Homebrew packages
# - Zsh + Prezto
# - Neovim + plugins
# - Ghostty terminal
# - Yazi file manager
# - Development tools (Node, PHP, Python, Go, Rust)
#
# Usage: ./install.sh [options]
# Options:
#   --minimal    Install only core tools (no dev languages)
#   --nvim-only  Install only Neovim config
#   --help       Show this help
# ============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Options
MINIMAL_INSTALL=false
NVIM_ONLY=false

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --minimal)
      MINIMAL_INSTALL=true
      shift
      ;;
    --nvim-only)
      NVIM_ONLY=true
      shift
      ;;
    --help)
      head -n 20 "$0" | tail -n +2 | sed 's/^# //'
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      echo "Run with --help for usage"
      exit 1
      ;;
  esac
done

# Helper functions
print_header() {
  echo ""
  echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${CYAN}  $1${NC}"
  echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo ""
}

print_success() {
  echo -e "${GREEN}✓${NC} $1"
}

print_error() {
  echo -e "${RED}✗${NC} $1"
}

print_warning() {
  echo -e "${YELLOW}⚠${NC}  $1"
}

print_info() {
  echo -e "${BLUE}ℹ${NC}  $1"
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# ============================================================================
# Main Installation
# ============================================================================

print_header "🚀 Dotfiles Installation"

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
  print_error "This script is designed for macOS only"
  exit 1
fi

print_info "Installation mode: $([ "$NVIM_ONLY" = true ] && echo "Neovim only" || [ "$MINIMAL_INSTALL" = true ] && echo "Minimal" || echo "Full")"

# ============================================================================
# Step 1: Install Homebrew
# ============================================================================

if [ "$NVIM_ONLY" = false ]; then
  print_header "📦 Installing Homebrew"

  if command_exists brew; then
    print_success "Homebrew already installed"
  else
    print_info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add to PATH
    if [[ $(uname -m) == 'arm64' ]]; then
      echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    print_success "Homebrew installed"
  fi
fi

# ============================================================================
# Step 2: Install Core Tools
# ============================================================================

if [ "$NVIM_ONLY" = false ]; then
  print_header "🛠️  Installing Core Tools"

  print_info "Installing essential command-line tools..."
  brew install \
    neovim \
    git \
    curl \
    wget \
    fd \
    ripgrep \
    fzf \
    eza \
    bat \
    zoxide \
    starship \
    lazygit \
    yazi \
    jq \
    tree \
    htop

  print_success "Core tools installed"
fi

# ============================================================================
# Step 3: Install Terminal
# ============================================================================

if [ "$NVIM_ONLY" = false ]; then
  print_header "💻 Installing Terminal"

  if brew list --cask ghostty &>/dev/null; then
    print_success "Ghostty already installed"
  else
    print_info "Installing Ghostty..."
    brew install --cask ghostty
    print_success "Ghostty installed"
  fi
fi

# ============================================================================
# Step 4: Install Fonts
# ============================================================================

if [ "$NVIM_ONLY" = false ]; then
  print_header "🔤 Installing Fonts"

  print_info "Installing JetBrainsMono Nerd Font..."
  brew install --cask font-jetbrains-mono-nerd-font
  print_success "Fonts installed"
fi

# ============================================================================
# Step 5: Install Development Tools
# ============================================================================

if [ "$MINIMAL_INSTALL" = false ] && [ "$NVIM_ONLY" = false ]; then
  print_header "👨‍💻 Installing Development Tools"

  # Node.js via NVM
  print_info "Installing NVM for Node.js..."
  if [ ! -d "$HOME/.nvm" ]; then
    brew install nvm
    mkdir -p ~/.nvm
    print_success "NVM installed"
  else
    print_success "NVM already installed"
  fi

  # PHP & Composer
  print_info "Installing PHP & Composer..."
  brew install php composer
  print_success "PHP & Composer installed"

  # Python
  print_info "Installing Python..."
  brew install python
  print_success "Python installed"

  # Go
  print_info "Installing Go..."
  brew install go
  print_success "Go installed"

  # Rust
  if ! command_exists rustc; then
    print_info "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
    print_success "Rust installed"
  else
    print_success "Rust already installed"
  fi
fi

# ============================================================================
# Step 6: Install Zsh Framework
# ============================================================================

if [ "$NVIM_ONLY" = false ]; then
  print_header "🐚 Installing Zsh Framework"

  # Install Prezto
  if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
    print_info "Installing Prezto..."
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    print_success "Prezto installed"
  else
    print_success "Prezto already installed"
  fi

  # Install Zsh plugins
  print_info "Installing Zsh plugins..."
  brew install zsh-fast-syntax-highlighting zsh-autosuggestions
  print_success "Zsh plugins installed"
fi

# ============================================================================
# Step 7: Backup Existing Configs
# ============================================================================

print_header "💾 Backing Up Existing Configs"

BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

backup_if_exists() {
  if [ -e "$1" ]; then
    print_info "Backing up $1"
    cp -r "$1" "$BACKUP_DIR/"
    return 0
  fi
  return 1
}

if [ "$NVIM_ONLY" = false ]; then
  backup_if_exists "$HOME/.zshrc"
  backup_if_exists "$HOME/.zshenv"
  backup_if_exists "$HOME/.zprofile"
  backup_if_exists "$HOME/.zlogin"
  backup_if_exists "$HOME/.zlogout"
  backup_if_exists "$HOME/.zpreztorc"
  backup_if_exists "$HOME/.config/ghostty"
  backup_if_exists "$HOME/.config/yazi"
  backup_if_exists "$HOME/.config/starship.toml"
fi

backup_if_exists "$HOME/.config/nvim"

print_success "Backups saved to $BACKUP_DIR"

# ============================================================================
# Step 8: Install Dotfiles (with symlinks)
# ============================================================================

print_header "🔗 Installing Dotfiles (symlinks)"

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Helper function to create symlink
create_symlink() {
  local source="$1"
  local target="$2"

  # Remove existing file/dir/symlink
  if [ -e "$target" ] || [ -L "$target" ]; then
    rm -rf "$target"
  fi

  # Create parent directory if needed
  mkdir -p "$(dirname "$target")"

  # Create symlink
  ln -s "$source" "$target"
  print_info "Linked: $target -> $source"
}

# Neovim config
print_info "Linking Neovim config..."
create_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
print_success "Neovim config linked"

if [ "$NVIM_ONLY" = false ]; then
  # Ghostty config
  if [ -d "$DOTFILES_DIR/ghostty" ]; then
    print_info "Linking Ghostty config..."
    create_symlink "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"
    print_success "Ghostty config linked"
  fi

  # Yazi config
  if [ -d "$DOTFILES_DIR/yazi" ]; then
    print_info "Linking Yazi config..."
    create_symlink "$DOTFILES_DIR/yazi" "$HOME/.config/yazi"
    print_success "Yazi config linked"
  fi

  # Starship config
  if [ -f "$DOTFILES_DIR/starship.toml" ]; then
    print_info "Linking Starship config..."
    create_symlink "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
    print_success "Starship config linked"
  fi

  # Zsh configs (symlink individual files)
  print_info "Linking Zsh configs..."
  [ -f "$DOTFILES_DIR/zshrc" ] && create_symlink "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
  [ -f "$DOTFILES_DIR/zshenv" ] && create_symlink "$DOTFILES_DIR/zshenv" "$HOME/.zshenv"
  [ -f "$DOTFILES_DIR/zprofile" ] && create_symlink "$DOTFILES_DIR/zprofile" "$HOME/.zprofile"
  [ -f "$DOTFILES_DIR/zlogin" ] && create_symlink "$DOTFILES_DIR/zlogin" "$HOME/.zlogin"
  [ -f "$DOTFILES_DIR/zlogout" ] && create_symlink "$DOTFILES_DIR/zlogout" "$HOME/.zlogout"
  [ -f "$DOTFILES_DIR/zpreztorc" ] && create_symlink "$DOTFILES_DIR/zpreztorc" "$HOME/.zpreztorc"
  print_success "Zsh configs linked"

  # Gitconfig (if exists)
  if [ -f "$DOTFILES_DIR/gitconfig" ]; then
    print_info "Linking Git config..."
    create_symlink "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
    print_success "Git config linked"
  fi
fi

print_success "All dotfiles linked successfully!"
print_info "Changes in ~/.config will now sync with $DOTFILES_DIR"

# ============================================================================
# Step 9: Install Neovim Plugins
# ============================================================================

print_header "🔌 Installing Neovim Plugins"

print_info "Opening Neovim to install plugins..."
print_info "This may take a few minutes..."

# Run Neovim headless to install plugins
nvim --headless "+Lazy! sync" +qa

print_success "Neovim plugins installed"

# ============================================================================
# Step 10: Install LSP Servers & Tools
# ============================================================================

print_header "🔧 Installing LSP Servers & Tools"

print_info "Installing language servers and formatters..."

# This will be auto-installed by Mason, but we can pre-install some
if command_exists npm; then
  npm install -g \
    typescript \
    typescript-language-server \
    vscode-langservers-extracted \
    @tailwindcss/language-server \
    prettier
fi

print_success "LSP tools installed"

# ============================================================================
# Step 11: Setup Additional Tools
# ============================================================================

if [ "$NVIM_ONLY" = false ]; then
  print_header "⚙️  Setting Up Additional Tools"

  # FZF key bindings
  if command_exists fzf; then
    print_info "Setting up FZF key bindings..."
    $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
    print_success "FZF configured"
  fi

  # Create necessary directories
  mkdir -p "$HOME/.local/share/zsh"
  mkdir -p "$HOME/.cache/zsh"
fi

# ============================================================================
# Completion
# ============================================================================

print_header "✨ Installation Complete!"

echo ""
print_success "Dotfiles installed successfully!"
echo ""
print_info "Backup of old configs: $BACKUP_DIR"
echo ""

if [ "$NVIM_ONLY" = false ]; then
  echo -e "${YELLOW}Next steps:${NC}"
  echo "  1. Restart your terminal or run: ${CYAN}exec zsh${NC}"
  echo "  2. Open Neovim and run: ${CYAN}:checkhealth${NC}"
  echo "  3. Configure Git:"
  echo "     ${CYAN}git config --global user.name \"Your Name\"${NC}"
  echo "     ${CYAN}git config --global user.email \"your@email.com\"${NC}"
  echo ""
  echo -e "${YELLOW}Optional:${NC}"
  echo "  - Install additional LSP servers in Neovim: ${CYAN}:Mason${NC}"
  echo "  - Update Neovim plugins: ${CYAN}:Lazy sync${NC}"
  echo "  - Check Neovim health: ${CYAN}:checkhealth${NC}"
else
  echo -e "${YELLOW}Next steps:${NC}"
  echo "  1. Open Neovim: ${CYAN}nvim${NC}"
  echo "  2. Run: ${CYAN}:checkhealth${NC}"
  echo "  3. Install LSP servers: ${CYAN}:Mason${NC}"
fi

echo ""
print_info "For help, see: ${CYAN}https://github.com/YOUR_USERNAME/terminal-files${NC}"
echo ""

# ============================================================================
# Offer to restart shell
# ============================================================================

if [ "$NVIM_ONLY" = false ]; then
  echo -e "${YELLOW}Would you like to restart your shell now? (y/n)${NC}"
  read -r response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    exec zsh
  fi
fi
