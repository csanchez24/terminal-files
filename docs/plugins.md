# 🔌 Neovim Plugins Reference

Complete list of all plugins used in this configuration.

## 📦 Plugin Manager

### lazy.nvim

- **What**: Modern plugin manager for Neovim
- **Why**: Lazy-loading, fast startup, automatic updates
- **Access**: `<leader>ll` or `:Lazy`

---

## 🎨 UI & Theme

### dracula_pro

- **What**: Dracula Pro Van Helsing theme
- **File**: `lua/plugins/theme.lua`
- **Variants**: dracula_pro, dracula_pro_van_helsing, dracula_pro_buffy, dracula_pro_blade, dracula_pro_morbius, dracula_pro_lincoln, dracula_pro_alucard

### alpha-nvim

- **What**: Startup screen with ASCII art
- **File**: `lua/plugins/greeter.lua`
- **Features**: Quick actions (new file, find file, recent files)

### lualine.nvim

- **What**: Customizable statusline
- **File**: `lua/plugins/statusline.lua`
- **Features**: Mode, branch, diagnostics, file type, progress

### mini.icons

- **What**: File type icons (replaces nvim-web-devicons)
- **File**: `lua/plugins/mini.lua`
- **Features**: Icon support for all plugins

### noice.nvim

- **What**: Better UI for messages, cmdline, and popups
- **File**: `lua/plugins/extras.lua`
- **Keys**:
  - `<leader>snl` - Last message
  - `<leader>snh` - Message history
  - `<C-f>/<C-b>` - Scroll in LSP docs

### nvim-notify

- **What**: Notification manager
- **File**: `lua/plugins/extras.lua`
- **Keys**: `<leader>un` - Dismiss notifications

---

## 📁 File Management

### oil.nvim

- **What**: Edit filesystem like a buffer
- **File**: `lua/plugins/file_exp.lua`
- **Keys**:
  - `<leader>e` - Toggle Oil
  - `h` - Parent directory
  - `l` - Enter/open
  - `<C-v>` - Vertical split
  - `<C-x>` - Horizontal split
  - `q` - Close

### telescope.nvim

- **What**: Fuzzy finder for everything
- **File**: `lua/plugins/telescope.lua`
- **Extensions**: fzf-native, ui-select, file-browser
- **Main Keys**:
  - `<leader>ff` - Find files
  - `<leader>sg` - Live grep
  - `<leader>sh` - Help tags
  - `<leader>sw` - Word under cursor
  - `<leader><space>` - Buffers
  - `<leader>se` - File browser (cwd)
  - `<leader>sE` - File browser (root)

### yazi.nvim

- **What**: Terminal file manager integration
- **File**: `lua/plugins/yazi.lua`
- **Keys**:
  - `<leader>-` - Open at current file
  - `<leader>fy` - Open in cwd

---

## 💻 LSP & Language Support

### nvim-lspconfig

- **What**: LSP client configurations
- **File**: `lua/plugins/lsp.lua`
- **Languages**:
  - Lua (lua_ls)
  - JavaScript/TypeScript (ts_ls)
  - HTML/CSS (html, cssls)
  - Tailwind (tailwindcss)
  - JSON/YAML (jsonls, yamlls)
  - Python (basedpyright)
  - Go (gopls)
  - PHP (intelephense)
  - SQL (sqls)
  - Java (jdtls via separate config)

### mason.nvim

- **What**: LSP/DAP/linter/formatter installer
- **File**: `lua/plugins/lsp.lua`
- **Access**: `<leader>mm` or `:Mason`

### mason-lspconfig.nvim

- **What**: Bridge between mason and lspconfig
- **File**: `lua/plugins/lsp.lua`

### mason-tool-installer.nvim

- **What**: Auto-install Mason packages
- **File**: `lua/plugins/lsp.lua`

### lazydev.nvim

- **What**: Lua development for Neovim configs
- **File**: `lua/plugins/lsp.lua`
- **Features**: Completions for vim APIs

### schemastore.nvim

- **What**: JSON/YAML schema support
- **File**: `lua/plugins/lsp.lua`

### sqls.nvim

- **What**: Enhanced SQL LSP features
- **File**: `lua/plugins/lsp.lua`

---

## ⚡ Completion

### blink.cmp

- **What**: Ultra-fast completion engine
- **File**: `lua/plugins/autocompletion.lua`
- **Keys**:
  - `<C-Space>` - Trigger completion
  - `<CR>` - Accept
  - `<C-n>/<C-p>` - Next/Previous
  - `<Tab>/<S-Tab>` - Snippet navigation

### friendly-snippets

- **What**: Collection of useful snippets
- **File**: Dependency of blink.cmp

---

## 🌳 Syntax & Highlighting

### nvim-treesitter

- **What**: Advanced syntax highlighting
- **File**: `lua/plugins/treesitter.lua`
- **Languages**: bash, c, html, lua, markdown, vim, javascript, typescript, json, python, go, php, sql, and more
- **Features**: Smart highlighting, code navigation

### nvim-treesitter-textobjects

- **What**: Enhanced text objects via treesitter
- **File**: `lua/plugins/treesitter.lua`
- **Keys**:
  - `]f/[f` - Next/previous function
  - `]c/[c` - Next/previous class

### nvim-ts-context-commentstring

- **What**: Context-aware commenting for JSX/TSX
- **File**: Dependency of mini.comment

---

## ✏️ Editing

### mini.nvim (Collection)

