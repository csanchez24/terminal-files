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

-- Load Lazy.nvim setup
require("lazy").setup({
	-- Simple plugins
	"tpope/vim-sleuth",
	{ "windwp/nvim-autopairs", config = true }, -- Auto-pairs
	{ "windwp/nvim-ts-autotag", event = "BufRead", opts = {} },
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
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

	-- Complex plugins (referencing separate files)
	{ import = "plugins" },
})

-- Additional configurations
