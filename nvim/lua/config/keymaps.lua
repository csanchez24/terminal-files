-- lua/config/keymaps.lua

-- [[ Basic Keymaps ]]
-- See :help vim.keymap.set()

-- Clear search highlighting           → Press <Esc> in normal mode to clear hlsearch
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear search highlight

-- Paste without overwriting register → In visual mode, paste replaces selection without clobbering the default register
vim.keymap.set("v", "p", "P") -- Paste over selection and keep default register

-- Redo                               → Use U to redo instead of Ctrl-r
vim.keymap.set("n", "U", "<C-r>") -- Redo last undone change

-- Floating window for error details   → Show diagnostics under cursor
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show diagnostic error" })

-- Populate location list with errors → Fill quickfix list with all current diagnostics
vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist, { desc = "Diagnostic quickfix list" })

-- [[ Window Navigation ]]
-- Use Ctrl+h/j/k/l to move between split windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move to right window" })

-- [[ Resize Windows ]]
-- Use special keys (˚ ∆ ˙ ¬) to resize splits
vim.keymap.set("n", "˚", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "∆", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "˙", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "¬", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
vim.keymap.set("n", "<Leader>=", "<C-w>=", { desc = "Equalize all splits" })

-- [[ Move Lines ]]
-- Quickly move the current line or selection up/down
vim.keymap.set("n", "Ô", "<cmd>m .+1<cr>==", { desc = "Move line down (normal)" })
vim.keymap.set("n", "", "<cmd>m .-2<cr>==", { desc = "Move line up (normal)" })
vim.keymap.set("i", "Ô", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down (insert)" })
vim.keymap.set("i", "", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up (insert)" })
vim.keymap.set("v", "Ô", ":m '>+1<cr>gv=gv", { desc = "Move selection down (visual)" })
vim.keymap.set("v", "", ":m '<-2<cr>gv=gv", { desc = "Move selection up (visual)" })

-- [[ Buffer Navigation ]]
-- Cycle through open buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Quickly switch to last-used buffer
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to alternate buffer" })
vim.keymap.set("n", "<leader><leader>", "<cmd>e #<cr>", { desc = "Switch to alternate buffer" })

-- [[ Multiple Cursors Alternative ]]
-- Search under cursor/selection and replace one instance at a time
vim.keymap.set(
	"n",
	"s*",
	":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn",
	{ desc = "Change next occurrence under cursor" }
)
vim.keymap.set("x", "s*", '"sy:let @/=@s<CR>cgn', { desc = "Change next occurrence of selection" })

-- [[ Saner Search Navigation ]]
-- Keep cursor centered and open folds when jumping to next/prev search
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result (visual)" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result (operator)" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Previous search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Previous search result (visual)" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Previous search result (operator)" })

-- [[ Undo Break-Points ]]
-- Insert extra undo points after punctuation in insert mode
vim.keymap.set("i", ",", ",<c-g>u", { desc = "Undo break after comma" })
vim.keymap.set("i", ".", ".<c-g>u", { desc = "Undo break after period" })
vim.keymap.set("i", ";", ";<c-g>u", { desc = "Undo break after semicolon" })

-- [[ Save File ]]
-- Save from any mode with Ctrl-S
vim.keymap.set({ "i", "n", "v", "x", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- [[ Keyword Program ]]
-- Look up keyword under cursor (K)
vim.keymap.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keyword lookup" })

-- [[ Indenting in Visual Mode ]]
-- Reselect visual area after shifting
vim.keymap.set("v", "<", "< gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", "> gv", { desc = "Indent right and reselect" })

-- [[ Plugin: Lazy.nvim ]]
-- Open Lazy plugin manager
vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Open Lazy.nvim" })

-- [[ New File ]]
-- Create a new empty buffer
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New file" })

-- [[ Lists: Location & Quickfix ]]
-- Open location list or quickfix list and navigate
vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Open location list" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Open quickfix list" })
vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

-- [[ Quit All Buffers ]]
-- Quit Neovim entirely
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- [[ Terminal Mode ]]
-- Easier navigation and toggling in terminal buffers
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Terminal: Enter normal mode" })
vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Terminal: Go to left window" })
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Terminal: Go to lower window" })
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Terminal: Go to upper window" })
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Terminal: Go to right window" })
vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Terminal: Hide terminal window" })
vim.keymap.set(
	"n",
	"<Leader>tn",
	":tabnew +terminal<CR>",
	{ noremap = true, silent = true, desc = "New terminal in tab" }
)
vim.keymap.set("n", "<Leader>t_", ":new +terminal<CR>", { noremap = true, silent = true, desc = "New terminal below" })
vim.keymap.set("n", "<Leader>t|", ":vnew +terminal<CR>", { noremap = true, silent = true, desc = "New terminal side" })

-- [[ Window & Tab Commands ]]
-- Window commands
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Switch to other window", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Close current window", remap = true })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- Tab commands
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "Go to first tab" })
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Go to last tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close current tab" })
vim.keymap.set("n", "<C-]>", "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "<C-[>", "<cmd>tabprevious<cr>", { desc = "Previous tab" })

-- Java build MotiveWave
vim.keymap.set("n", "<leader>,", ":!./gradlew dmw<CR>", { desc = "Buid MotiveWave" })
