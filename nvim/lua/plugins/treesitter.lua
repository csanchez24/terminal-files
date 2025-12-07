-- Treesitter configuration for Neovim
-- Provides syntax highlighting, indentation, text objects, and more
-- https://github.com/nvim-treesitter/nvim-treesitter

return {
	"nvim-treesitter/nvim-treesitter", -- Core Treesitter plugin
	version = false, -- Use latest remote version
	build = ":TSUpdate", -- Update parsers on plugin install/update
	event = "BufRead", -- Load after opening a buffer

	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects", -- Additional textobject support
			config = function()
				-- Override 'goto' mappings in diff mode to use Vim defaults
				local move = require("nvim-treesitter.textobjects.move")
				local configs = require("nvim-treesitter.configs")
				for name, fn in pairs(move) do
					if name:find("goto") == 1 then
						move[name] = function(query, ...)
							if vim.wo.diff then
								-- If in diff view, run the default keymap instead of TS object query
								local mod = configs.get_module("textobjects.move")[name] or {}
								for key, q in pairs(mod) do
									if query == q and key:find("[%]%[][cC]") then
										vim.cmd("normal! " .. key)
										return
									end
								end
							end
							-- Otherwise, use the original Treesitter move function
							return fn(query, ...)
						end
					end
				end
			end,
		},
	},

	opts = {
		-- List of languages to ensure parser installation
		ensure_installed = {
			"bash",
			"c",
			"css",
			"diff",
			"dockerfile",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"go",
			"gomod",
			"gosum",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"php",
			"php_only",
			"phpdoc",
			"python",
			"query",
			"regex",
			"sql",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},
		auto_install = true, -- Automatically install missing parsers

		-- Syntax highlighting powered by Treesitter
		highlight = {
			enable = true,
			-- Additional regex-based highlighting (e.g. for Ruby indent)
			additional_vim_regex_highlighting = { "ruby" },
		},

		-- Indentation based on Treesitter parse tree
		indent = {
			enable = true,
			disable = { "ruby" }, -- Disable for Ruby due to known issues
		},

		-- Incremental selection (expand/swap nodes)
		incremental_selection = {
			enable = true,
		},

		-- Textobject movements (functions, classes)
		textobjects = {
			move = {
				enable = true,
				-- Jump to next start/end of function or class
				goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
				goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
				goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
				goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
			},
		},
	},

	config = function(_, opts)
		-- Remove duplicate entries in ensure_installed list
		if type(opts.ensure_installed) == "table" then
			local seen = {}
			opts.ensure_installed = vim.tbl_filter(function(lang)
				if seen[lang] then
					return false
				end
				seen[lang] = true
				return true
			end, opts.ensure_installed)
		end

		-- Apply the Treesitter configuration
		require("nvim-treesitter.configs").setup(opts)

		-- Create :TSResetHighlight command to re-enable highlighting after edits
		vim.api.nvim_create_user_command(
			"TSResetHighlight",
			"write | edit | TSBufEnable highlight",
			{ bang = true, desc = "Reset Treesitter highlights" }
		)
	end,
}
