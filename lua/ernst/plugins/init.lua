-- Dependencies required by other plugins
vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/folke/which-key.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    'https://github.com/MunifTanjim/nui.nvim',
    'https://github.com/ibhagwan/fzf-lua',
})

vim.pack.add({
    'https://github.com/bronson/vim-visual-star-search',
    'https://github.com/mattn/emmet-vim',
    'https://github.com/mg979/vim-visual-multi',
    'https://github.com/pangloss/vim-javascript',
    'https://github.com/tpope/vim-repeat',
    'https://github.com/tpope/vim-surround',
    'https://github.com/tpope/vim-fugitive',
})

-- Plugin configs where loading order matters
require('ernst/plugins/which-key')
require('ernst/plugins/parrot')

-- Everything else
require('ernst/plugins/aerial')
require('ernst/plugins/blink')
require('ernst/plugins/codediff')
require('ernst/plugins/comment')
require('ernst/plugins/conform')
require('ernst/plugins/delta')
require('ernst/plugins/fzf')
require('ernst/plugins/gitsigns')
require('ernst/plugins/lualine')
require('ernst/plugins/luasnip')
require('ernst/plugins/mason')
require('ernst/plugins/nvim-treesitter')
require('ernst/plugins/nvim-web-devicons')
require('ernst/plugins/oil')
require('ernst/plugins/telescope')
require('ernst/plugins/tmux')
require('ernst/plugins/trouble')
