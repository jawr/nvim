call plug#begin(stdpath('data') . '/plugged')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'crispgm/nvim-go'
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'hoob3rt/lualine.nvim'
  "" https://github.com/nvim-lua/completion-nvim
  Plug 'nvim-lua/completion-nvim'
  Plug 'lifepillar/vim-gruvbox8'
  Plug 'nvim-telescope/telescope.nvim'
call plug#end()

lua require('goconfig')
lua require('lsp')
lua require('treesitter')
lua require('statusline')

"" file type specific spacing rules
autocmd FileType markdown setlocal textwidth=80 spell spelllang=en_gb
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab 
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType lua setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType nix setlocal shiftwidth=2 tabstop=2 expandtab

"" some defaults
set nobackup
set nowritebackup
set autochdir

"" theme
set background=dark
colorscheme gruvbox8

"" saga overrides
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent> gr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR> 
tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>

"" completion overrides
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect
set shortmess+=c

"" completion disable auto popup and set tab to trigger auto complete
let g:completion_enable_auto_popup = 0
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

"" telescope
" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
