-- A blazing fast and easy to configure Neovim statusline written in Lua.
-- https://github.com/nvim-lualine/lualine.nvim
--

local dracula_pro = {
	normal = {
		a = { fg = "#0B0D0F", bg = "#8AFF80", gui = "bold" }, -- Green for normal mode
		b = { fg = "#F8F8F2", bg = "#708CA9" }, -- Foreground and selection background
		c = { fg = "#F8F8F2", bg = "#0B0D0F" }, -- Foreground and background
	},
	insert = {
		a = { fg = "#0B0D0F", bg = "#9580FF", gui = "bold" }, -- Blue for insert mode
		b = { fg = "#F8F8F2", bg = "#708CA9" },
		c = { fg = "#F8F8F2", bg = "#0B0D0F" },
	},
	visual = {
		a = { fg = "#0B0D0F", bg = "#FF80BF", gui = "bold" }, -- Magenta for visual mode
		b = { fg = "#F8F8F2", bg = "#708CA9" },
		c = { fg = "#F8F8F2", bg = "#0B0D0F" },
	},
	replace = {
		a = { fg = "#0B0D0F", bg = "#FF9580", gui = "bold" }, -- Red for replace mode
		b = { fg = "#F8F8F2", bg = "#708CA9" },
		c = { fg = "#F8F8F2", bg = "#0B0D0F" },
	},
	command = {
		a = { fg = "#0B0D0F", bg = "#FFFF80", gui = "bold" }, -- Yellow for command mode
		b = { fg = "#F8F8F2", bg = "#708CA9" },
		c = { fg = "#F8F8F2", bg = "#0B0D0F" },
	},
	inactive = {
		a = { fg = "#708CA9", bg = "#0B0D0F" },
		b = { fg = "#708CA9", bg = "#0B0D0F" },
		c = { fg = "#708CA9", bg = "#0B0D0F" },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = dracula_pro,
				-- theme = "dracula", -- Use the Dracula theme
				icons_enabled = true,
				globalstatus = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "starter", "TelescopePrompt" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "quickfix", "lazy", "mason", "oil", "nvim-dap-ui" },
		})
	end,
}
