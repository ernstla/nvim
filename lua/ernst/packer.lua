vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-tree/nvim-web-devicons'

    use {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.0', 
	requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- filebeagle and dirvish alternative
    use {
        'tamago324/lir.nvim',
	requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'aserowy/tmux.nvim',
        config = function() require('tmux').setup() end
    })
end)
