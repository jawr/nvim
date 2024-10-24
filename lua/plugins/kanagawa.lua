return {
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = true,
				undercurls = true,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				overrides = function(colors)
					local theme = colors.theme

					return {
						-- Transparent Floating Windows
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

						-- Borderless Telescope
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = "none" },
						TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = "none" },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = "none" },
						TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = "none" },
						TelescopePreviewNormal = { bg = "none" },
						TelescopePreviewBorder = { bg = "none", fg = theme.ui.bg_dim },

						-- Dark completion (popup) menu
						Pmenu = { fg = theme.ui.shade0, bg = "none" }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = "none" },
						PmenuThumb = { bg = "none" },

						CursorLineNr = { fg = colors.sakuraPink, bg = theme.ui.bg_p2 },
					}
				end,
			})
			vim.cmd("colorscheme kanagawa-dragon")
		end,
	},
}
