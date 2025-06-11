-- Collection of small, independent 'mini.nvim' plugins with comments
-- https://github.com/echasnovski/mini.nvim

return {
	"echasnovski/mini.nvim", -- Core 'mini' plugin suite
	version = false,
	event = "BufRead", -- Load on buffer read for performance
	dependencies = {
		-- Context-aware commentstring for embedded filetypes (e.g. Vue, Svelte)
		{ "JoosepAlviste/nvim-ts-context-commentstring", opts = { enable_autocmd = false } },
	},

	config = function()
		-- [[ Icon Rendering ]]
		-- Provides filetype icons for buffers and integrates with Telescope
		require("mini.icons").setup({})
		require("mini.icons").mock_nvim_web_devicons() -- Workaround for Telescope icon issue

		-- [[ Improved Text-Object Selection ]]
		-- mini.ai: better 'around' and 'inside' text-objects for motions/commands
		-- Examples:
		--   va)  -> visually select around parentheses
		--   yinq -> yank inside next single-quote
		--   ci'  -> change inside single-quote
		require("mini.ai").setup({ n_lines = 500 }) -- Scan up to 500 lines for matching objects

		-- [[ Surround Manipulation ]]
		-- mini.surround: add, delete, replace surroundings like brackets, quotes, tags
		-- Commands:
		--   saiw) -> add inner-surrounding parentheses around word
		--   sd'   -> delete surrounding single-quotes
		--   sr)'  -> replace surrounding parentheses with single-quotes
		require("mini.surround").setup()

		-- [[ Auto-Pairs ]]
		-- mini.pairs: automatically insert matching pairs for [], {}, <>, '', "", etc.
		require("mini.pairs").setup()

		-- [[ Commenting Utility ]]
		-- mini.comment: toggle line and block comments (gcc, gc{motion}, etc.)
		-- Uses ts-context-commentstring for correct syntax in embedded sections
		require("mini.comment").setup({
			options = {
				custom_commentstring = function()
					-- Calculate commentstring via treesitter context or fall back
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		})
	end,
}
