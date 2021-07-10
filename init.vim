call plug#begin(stdpath('data') . '/plugged')
  "" dependencies
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  "" go 
  Plug 'mattn/vim-goimports'
  "" Plug 'crispgm/nvim-go'
  "" lsp and treesitter
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  "" telescope/file search
  Plug 'nvim-telescope/telescope.nvim'
  "" telescope icons
  Plug 'kyazdani42/nvim-web-devicons'
  "" status line
  Plug 'hoob3rt/lualine.nvim'
  "" autocomplete
  Plug 'hrsh7th/nvim-compe'
  "" prettier
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  "" theme
  Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
call plug#end()

"" lua imports
"" lua require('goconfig')
lua require('completion')
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

"" set javascript files to be autochdir
autocmd FileType javascript set autochdir

"" theme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax enable
colorscheme nord

let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

"" saga overrides
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent> gr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
"" saga terminal
nnoremap <silent> <leader>d <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR> 
tnoremap <silent> <leader>d <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>

"" telescope
" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"" set number by default
set number

"" set tabs
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2

"" prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1
