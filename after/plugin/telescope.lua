local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local lib = require('ernst.lib')

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<c-j>'] = actions.move_selection_next,
                ['<c-k>'] = actions.move_selection_previous,
                ['<c-s>'] = actions.select_horizontal,
                ['<esc>'] = actions.close,
            },
        },
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
            vertical = { width = 0.5, height = 0.8, mirror = true, prompt_position = 'bottom' },
            horizontal = { width = 91, height = 0.6, mirror = false, prompt_position = 'top' }
        },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    },
    pickers = {
        git_files = {
            hidden = true,
            previewer = false,
            find_command = {
                'fd',
                '--type', 'f',
                '--hidden',
                '--follow',
            }
        },
        find_files = {
            hidden = true,
            find_command = {
                'fd',
                '--type', 'f',
                '--no-ignore',
                '--hidden',
                '--exclude=node_modules',
                '--exclude=.git',
                '--color=never',
                '--follow',
            }
        },
        buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            previewer = false,
            mappings = {
                i = {
                    ['<c-x>'] = actions.delete_buffer,
                },
            },
            borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
        },
        grep_string = {
            layout_config = {
                horizontal = {
                    width = 0.8, height = 0.6, mirror = false, prompt_position = 'top', preview_width = 0.6
                }
            },
            mappings = {
                i = {
                    ['<c-q>'] = actions.smart_send_to_qflist,
                    --['<c-q>'] = actions.smart_add_to_qflist + actions.open_qflist,
                }
            }
        },
        lsp_references = {
            layout_config = {
                horizontal = {
                    width = 0.8, height = 0.6, mirror = false, prompt_position = 'top', preview_width = 0.6
                }
            },
            mappings = {
                i = {
                    ['<c-q>'] = actions.smart_send_to_qflist,
                    --['<c-q>'] = actions.smart_add_to_qflist + actions.open_qflist,
                }
            }
        },
    },
}

require('telescope').load_extension('fzf')

vim.keymap.set('n', '<m-p>', builtin.find_files, {})
vim.keymap.set('n', '<c-p>', lib.project_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<f9>', builtin.buffers, {})
vim.keymap.set('n', '<m-b>', builtin.buffers, {})
vim.keymap.set('n', '<leader>r', function()
    builtin.grep_string({ search = vim.fn.input('ripgrep: ') });
end)
