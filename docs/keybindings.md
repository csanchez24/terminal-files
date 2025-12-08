# ⌨️ Keybindings Reference

Complete keybinding reference organized by category.

---

## 🎯 Leader Key

```vim
<Space>    " Leader key
\          " Local leader
```

---

## 📂 File Navigation

### Telescope

```vim
<leader>ff    " Find Files
<leader>fr    " Recent Files
<leader>fg    " Git Files
<leader>fb    " File Browser
<leader>fo    " Old Files (recent)
```

### File Explorers

```vim
<leader>e     " Toggle Oil (quick edits)
<leader>-     " Open Yazi at current file
<leader>fy    " Open Yazi in cwd
```

### Quick Navigation

```vim
<C-o>         " Jump back
<C-i>         " Jump forward
``            " Jump to last position
'{a-z}        " Jump to mark
m{a-z}        " Set mark
```

---

## 🔍 Search

### Text Search

```vim
<leader>sg    " Live Grep (search in files)
<leader>sw    " Search Word under cursor
<leader>sb    " Search in current Buffer
<leader>s/    " Search in open files
```

### In-file Search

```vim
/pattern      " Search forward
?pattern      " Search backward
*             " Search word under cursor
#             " Search backward
n             " Next match
N             " Previous match
<Esc>         " Clear search highlight
```

### Search & Replace

```vim
:%s/old/new/g       " Replace all in file
:%s/old/new/gc      " Replace with confirmation
:'<,'>s/old/new/g   " Replace in selection
```

---

## 📝 Editing

### Text Objects (Mini.ai)

```vim
ciw           " Change inner word
ci"           " Change inside quotes
ci(           " Change inside parens
cin"          " Change in next quotes
cil(          " Change in last parens
daf           " Delete around function
vip           " Visual select paragraph
```

### Surround (Mini.surround)

```vim
saiw)         " Surround add inner word with )
sd"           " Surround delete "
sr"'          " Surround replace " with '
sf"           " Surround find "
```

### Comments (Mini.comment)

```vim
gcc           " Toggle comment line
gc{motion}    " Toggle comment motion
gcap          " Toggle comment paragraph
gcip          " Toggle comment inside paragraph
```

### Multiple Cursors Alternative

```vim
s*            " Select word, then . to repeat
(visual) s*   " Select selection, then .
```

---

## 💻 LSP (Language Server)

### Navigation

```vim
gd            " Go to Definition
gD            " Go to Declaration
gr            " Go to References
gI            " Go to Implementation
gy            " Go to Type definition
K             " Hover Documentation
gK            " Signature Help
```

### Code Actions

```vim
<leader>ca    " Code Action
<leader>rn    " Rename symbol
<leader>co    " Organize Imports (TS)
<leader>cf    " Format buffer
```

### Diagnostics

```vim
[d            " Previous Diagnostic
]d            " Next Diagnostic
<leader>cd    " Line Diagnostics (float)
<leader>cl    " Location List
<leader>ld    " Location List Diagnostics
```

### Symbols

```vim
<leader>ds    " Document Symbols
<leader>ws    " Workspace Symbols
```

---

## ⚡ Completion (Blink.cmp)

### In Insert Mode

```vim
<C-Space>     " Show completions
<CR>          " Accept completion
<C-y>         " Accept completion
<C-n>         " Next item
<C-p>         " Previous item
<C-e>         " Close menu
<C-b>         " Scroll docs up
<C-f>         " Scroll docs down
<Tab>         " Next snippet field
<S-Tab>       " Previous snippet field
```

---

## 🌿 Git (Gitsigns)

### Navigation

```vim
]c            " Next hunk (change)
[c            " Previous hunk
```

### Operations

```vim
<leader>hs    " Stage hunk
<leader>hr    " Reset hunk
<leader>hS    " Stage buffer
<leader>hu    " Undo stage hunk
<leader>hR    " Reset buffer
<leader>hp    " Preview hunk
<leader>hb    " Blame line
<leader>hd    " Diff this
<leader>hD    " Diff against last commit
```

### Toggles

```vim
<leader>tb    " Toggle blame line
<leader>tD    " Toggle deleted
```

### Git via Telescope

```vim
<leader>gc    " Git Commits
<leader>gs    " Git Status
<leader>gb    " Git Branches
```

---

## 🗂️ Buffers & Windows

### Buffers

