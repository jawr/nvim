local lualine = require("lualine")

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox",
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{
				"filename",
				file_status = true,
				path = 1,
			},
		},
		lualine_c = {},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_lsp" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
			"encoding",
			"filetype",
		},
		lualine_y = { "location" },
		lualine_z = { "branch" },
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
	extensions = { "fugitive", "quickfix", "nvim-tree" },
})