**File**: `lua/plugins/mini.lua`

#### mini.ai

- **What**: Better text objects
- **Examples**: `cin"` (change in next quote), `daf` (delete around function)

#### mini.surround

- **What**: Add/delete/replace surroundings
- **Keys**:
  - `sa` - Surround add
  - `sd` - Surround delete
  - `sr` - Surround replace

#### mini.pairs

- **What**: Auto-close brackets/quotes

#### mini.comment

- **What**: Smart commenting
- **Keys**:
  - `gcc` - Toggle line comment
  - `gc{motion}` - Comment motion

#### mini.bufremove

- **What**: Better buffer deletion
- **Keys**:
  - `<leader>bd` - Delete buffer
  - `<leader>bD` - Force delete

#### mini.indentscope

- **What**: Indent guides with scope highlighting

### nvim-autopairs

- **What**: Auto-close pairs (alternative to mini.pairs)
- **File**: `init.lua`

---

## 🎨 Formatting & Linting

### conform.nvim

- **What**: Code formatter
- **File**: `lua/plugins/formatter.lua`
- **Keys**: `<leader>cf` - Format buffer
- **Formatters**:
  - Lua: stylua
  - Shell: shfmt
  - Web: prettier (HTML, CSS, JS, TS, JSON, YAML)
  - Python: ruff_format
  - Go: goimports, gofmt
  - PHP: php_cs_fixer
  - SQL: sqlfluff
  - C/C++: clang_format

### nvim-lint

- **What**: Asynchronous linter
- **File**: `lua/plugins/linter.lua`
- **Linters**:
  - fish: fish
  - JavaScript/TypeScript: eslint
  - PHP: phpcs

---

## 🔧 Git Integration

### gitsigns.nvim

- **What**: Git decorations and operations
- **File**: `lua/plugins/gitsigns.lua`
- **Keys**:
  - `]c/[c` - Next/previous hunk
  - `<leader>hs` - Stage hunk
  - `<leader>hr` - Reset hunk
  - `<leader>hp` - Preview hunk
  - `<leader>hb` - Blame line
  - `<leader>hd` - Diff this
  - `<leader>tb` - Toggle blame

---

## 🚀 Utilities

### trouble.nvim

- **What**: Better diagnostics list
- **File**: `lua/plugins/extras.lua`
- **Keys**:
  - `<leader>xx` - Toggle diagnostics
  - `<leader>xX` - Buffer diagnostics
  - `<leader>cs` - Symbols

### nvim-ufo

- **What**: Better code folding
- **File**: `lua/plugins/extras.lua`
- **Keys**: `zo/zc/za` - Open/close/toggle fold

### todo-comments.nvim

- **What**: Highlight TODO comments
- **File**: `lua/plugins/extras.lua`
- **Keys**:
  - `]t/[t` - Next/previous todo
  - `<leader>xt` - Todo list
- **Supported**: TODO, HACK, BUG, NOTE, FIX, WARNING, PERF

### flash.nvim

- **What**: Navigate with search labels
- **File**: `lua/plugins/extras.lua`
- **Keys**:
  - `s` - Flash jump
  - `S` - Flash treesitter

### harpoon (v2)

- **What**: Quick file navigation
- **File**: `lua/plugins/extras.lua`
- **Keys**:
  - `<leader>ha` - Add file
  - `<leader>hh` - Toggle menu
  - `<leader>1-5` - Jump to file 1-5

### plenary.nvim

- **What**: Lua utility library
- **File**: Dependency for many plugins

---

## 🛠️ Language-Specific

### gopher.nvim

- **What**: Go language utilities
- **File**: `init.lua`
- **For**: Go development helpers

---

## 📝 Core Utilities

### vim-sleuth

- **What**: Auto-detect indentation
- **File**: `init.lua`

### Comment.nvim

- **What**: Alternative commenting plugin
- **File**: `init.lua`
- **Note**: Can coexist with mini.comment

---

## 📊 Plugin Count Summary

- **UI/Theme**: 6 plugins
- **File Management**: 3 plugins
- **LSP**: 6 plugins
- **Completion**: 2 plugins
- **Syntax**: 3 plugins
- **Editing**: 7 plugins (mini.nvim modules)
- **Formatting/Linting**: 2 plugins
- **Git**: 1 plugin
- **Utilities**: 6 plugins
- **Language-specific**: 1 plugin
- **Core**: 2 plugins

**Total**: ~30+ plugins/modules

---

## 🔄 Plugin Management

### Install/Update

```vim
:Lazy sync           " Install/update/clean all
:Lazy update         " Update only
:Lazy clean          " Remove unused
```

### Health Check

```vim
:checkhealth         " Check all
:checkhealth lazy    " Check Lazy
:checkhealth lsp     " Check LSP
```

### Mason Management

```vim
:Mason               " Open UI
:MasonUpdate         " Update registry
:MasonInstall <tool> " Install tool
```

---

## 💡 Tips

1. **Lazy Loading**: Most plugins load on-demand for fast startup
2. **Dependencies**: All dependencies auto-installed by Lazy
3. **Updates**: Run `:Lazy sync` weekly
4. **New Plugins**: Add to `lua/plugins/` directory
5. **Remove Plugins**: Delete file and run `:Lazy clean`

---

## 📚 Resources

- [Lazy.nvim Docs](https://github.com/folke/lazy.nvim)
- [Mason Registry](https://mason-registry.dev/)
- [Neovim LSP Config](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

---

**Last Updated**: December 2024
