vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { "rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	}
	use { 'nvim-treesitter/nvim-treesitter',
		as = 'treesitter',
		{ run = ':TSUpdate'}
	}
	use('mbbill/undotree')
    use('neovim/nvim-lspconfig')
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use('jose-elias-alvarez/null-ls.nvim')
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'saadparwaiz1/cmp_luasnip'}
    use {'rafamadriz/friendly-snippets'}
    use {'VonHeikemen/lsp-zero.nvim'}
    use 'mfussenegger/nvim-dap-python'
    use {
        'stevearc/overseer.nvim',
        config = function() require('overseer').setup() end
    }
    use { 'L3MON4D3/LuaSnip', tag = "v2.*" }
end)
