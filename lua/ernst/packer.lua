M = {}

M.setup = function(is_bootstrap)
    return require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'

        use {
            'neovim/nvim-lspconfig',
            requires = {
                -- Automatically install LSPs to stdpath for neovim
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',

                -- Useful status updates for LSP
                'j-hui/fidget.nvim',

                -- Additional lua configuration, makes nvim stuff amazing
                'folke/neodev.nvim',
            },
        }
        use {
            'hrsh7th/nvim-cmp',
            requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
        }

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

        use { -- filebeagle and dirvish alternative
            'tamago324/lir.nvim',
            requires = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
        }

        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                pcall(require('nvim-treesitter.install').update { with_sync = true })
            end,
        }
        use {
            'nvim-treesitter/playground',
            after = 'nvim-treesitter',
        }
        use { -- Additional text objects via treesitter
            'nvim-treesitter/nvim-treesitter-textobjects',
            after = 'nvim-treesitter',
        }

        use { 'alvarosevilla95/luatab.nvim', requires = 'nvim-tree/nvim-web-devicons' }

        use { 'rose-pine/neovim', as = 'rose-pine' }

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

        if is_bootstrap then
            require('packer').sync()
        end
    end)
end

return M
