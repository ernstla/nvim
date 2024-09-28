local g = vim.g

-- Install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- make sure to set `mapleader` before lazy so our mappings are correct
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Global plugin settings
g.user_emmet_leader_key = '<c-e>'
g.loaded_netrw = 1              -- let nvim-tree hijack directory windows (e. g. `nvim .`)
g.loaded_netrwPlugin = 1
g.VM_case_setting = 'sensitive' -- case sensitive multi cursors (vim-visual-multi)

require('lazy').setup({ import = "ernst/plugins" }, {
    change_detection = {
        notify = false,
    },
    ui = {
        border = "single",
    }
})

-- Load nvim settings, lazy, autocmd, mappings etc.
require("ernst")
