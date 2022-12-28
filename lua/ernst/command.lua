local command = vim.api.nvim_create_user_command

command('Colorizer', 'ColorizerToggle', {})
command('Ag', function(opts) vim.cmd('silent! :botright :grep ' .. opts.args) end, { nargs = '*' })
command('Jsonify', '%!python3 -m json.tool', {})
command('Tidy', '!tidy -mi -html -wrap 0 %', {})
