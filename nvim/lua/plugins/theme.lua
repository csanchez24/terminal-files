-- Dracula Pro theme plugin configuration
-- Custom Dracula Pro colorscheme stored locally

return {
	"dracula_pro", -- Plugin identifier (alias for local theme)
	dir = "~/.config/nvim/dracula_pro", -- Path to the local theme directory
	name = "dracula_pro", -- Named reference for the colorscheme
	config = function()
		-- Enable italic comments in the theme
		vim.g.dracula_italic_comment = true
		-- Enable bold text for emphasis
		vim.g.dracula_bold = true
		-- Apply the 'dracula_pro_van_helsing' colorscheme
		vim.cmd([[colorscheme dracula_pro_van_helsing]])
	end,
}
