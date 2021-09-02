local npairs = require('nvim-autopairs')

npairs.setup({
  check_ts = true,
    ts_config = {
      lua = {'string'},-- it will not add pair on that treesitter node
      javascript = {'template_string'},
      javascriptreact = {'template_string'},
      typescript = {'template_string'},
      typescriptreact = {'template_string'},
    }
})

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = true -- automatically select the first item
})
