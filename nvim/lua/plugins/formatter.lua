-- Autoformat setup using conform.nvim
-- https://github.com/stevearc/conform.nvim

-- Create :FormatDisable command to turn off autoformatting
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- If called with bang (!), disable for this buffer only
		vim.b.disable_autoformat = true
	else
		-- Otherwise, disable globally across all buffers
		vim.g.disable_autoformat = true
	end
end, {
	desc = "[D]isable autoformat-on-save", -- Description shown in :help
	bang = true, -- Allow trailing ! in the command
})

-- Create :FormatEnable command to re-enable autoformatting
vim.api.nvim_create_user_command("FormatEnable", function()
	-- Reset both buffer-local and global flags
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "[R]e-enable autoformat-on-save",
})

return {
	"stevearc/conform.nvim", -- Plugin repo
	event = "BufRead", -- Load on buffer read
	keys = {
		{
			"<leader>cF", -- Map <leader>cF in normal/visual modes
			function()
				-- Manually trigger formatting; async with LSP fallback
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = { "n", "v" },
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false, -- Suppress error notifications

		-- Configure autoformat-on-save behavior per buffer
		format_on_save = function(bufnr)
			-- Skip if disabled globally or for this buffer
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			-- Disable LSP fallback for certain filetypes lacking standard style
			local disabled_filetypes = { c = true, cpp = true, sql = true }
			return {
				timeout_ms = 500, -- Give formatters 500ms
				lsp_fallback = not disabled_filetypes[vim.bo[bufnr].filetype],
			}
		end,

		-- Specify formatters by filetype
		formatters_by_ft = {
			["lua"] = { "stylua" }, -- Lua: stylua
			["fish"] = { "fish_indent" }, -- Fish shell
			["sh"] = { "shfmt" }, -- Shell scripts
			["html"] = { "prettier" }, -- HTML via Prettier
			["css"] = { "prettier" }, -- CSS via Prettier
			["scss"] = { "prettier" },
			["less"] = { "prettier" },
			["json"] = { "prettier" }, -- JSON/JSONC
			["jsonc"] = { "prettier" },
			["yaml"] = { "prettier" },
			["markdown"] = { "prettier" }, -- Markdown & MDX
			["javascript"] = { "prettier" }, -- JS/TS/React etc.
			["javascriptreact"] = { "prettier" },
			["typescript"] = { "prettier" },
			["typescriptreact"] = { "prettier" },
			["astro"] = { "prettier" },
			["vue"] = { "prettier" },
			["graphql"] = { "prettier" },
			["handlebars"] = { "prettier" },
			["markdown.mdx"] = { "prettier" },
			["python"] = { "ruff_format" }, -- Python: ruff_format
			["sql"] = { "sqlfluff" }, -- SQL: sqlfluff
			["java"] = { "google-java-format" },
			["php"] = { "php-cs-fixer" },
		},
	},
}
