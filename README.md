# 🚀 My Development Environment

Modern, fast, and beautiful terminal setup for macOS with Neovim, Zsh, and more.

![Platform](https://img.shields.io/badge/platform-macOS-lightgrey)
![Shell](https://img.shields.io/badge/shell-zsh-green)
![Editor](https://img.shields.io/badge/editor-neovim-blue)
![Theme](https://img.shields.io/badge/theme-dracula_pro-purple)

## 📸 Screenshots

> Add your screenshots here

## ✨ Features

- 🎨 **Dracula Pro** theme everywhere
- ⚡ **Neovim 0.11+** with LSP, Treesitter, and modern plugins
- 🐚 **Zsh** with Prezto and Starship prompt
- 📁 **Yazi** - Modern terminal file manager
- 🔍 **Telescope** - Fuzzy finder for everything
- 🎯 **Blink.cmp** - Ultra-fast autocompletion
- 🌳 **Lazygit** - Beautiful git TUI
- 🖥️ **Ghostty** - Fast GPU-accelerated terminal

## 📋 What's Included

### Terminal Setup
- **Ghostty** - Modern terminal emulator
- **Zsh** + **Prezto** - Shell framework
- **Starship** - Fast prompt
- **Yazi** - File manager

### Neovim Plugins
- **Lazy.nvim** - Plugin manager
- **LSP** - Language servers (TS, Go, PHP, Python, Lua)
- **Blink.cmp** - Autocompletion
- **Telescope** - Fuzzy finder
- **Treesitter** - Better syntax highlighting
- **Conform** - Code formatter
- **Gitsigns** - Git integration
- **Mini.nvim** - Swiss army knife utilities
- **Noice.nvim** - Better UI
- And more...

## 🛠️ Prerequisites

### Required
- macOS 12.0+ (Monterey or later)
- [Homebrew](https://brew.sh/)
- Git

### Optional but Recommended
- [Nerd Font](https://www.nerdfonts.com/) (JetBrainsMono recommended)

## 📦 Installation

### 1. Install Homebrew (if not installed)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Clone this repository

```bash
git clone https://github.com/YOUR_USERNAME/terminal-files.git ~/.dotfiles
cd ~/.dotfiles
```

### 3. Run the installation script

```bash
chmod +x install.sh
./install.sh
```

Or install manually (see [Manual Installation](#manual-installation) below).

## 🔧 Manual Installation

### Step 1: Install Core Tools

```bash
# Install essential tools
brew install \
  neovim \
  zsh \
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
  yazi

# Install Ghostty (terminal)
brew install --cask ghostty

# Install Nerd Font
brew install --cask font-jetbrains-mono-nerd-font
```

### Step 2: Install Development Tools

```bash
# Node.js (via NVM)
brew install nvm
mkdir -p ~/.nvm

# PHP & Composer
brew install php composer

# Python
brew install python

# Go
brew install go

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Step 3: Install Zsh Framework

```bash
# Install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Create Zsh config symlinks
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

### Step 4: Install Dotfiles (Symlinks)

**Important:** We use symlinks so changes in `~/.config` sync automatically with the repo.

```bash
# Function to create symlinks safely
link_dotfile() {
  local source="$1"
  local target="$2"
  
  # Remove existing
  [ -e "$target" ] && rm -rf "$target"
  
  # Create symlink
  ln -s "$source" "$target"
  echo "✓ Linked: $target -> $source"
}

# Neovim
link_dotfile "$PWD/nvim" "$HOME/.config/nvim"

# Ghostty
link_dotfile "$PWD/ghostty" "$HOME/.config/ghostty"

# Yazi
link_dotfile "$PWD/yazi" "$HOME/.config/yazi"

# Starship
link_dotfile "$PWD/starship.toml" "$HOME/.config/starship.toml"

# Zsh files
link_dotfile "$PWD/zshrc" "$HOME/.zshrc"
link_dotfile "$PWD/zshenv" "$HOME/.zshenv"
link_dotfile "$PWD/zprofile" "$HOME/.zprofile"
link_dotfile "$PWD/zlogin" "$HOME/.zlogin"
link_dotfile "$PWD/zlogout" "$HOME/.zlogout"
link_dotfile "$PWD/zpreztorc" "$HOME/.zpreztorc"
```

**Verify symlinks:**
```bash
ls -la ~/.config/nvim
# Should show: nvim -> /Users/you/.dotfiles/nvim
```

### Step 5: Install Neovim Plugins

```bash
# Open Neovim (it will auto-install plugins)
nvim

# Inside Neovim, run:
:Lazy sync
:Mason
:TSUpdate

# Check health
:checkhealth
```

### Step 6: Setup Yazi Plugins

```bash
# Create plugins directory
mkdir -p ~/.config/yazi/plugins

# Yazi will work out of the box with your config
```

### Step 7: Restart Shell

```bash
# Restart your terminal or
exec zsh
```

## 📁 File Structure

```
~/.dotfiles/
├── nvim/                      # Neovim configuration
│   ├── init.lua              # Entry point
│   ├── lua/
│   │   ├── config/           # Core settings
│   │   │   ├── settings.lua
│   │   │   ├── keymaps.lua
│   │   │   └── autocmds.lua
│   │   └── plugins/          # Plugin configs
│   │       ├── autocompletion.lua
│   │       ├── lsp.lua
│   │       ├── telescope.lua
│   │       ├── treesitter.lua
│   │       ├── formatter.lua
│   │       ├── linter.lua
│   │       ├── gitsigns.lua
│   │       ├── mini.lua
│   │       ├── statusline.lua
│   │       ├── theme.lua
│   │       ├── file_exp.lua
│   │       ├── yazi.lua
│   │       ├── greeter.lua
│   │       └── extras.lua
│   └── dracula_pro/          # Custom theme
│
├── ghostty/                   # Terminal config
│   └── config
│
├── yazi/                      # File manager config
│   ├── yazi.toml
│   ├── keymap.toml
│   └── theme.toml
│
├── zshrc                      # Zsh main config
├── zshenv                     # Environment variables
├── zprofile                   # Login shell config
├── zlogin                     # Post-login tasks
├── zlogout                    # Logout cleanup
├── zpreztorc                  # Prezto config
├── starship.toml             # Prompt config
├── .gitignore
└── README.md
```

## 🎯 Quick Start Guide

### Dotfiles Helper Script

We include a helper script to manage your dotfiles easily:

```bash
# Make it executable
chmod +x ~/.dotfiles/dotfiles

# Add to your PATH (already in zshrc)
# Or create alias:
alias dotfiles='~/.dotfiles/dotfiles'

# Use it!
dotfiles status       # Check git status and symlinks
dotfiles sync         # Commit and push/pull
dotfiles edit nvim    # Edit Neovim config
dotfiles update       # Update everything
dotfiles check        # Health check
dotfiles help         # See all commands
```

### Essential Keybindings

#### Neovim
```vim
<Space>         Leader key
<Space>ff       Find files
<Space>sg       Search in files
<Space>e        File explorer (Oil)
<Space>-        File explorer (Yazi)
gd              Go to definition
gr              Find references
K               Hover documentation
<Space>ca       Code actions
<Space>cf       Format code
gcc             Comment line
```

#### Terminal (Zsh)
```bash
ya              Open Yazi file manager
lg              Open Lazygit
<Ctrl+R>        Search history (with fzf)
z <directory>   Jump to directory (zoxide)
```

### Common Workflows

**1. Finding and editing files:**
```vim
<Space>ff       # Find file
<Space>sg       # Search text in files
gd              # Go to definition
<Space>ca       # Code actions
<Space>cf       # Format
```

**2. Git workflow:**
```bash
lg              # Open Lazygit
# or in Neovim:
]c              # Next git change
<Space>hp       # Preview change
<Space>hs       # Stage change
```

**3. File navigation:**
```bash
ya              # Yazi file manager
# or in Neovim:
<Space>e        # Oil (quick edits)
<Space>-        # Yazi (full features)
```

## 🔄 Updating

### Sync Your Changes to GitHub

Since we use symlinks, any changes you make are automatically in the repo:

```bash
# 1. Make changes in Neovim
nvim ~/.config/nvim/init.lua

# 2. The file is actually ~/.dotfiles/nvim/init.lua (symlink!)
# So git sees it immediately:
cd ~/.dotfiles
git status
# modified:   nvim/init.lua

# 3. Commit and push
git add .
git commit -m "Update nvim config"
git push
```

### Pull Updates from GitHub

```bash
cd ~/.dotfiles
git pull

# Changes apply INSTANTLY because of symlinks!
# No need to copy or reinstall anything
```

### Update Tools & Plugins

```bash
# Update Homebrew packages
brew update && brew upgrade

# Update Neovim plugins
nvim +Lazy sync +qa

# Update Prezto
cd ~/.zprezto
git pull && git submodule update --init --recursive
```

### Force Sync Everything

If you messed something up:

```bash
cd ~/.dotfiles
git fetch origin
git reset --hard origin/main  # ⚠️ This discards local changes!
```

## 🐛 Troubleshooting

### Neovim issues

**Plugins not loading:**
```vim
:Lazy clean
:Lazy sync
```

**LSP not working:**
```vim
:Mason
:checkhealth
```

**Treesitter errors:**
```vim
:TSUpdate
```

### Zsh issues

**Slow startup:**
```bash
# Profile startup
time zsh -i -c exit

# Check Prezto modules in ~/.zpreztorc
```

**Command not found:**
```bash
# Check PATH
echo $PATH

# Reload config
exec zsh
```

### Yazi issues

**Preview not working:**
```bash
# Install dependencies
brew install ffmpegthumbnailer poppler imagemagick
```

## 📚 Documentation

- [Neovim Cheatsheet](./docs/neovim-cheatsheet.md)
- [Keybindings](./docs/keybindings.md)
- [Plugin List](./docs/plugins.md)

## 🎨 Customization

### Changing Theme

The theme is Dracula Pro Van Helsing. To change:

**Neovim:**
Edit `~/.config/nvim/lua/plugins/theme.lua`:
```lua
vim.cmd([[colorscheme dracula_pro_van_helsing]])
-- Other variants: dracula_pro, dracula_pro_buffy, dracula_pro_blade
```

**Ghostty:**
Edit `~/.config/ghostty/config` color palette section.

**Starship:**
Edit `~/.config/starship.toml` palette section.

### Adding Neovim Plugins

1. Create new file in `~/.config/nvim/lua/plugins/`
2. Add plugin config:
```lua
return {
  "author/plugin-name",
  config = function()
    -- your config
  end,
}
```
3. Restart Neovim: `:Lazy sync`

### Adding Zsh Plugins

Edit `~/.zpreztorc`:
```bash
zstyle ':prezto:load' pmodule \
  'existing-module' \
  'new-module'
```

## 🤝 Contributing

Feel free to fork and customize for your needs!

### Workflow for Your Own Changes

With symlinks, it's super easy:

```bash
# 1. Edit any config file normally
nvim ~/.config/nvim/lua/plugins/telescope.lua
# or
code ~/.zshrc

# 2. Test your changes
# Restart Neovim or shell to verify

# 3. Commit when happy
cd ~/.dotfiles
git add .
git commit -m "feat: add new telescope mapping"
git push
```

### Keeping Private Settings

Some settings shouldn't be public (API keys, personal info):

```bash
# In your configs, use local files that are gitignored:

# Neovim: Create ~/.config/nvim/lua/local.lua
# Then in init.lua:
pcall(require, "local")  -- Won't error if doesn't exist

# Zsh: Create ~/.zshrc.local
# Already sourced at end of .zshrc
# Add: export GITHUB_TOKEN="secret"

# These files are in .gitignore, so safe!
```

### Sharing Improvements

Found a better plugin or config? PRs welcome!

1. Fork the repo
2. Make your changes
3. Test thoroughly
4. Submit PR with description

## 📝 License

MIT License - Feel free to use and modify

## 🙏 Credits

- [Neovim](https://neovim.io/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Prezto](https://github.com/sorin-ionescu/prezto)
- [Starship](https://starship.rs/)
- [Yazi](https://github.com/sxyazi/yazi)
- [Dracula Pro](https://draculatheme.com/pro)
- [Ghostty](https://ghostty.org/)

## 💬 Questions?

Open an issue or check the [Neovim Cheatsheet](./docs/neovim-cheatsheet.md)

---

**Made with ❤️ and ☕**

*Last updated: December 2024*
