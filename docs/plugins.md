# Neovim Plugins

This document lists all plugins used in this Neovim configuration, organized by category.

## Plugin Manager

### lazy.nvim

**Location:** `init.lua`

- Modern plugin manager for Neovim
- Lazy-loading for better performance
- Automatic installation and updates
- Access: `<leader>ll` to open Lazy interface

---

## Core Functionality

### vim-sleuth

**File:** `init.lua`

- Automatically detects and sets indentation settings
- No configuration needed

### nvim-autopairs

**File:** `init.lua`

- Automatically inserts closing brackets, quotes, etc.
- Smart integration with completion

### nvim-ts-autotag

**File:** `init.lua`

- Auto-close and auto-rename HTML/XML tags
- Works with JSX/TSX files

---

## File Management

### oil.nvim

**File:** `lua/plugins/file_exp.lua`

- Edit your filesystem like a buffer
- Keybindings:
  - `<leader>e` - Toggle Oil file explorer
  - `h` - Go to parent directory
  - `l` - Open file/directory
  - `<C-v>` - Open in vertical split
  - `<C-x>` - Open in horizontal split
  - `q` - Close Oil

**Features:**

- Delete files by deleting lines
- Rename files by editing text
- Move files by cutting/pasting lines
- Create files/folders by adding new lines
- Trash support enabled

### telescope.nvim

**File:** `lua/plugins/telescope.lua`

- Fuzzy finder for files, buffers, and more
- Extensions:
  - telescope-fzf-native.nvim (fast fuzzy finding)
  - telescope-ui-select.nvim (native UI integration)
  - telescope-file-browser.nvim (file browser)

**Main Keybindings:**

- `<leader>sf` - Search files
- `<leader>sg` - Live grep (search in files)
- `<leader>sh` - Search help
- `<leader>sk` - Search keymaps
- `<leader>sw` - Search current word
- `<leader>sd` - Search diagnostics
- `<leader>sr` - Resume last search
- `<leader>s.` - Search recent files
- `<leader><leader>` - Find buffers
- `<leader>/` - Fuzzy search in current buffer
- `<leader>sn` - Search Neovim config files
- `<leader>se` - File browser (current directory)
- `<leader>sE` - File browser (project root)

**Telescope File Browser Operations:**

- `<C-c>` - Create new file/folder (add `/` at end for folder)
- `<C-r>` - Rename file
- `<C-d>` - Delete file
- `<C-m>` - Move file
- `<C-y>` - Copy file
- `<C-h>` - Toggle hidden files
- `<Tab>` - Select multiple files
- Navigation with `j/k` or arrow keys

---

## LSP & Code Intelligence

### nvim-lspconfig

**File:** `lua/plugins/lsp.lua`

- LSP configuration for various languages
- Supported languages:
  - Java (jdtls)
  - SQL (sqls)
  - Lua (lua_ls)
  - JavaScript/TypeScript (ts_ls)
  - HTML, CSS (html, cssls)
  - Tailwind CSS (tailwindcss)
  - YAML (yamlls)
  - PHP (intelephense)

**LSP Keybindings:**

- `gd` - Go to definition
- `gD` - Go to declaration
- `gI` - Go to implementation
- `gr` - Go to references
- `<leader>D` - Type definition
- `<leader>ds` - Document symbols
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code action
- `K` - Hover documentation
- `<leader>th` - Toggle inlay hints
- `<leader>co` - Organize imports (TypeScript)

### mason.nvim

**File:** `lua/plugins/lsp.lua`

- Package manager for LSP servers, formatters, and linters
- Automatic installation of configured servers
- Access: `<leader>mm` to open Mason

### lazydev.nvim

**File:** `lua/plugins/lsp.lua`

- Lua development setup for Neovim
- Provides completions for Neovim APIs

---

## Completion

### blink.cmp

**File:** `lua/plugins/autocompletion.lua` (referenced in lsp.lua)

- Modern completion engine
- Fast and lightweight
- LSP integration

### nvim-cmp (Alternative)

**File:** `lua/plugins/autocompletion.lua`

- Completion engine with extensive customization
- Sources: LSP, LuaSnip, path
- **Keybindings:**
  - `<C-n>` - Next completion
  - `<C-p>` - Previous completion
  - `<C-y>` - Confirm completion
  - `<C-Space>` - Trigger completion
  - `<C-b>/<C-f>` - Scroll docs

### LuaSnip

**File:** `lua/plugins/autocompletion.lua`

- Snippet engine
- Includes friendly-snippets collection
- **Keybindings:**
  - `<C-l>` - Expand/jump forward in snippet
  - `<C-h>` - Jump backward in snippet
  - `<Tab>` - Jump forward (in snippet mode)

---

## Syntax & Highlighting

### nvim-treesitter

**File:** `lua/plugins/treesitter.lua`

