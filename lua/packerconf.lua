-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
[[
    augroup Packer
        autocmd!
        autocmd BufWritePost init.lua PackerCompile
    augroup end
]],
    false
)

local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'kana/vim-textobj-indent'
    use 'kana/vim-textobj-line'
    use 'kana/vim-textobj-user'
    use 'nelstrom/vim-visual-star-search'
    use 'scrooloose/nerdcommenter'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'wellle/targets.vim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-obsession'
    use 'jeetsukumaran/vim-filebeagle'
    use 'guns/xterm-color-table.vim'
    use 'lilydjwg/colorizer'
    use 'mbbill/undotree'

    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'lukas-reineke/indent-blankline.nvim'
    use { 'mhinz/vim-signify', requires = { 'nvim-lua/plenary.nvim' } }
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'SirVer/ultisnips'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use 'preservim/nerdtree'
    use 'jlanzarotta/bufexplorer'
    use 'terryma/vim-multiple-cursors'
    use 'majutsushi/tagbar'

    -- Languages
    use 'cespare/vim-toml'
    use 'lifepillar/pgsql.vim'
    use 'mxw/vim-jsx'
    use 'pangloss/vim-javascript'
    use 'plasticboy/vim-markdown'
    use 'posva/vim-vue'
    use 'rust-lang/rust.vim'
    use 'tpope/vim-haml'
    use 'evanleck/vim-svelte'
    use 'ziglang/zig.vim'
    use 'https://git.serious.selfip.org/ernst/nim.vim.git'

    if vim.fn.has("unix") == 1 then
        use 'christoomey/vim-tmux-navigator'
    end
end)
