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
				python = { "black", "isort" },
				javascript = { "prettierd", "eslint_d" },
				typescript = { "prettierd", "eslint_d" },
				typescriptreact = { "prettierd", "eslint_d" },
				javascriptreact = { "prettierd", "eslint_d" },
			},
			formatters = {
				black = {
					prepend_args = { "--fast" },
				},
			},
		},
	},
}
