return { {
    'stevearc/qf_helper.nvim',
    opts = {
        prefer_loclist = true,             -- Used for QNext/QPrev (see Commands below)
        sort_lsp_diagnostics = true,       -- Sort LSP diagnostic results
        quickfix = {
            autoclose = true,              -- Autoclose qf if it's the only open window
            default_bindings = false,      -- Set up recommended bindings in qf window
            default_options = true,        -- Set recommended buffer and window options
            max_height = 13,               -- Max qf height when using open() or toggle()
            min_height = 1,                -- Min qf height when using open() or toggle()
            track_location = 'cursor',     -- Keep qf updated with your current location
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
    },
    config = function(spec)
        require('qf_helper').setup(spec.opts)

        local map = vim.keymap.set
        local opts = { noremap = true, silent = true, nowait = true }

        map('n', '<leader><f3>', '<cmd>QFToggle<cr>', opts)
        map('n', '<f3>', '<cmd>QFNext<cr>', opts)
        map('n', '<s-f3>', '<cmd>QFPrev<cr>', opts)
        map('n', '<leader><f4>', '<cmd>LLToggle<cr>', opts)
        map('n', '<f4>', '<cmd>LLNext<cr>', opts)
        map('n', '<s-f4>', '<cmd>LLPrev<cr>', opts)
    end
} }
