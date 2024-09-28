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

require('ernst/settings')
require('lazy').setup({ import = "ernst/plugins" }, {
    change_detection = {
        notify = false,
    },
    ui = {
        border = "single",
    }
})

-- Load autocmd, mappings etc.
require("ernst")
