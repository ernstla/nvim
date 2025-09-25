return { {
    'numToStr/Comment.nvim',
    opts = {
        padding = true,  -- Add a space b/w comment and the line
        sticky = true,   -- Whether the cursor should stay at its position
        ignore = nil,    -- Lines to be ignored while (un)comment
        pre_hook = nil,  -- Function to call before (un)comment
        post_hook = nil, -- Function to call after (un)comment

        -- LHS of toggle mappings in NORMAL mode
        toggler = {
            line = 'gcc',  -- Line-comment toggle keymap
            -- line = '<leader>ci',
            block = 'gbc', -- Block-comment toggle keymap
        },

        -- LHS of operator-pending mappings in NORMAL and VISUAL mode
        -- opleader = {
        --     -- Line-comment keymap
        --     line = '<leader>ci', --line = 'gc',
        --     block = 'gb',        -- Block-comment keymap
        -- },

        -- LHS of extra mappings
        extra = {
            above = 'gcO', -- Add comment on the line above
            below = 'gco', -- Add comment on the line below
            eol = 'gcA',   -- Add comment at the end of line
        },

        -- Enable keybindings
        -- NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
            -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = true,
            extra = true, -- Extra mapping; `gco`, `gcO`, `gcA`
        },
    },
    config = function(spec)
        require('Comment').setup(spec.opts)

        local api = require('Comment.api')
        local esc = vim.api.nvim_replace_termcodes('<esc>', true, false, true)

        vim.keymap.set(
            'n',
            '<c-_>', -- <c-_> means <c-/> -- see :help :map-special-keys
            "<cmd>lua require('Comment.api').toggle.linewise.current(vim.fn.visualmode())<cr>",
            { noremap = true, silent = true, nowait = true }
        )
        vim.keymap.set(
            'n',
            '<c-/>', -- <c-_> means <c-/> -- see :help :map-special-keys
            "<cmd>lua require('Comment.api').toggle.linewise.current(vim.fn.visualmode())<cr>",
            { noremap = true, silent = true, nowait = true }
        )

        vim.keymap.set('x', '<c-_>', function()
            vim.api.nvim_feedkeys(esc, 'nx', false)
            api.toggle.linewise(vim.fn.visualmode())
        end)
        vim.keymap.set('x', '<c-/>', function()
            vim.api.nvim_feedkeys(esc, 'nx', false)
            api.toggle.linewise(vim.fn.visualmode())
        end)
    end
} }
