return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            format = {
                defaultConfig = {
                    indent_style = "space",
                    indent_size = 2
                }
            },
            diagnostics = {
                disable = {
                    "missing-fields", -- don't complain about missing fields in tables
                },
                globals = {
                    'vim',
                    'require'
                },
            },
        }
    }
}
