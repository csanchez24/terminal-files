-- Telescope.nvim: Fuzzy finder for files, LSP, help tags, and more
-- https://github.com/nvim-telescope/telescope.nvim

return {
	"nvim-telescope/telescope.nvim", -- Core Telescope plugin
	event = "VimEnter", -- Load on Neovim startup
	branch = "0.1.x", -- Use stable 0.1.x branch
	dependencies = {
		"nvim-lua/plenary.nvim", -- Utility functions required by Telescope

		-- FZF-native extension for faster sorting (optional)
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make", -- Compile native C code on install/update
			cond = function() -- Only load if 'make' is available
				return vim.fn.executable("make") == 1
			end,
		},

		-- Replace vim.ui.select with Telescope-based picker for consistency
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- File browser extension: browse/create/rename/move files inside Telescope
		{
			"nvim-telescope/telescope-file-browser.nvim",
			build = "make",
			enabled = vim.fn.executable("make") == 1,
		},
	},

	config = function()
		-- Import Telescope actions for mappings & custom behaviors
		local actions = require("telescope.actions")

		-- Custom function: send selected entries to quickfix list and open it
		local send_selected_to_qflist = function(prompt_bufnr, mode, target)
			actions.send_selected_to_qflist(prompt_bufnr, mode, target)
			actions.open_qflist(0)
		end

		-- Setup Telescope with default options
		require("telescope").setup({
			defaults = {
				prompt_prefix = "  ", -- Prefix before input prompt
				selection_caret = "  ", -- Marker for selected item
				layout_strategy = "horizontal", -- Horizontal split layout
				layout_config = {
					prompt_position = "top", -- Prompt at top of window
					preview_cutoff = 200, -- Hide preview if cols < 200
				},
				sorting_strategy = "ascending", -- Oldest results at top
				selection_strategy = "reset", -- Reset selection on new search
				winblend = 0, -- No transparency
				borderchars = { " ", " ", " ", " ", " ", " ", " ", " " }, -- No borders
				scroll_strategy = "cycle", -- Cycle over results
				file_ignore_patterns = { -- Exclude common dirs/files
					"node_modules/.*",
					".git/.*",
					"yarn.lock",
					"\\.next/.*",
				},

				-- Open selection in first non-special window (or current)
				get_selection_window = function()
					local wins = vim.api.nvim_list_wins()
					table.insert(wins, 1, vim.api.nvim_get_current_win())
					for _, win in ipairs(wins) do
						local buf = vim.api.nvim_win_get_buf(win)
						if vim.bo[buf].buftype == "" then
							return win
						end
					end
					return 0
				end,

				-- Key mappings for insert (i) and normal (n) modes in Telescope prompt
				mappings = {
					i = {
						["<C-s>"] = actions.select_horizontal, -- Open in horizontal split
						["œ"] = send_selected_to_qflist, -- Add to quickfix list
					},
					n = {
						["q"] = actions.close, -- Close Telescope window
						["œ"] = send_selected_to_qflist, -- Add to quickfix list
					},
				},
			},
		})

		-- Load installed Telescope extensions safely
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "file_browser")

		-- Shortcut to Telescope builtins
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help Tags" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Telescope Builtins" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search Current Word" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live Grep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume Last Picker" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "Recent Files" })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Open Buffers" })

		-- File browser keymaps
		vim.keymap.set("n", "<leader>sE", ":Telescope file_browser<CR>", { desc = "File Browser" })
		vim.keymap.set(
			"n",
			"<leader>se",
			":Telescope file_browser path=%:p:h select_buffer=true<CR>",
			{ desc = "File Browser (cwd)" }
		)

		-- Fuzzy search in current buffer
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find()
		end, { desc = "Fuzzy Find in Buffer" })

		-- Live grep only open files
		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({ grep_open_files = true, prompt_title = "Grep Open Files" })
		end, { desc = "Live Grep Open Files" })

		-- Shortcut to search Neovim config directory
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Search Neovim Config" })
	end,
}
