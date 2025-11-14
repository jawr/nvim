return {
	-- Autoformat
	{
		"stevearc/conform.nvim",
		opts = {
			async = true,
			notify_on_error = true,
			format_on_save = {
				timeout_ms = 2000,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black", "isort" },
				javascript = { "prettier", "eslint_d" },
				typescript = { "prettier", "eslint_d" },
				typescriptreact = { "prettier", "eslint_d" },
				javascriptreact = { "prettier", "eslint_d" },
			},
			formatters = {
				black = {
					prepend_args = { "--fast" },
				},
			},
		},
	},
}
