M = {}

M.setup = function(is_bootstrap)
    return require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'

        use 'NvChad/nvim-colorizer.lua'
        use 'aserowy/tmux.nvim'
        use 'bronson/vim-visual-star-search'
        use 'lewis6991/gitsigns.nvim'
        use 'mbbill/undotree'
        use 'mg979/vim-visual-multi'
        use 'numToStr/Comment.nvim'
        use 'stevearc/qf_helper.nvim'

        use 'tpope/vim-repeat'
        use 'tpope/vim-surround'
        use 'tpope/vim-fugitive'
        use 'tpope/vim-obsession'

        use {
            'ThePrimeagen/harpoon',
            requires = { 'nvim-lua/plenary.nvim' }
        }

        use {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.0',
            requires = { 'nvim-lua/plenary.nvim' }
        }

        use {
            'nvim-tree/nvim-tree.lua',
            requires = { 'nvim-tree/nvim-web-devicons' },
            tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }

        -- filebeagle and dirvish alternative
        use {
            'tamago324/lir.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
                'nvim-tree/nvim-web-devicons',
            }
        }

        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        }

        -- color scheme
        use { 'rose-pine/neovim', as = 'rose-pine' }

        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use 'nvim-treesitter/playground'

        use {
            'VonHeikemen/lsp-zero.nvim',
            requires = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' },
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lua' },

                -- Snippets
                { 'L3MON4D3/LuaSnip' },
                { 'rafamadriz/friendly-snippets' },
            }
        }

        if is_bootstrap then
            require('packer').sync()
        end
    end)
end

return M
