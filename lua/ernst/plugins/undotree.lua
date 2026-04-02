vim.cmd('packadd nvim.undotree')
vim.keymap.set("n", '<f5>', require("undotree").open)
