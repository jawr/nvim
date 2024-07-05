return {
	{
		"sho-87/kanagawa-paper.nvim",
		name = "kanagawa-paper",
		priority = 1000,
		config = function()
			require("kanagawa-paper").setup({
				transparent = true,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				overrides = function()
					-- make all telescope bg none/transparent
					return {
						TelescopeTitle = { bg = "none" },
						TelescopePromptNormal = { bg = "none" },
						TelescopePromptBorder = { bg = "none" },
						TelescopeResultsNormal = { bg = "none" },
						TelescopeResultsBorder = { bg = "none" },
						TelescopePreviewNormal = { bg = "none" },
						TelescopePreviewBorder = { bg = "none" },
					}
				end,
			})
			vim.cmd("colorscheme kanagawa-paper")
		end,
	},
}
