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
				javascript = { "prettierd", "eslint" },
				typescript = { "prettierd", "eslint" },
				typescriptreact = { "prettierd", "eslint" },
				javascriptreact = { "prettierd", "eslint" },
			},
			formatters = {
				black = {
					prepend_args = { "--fast" },
				},
			},
		},
	},
}
