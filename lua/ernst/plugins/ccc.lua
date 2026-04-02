require('ccc').setup()

vim.keymap.set('n', '<f7>', '<cmd>CccConvert<cr>', { noremap = true, silent = true, nowait = true })

local command = vim.api.nvim_create_user_command

command('Colors', 'CccHighlighterToggle', {})
command('ColorsPicker', 'CccPick', {})
command('ColorsConvert', 'CccConvert', {})
