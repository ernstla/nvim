return {
    cmd = { 'vscode-json-language-server', '--stdio' },
    filetypes = { 'json', 'jsonc' },
    init_options = {
        provideFormatter = true,
    },
    root_markers = { '.git' },
    single_file_support = true,
    settings = {
        jsonls = {
            format = {
                enabled = false
            }
        },
        json = {
            format = {
                enabled = false
            }
        }
    }
}
