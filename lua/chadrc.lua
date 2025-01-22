---@type ChadrcConfig
local M = {
	ui = {
		cmp = {
			icons = true,
			style = "default",
			icons_left = true,
		},
		statusline = {
			separator_style = "arrow",
		},
		telescope = {
			style = "borderless",
		},
		tabufline = {
			lazyload = false,
			enabled = true,
		}
	},
	nvdash = {
		load_on_startup = true,
		header = {
			"                                                                       ",
			"                                                                     ",
			"       ████ ██████           █████      ██                     ",
			"      ███████████             █████                             ",
			"      █████████ ███████████████████ ███   ███████████   ",
			"     █████████  ███    █████████████ █████ ██████████████   ",
			"    █████████ ██████████ █████████ █████ █████ ████ █████   ",
			"  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
			" ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
			"                                                                       ",
			"                                                                       ",
		},
		buttons = {
			{ txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
			{ txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
			{ txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
			{ txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
			{ txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

			{ txt = " ", hl = "NvDashFooter", no_gap = true, rep = true },

			{
				txt = function()
					local stats = require("lazy").stats()
					local ms = math.floor(stats.startuptime) .. " ms"
					return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
				end,
				hl = "NvDashFooter",
				no_gap = true,
			},

			{ txt = " ", hl = "NvDashFooter", no_gap = true, rep = true },
		}
	},
	base46 = {
		theme_toggle = { "onedark", "catppuccin" },
		transparency = false
	},
	cheatsheet =  {
		excluded_groups = { },
		theme = "grid",
	},
}

return M