- Advanced syntax highlighting
- Code navigation with textobjects
- **Keybindings:**
  - `]f` / `[f` - Next/previous function start
  - `]F` / `[F` - Next/previous function end
  - `]c` / `[c` - Next/previous class start
  - `]C` / `[C` - Next/previous class end

**Supported Languages:**

- bash, sql, c, html, lua, markdown, vim
- javascript, typescript, tsx, json
- python, go, php

### nvim-treesitter-textobjects

**File:** `lua/plugins/treesitter.lua`

- Enhanced text objects based on syntax tree
- Smart navigation between functions and classes

---

## Code Formatting

### conform.nvim

**File:** `lua/plugins/formatter.lua`

- Format on save enabled by default
- Per-language formatters configured
- **Keybindings:**
  - `<leader>cF` - Format buffer

**Supported Formatters:**

- Lua: stylua
- Shell: shfmt
- Web: prettier (HTML, CSS, JS, TS, JSON, YAML, etc.)
- Python: ruff_format
- SQL: sqlfluff

**Commands:**

- `:FormatDisable` - Disable format-on-save
- `:FormatDisable!` - Disable for current buffer only
- `:FormatEnable` - Re-enable format-on-save

---

## Code Linting

### nvim-lint

**File:** `lua/plugins/linter.lua`

- Linting on save and text changes
- **Configured Linters:**
  - fish: fish
  - JavaScript/TypeScript/JSON: eslint

---

## Git Integration

### gitsigns.nvim

**File:** `lua/plugins/gitsigns.lua`

- Git status in sign column
- **Keybindings:**
  - `]c` / `[c` - Next/previous git change
  - `<leader>hs` - Stage hunk
  - `<leader>hr` - Reset hunk
  - `<leader>hS` - Stage buffer
  - `<leader>hu` - Undo stage hunk
  - `<leader>hR` - Reset buffer
  - `<leader>hp` - Preview hunk
  - `<leader>hb` - Blame line
  - `<leader>hd` - Diff against index
  - `<leader>hD` - Diff against last commit
  - `<leader>tb` - Toggle blame line
  - `<leader>tD` - Toggle deleted lines

---

## UI Enhancements

### alpha-nvim

**File:** `lua/plugins/greeter.lua`

- Startup screen with ASCII art
- Quick actions for new file, find file, recent files, etc.

### lualine.nvim

**File:** `lua/plugins/statusline.lua`

- Customizable statusline
- Dracula Pro theme integration
- Shows mode, branch, diagnostics, file type, etc.

### mini.nvim

**File:** `lua/plugins/mini.lua`

- Collection of independent modules:

#### mini.icons

- File type icons
- Mocks nvim-web-devicons for compatibility

#### mini.ai

- Enhanced text objects
- Examples:
  - `va)` - Select around parentheses
  - `yinq` - Yank inside next quote
  - `ci'` - Change inside quote

#### mini.surround

- Add/delete/replace surroundings
- Examples:
  - `saiw)` - Surround word with parentheses
  - `sd'` - Delete surrounding quotes
  - `sr)'` - Replace parentheses with quotes

#### mini.pairs

- Auto-close brackets, quotes, etc.
- Smart integration with treesitter

#### mini.comment

- Comment/uncomment code
- **Keybindings:**
  - `gcc` - Toggle line comment
  - `gc{motion}` - Comment motion (e.g., `gc}` for paragraph)
  - Visual mode: `gc` - Comment selection

---

## Language-Specific

### gopher.nvim

**File:** `init.lua`

- Go language utilities
- Depends on nvim-dap for debugging

### sqls.nvim

**File:** `lua/plugins/lsp.lua`

- SQL language server integration
- Enhanced SQL editing features

---

## Utilities

### todo-comments.nvim

**File:** `init.lua`

- Highlight and search TODO comments
- Supports: TODO, HACK, BUG, NOTE, FIX, WARNING, PERF

### nvim-ts-context-commentstring

**File:** `lua/plugins/mini.lua`

- Context-aware commenting for embedded languages
- Works with Vue, Svelte, JSX/TSX

### plenary.nvim

**File:** `lua/plugins/telescope.lua`

- Utility library required by many plugins
- Provides async functions, file operations, etc.

---

## Theme

### dracula_pro

**File:** `lua/plugins/theme.lua`

- Dracula Pro Van Helsing theme
- Custom directory: `~/.config/nvim/dracula_pro`
- Italic comments and bold text enabled

---

## Summary

**Total Plugin Count:** ~25+ plugins/modules

**Categories:**

- Core: 3
- File Management: 2
- LSP & Intelligence: 4
- Completion: 3
- Syntax: 2
- Formatting: 1
- Linting: 1
- Git: 1
- UI: 3
- Mini Modules: 5
- Language-Specific: 2
- Utilities: 3
- Theme: 1

All plugins are managed by lazy.nvim and configured in the `lua/plugins/` directory with lazy-loading enabled for optimal performance.
