return {
	{
		"nvim-lualine/lualine.nvim",
		opts = function()
			return {
				options = {
					theme = "auto",
					component_separators = { left = " ", right = " " },
					section_separators = { left = " ", right = " " },
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "alpha" } },
				},
				sections = {
					lualine_a = { { "mode", icon = "" } },
					lualine_b = { { "branch", icon = "" } },
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = "   ",
								warn = "   ",
								info = "   ",
								hint = " 󰝶  ",
							},
						},
						{ "filetype", icon_only = true, separator = "" },
						{ "filename" },
					},
					lualine_x = {
						{
							function()
								return require("nvim-navic").get_location()
							end,
							cond = function()
								return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
							end,
						},
						{ "diff" },
					},
					lualine_y = {
						{ "progress" },
						{ "location" },
					},
					lualine_z = {
						{ "datetime", style = "  %X" },
					},
				},
			}
		end,
	},
}
