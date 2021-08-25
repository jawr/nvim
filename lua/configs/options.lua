local opt = vim.opt
local g   = vim.g
local cmd = vim.cmd

-- Editor behavior ->>1
opt.expandtab = true -- Tabs are the devil's work
opt.hidden = true
opt.history = 1000
opt.undofile = true
opt.backup = false -- No backup after editing
opt.writebackup = false -- No backups made while editing
opt.softtabstop = 4 -- Makes you think that your spaces are tabs
opt.tabstop = 4 -- The all powerfull tab number
opt.number = true -- Show line numbers
-- opt.showbreak = '↲' -- Show me where you broke my lines
opt.showmatch = true -- Highlight matching parentesis, braces, etc.
opt.list = true -- Show some invisible characters
opt.termguicolors = true  -- True color support

-- search
opt.hlsearch = true -- Highlight search
opt.ignorecase = false -- Case insensitive
opt.incsearch = true -- Search as you type
vim.o.smartcase = true

opt.cursorline = true
opt.lazyredraw = true

-- autocommands
cmd 'autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType javascriptreact setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab autowrite'
cmd 'autocmd FileType json setlocal ts=2 sts=2 sw=2 conceallevel=0 expandtab'
cmd 'autocmd FileType fish setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType lua setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType proto setlocal ts=2 sts=2 sw=2 expandtab'

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)
