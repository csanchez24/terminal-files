-- lua/config/settings.lua

-- Leader keys
vim.g.mapleader = " " -- Set the global leader key to Space
vim.g.maplocalleader = "\\" -- Set the local leader key to backslash

-- Line numbering
vim.o.number = true -- Show absolute line numbers
vim.o.relativenumber = true -- Show line numbers relative to the cursor

-- Indentation
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
vim.o.tabstop = 2 -- Number of spaces that a Tab counts for
vim.opt.shiftround = true -- Round indent to multiple of shiftwidth
vim.o.smartindent = true -- Auto-indent new lines based on syntax

-- Scrolling & wrapping
vim.opt.sidescrolloff = 8 -- Minimum number of screen columns to keep to the cursor's left/right
vim.o.wrap = false -- Disable line wrapping
vim.opt.scrolloff = 10 -- Minimum number of screen lines to keep above/below cursor
vim.opt.splitkeep = "screen" -- Keep text on screen when splitting

-- Display & UI
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
vim.g.have_nerd_font = true -- Indicates availability of a Nerd Font for icons
vim.opt.signcolumn = "yes" -- Always show the sign column (e.g. for diagnostics)
vim.opt.cursorline = true -- Highlight the screen line of the cursor
vim.opt.conceallevel = 3 -- Hide text marked by "conceal" syntax element
vim.opt.showtabline = 1 -- Show tabline only if there are at least two tabs
vim.opt.laststatus = 3 -- Global statusline at the bottom
vim.opt.ruler = false -- Disable showing line/column ruler in the status line
vim.opt.showmode = false -- Don't show current mode (e.g. --INSERT--) in command line
vim.opt.cmdheight = 0 -- Height of the command line (0 hides it when not in use)

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Use the system clipboard for all operations

-- Undo & file history
vim.opt.undofile = true -- Enable persistent undo so undo history persists across sessions

-- Search
vim.o.ignorecase = true -- Ignore case in search patterns
vim.o.smartcase = true -- Override ignorecase if search pattern contains uppercase letters
vim.o.incsearch = true -- Show search matches as you type
vim.opt.hlsearch = true -- Highlight all search matches

-- Splits
vim.opt.splitright = true -- Vertical splits will automatically be to the right
vim.opt.splitbelow = true -- Horizontal splits will automatically be below

-- Display invisible characters
vim.opt.list = true -- Show whitespace characters
vim.opt.listchars = vim.opt.listchars - "space" - "trail" - "lead" - "nbsp" - "tab"
vim.cmd([[set listchars+=tab:\ \ ,eol:¬,extends:…,precedes:…]]) -- Customize listchars for tabs, eol, extends, precedes

-- Input & timeout
vim.opt.timeoutlen = 500 -- Time in ms to wait for mapped sequence to complete
vim.opt.ttimeoutlen = 0 -- Time in ms to wait for key code sequence to complete
vim.opt.updatetime = 300 -- Time in ms of inactivity before writing swap file / triggering CursorHold

-- Completion & formatting
vim.opt.completeopt = "menu,menuone,noselect" -- Options for Insert mode completion
vim.opt.formatoptions = vim.opt.formatoptions - "c" - "r" - "o" -- Don't auto-wrap comments when hitting Enter

-- Grep program
vim.opt.grepformat = "%f:%l:%c:%m" -- Format of grep output
vim.opt.grepprg = "rg --vimgrep" -- Use ripgrep for :grep
vim.opt.inccommand = "nosplit" -- Show effects of a command incrementally without splitting window

-- Wildmenu & command-line completion
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in Visual Block mode
