-- Dependencies required by other plugins
vim.pack.add({
    'https://github.com/MunifTanjim/nui.nvim',
    'https://github.com/folke/which-key.nvim',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope-live-grep-args.nvim',
    'https://github.com/nvim-telescope/telescope-ui-select.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
})

vim.pack.add({
    'https://github.com/bronson/vim-visual-star-search',
    'https://github.com/mattn/emmet-vim',
    'https://github.com/mg979/vim-visual-multi',
    'https://github.com/pangloss/vim-javascript',
    'https://github.com/tpope/vim-repeat',
    'https://github.com/tpope/vim-surround',
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/stevearc/aerial.nvim',
    'https://github.com/kokusenz/delta.lua',
    'https://github.com/kokusenz/deltaview.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/esmuellert/codediff.nvim',
    'https://github.com/numToStr/Comment.nvim',
    'https://github.com/stevearc/conform.nvim',
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/frankroeder/parrot.nvim',
    'https://github.com/aserowy/tmux.nvim',
    'https://github.com/folke/trouble.nvim',
    'https://github.com/nvim-tree/nvim-tree.lua',
    'https://github.com/nvim-pack/nvim-spectre',
    'https://github.com/stevearc/qf_helper.nvim',

    { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range('v2.*') },
    { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.*') },
})

-- Plugin configs where loading order matters
require('ernst/plugins/which-key')
require('ernst/plugins/parrot')
require('ernst/plugins/luasnip')

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
require('ernst/plugins/mason')
require('ernst/plugins/nvim-treesitter')
require('ernst/plugins/nvim-web-devicons')
require('ernst/plugins/oil')
require('ernst/plugins/telescope')
require('ernst/plugins/tmux')
require('ernst/plugins/trouble')
require('ernst/plugins/spectre')
require('ernst/plugins/tree')
require('ernst/plugins/qf-helper')
