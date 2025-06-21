vim.diagnostic.config {
    float = {
        border = "rounded",
        source = "always",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = ' ',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignErrorNumber',
        },
    },
}

vim.lsp.enable({
    'eslint',
    'go',
    'json',
    'lua',
    'nim',
    'php',
    'python',
    'ruff',
    'rust',
    'svelte',
    'tailwind',
    'typescript',
    'vue'
})