```vim
<S-h>         " Previous buffer
<S-l>         " Next buffer
[b            " Previous buffer
]b            " Next buffer
<leader>bb    " Switch to other buffer
<leader>bd    " Delete buffer
<leader>bD    " Delete buffer (force)
<leader><space> " Show buffers (Telescope)
```

### Windows

```vim
<C-h>         " Move to left window
<C-j>         " Move to down window
<C-k>         " Move to up window
<C-l>         " Move to right window
<leader>ww    " Other window
<leader>wd    " Delete window
<leader>w-    " Split horizontal
<leader>w|    " Split vertical
<leader>-     " Split horizontal
<leader>|     " Split vertical
<leader>=     " Equalize windows
```

### Window Resize (macOS)

```vim
˚ (Alt+k)     " Increase height
∆ (Alt+j)     " Decrease height
˙ (Alt+h)     " Decrease width
¬ (Alt+l)     " Increase width
```

### Tabs

```vim
<leader><tab><tab>  " New tab
<leader><tab>d      " Close tab
<leader><tab>]      " Next tab
<leader><tab>[      " Previous tab
<leader><tab>f      " First tab
<leader><tab>l      " Last tab
```

---

## 💻 Terminal

```vim
<leader>tn    " Terminal in new tab
<leader>t_    " Terminal below
<leader>t|    " Terminal side
<Esc><Esc>    " Enter normal mode (in terminal)
<C-h/j/k/l>   " Navigate windows (in terminal)
```

---

## 🔧 Utilities

### Mason

```vim
<leader>mm    " Open Mason
:Mason        " Open Mason UI
```

### Lazy

```vim
<leader>ll    " Open Lazy
:Lazy         " Open Lazy UI
```

### Help & Commands

```vim
<leader>sh    " Search Help
<leader>sk    " Search Keymaps
<leader>sc    " Search Commands
<leader>sH    " Search Highlights
<leader>sm    " Search Man pages
```

### Quick Lists

```vim
<leader>xq    " Open quickfix
<leader>xl    " Open location list
[q            " Previous quickfix
]q            " Next quickfix
<leader>qq    " Quit all
```

---

## 🎨 UI Enhancements

### Noice

```vim
<leader>snl   " Last message
<leader>snh   " Message history
<leader>sna   " All messages
<leader>un    " Dismiss notifications
<C-f>         " Scroll forward (in docs)
<C-b>         " Scroll backward (in docs)
```

### Trouble (if installed)

```vim
<leader>xx    " Toggle Diagnostics
<leader>xX    " Buffer Diagnostics
<leader>cs    " Symbols
<leader>cl    " LSP definitions/refs
```

### Todo Comments (if installed)

```vim
]t            " Next todo
[t            " Previous todo
<leader>xt    " Todo (Trouble)
<leader>st    " Todo (Telescope)
```

---

## 🚀 Custom Shortcuts

### Quick Edit Configs

```vim
<leader>fn    " New file
<leader>sn    " Search Neovim files (your config)
```

### Save & Quit

```vim
<C-s>         " Save file
<leader>qq    " Quit all
:w            " Save
:q            " Quit
:wq           " Save and quit
```

### Misc

```vim
<leader>K     " Keywordprg
<leader>th    " Toggle inlay hints
<leader>?     " Open cheatsheet (if configured)
```

---

## 📋 Oil.nvim Specific

```vim
<leader>e     " Toggle Oil
-             " Go to parent (in Oil)
<Enter>       " Open file/directory (in Oil)
<C-h>         " Toggle hidden (in Oil)
g?            " Help (in Oil)
```

**In Oil buffer:**

```vim
i             " Insert mode (create file)
dd            " Delete line (delete file)
cw            " Change word (rename)
:w            " Save changes
```

---

## 🗂️ Yazi Specific

```vim
<leader>-     " Open Yazi at current file
<leader>fy    " Open Yazi in cwd
```

**In Yazi:**

```vim
hjkl          " Navigate
<Space>       " Select
a             " Create file
A             " Create directory
r             " Rename
d             " Delete
y             " Copy
x             " Cut
p             " Paste
/             " Search
q             " Quit
```

---

## 💡 Tips

- **Leader key is Space** - Most custom commands start with it
- **Use `<C-/>` in Telescope** to see available keybindings
- **Press `g?` in Oil** for help
- **Run `:Telescope keymaps`** to search all keybindings
- **Use `:checkhealth`** to verify everything is working

---

**Last updated:** December 2024
