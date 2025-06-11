-- Autocompletion setup using blink.cmp for Neovim
-- https://github.com/hrsh7th/nvim-cmp (wrapper: saghen/blink.cmp)

-- Custom sort function to prioritize completion sources
local sort_source = function(a, b)
	-- Define priority: LSP highest, then snippets, git, path, buffer, lazydev lowest
	local order = { lsp = 6, snippets = 5, git = 4, path = 3, buffer = 2, lazydev = 1 }
	local a_order_id = order[a.source_id]
	local b_order_id = order[b.source_id]
	-- If priorities differ, return the higher-priority source first
	if a_order_id ~= b_order_id then
		return a_order_id > b_order_id
	end
	-- Otherwise, leave equal sources in their default order
end

return {
	-- Core completion plugin (blink.cmp wrapper)
	"saghen/blink.cmp",
	event = "VimEnter", -- Load on startup completion
	version = "1.*", -- Use any 1.x version

	dependencies = {
		-- Snippet engine: LuaSnip
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = (function()
				-- Attempt to build jsregexp for advanced snippet regex support
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return -- Skip on Windows or if 'make' is unavailable
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				-- Pre-made snippet collection for many languages/frameworks
				{
					"rafamadriz/friendly-snippets",
					config = function()
						-- Lazy-load VSCode-format snippets
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			opts = {}, -- Default LuaSnip options
		},

		-- Adds fuzzy-file/source search info for blink
		"folke/lazydev.nvim",
	},

	--- @module 'blink.cmp'
	--- @type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			-- 'default' mapping:
			--   <C-y> to confirm, <Tab>/<S-Tab> to jump snippets, <C-Space> to open menu, etc.
		},

		appearance = {
			nerd_font_variant = "mono", -- Use mono Nerd Font for aligned icons
		},

		completion = {
			documentation = {
				auto_show = true, -- Don’t pop up docs immediately
				auto_show_delay_ms = 500, -- Delay before showing docs if enabled
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "lazydev" }, -- Load these in order
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},

		snippets = {
			preset = "luasnip", -- Use LuaSnip as snippet backend
		},

		fuzzy = {
			implementation = "lua", -- Use Lua fuzzy matcher by default
			sorts = {
				sort_source, -- First sort by our custom priority
				"score", -- Then by builtin score
				"sort_text", -- Finally by text
			},
		},

		signature = {
			enabled = true, -- Show signature help while typing function args
		},
	},
}
