local command = vim.api.nvim_create_user_command

command('Colors', 'CccHighlighterToggle', {})
command('PickColor', 'CccPick', {})
command('Jsonify', '%!python3 -m json.tool', {})
command('Tidy', '!tidy -mi -html -wrap 0 %', {})
command('LspInfo', 'checkhealth vim.lsp', {})
command('LspAttached', 'lua vim.print(vim.lsp.get_clients({ bufnr = 0 }))', {})
command("ReloadColorscheme", function() require('ernst/lib').reload_colorscheme() end, {})
