return { {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
        keymap = {
            preset = 'none',
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<Up>'] = {
                function(cmp) return cmp.select_prev({ on_ghost_text = true }) end,
            },
            ['<Down>'] = {
                function(cmp) return cmp.select_next({ on_ghost_text = true }) end,
            },
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<CR>'] = { 'select_and_accept', 'fallback' },
            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            ['<C-p>'] = { 'scroll_documentation_up', 'fallback_to_mappings' },
            ['<C-n>'] = { 'scroll_documentation_down', 'fallback_to_mappings' },
            ['<C-t>'] = { 'show_signature' },
            ['<C-e>'] = { 'hide', 'fallback' },
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
                'parrot',
            },
            providers = {
                lsp = {
                    min_keyword_length = 0,
                    score_offset = 0,
                },
                path = {
                    min_keyword_length = 2,
                    score_offset = 1,
                },
                buffer = {
                    min_keyword_length = 2,
                    score_offset = 2,
                },
                parrot = {
                    module = "parrot.completion.blink",
                    name = "parrot",
                    score_offset = 20,
                    opts = {
                        show_hidden_files = false,
                        max_items = 50,
                    }
                },
            }
        },
        completion = {
            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
                cycle = {
                    from_top = true,
                    from_bottom = true,
                },
            },
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
        cmdline = {
            keymap = {
                preset = 'inherit',
                ['<Tab>'] = { 'show_and_insert', 'insert_next' },
                ['<S-Tab>'] = { 'select_prev' },
                ['<CR>'] = { 'accept_and_enter', 'fallback' },
            },
            completion = {
                menu = { auto_show = false }
            },
        },
    },
    opts_extend = { "sources.default" }
} }
