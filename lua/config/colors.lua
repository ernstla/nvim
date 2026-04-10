local command = vim.api.nvim_create_user_command

vim.lsp.document_color.enable(false)

command('Colors', function() vim.lsp.document_color.enable(not vim.lsp.document_color.is_enabled()) end, {})
command('ColorsConvert', function() vim.lsp.document_color.color_presentation() end, {})
