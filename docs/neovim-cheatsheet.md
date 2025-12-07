# 🚀 Neovim Complete Cheatsheet

## 📑 Table of Contents
- [General Vim](#general-vim)
- [Plugin Management](#plugin-management)
- [File Navigation](#file-navigation)
- [Text Editing](#text-editing)
- [LSP (Language Server)](#lsp-language-server)
- [Autocompletion](#autocompletion)
- [Git Integration](#git-integration)
- [Search & Replace](#search--replace)
- [Diagnostics & Errors](#diagnostics--errors)
- [Formatting & Linting](#formatting--linting)
- [Terminal](#terminal)
- [Buffers & Windows](#buffers--windows)

---

## General Vim

### Modes
| Key | Description |
|-----|-------------|
| `i` | Insert mode (before cursor) |
| `a` | Insert mode (after cursor) |
| `I` | Insert at start of line |
| `A` | Insert at end of line |
| `o` | New line below |
| `O` | New line above |
| `v` | Visual mode |
| `V` | Visual line mode |
| `<C-v>` | Visual block mode |
| `<Esc>` | Normal mode |

### Basic Movement
| Key | Description |
|-----|-------------|
| `h/j/k/l` | Left/Down/Up/Right |
| `w` | Next word |
| `b` | Previous word |
| `e` | End of word |
| `0` | Start of line |
| `$` | End of line |
| `gg` | Start of file |
| `G` | End of file |
| `{` | Previous paragraph |
| `}` | Next paragraph |
| `<C-u>` | Scroll up half page |
| `<C-d>` | Scroll down half page |

### Basic Editing
| Key | Description |
|-----|-------------|
| `x` | Delete character |
| `dd` | Delete line |
| `D` | Delete to end of line |
| `yy` | Yank (copy) line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `u` | Undo |
| `U` | Redo (`<C-r>` in config) |
| `.` | Repeat last command |
| `<C-s>` | Save file |

---

## Plugin Management

### Lazy.nvim
| Command | Description |
|---------|-------------|
| `:Lazy` | Open Lazy UI |
| `:Lazy sync` | Install/Update/Clean plugins |
| `:Lazy update` | Update plugins |
| `:Lazy clean` | Remove unused plugins |
| `:Lazy profile` | Show load times |
| `:Lazy log` | Show git log |
| `<leader>ll` | Open Lazy UI |

---

## File Navigation

### Telescope (Fuzzy Finder)
| Key | Description |
|-----|-------------|
| `<leader>ff` | Find Files |
| `<leader>fr` | Recent Files |
| `<leader><space>` | Open Buffers |
| `<leader>sg` | Live Grep (search text) |
| `<leader>sw` | Search Word under cursor |
| `<leader>sb` | Search in current Buffer |
| `<leader>sh` | Search Help |
| `<leader>sk` | Search Keymaps |
| `<leader>sc` | Search Command history |
| `<leader>sm` | Search Marks |
| `<leader>sr` | Resume last search |
| `<leader>sn` | Search Neovim config |
| `<leader>se` | File browser (cwd) |
| `<leader>sE` | File browser (root) |

#### Inside Telescope
| Key | Description |
|-----|-------------|
| `<C-n>` / `<C-j>` | Next item |
| `<C-p>` / `<C-k>` | Previous item |
| `<Enter>` | Open file |
| `<C-x>` | Open in horizontal split |
| `<C-v>` | Open in vertical split |
| `<C-t>` | Open in new tab |
| `<C-q>` | Send to quickfix list |
| `<C-u>` | Scroll preview up |
| `<C-d>` | Scroll preview down |
| `<Tab>` | Toggle selection |
| `<Esc>` | Close |

### Oil.nvim (File Explorer)
| Key | Description |
|-----|-------------|
| `<leader>e` | Toggle Oil |
| `-` | Go to parent directory |
| `<Enter>` | Open file/directory |
| `<C-h>` | Toggle hidden files |
| `<C-s>` | Open in horizontal split |
| `<C-v>` | Open in vertical split |
| `g?` | Show help |
| `:w` | Save changes (rename/move files) |

### Yazi (Terminal File Manager)
| Key | Description |
|-----|-------------|
| `<leader>-` | Open Yazi at current file |
| `<leader>e` | Open Yazi in cwd |
| `<C-up>` | Resume last Yazi session |

#### Inside Yazi
| Key | Description |
|-----|-------------|
| `h/j/k/l` | Navigate |
| `<Enter>` | Open file |
| `<Space>` | Select file |
| `y` | Copy |
| `x` | Cut |
| `p` | Paste |
| `d` | Delete |
| `r` | Rename |
| `/` | Search |
| `z` | Jump with zoxide |
| `t` | New tab |
| `[` / `]` | Switch tabs |
| `.` | Toggle hidden |
| `q` | Quit |

---

## Text Editing

### Mini.surround
| Key | Description |
|-----|-------------|
| `sa{motion}{char}` | Add surrounding |
| `sd{char}` | Delete surrounding |
| `sr{old}{new}` | Replace surrounding |
| `sf{char}` | Find surrounding (right) |
| `sF{char}` | Find surrounding (left) |
| `sh{char}` | Highlight surrounding |

**Examples:**
```vim
saiw)    " Surround Add Inner Word with )
sd"      " Surround Delete "
sr"'     " Surround Replace " with '
```

### Mini.ai (Better text objects)
| Key | Description |
|-----|-------------|
| `a` / `i` | Around / Inside |
| `n` / `l` | Next / Last |
| `cin"` | Change In Next " |
| `dan)` | Delete Around Next ) |
| `vil{` | Visual Inside Last { |

**Text objects:** `w` word, `s` sentence, `p` paragraph, `t` tag, `f` function, `c` class

### Mini.comment
| Key | Description |
|-----|-------------|
| `gcc` | Toggle comment line |
| `gc{motion}` | Toggle comment motion |
| `gcap` | Toggle comment paragraph |
| `gcip` | Toggle comment inside paragraph |

### Mini.pairs
Auto-closes: `()` `[]` `{}` `""` `''` ``` `` ```

### Vim Motions (Enhanced)
| Key | Description |
|-----|-------------|
| `s{char}{char}` | Flash jump (anywhere on screen) |
| `S` | Flash treesitter (functions/classes) |
| `]f` / `[f` | Next/Previous function |
| `]c` / `[c` | Next/Previous class |

---

## LSP (Language Server)

### Navigation
| Key | Description |
|-----|-------------|
| `gd` | Go to Definition |
| `gD` | Go to Declaration |
| `gr` | Go to References |
| `gI` | Go to Implementation |
| `gy` | Go to Type definition |
| `K` | Hover Documentation |
| `gK` | Signature Help |

### Code Actions
| Key | Description |
|-----|-------------|
| `<leader>ca` | Code Action |
| `<leader>rn` | Rename symbol |
| `<leader>co` | Organize Imports (TS) |

### Symbols & Workspace
| Key | Description |
|-----|-------------|
| `<leader>ds` | Document Symbols |
| `<leader>ws` | Workspace Symbols |
| `<leader>wa` | Workspace Add folder |
| `<leader>wr` | Workspace Remove folder |
| `<leader>wl` | Workspace List folders |

### Diagnostics
| Key | Description |
|-----|-------------|
| `[d` | Previous Diagnostic |
| `]d` | Next Diagnostic |
| `<leader>cd` | Line Diagnostics (float) |
| `<leader>cl` | Location List |

### Inlay Hints
| Key | Description |
|-----|-------------|
| `<leader>th` | Toggle Inlay Hints |

---

## Autocompletion

### Blink.cmp
| Key | Description |
|-----|-------------|
| `<C-Space>` | Show completions |
| `<CR>` / `<C-y>` | Accept completion |
| `<C-n>` | Next item |
| `<C-p>` | Previous item |
| `<C-e>` | Close menu |
| `<C-b>` | Scroll docs up |
| `<C-f>` | Scroll docs down |
| `<Tab>` | Next snippet field |
| `<S-Tab>` | Previous snippet field |

---

## Git Integration

### Gitsigns
| Key | Description |
|-----|-------------|
| `]c` | Next hunk (change) |
| `[c` | Previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hR` | Reset buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff this |
| `<leader>hD` | Diff against last commit |
| `<leader>tb` | Toggle blame line |
| `<leader>tD` | Toggle deleted |

### Git Commands (Telescope)
| Key | Description |
|-----|-------------|
| `<leader>gc` | Git Commits |
| `<leader>gs` | Git Status |

---

## Search & Replace

### Search
| Key | Description |
|-----|-------------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor |
| `#` | Search word backward |
| `<Esc>` | Clear search highlight |

### Find & Replace
```vim
:%s/old/new/g        " Replace all in file
:%s/old/new/gc       " Replace with confirmation
:s/old/new/g         " Replace in current line
:'<,'>s/old/new/g    " Replace in visual selection
```

### Multiple Cursors Alternative
| Key | Description |
|-----|-------------|
| `s*` | Select word, then `.` to repeat |
| (visual) `s*` | Select selection, then `.` |

---

## Diagnostics & Errors

### Trouble.nvim
| Key | Description |
|-----|-------------|
| `<leader>xx` | Toggle Diagnostics |
| `<leader>xX` | Buffer Diagnostics |
| `<leader>cs` | Symbols (Trouble) |
| `<leader>cl` | LSP definitions/refs |
| `<leader>xL` | Location List |
| `<leader>xQ` | Quickfix List |

### Todo Comments
| Key | Description |
|-----|-------------|
| `]t` | Next todo comment |
| `[t` | Previous todo comment |
| `<leader>xt` | Todo (Trouble) |
| `<leader>xT` | Todo/Fix/Fixme |
| `<leader>st` | Todo (Telescope) |

---

## Formatting & Linting

### Conform (Formatter)
| Key | Description |
|-----|-------------|
| `<leader>cf` | Format buffer |
| `<leader>cF` | Format buffer |
| `:Format` | Format command |
| `:FormatDisable` | Disable auto-format |
| `:FormatDisable!` | Disable for buffer |
| `:FormatEnable` | Enable auto-format |

### File saves with auto-format
```vim
:w    " Save (auto-formats if enabled)
```

---

## Terminal

### Terminal Management
| Key | Description |
|-----|-------------|
| `<leader>tn` | Terminal in new tab |
| `<leader>t_` | Terminal below |
| `<leader>t\|` | Terminal side |
| `<Esc><Esc>` | Enter normal mode |
| `<C-h/j/k/l>` | Navigate windows |

---

## Buffers & Windows

### Buffers
| Key | Description |
|-----|-------------|
| `<S-h>` / `[b` | Previous buffer |
| `<S-l>` / `]b` | Next buffer |
| `<leader>bb` | Switch to other buffer |
| `<leader>bd` | Delete buffer |
| `<leader>bD` | Delete buffer (force) |
| `<leader><space>` | Show buffers (Telescope) |

### Windows
| Key | Description |
|-----|-------------|
| `<C-h/j/k/l>` | Navigate windows |
| `<leader>ww` | Other window |
| `<leader>wd` | Delete window |
| `<leader>w-` | Split horizontal |
| `<leader>w\|` | Split vertical |
| `<leader>-` | Split horizontal |
| `<leader>\|` | Split vertical |
| `<leader>=` | Equalize windows |

### Window Resize (macOS)
| Key | Description |
|-----|-------------|
| `˚` (Alt+k) | Increase height |
| `∆` (Alt+j) | Decrease height |
| `˙` (Alt+h) | Decrease width |
| `¬` (Alt+l) | Increase width |

### Tabs
| Key | Description |
|-----|-------------|
| `<leader><tab><tab>` | New tab |
| `<leader><tab>d` | Close tab |
| `<leader><tab>]` | Next tab |
| `<leader><tab>[` | Previous tab |
| `<leader><tab>f` | First tab |
| `<leader><tab>l` | Last tab |

---

## Harpoon (File Marks)

| Key | Description |
|-----|-------------|
| `<leader>ha` | Add file to harpoon |
| `<leader>hh` | Toggle harpoon menu |
| `<leader>1` | Go to file 1 |
| `<leader>2` | Go to file 2 |
| `<leader>3` | Go to file 3 |
| `<leader>4` | Go to file 4 |
| `<leader>5` | Go to file 5 |

---

## Code Folding

### UFO (Better folding)
| Key | Description |
|-----|-------------|
| `zc` | Close fold |
| `zo` | Open fold |
| `za` | Toggle fold |
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zr` | Reduce folding level |
| `zm` | More folding |

---

## Noice (UI)

| Key | Description |
|-----|-------------|
| `<leader>snl` | Last message |
| `<leader>snh` | Message history |
| `<leader>sna` | All messages |
| `<leader>un` | Dismiss notifications |
| `<C-f>` | Scroll forward (in LSP docs) |
| `<C-b>` | Scroll backward (in LSP docs) |

---

## Quick Lists

### Quickfix & Location List
| Key | Description |
|-----|-------------|
| `<leader>xq` | Open quickfix |
| `<leader>xl` | Open location list |
| `[q` | Previous quickfix |
| `]q` | Next quickfix |

---

## Mason (Tool Manager)

| Command | Description |
|---------|-------------|
| `:Mason` | Open Mason UI |
| `:MasonUpdate` | Update registry |
| `:MasonInstall <tool>` | Install tool |
| `:MasonUninstall <tool>` | Uninstall tool |
| `<leader>mm` | Open Mason |

---

## Useful Ex Commands

### File Operations
```vim
:w              " Save
:q              " Quit
:wq / :x        " Save and quit
:q!             " Quit without saving
:wa             " Save all
:qa             " Quit all
:e <file>       " Edit file
:e!             " Reload file
```

### Buffer Operations
```vim
:ls             " List buffers
:b <number>     " Go to buffer number
:bd             " Delete buffer
:bn             " Next buffer
:bp             " Previous buffer
```

### Health Check
```vim
:checkhealth    " Check Neovim health
:Lazy sync      " Sync plugins
:TSUpdate       " Update treesitter parsers
```

---

## Tips & Tricks

### Search in Files
```vim
<leader>sg      " Live grep in project
<leader>sw      " Search word under cursor
/pattern<CR>    " Search in current file
*               " Search current word
```

### Quick Edits
```vim
ciw             " Change inner word
diw             " Delete inner word
yiw             " Yank inner word
ci"             " Change inside quotes
da(             " Delete around parentheses
```

### Jump Around
```vim
<C-o>           " Jump back
<C-i>           " Jump forward
''              " Jump to last position
m{a-z}          " Set mark
'{a-z}          " Jump to mark
```

### Macros
```vim
qa              " Record macro to register 'a'
q               " Stop recording
@a              " Play macro 'a'
@@              " Repeat last macro
```

---

## Keyboard Symbols Reference

| Symbol | macOS Key | Description |
|--------|-----------|-------------|
| `<C-x>` | Control+x | Control key |
| `<M-x>` / `<A-x>` | Option+x | Alt/Option key |
| `<S-x>` | Shift+x | Shift key |
| `<D-x>` | Command+x | Command key (GUI only) |
| `<leader>` | Space | Leader key |
| `<CR>` | Enter | Enter/Return |
| `<Esc>` | Escape | Escape key |
| `<Tab>` | Tab | Tab key |
| `<BS>` | Backspace | Backspace |

---

## Common Workflows

### Finding & Editing
1. `<leader>ff` - Find file
2. `<leader>sg` - Search in files
3. `gd` - Go to definition
4. `<leader>ca` - Code actions
5. `<leader>cf` - Format

### Git Workflow
1. `]c` - Next change
2. `<leader>hp` - Preview hunk
3. `<leader>hs` - Stage hunk
4. `<leader>gc` - View commits

### Refactoring
1. `gr` - Find references
2. `<leader>rn` - Rename
3. `<leader>ca` - Code action
4. `<leader>cf` - Format

### Debugging
1. `<leader>xx` - View diagnostics
2. `[d` / `]d` - Navigate diagnostics
3. `K` - Hover documentation
4. `<leader>cd` - Line diagnostics

---

## Notes

- **Leader key** is set to `<Space>`
- **Local leader** is set to `\`
- Most commands work in **Normal mode** unless specified
- For visual mode commands, select text first with `v`
- Some keybindings may require specific plugins to be loaded

---

**Version:** Neovim 0.11+ with Lazy.nvim
**Last Updated:** December 2024
