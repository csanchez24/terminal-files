-- Alpha-nvim startup screen configuration
-- https://github.com/goolord/alpha-nvim

return {
	"goolord/alpha-nvim", -- Plugin for customizable Neovim start/dashboard screen
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional icons support for filetype icons
	config = function()
		local alpha = require("alpha") -- Core alpha module
		local dashboard = require("alpha.themes.dashboard") -- Use the 'dashboard' theme

		-- [[ Header ]]: ASCII art displayed at top of the dashboard
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

		-- [[ Buttons ]]: Quick actions for common tasks
		dashboard.section.buttons.val = {
			dashboard.button("e", "📄  New File", ":ene <BAR> startinsert<CR>"), -- Create a new file
			dashboard.button("f", "🔍  Find File", ":Telescope find_files<CR>"), -- Open file search
			dashboard.button("r", "📂  Recent Files", ":Telescope oldfiles<CR>"), -- List recently opened files
			dashboard.button("s", "⚙️   Settings", ":e $MYVIMRC<CR>"), -- Open init.lua/settings
			dashboard.button("q", "🚪  Quit", ":qa<CR>"), -- Quit Neovim
		}

		-- [[ Footer ]]: Dynamic message showing Neovim version
		local function footer()
			local version = vim.version() -- Get current Neovim version
			-- Format as 'Neovim vX.Y.Z'
			return string.format("🚀 Neovim v%d.%d.%d", version.major, version.minor, version.patch)
		end
		dashboard.section.footer.val = footer()

		-- [[ Highlight Groups ]] for styling header, buttons, and footer
		dashboard.section.header.opts.hl = "Comment" -- Use 'Comment' highlight for ASCII art
		dashboard.section.buttons.opts.hl = "Keyword" -- Use 'Keyword' highlight for buttons
		dashboard.section.footer.opts.hl = "Function" -- Use 'Function' highlight for footer

		-- Activate alpha with the configured dashboard theme
		alpha.setup(dashboard.opts)
	end,
}
