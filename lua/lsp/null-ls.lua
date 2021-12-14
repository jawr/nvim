local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.prettier.with({
	  filetypes = { "html", "json", "yaml", "markdown" },
	}),
	null_ls.builtins.formatting.goimports,
	null_ls.builtins.formatting.black,
	null_ls.builtins.formatting.eslint_d,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.terraform_fmt,
	null_ls.builtins.formatting.clang_format.with({
	  filetypes = { "proto" },
	}),
}

null_ls.config({
	debug = true,
	sources = sources,
})
