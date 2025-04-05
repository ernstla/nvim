return {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    single_file_support = true,
    root_markers = { 'Cargo.toml' },
    capabilities = {
        experimental = {
            serverStatusNotification = true,
        },
    },
    settings = {
        ["rust-analyzer"] = {
            rustfmt = {
                enableRangeFormatting = true
            }
        }
    }
}
