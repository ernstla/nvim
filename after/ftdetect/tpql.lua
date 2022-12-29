vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = '*.tpql',
    command = 'set filetype=sql'
})
