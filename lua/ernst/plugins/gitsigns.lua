return { {
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add = { text = '┃' },
            change = { text = '' },
            delete = { text = '⌥' },
            topdelete = { text = '⌥' },
            changedelete = { text = '◦' },
            untracked = { xt = '┆' },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
            interval = 1000,
            follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,  -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        }
    },
    config = function(spec)
        require('gitsigns').setup(spec.opts)

        local gs = package.loaded.gitsigns

        vim.keymap.set('n', '<leader>]', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return '<Ignore>'
        end, { noremap = true, silent = true, nowait = true, desc = "next change hunk", expr = true })

        vim.keymap.set('n', '<leader>[', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return '<Ignore>'
        end, { noremap = true, silent = true, nowait = true, desc = "previous change hunk", expr = true })
    end
} }
