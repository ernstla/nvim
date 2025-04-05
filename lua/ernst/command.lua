local command = vim.api.nvim_create_user_command

command('Colors', 'CccHighlighterToggle', {})
command('PickColor', 'CccPick', {})
command('Ag', function(opts) vim.cmd('silent! :botright :grep ' .. opts.args) end, { nargs = '*' })
command('Agi', function(opts) vim.cmd('silent! :botright :grep --ignore-case ' .. opts.args) end, { nargs = '*' })
command('Ags', function(opts) vim.cmd('silent! :botright :grep --case-sensitive ' .. opts.args) end, { nargs = '*' })
command('Jsonify', '%!python3 -m json.tool', {})
command('Tidy', '!tidy -mi -html -wrap 0 %', {})
command('LspInfo', 'checkhealth lsp', {})
