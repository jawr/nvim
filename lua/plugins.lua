return require("packer").startup(function()
	-- packer
	use("wbthomason/packer.nvim")

	-- lsp pre configs
	use("neovim/nvim-lspconfig")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
	})

	use("jose-elias-alvarez/nvim-lsp-ts-utils")

	-- syntax hilighting
	use({ "nvim-treesitter/nvim-treesitter" })

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
	})

	-- completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			-- icons
			"onsails/lspkind-nvim",
			-- completion sources
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
		},
	})

	use("ray-x/lsp_signature.nvim")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	-- use 'golang/vscode-go'

	-- status bar
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- themes
	use("savq/melange")
end)
