return {
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
