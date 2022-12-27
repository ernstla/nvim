vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'


   --- use 'aserowy/tmux.nvim'

    use {
        'ThePrimeagen/harpoon',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.0', 
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'nvim-tree/nvim-web-devicons'

    -- filebeagle and dirvish alternative
    use {
        'tamago324/lir.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }


    -- color scheme
    use {'rose-pine/neovim', as = 'rose-pine'}

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/playground'
end)
