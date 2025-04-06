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
        },
        sources = {
            default = {
                'lsp',
                'path',
                'buffer',
            },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
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
