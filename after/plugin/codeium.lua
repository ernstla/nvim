-- vim.g.codeium_disable_bindings = 1
-- vim.g.codeium_manual = 1
vim.g.codeium_no_map_tab = 1

vim.keymap.set('i', '<m-i>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
vim.keymap.set('i', '<m-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
vim.keymap.set('i', '<m-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
vim.keymap.set('i', '<m-l>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
