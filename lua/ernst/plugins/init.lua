local gh = function(x) return 'https://github.com/' .. x end

-- Dependencies required by other plugins
vim.pack.add({
    gh('nvim-tree/nvim-web-devicons'),
    gh('folke/which-key.nvim'),
    gh('nvim-lua/plenary.nvim'),
    gh('MunifTanjim/nui.nvim'),
    gh('ibhagwan/fzf-lua'),
    gh('nvim-telescope/telescope-live-grep-args.nvim'),
    gh('nvim-telescope/telescope-ui-select.nvim'),
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
    gh('nvim-telescope/telescope.nvim'),
    gh('nvim-tree/nvim-tree.lua'),
    gh('pangloss/vim-javascript'),
    gh('stevearc/aerial.nvim'),
    gh('stevearc/conform.nvim'),
    gh('stevearc/oil.nvim'),
    gh('stevearc/qf_helper.nvim'),
    gh('tpope/vim-fugitive'),
    gh('tpope/vim-repeat'),
    gh('tpope/vim-surround'),
    gh('uga-rosa/ccc.nvim'),
    gh('williamboman/mason.nvim'),
    gh('nvim-mini/mini.surround'),
    gh('nvim-mini/mini.splitjoin'),
    gh('nvim-mini/mini.sessions'),
    gh('nvim-mini/mini.ai'),

    { src = gh('L3MON4D3/LuaSnip'), version = vim.version.range('v2.*') },
    { src = gh('saghen/blink.cmp'), version = vim.version.range('1.*') },
})

-- Plugin configs where loading order matters
require('ernst/plugins/which-key')
require('ernst/plugins/parrot')
require('ernst/plugins/luasnip')

-- Everything else
require('ernst/plugins/aerial')
require('ernst/plugins/blink')
require('ernst/plugins/ccc')
require('ernst/plugins/codediff')
require('ernst/plugins/comment')
require('ernst/plugins/conform')
require('ernst/plugins/delta')
require('ernst/plugins/early-retirement')
require('ernst/plugins/fzf')
require('ernst/plugins/gitsigns')
require('ernst/plugins/harpoon')
require('ernst/plugins/lualine')
require('ernst/plugins/luatab')
require('ernst/plugins/mason')
require('ernst/plugins/mini')
require('ernst/plugins/nvim-treesitter')
require('ernst/plugins/nvim-web-devicons')
require('ernst/plugins/oil')
require('ernst/plugins/qf-helper')
require('ernst/plugins/spectre')
require('ernst/plugins/tailwind-tools')
require('ernst/plugins/telescope')
require('ernst/plugins/tmux')
require('ernst/plugins/tree')
require('ernst/plugins/trouble')
