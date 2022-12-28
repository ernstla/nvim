require 'qf_helper'.setup({
    prefer_loclist = true, -- Used for QNext/QPrev (see Commands below)
    sort_lsp_diagnostics = true, -- Sort LSP diagnostic results
    quickfix = {
        autoclose = true, -- Autoclose qf if it's the only open window
        default_bindings = false, -- Set up recommended bindings in qf window
        default_options = true, -- Set recommended buffer and window options
        max_height = 13, -- Max qf height when using open() or toggle()
        min_height = 1, -- Min qf height when using open() or toggle()
        track_location = 'cursor', -- Keep qf updated with your current location
        -- Use `true` to update position as well
    },
    loclist = {
        autoclose = true,
        default_bindings = false,
        default_options = true,
        max_height = 13,
        min_height = 1,
        track_location = 'cursor',
    },
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true, nowait = true }

map('n', '<C-F3>', '<Cmd>QFToggle<CR>', opts)
map('n', '<F3>', '<Cmd>QFNext<CR>', opts)
map('n', '<S-F3>', '<Cmd>QFPrev<CR>', opts)
map('n', '<C-F4>', '<Cmd>LLToggle<CR>', opts)
map('n', '<F4>', '<Cmd>LLNext<CR>', opts)
map('n', '<S-F4>', '<Cmd>LLPrev<CR>', opts)
