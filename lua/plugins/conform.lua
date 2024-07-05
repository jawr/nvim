return {
	-- Autoformat
	{
		"stevearc/conform.nvim",
		opts = {
			async = true,
			lsp_fallback = true,
			notify_on_error = true,
			format_on_save = {
				timeout_ms = 2000,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				javascriptreact = { "prettierd" },
			},
			formatters = {
				black = {
					prepend_args = { "--fast" },
				},
			},
		},
	},
}
