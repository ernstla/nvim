return {
    init_options = { hostInfo = 'neovim' },
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
    },
    root_marker =
    { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
    single_file_support = true,
    settings = {
        javascript = {
            format = {
                enabled = false
            }
        },
        typescript = {
            format = {
                enabled = false
            }
        },
    }
}
