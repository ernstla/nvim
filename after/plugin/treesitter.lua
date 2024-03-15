require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or 'all'
    ensure_installed = {
        'c',
        'css',
        'html',
        'javascript',
        'lua',
        'markdown_inline',
        'php',
        'python',
        'query',
        'rust',
        'scss',
        'svelte',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
    },

    modules = {},

    ignore_install = {},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        disable = { 'html', 'php', 'python', 'javascript' },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = false,
    }
}
