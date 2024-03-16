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
        branch = '0.1.x',
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
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            'nvim-treesitter/playground',
            -- Additional text objects via treesitter
            'nvim-treesitter/nvim-treesitter-textobjects',
        }
    },

    { 'alvarosevilla95/luatab.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },

    'robitx/gp.nvim',
    'Exafunction/codeium.vim',
    'NvChad/nvim-colorizer.lua',
    'aserowy/tmux.nvim',
    'bronson/vim-visual-star-search',
    'hrsh7th/cmp-buffer',
    'lewis6991/gitsigns.nvim',
    'mattn/emmet-vim',
    'mbbill/undotree',
    'mg979/vim-visual-multi',
    'numToStr/Comment.nvim',
    'nvimdev/guard.nvim',
    'pangloss/vim-javascript',
    'simrat39/symbols-outline.nvim',
    'stevearc/qf_helper.nvim',

    'tpope/vim-abolish',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'tpope/vim-fugitive',
    'tpope/vim-obsession',

    -- Languages
    'alaviss/nim.nvim',
    'ziglang/zig',
}, {
    ui = {
        border = "single",
    }
})
