-- init.lua

-- Load base configurations
require("config.settings")
require("config.keymaps")
require("config.autocmds")
require("config.jdtls")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
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

	-- Java jdtls extra tools e.g. linting, formatting, debuggin, ...
	{ "mfussenegger/nvim-jdtls", ft = "java" },

	-- Import additional plugin configurations from lua/plugins/*.lua
	{ import = "plugins" },
})
