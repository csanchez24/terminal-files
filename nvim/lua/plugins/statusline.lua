-- Lualine.nvim: Fast and easy-to-configure statusline written in Lua
-- https://github.com/nvim-lualine/lualine.nvim

-- Custom Dracula Pro theme definitions for lualine
local dracula_pro = {
	normal = {
		a = { fg = "#0B0D0F", bg = "#8AFF80", gui = "bold" }, -- Normal mode: green section A
		b = { fg = "#F8F8F2", bg = "#708CA9" }, -- Section B: file info and diagnostics
		c = { fg = "#F8F8F2", bg = "#0B0D0F" }, -- Section C: secondary info
	},
	insert = {
		a = { fg = "#0B0D0F", bg = "#9580FF", gui = "bold" }, -- Insert mode: blue section A
		b = { fg = "#F8F8F2", bg = "#708CA9" }, -- Section B
		c = { fg = "#F8F8F2", bg = "#0B0D0F" }, -- Section C
	},
	visual = {
		a = { fg = "#0B0D0F", bg = "#FF80BF", gui = "bold" }, -- Visual mode: magenta section A
		b = { fg = "#F8F8F2", bg = "#708CA9" }, -- Section B
		c = { fg = "#F8F8F2", bg = "#0B0D0F" }, -- Section C
	},
	replace = {
		a = { fg = "#0B0D0F", bg = "#FF9580", gui = "bold" }, -- Replace mode: red section A
		b = { fg = "#F8F8F2", bg = "#708CA9" }, -- Section B
		c = { fg = "#F8F8F2", bg = "#0B0D0F" }, -- Section C
	},
	command = {
		a = { fg = "#0B0D0F", bg = "#FFFF80", gui = "bold" }, -- Command mode: yellow section A
		b = { fg = "#F8F8F2", bg = "#708CA9" }, -- Section B
		c = { fg = "#F8F8F2", bg = "#0B0D0F" }, -- Section C
	},
	inactive = {
		a = { fg = "#708CA9", bg = "#0B0D0F" }, -- Inactive window: muted colors
		b = { fg = "#708CA9", bg = "#0B0D0F" },
		c = { fg = "#708CA9", bg = "#0B0D0F" },
	},
}

return {
	"nvim-lualine/lualine.nvim", -- Plugin repository
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional file icons support
	config = function()
		require("lualine").setup({
			options = {
				theme = dracula_pro, -- Apply custom Dracula Pro colors
				icons_enabled = true, -- Show icons in statusline
				globalstatus = true, -- Use a single statusline for all windows
				section_separators = { left = "", right = "" }, -- Separator glyphs
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "starter", "TelescopePrompt" }, -- Exclude these filetypes
			},
			-- Active sections: a–z
			sections = {
				lualine_a = { "mode" }, -- Display current mode
				lualine_b = { "branch", "diff", "diagnostics" }, -- Git branch, diff stats, LSP diagnostics
				lualine_c = { "filename" }, -- File name
				lualine_x = { "filetype" }, -- File type icon/name
				lualine_y = { "progress" }, -- Progress through file (e.g., 45%)
				lualine_z = { "location" }, -- Cursor position (line:col)
			},
			-- Inactive window sections (minimal)
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {}, -- No custom tabline
			extensions = { -- Enable lualine extensions
				"quickfix", -- Show quickfix list status
				"lazy", -- Lazy.nvim plugin status
				"mason", -- Mason installer status
				"oil", -- Oil.nvim file explorer status
				"nvim-dap-ui", -- DAP UI status for debugging
			},
		})
	end,
}
