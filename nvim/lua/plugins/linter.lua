-- Nvim-lint: Fast, easy-to-configure linting for Neovim
-- https://github.com/mfussenegger/nvim-lint

return {
	"mfussenegger/nvim-lint", -- Plugin repository for lint integration
	event = "BufReadPost", -- Load linting after buffer is read

	-- Plugin setup function
	config = function()
		local lint = require("lint") -- Import nvim-lint API
		--[[
		  Map filetypes to their respective linters:
		    - 'fish'            → fish shell script linter
		    - 'typescript'      → eslint
		    - 'javascript'      → eslint
		    - 'typescriptreact' → eslint
		    - 'json'            → eslint
		  You can use:
		    ['*'] = { 'global_linter' } -- for all filetypes
		    ['_'] = { 'fallback_linter' } -- for unmatched filetypes
		--]]
		lint.linters_by_ft = {
			["fish"] = { "fish" }, -- Lint .fish files with 'fish'
			["typescript"] = { "eslint" }, -- Lint .ts files with ESLint
			["javascript"] = { "eslint" }, -- Lint .js files with ESLint
			["typescriptreact"] = { "eslint" }, -- Lint .tsx files with ESLint
			["json"] = { "eslint" }, -- Lint .json files with ESLint
			["php"] = { "phpcs" }, -- Lint .php files with phpcs
			-- ['*'] = { 'global_linter' },           -- Run on all filetypes
			-- ['_'] = { 'fallback_linter' },         -- Run when no other linter defined
		}
		-- Create an autocommand group named 'lint'
		local group = vim.api.nvim_create_augroup("lint", { clear = true })

		-- Trigger linting on BufEnter, BufWritePost, and InsertLeave events
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = group, -- Associate with the 'lint' augroup
			callback = function()
				require("lint").try_lint() -- Run the linter for the current buffer
			end,
		})
	end,
}
