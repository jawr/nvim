return require('packer').startup(function()

  use 'wbthomason/packer.nvim'

  -- lsp pre configs
  use 'neovim/nvim-lspconfig'

  -- syntax hilighting
  use { 'nvim-treesitter/nvim-treesitter' }

  -- fuzzy finder
  use {  
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- completion
  -- use 'hrsh7th/nvim-compe'
  -- use { 'ms-jpq/coq_nvim', branch = 'coq'}

  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin


  -- use 'windwp/nvim-autopairs' -- Auto-pairs with nvim-treesitter integration

  -- status bar
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- themes
  -- use 'folke/tokyonight.nvim'
  use 'savq/melange'

  use {
    'ray-x/go.nvim',
    require('go').setup({
      goimport = 'gopls',
      gofmt = 'gopls',
      lsp_gofumpt = true,
    })
  }

end)
