-- A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer.
-- https://github.com/stevearc/oil.nvim

return {
	"stevearc/oil.nvim", -- Plugin repo
	opts = {
		default_file_explorer = true, -- Use Oil as the default `:edit .` file explorer
		delete_to_trash = true, -- Send deleted files to trash instead of permanent removal
		skip_confirm_for_simple_edits = true, -- Skip confirmation prompt for quick operations (create/remove/rename)
		columns = {
			"icon", -- Show file icons column
			-- 'permissions',                -- (optional) show file permission bits
			-- 'size',                       -- (optional) show file sizes
			-- 'mtime',                      -- (optional) show last modification time
		},
		view_options = {
			show_hidden = true, -- Display hidden files (dotfiles)
			natural_order = true, -- Sort files in natural order (e.g., 'file2' before 'file10')
		},
		win_options = {
			wrap = true, -- Enable line wrapping in the Oil buffer
			winblend = 0, -- No transparency (0 = fully opaque)
		},
		keymaps = {
			["q"] = "actions.close", -- Press 'q' to close the Oil window
			["h"] = "actions.parent", -- 'h' to go to parent directory
			["l"] = "actions.select", -- 'l' to open file or enter directory
			["<C-v>"] = { "actions.select", opts = { vertical = true } }, -- Ctrl+v: open in vertical split
			["<C-x>"] = { "actions.select", opts = { horizontal = true } }, -- Ctrl+x: open in horizontal split
		},
	},
	keys = {
		{ "<leader>e", "<cmd>OilToggle<cr>", mode = "n", desc = "Toggle (Oil) file explorer" },
	},
	config = function(_, opts)
		require("oil").setup(opts) -- Initialize Oil with the specified options
		-- Create a custom command to toggle Oil on/off
		vim.api.nvim_create_user_command("OilToggle", function()
			local oil = require("oil")
			if vim.bo.filetype == "oil" then
				oil.close() -- Close if already in Oil buffer
			else
				oil.open() -- Open otherwise
			end
		end, {})
	end,
}
