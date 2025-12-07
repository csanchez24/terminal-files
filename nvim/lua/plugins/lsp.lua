-- LSP Configuration & Mason Integration
-- Core Neovim LSP client with Mason for easy server management
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/mason-org/mason.nvim
-- https://github.com/mason-org/mason-lspconfig.nvim

return {
	"neovim/nvim-lspconfig", -- Main LSP configuration plugin
	event = "BufReadPre", -- Load after a buffer is read

	dependencies = {
		{ "mason-org/mason.nvim", opts = {} }, -- Install and manage external LSPs/tools
		"mason-org/mason-lspconfig.nvim", -- Integrate Mason with lspconfig
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Auto-install specified development tools
		"nanotee/sqls.nvim", -- SQL language server support
		{ "folke/lazydev.nvim", ft = { "lua" }, opts = {} }, -- Lua dev utilities for config & runtime
		"saghen/blink.cmp", -- Extension for completion capabilities
	},

	config = function()
		-- Setup buffer-local keymaps when any LSP server attaches
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("ag__lsp_attach", { clear = true }),
			callback = function(args)
				-- Helper to map keys in the attached buffer with descriptive names
				local map = function(keys, fn, desc)
					vim.keymap.set("n", keys, fn, { buffer = args.buf, desc = "LSP: " .. desc })
				end

				-- Get the LSP client that just attached
				local client = vim.lsp.get_client_by_id(args.data.client_id)

				-- Go to Implementation (gI), Declaration (gD), Definition (gd)
				map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
				map("gD", vim.lsp.buf.declaration, "Goto Declaration")
				map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")

				-- Type definition and references
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type Definition")
				map("gr", require("telescope.builtin").lsp_references, "References")

				-- Document symbols, rename, code actions, and hover
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
				map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
				map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
				map("K", vim.lsp.buf.hover, "Hover Documentation")

				-- Highlight symbol under cursor on CursorHold and clear on move
				if client ~= nil and client.server_capabilities.documentHighlightProvider then
					local hl_grp = vim.api.nvim_create_augroup("ag__lsp_highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = args.buf,
						group = hl_grp,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = args.buf,
						group = hl_grp,
						callback = vim.lsp.buf.clear_references,
					})
					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("ag__lsp_detach", { clear = true }),
						callback = function(detach_args)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "ag__lsp_highlight", buffer = detach_args.buf })
						end,
					})
				end

				-- Toggle inlay hints if supported
				if client ~= nil and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, "Toggle Inlay Hints")
				end

				-- Organize imports in TypeScript server
				if client ~= nil and client.name == "ts_ls" then
					map("<leader>co", function()
						client:exec_cmd({
							title = "organize_imports",
							command = "_typescript.organizeImports",
							arguments = { vim.api.nvim_buf_get_name(args.buf) },
						}, { bufnr = args.buf })
					end, "Organize Imports")
				end
			end,
		})

		-- Enhance LSP capabilities for better completion integration
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

		-- List of servers to configure with optional overrides
		local servers = {
			-- Java [*.java]
			jdtls = {
				capabilities = {
					workspace = {
						configuration = true,
					},
					textDocument = {
						completion = {
							completionItem = {
								snippetSupport = true,
							},
						},
					},
				},
			},
			sqls = { on_attach = vim.lsp.enable("sqls") },
			lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim", "vim.uv" } } } } },
			ts_ls = {
				settings = {
					typescript = { format = { enable = false } },
					javascript = { format = { enable = false } },
					completions = { completeFunctionCalls = true },
				},
			},
			html = {
				filetypes = { "html", "tsx", "jsx", "vue", "blade", "templ", "php" },
				init_options = { provideFormatter = false },
			},
			cssls = { settings = { css = { validate = false } } },
			tailwindcss = {
				filetypes = {
					"astro",
					"templ",
					"hbs",
					"html",
					"mdx",
					"php",
					"css",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
				init_options = { userLanguages = { templ = "html" } },
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								"tw`([^`]*)",
								'tw="([^"]*)',
								'tw={"([^"}]*)',
								"tw\\.w+`([^`]*)",
								"tw(.*?)`([^`]*)",
							},
						},
					},
				},
			},
			yamlls = { settings = { yaml = { keyOrdering = false } } },
			intelephense = {},
		}

		-- Keymap to open Mason UI
		vim.keymap.set("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "Open Mason" })

		-- Ensure desired servers are installed via Mason
		local ensure_installed = vim.tbl_keys(servers)
		require("mason-lspconfig").setup({
			ensure_installed = ensure_installed,
			automatic_installation = true,
			automatic_enable = { exclude = { "jdtls" } },
		})

		-- Setup each LSP server with its config and enhanced capabilities
		for name, cfg in pairs(servers) do
			cfg.capabilities = vim.tbl_deep_extend("force", {}, capabilities, cfg.capabilities or {})
			if name ~= "jdtls" then
				vim.lsp.config(name, cfg)
			end
		end
	end,
}
