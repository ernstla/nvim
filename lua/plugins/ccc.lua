vim.opt.termguicolors = true

local ccc = require("ccc")

ccc.setup({
    highlighter = {
        auto_enable = false,
        lsp = false,
    },
})

vim.api.nvim_create_user_command('Colors', 'CccHighlighterToggle', {})
vim.api.nvim_create_user_command('Pick', 'CccPick', {})
vim.keymap.set(
    'n',
    '<leader>cc',
    "<cmd>CccConvert<cr>",
    { noremap = true, silent = true, nowait = true }
)
