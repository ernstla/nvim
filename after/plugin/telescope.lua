local builtin = require('telescope.builtin')
vim.keymap.set('n', '<m-p>', builtin.find_files, {})
vim.keymap.set('n', '<c-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ff', function()
	builtin.grep_string({ search = vim.fn.input('Grep > ') });
end)
