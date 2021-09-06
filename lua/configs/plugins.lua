return require('packer').startup(function()
  -- packer
  use 'wbthomason/packer.nvim'

  -- lsp pre configs
  use 'neovim/nvim-lspconfig'

  -- syntax hilighting
  use { 'nvim-treesitter/nvim-treesitter' }

  -- fuzzy finder
  use {  
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim', 
      'nvim-lua/plenary.nvim',
    }
  }

  -- completion
  use { 
    'hrsh7th/nvim-cmp',
    requires = {
      -- icons
      'onsails/lspkind-nvim',
      -- completion sources
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-nvim-lsp',
    }
  }

  -- snippets
  use 'golang/vscode-go'

  -- status bar
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- themes
  use 'savq/melange'

end)
