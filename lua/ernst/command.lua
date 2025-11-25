local command = vim.api.nvim_create_user_command

command('Colors', 'CccHighlighterToggle', {})
command('PickColor', 'CccPick', {})
command('Jsonify', '%!python3 -m json.tool', {})
command('Tidy', '!tidy -mi -html -wrap 0 %', {})
command('LspInfo', 'checkhealth vim.lsp', {})
command('LspAttached', 'lua vim.print(vim.lsp.get_clients({ bufnr = 0 }))', {})
command("ReloadColorscheme", function() require('ernst/lib').reload_colorscheme() end, {})

command('Rg', function(opts) vim.cmd('silent! :botright :grep ' .. opts.args) end, { nargs = '*' })
command('Rgi', function(opts) vim.cmd('silent! :botright :grep --ignore-case ' .. opts.args) end, { nargs = '*' })
command('Rgs', function(opts) vim.cmd('silent! :botright :grep --case-sensitive ' .. opts.args) end, { nargs = '*' })
