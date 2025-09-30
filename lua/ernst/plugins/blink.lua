return { {
    'saghen/blink.cmp',
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
            ['<cr>'] = { 'select_and_accept', 'fallback' },
            ['<tab>'] = { 'fallback' }, -- ignore tab to trigger luasnips
            ['<s-tab>'] = { 'fallback' },
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning",
            sorts = {
                'exact',
                'score',
                'sort_text',
            },
        },
        sources = {
            default = {
                'lsp',
                'path',
                'buffer',
            },
            providers = {
                snippets = {
                    min_keyword_length = 2,
                    score_offset = 0,
                },
                lsp = {
                    min_keyword_length = 2,
                    score_offset = -1,
                },
                path = {
                    min_keyword_length = 2,
                    score_offset = -2,
                },
                buffer = {
                    min_keyword_length = 2,
                    score_offset = -3,
                },
            }
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
