return {
    {
        'nvim-mini/mini.surround',
        version = false,
        opts = {
            mappings = {
                add = 'sa',        -- Add surrounding in Normal and Visual modes
                delete = 'sd',     -- Delete surrounding
                find = 'sf',       -- Find surrounding (to the right)
                find_left = 'sF',  -- Find surrounding (to the left)
                highlight = 'sh',  -- Highlight surrounding
                replace = 'sr',    -- Replace surrounding

                suffix_last = 'l', -- Suffix to search with "prev" method
                suffix_next = 'n', -- Suffix to search with "next" method
            },
            n_lines = 20,          -- Number of lines within which surrounding is searched
        }
    },
    {
        'nvim-mini/mini.splitjoin',
        opts = {
            mappings = {
                toggle = 'gp',
                split = '',
                join = '',
            },
        },
    },
    {
        'nvim-mini/mini.ai',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        version = '*',
        config = function()
            local ai = require("mini.ai")
            ai.setup({
                n_lines = 100,
                custom_textobjects = {
                    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
                },
            })
        end,
    },
    {
        "nvim-mini/mini.diff",
        config = function()
            local diff = require("mini.diff")
            diff.setup({
                -- Disabled by default
                source = diff.gen_source.none(),
            })
        end,
    }
}
