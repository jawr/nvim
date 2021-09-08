local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.eslint,
}

null_ls.config({ sources = sources })
