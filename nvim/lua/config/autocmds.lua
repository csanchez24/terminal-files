-- lua/autocmds.lua
-- Basic Autocommands for common Neovim behaviors
-- See `:help lua-guide-autocommands`

-- Highlight yanked text briefly
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on yank",
  group = vim.api.nvim_create_augroup("ag__highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank() -- Uses default highlight settings
  end,
})

-- Automatically resize splits when the Neovim window is resized
vim.api.nvim_create_autocmd("VimResized", {
  desc = "Resize splits on VimResized",
  group = vim.api.nvim_create_augroup("ag__resize_splits", { clear = true }),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =") -- Equalize all windows in each tab
    vim.cmd("tabnext " .. current_tab) -- Return to the original tab
  end,
})

-- Restore cursor to last known position when reopening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Restore cursor position",
  group = vim.api.nvim_create_augroup("ag__buff_cursor_last_position", { clear = true }),
  callback = function(event)
    local buf = event.buf
    local ft = vim.bo[buf].filetype
    local seen = vim.b[buf].buff_cursor_last_position
    -- Skip for certain filetypes or if already restored
    if ft == "gitcommit" or seen then
      return
    end
    vim.b[buf].buff_cursor_last_position = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"') -- Get last cursor mark
    local lcount = vim.api.nvim_buf_line_count(buf)
    -- If mark is valid, set cursor there
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Use <q> to close various special filetype windows
vim.api.nvim_create_autocmd("FileType", {
  desc = "Close certain filetypes with q",
  group = vim.api.nvim_create_augroup("ag__close_with_q", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false -- Do not list in buffer list
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Enable wrapping and spellcheck for text-like filetypes
vim.api.nvim_create_autocmd("FileType", {
  desc = "Wrap and spellcheck for markdown/gitcommit",
  group = vim.api.nvim_create_augroup("ag__wrap_spell", { clear = true }),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true -- Wrap long lines
    vim.opt_local.spell = true -- Enable spell checking
    vim.opt_local.spelllang = "en,es"
  end,
})

-- Create missing directories automatically before saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Auto-create missing directories",
  group = vim.api.nvim_create_augroup("ag__auto_create_dir", { clear = true }),
  callback = function(event)
    -- Skip URLs
    if event.match:match("^%w+://") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p") -- Create parent dir(s)
  end,
})

-- Disable line numbers in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Disable numbers in terminal",
  group = vim.api.nvim_create_augroup("ag__remove_term_number_col", { clear = true }),
  callback = function()
    vim.cmd("startinsert") -- Enter insert mode immediately
    vim.cmd("setlocal nonumber norelativenumber") -- Hide number columns
  end,
})

-- Ensure 'formatoptions' does not include certain flags
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufRead", "BufNewFile" }, {
  desc = "Remove unwanted formatoptions",
  group = vim.api.nvim_create_augroup("ag__force_formatoptions", { clear = true }),
  callback = function()
    vim.cmd("setlocal formatoptions-=cro") -- Remove 'c', 'r', 'o' options
  end,
})

-- Register custom file extensions for correct filetype detection
vim.api.nvim_create_autocmd("BufReadPre", {
  desc = "Register custom filetypes",
  group = vim.api.nvim_create_augroup("ag__file_types", { clear = true }),
  callback = function()
    vim.filetype.add({ extension = { templ = "templ" } }) -- Treat .templ files as 'templ'
  end,
})
