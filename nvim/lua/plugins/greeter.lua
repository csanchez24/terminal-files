return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional: Adds icons
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Header (ASCII art)
		dashboard.section.header.val = {
			"    #*++*#               #*++*#    ",
			"   #*%@@%#%#***********#%##@@@##   ",
			"   %#%%%%**++===++++==++**%%%%##   ",
			"   %%#%**++======+======++**%#%%   ",
			"     %**+++++++++++++++++++**#%    ",
			"    ##***=-----+****-----+***##    ",
			"   ###***+%%%%%#***#%%%#%****##%   ",
			"   %##**###@+@#*+==*#@-@%#***##%   ",
			"  %%###***#*#*=-:::--#*+%****###%  ",
			"  %%####****#=-:::::-=#*****###%%  ",
			"  %%%#######*--#+=+#=-+#######%%%  ",
			"   %%%######*=#@@@@@#=+#######%%   ",
			"   %%%%####%*==#%@%#==*%####%%%%   ",
			"    %%%%%##%%****#****#%##%%%%%    ",
			"     %%%%%%%%%*+*##+*%%%%%%%%      ",
			"        %%%%%%%@@@@@%%%%%%%        ",
			"          %%%%%%%%%%%%%%%          ",
			"             %%%%%%%%%             ",
			"               %%%%@               ",
		}

		-- Buttons
		dashboard.section.buttons.val = {
			dashboard.button("e", "📄  New File", ":ene <BAR> startinsert<CR>"),
			dashboard.button("f", "🔍  Find File", ":Telescope find_files<CR>"),
			dashboard.button("r", "📂  Recent Files", ":Telescope oldfiles<CR>"),
			dashboard.button("s", "⚙️   Settings", ":e $MYVIMRC<CR>"),
			dashboard.button("q", "🚪  Quit", ":qa<CR>"),
		}

		dashboard.section.footer.val = "🎉 Welcome to Neovim!"
		-- Set Footer (Dynamic Message)
		local function footer()
			local version = vim.version()
			local nvim_version = string.format("Neovim v%d.%d.%d", version.major, version.minor, version.patch)
			return string.format("🚀 %s", nvim_version, plugins)
		end
		dashboard.section.footer.val = footer()

		dashboard.section.header.opts.hl = "Comment"
		dashboard.section.buttons.opts.hl = "Keyword"
		dashboard.section.footer.opts.hl = "Function"

		-- Setup alpha with the dashboard theme
		alpha.setup(dashboard.opts)
	end,
}
