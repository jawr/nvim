local ls = require "luasnip"

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

-- load vscode snippets
-- require("luasnip.loaders.from_vscode").lazy_load {}
