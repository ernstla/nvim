local gh = function(x) return 'https://github.com/' .. x end

-- Dependencies required by other plugins
vim.pack.add({
    gh('nvim-tree/nvim-web-devicons'),
    gh('folke/which-key.nvim'),
    gh('nvim-lua/plenary.nvim'),
    gh('MunifTanjim/nui.nvim'),
    gh('ibhagwan/fzf-lua'),
    gh('nvim-treesitter/nvim-treesitter'),
    gh('nvim-treesitter/nvim-treesitter-textobjects'),
})

vim.pack.add({
    gh('ThePrimeagen/harpoon'),
    gh('alvarosevilla95/luatab.nvim'),
    gh('aserowy/tmux.nvim'),
    gh('bronson/vim-visual-star-search'),
    gh('chrisgrieser/nvim-early-retirement'),
    gh('esmuellert/codediff.nvim'),
    gh('folke/trouble.nvim'),
    gh('frankroeder/parrot.nvim'),
    gh('kokusenz/delta.lua'),
    gh('kokusenz/deltaview.nvim'),
    gh('lewis6991/gitsigns.nvim'),
    gh('luckasRanarison/tailwind-tools.nvim'),
    gh('mattn/emmet-vim'),
    gh('mg979/vim-visual-multi'),
    gh('numToStr/Comment.nvim'),
    gh('nvim-lualine/lualine.nvim'),
    gh('nvim-pack/nvim-spectre'),
    gh('nvim-tree/nvim-tree.lua'),
    gh('pangloss/vim-javascript'),
    gh('stevearc/aerial.nvim'),
    gh('stevearc/conform.nvim'),
    gh('stevearc/oil.nvim'),
    gh('stevearc/qf_helper.nvim'),
    gh('tpope/vim-fugitive'),
    gh('tpope/vim-repeat'),
    gh('tpope/vim-surround'),
    gh('williamboman/mason.nvim'),
    gh('nvim-mini/mini.surround'),
    gh('nvim-mini/mini.splitjoin'),
    gh('nvim-mini/mini.sessions'),
    gh('nvim-mini/mini.ai'),

    { src = gh('L3MON4D3/LuaSnip'), version = vim.version.range('v2.*') },
    { src = gh('saghen/blink.cmp'), version = vim.version.range('1.*') },
})

-- Plugin configs where loading order matters
require('plugins/which-key')
require('plugins/parrot')
require('plugins/luasnip')

-- Everything else
require('plugins/aerial')
require('plugins/blink')
require('plugins/codediff')
require('plugins/comment')
require('plugins/conform')
require('plugins/delta')
require('plugins/early-retirement')
require('plugins/fzf-lua')
require('plugins/gitsigns')
require('plugins/harpoon')
require('plugins/lualine')
require('plugins/luatab')
require('plugins/mason')
require('plugins/mini')
require('plugins/nvim-treesitter')
require('plugins/nvim-web-devicons')
require('plugins/oil')
require('plugins/qf-helper')
require('plugins/spectre')
require('plugins/tailwind-tools')
require('plugins/tmux')
require('plugins/tree')
require('plugins/trouble')
require('plugins/undotree')
