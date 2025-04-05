if not pcall(require, 'ernst/secrets') then
    return
end

local secrets = require('ernst/secrets')

return {
    cmd = { 'intelephense', '--stdio' },
    filetypes = { 'php' },
    root_markers = { 'composer.json', '.git' },
    init_options = {
        licenceKey = secrets.intelephense_key,
    },
    settings = {
        intelephense = {
            files = {
                maxSize = 5000000
            },
            format = {
                -- This does not work. See intelephense condition in lsp.lua `on_attach`
                enable = false, -- use phpcsfixer directly
            },
            diagnostics = {
                enable = true,
            },
        }
    }
}
