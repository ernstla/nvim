return { {
    'saghen/blink.cmp',
    dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    version = '1.*',
    opts = {
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        keymap = {
            preset = 'enter',
            ['<c-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<c-f>'] = { 'scroll_documentation_down', 'fallback' },
            ['<c-k>'] = { 'select_prev' },
            ['<c-j>'] = { 'select_next' },
            ['<up>'] = { 'select_prev' },
            ['<down>'] = { 'select_next' },
            ['<tab>'] = { 'select_and_accept', 'fallback' },
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning",
            sorts = {
                'exact',
                'score',
                'sort_text',
            },
        },
        snippets = { preset = 'luasnip' },
        sources = {
            default = {
                'snippets',
                'lsp',
                'path',
                'buffer',
            },
            -- providers = {
            --     snippets = {
            --         score_offset = 100,
            --     },
            -- }
        },
        completion = {
            menu = {
                border = 'rounded',
                auto_show = true,
            },
            documentation = {
                window = { border = 'rounded' },
                auto_show = true
            },
        },
        signature = {
            enabled = true,
            window = { border = 'rounded' }
        },
    },
    opts_extend = { "sources.default" }
} }
