-- lua/settings.lua

-- Set leader key
vim.g.mapleader = " "

-- General settings
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Relative line numbers
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = 2 -- Size of an indent
vim.o.tabstop = 2 -- Number of spaces tabs count for
vim.o.smartindent = true -- Auto-indent new lines
vim.o.wrap = false -- Disable line wrapping
vim.opt.termguicolors = true -- Enable true colors
vim.g.have_nerd_font = true
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"

vim.o.ignorecase = true -- Ignore case when searching
vim.o.smartcase = true -- Override ignorecase if search has capitals
vim.o.incsearch = true -- Show search matches as you type
vim.opt.hlsearch = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = vim.opt.listchars - "space" - "trail" - "lead" - "nbsp" - "tab"
vim.cmd([[set listchars+=tab:\ \ ,eol:¬,extends:…,precedes:…]])

vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.opt.conceallevel = 3

vim.opt.smartindent = true
vim.opt.splitkeep = "screen"

vim.opt.virtualedit = "block"

vim.opt.wildmode = "longest:full,full"

vim.opt.wrap = false

vim.opt.showtabline = 1

vim.opt.ruler = false
vim.opt.showmode = false
vim.opt.laststatus = 3
