return {
	"dracula_pro",
	dir = "~/.config/nvim/dracula_pro",
	name = "dracula_pro",
	config = function()
		vim.g.dracula_italic_comment = true -- Enable italic comments
		vim.g.dracula_bold = true -- Enable bold text
		vim.cmd([[colorscheme dracula_pro_van_helsing]])
	end,
}
