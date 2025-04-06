return { {
    'nvim-telescope/telescope.nvim',
    --branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = function(actions)
        return {
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
                    horizontal = { width = 191, height = 0.6, mirror = false, prompt_position = 'top' }
                },
                borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            },
            pickers = {
                git_files = {
                    hidden = true,
                    previewer = false,
                    file_ignore_patterns = {
                        'venv', '__pycache__', '%.xlsx', '%.jpg', '%.jpeg', '%.jfif', '%.png', '%.webp', '%.pdf',
                        '%.odt', '%.ico', '%.JPEG', '%.JPG', '%.mp4', '%.woff', '%.woff2', '%.ttf', '%.otf',
                    }
                },
                find_files = {
                    hidden = true,
                    no_ignore = true,
                    follow = true,
                    find_command = {
                        'fdfind',
                        '--type', 'f',
                        '--no-ignore',
                        '--hidden',
                        '--exclude=node_modules',
                        '--exclude=vendor',
                        '--exclude=.git',
                        '--exclude=.svelte-kit',
                        '--exclude=build',
                        '--exclude=dist',
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
    end,
    config = function(spec)
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')
        local lib = require('ernst.lib')

        require('telescope').setup(spec.opts(actions))

        vim.keymap.set('n', '<m-p>', builtin.find_files, {})
        vim.keymap.set('n', '<c-p>', lib.project_files, {})
        vim.keymap.set('n', '<f9>', builtin.buffers, {})

        require("which-key").add(
            { {
                mode = { "n" },
                { '<leader>b',  builtin.buffers,   desc = 'telescope: buffers',   nowait = true, remap = false },
                { '<leader>tb', builtin.buffers,   desc = 'telescope: buffers',   nowait = true, remap = false },
                { '<leader>th', builtin.help_tags, desc = 'telescope: help tags', nowait = true, remap = false },
                {
                    '<leader>r',
                    function()
                        builtin.grep_string({ search = vim.fn.input('ripgrep: ') })
                    end,
                    desc = 'telescope: ripgrep',
                    nowait = true,
                    remap = false
                },
            } }
        )
    end
} }
