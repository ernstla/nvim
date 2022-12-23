local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<c-j>'] = actions.move_selection_next,
                ['<c-k>'] = actions.move_selection_previous,
                ['<c-s>'] = actions.select_horizontal,
                ['<esc>'] = actions.close
            },
        },
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
            vertical = { width = 0.5, height = 0.8, mirror = true, prompt_position = 'bottom' },
            horizontal = { width = 0.6, height = 0.6, mirror = false, prompt_position = 'top' }
        },
    },
}

vim.keymap.set('n', '<m-p>', builtin.find_files, {})
vim.keymap.set('n', '<c-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ff', function()
	builtin.grep_string({ search = vim.fn.input('Grep > ') });
end)
