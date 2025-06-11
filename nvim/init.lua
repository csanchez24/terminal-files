-- init.lua

-- Load base configurations
require("config.settings")
require("config.keymaps")
require("config.autocmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load and configure plugins using Lazy.nvim
require("lazy").setup({
	-- Automatically detect and set editor indentation settings per file
	"tpope/vim-sleuth",

	-- Automatically insert matching pairs of characters like (), {}, "", etc.
	{ "windwp/nvim-autopairs", config = true },

	-- Auto-close and auto-rename HTML/XML tags based on Treesitter
	{ "windwp/nvim-ts-autotag", event = "BufRead", opts = {} },

	-- Highlight and navigate TODO, FIXME, and other comment tags in code
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	-- Go language support:
	-- - Adds Go-specific commands and utilities
	-- - Integrates with plenary for async utilities
	-- - Uses Treesitter for syntax
	-- - Hooks into nvim-dap for Go debugging
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"mfussenegger/nvim-dap",
		},
		opts = {},
	},

	-- Import additional plugin configurations from lua/plugins/*.lua
	{ import = "plugins" },
})
