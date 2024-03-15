require("lazy").setup({
    -- Colorscheme
    'rose-pine/neovim',

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',
        },
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    },

    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
        dependencies = {
            'nvim-treesitter/playground',
            -- Additional text objects via treesitter
            'nvim-treesitter/nvim-treesitter-textobjects',
        }
    },

    { 'alvarosevilla95/luatab.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },

    'nvimdev/guard.nvim',
    -- 'leafOfTree/vim-svelte-plugin',
    'hrsh7th/cmp-buffer',
    'Exafunction/codeium.vim',
    'pangloss/vim-javascript',
    'NvChad/nvim-colorizer.lua',
    'aserowy/tmux.nvim',
    'bronson/vim-visual-star-search',
    'lewis6991/gitsigns.nvim',
    'mattn/emmet-vim',
    'mbbill/undotree',
    'mg979/vim-visual-multi',
    'numToStr/Comment.nvim',
    'simrat39/symbols-outline.nvim',
    'stevearc/qf_helper.nvim',

    'tpope/vim-abolish',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'tpope/vim-fugitive',
    'tpope/vim-obsession',

    -- Languages
    'alaviss/nim.nvim',
    'ziglang/zig.vim',
}, {
    ui = {
        border = "single",
    }
})
