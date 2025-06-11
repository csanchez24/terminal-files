-- GitSigns.nvim configuration
-- Adds Git change indicators in the sign column and useful hunk actions
-- https://github.com/lewis6991/gitsigns.nvim

return {
	"lewis6991/gitsigns.nvim", -- Plugin repository
	event = "BufRead", -- Load when a buffer is read
	opts = {
		-- Define symbols for Git signs in the gutter
		signs = {
			add = { text = "▎" }, -- Added line indicator
			change = { text = "▎" }, -- Modified line indicator
			delete = { text = "" }, -- Deleted line start indicator
			topdelete = { text = "" }, -- Deleted line top indicator
			changedelete = { text = "▎" }, -- Changed & deleted combination
			untracked = { text = "▎" }, -- Untracked file indicator
		},

		-- Run when Gitsigns attaches to a buffer
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			-- Helper to map keys locally for this buffer
			local function map(mode, lhs, rhs, opts)
				opts = opts or {}
				opts.buffer = bufnr -- Bind mapping to this buffer only
				vim.keymap.set(mode, lhs, rhs, opts)
			end

			-- [[ Navigation ]] --
			map("n", "]c", function()
				if vim.wo.diff then
					-- Use built-in diff navigation if in diff view
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next") -- Jump to next Git hunk
				end
			end, { desc = "Jump to next git [c]hange" })

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true }) -- Diff prev hunk
				else
					gitsigns.nav_hunk("prev") -- Jump to previous Git hunk
				end
			end, { desc = "Jump to previous git [c]hange" })

			-- [[ Actions ]] --
			-- Stage or reset hunks in visual mode
			map("v", "<leader>hs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Stage selected hunk" })
			map("v", "<leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Reset selected hunk" })

			-- Stage/reset and other hunk commands in normal mode
			map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage current hunk" })
			map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset current hunk" })
			map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage entire buffer" })
			map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset entire buffer" })
			map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview current hunk" })
			map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })
			map("n", "<leader>hb", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Show git blame for line" })
			map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff buffer vs index" })
			map("n", "<leader>hD", function()
				gitsigns.diffthis("~")
			end, { desc = "Diff buffer vs last commit" })

			-- [[ Toggles ]] --
			map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle inline git blame" })
			map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })
			-- Text object
			map({ "o", "x" }, "ih", gitsigns.select_hunk)
		end,
	},
}
