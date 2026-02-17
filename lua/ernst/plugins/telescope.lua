local function escape_pattern(text)
    return text:gsub("([^%w])", "%%%1")
end

local file_ignore_patterns = {
    '%.JPEG',
    '%.JPG',
    '%.doc',
    '%.docx',
    '%.ico',
    '%.jfif',
    '%.jpeg',
    '%.jpg',
    '%.mp3',
    '%.mp4',
    '%.odt',
    '%.otf',
    '%.pdf',
    '%.png',
    '%.ppt',
    '%.pptx',
    '%.ttf',
    '%.wav',
    '%.webp',
    '%.woff',
    '%.woff2',
    '%.xls',
    '%.xlsx',
    '__pycache__',
    'venv',
}

return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-live-grep-args.nvim',
        },
        opts = function()
            local actions = require('telescope.actions')
            local action_state = require('telescope.actions.state')

            return {
                defaults = {
                    mappings = {
                        i = {
                            ['<c-j>'] = actions.move_selection_next,
                            ['<c-k>'] = actions.move_selection_previous,
                            ['<c-f>'] = actions.preview_scrolling_down,
                            ['<c-b>'] = actions.preview_scrolling_up,
                            ['<c-s>'] = actions.select_horizontal,
                            ['<c-p>'] = require('telescope.actions.layout').toggle_preview,
                            ['<esc>'] = function(prompt_bufnr)
                                if action_state.get_current_line() == '' then
                                    actions.close(prompt_bufnr)
                                    return
                                end

                                local keys = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
                                vim.api.nvim_feedkeys(keys, 'n', true)
                            end,
                        },
                        n = {
                            ['<esc>'] = actions.close,
                            ['q'] = actions.close,
                        },
                    },
                    sorting_strategy = 'ascending',
                    preview = false,
                    layout_strategy = 'vertical',
                    layout_config = {
                        vertical = {
                            width = function(_, max_columns, _)
                                local width = max_columns < 150 and 0.9 or 0.5
                                return math.floor(max_columns * width)
                            end,
                            height = 0.8,
                            mirror = true,
                            prompt_position = 'top',
                        },
                        horizontal = {
                            width = function(_, max_columns, _)
                                local width = max_columns < 250 and 0.95 or 0.8
                                return math.floor(max_columns * width)
                            end,
                            preview_width = 0.5,
                            height = 0.8,
                            mirror = false,
                            prompt_position = 'top',
                        },
                    },
                    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                },
                extensions = {
                    live_grep_args = {
                        auto_quoting = true,
                    }
                },
                pickers = {
                    git_files = {
                        hidden = true,
                        file_ignore_patterns = file_ignore_patterns,
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
                        default_selection_index = 1,
                        mappings = {
                            i = {
                                ['<c-x>'] = actions.delete_buffer,
                            },
                        },
                        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
                    },
                    live_grep = {
                        layout_strategy = 'flex',
                        layout_config = {
                            flex = { flip_columns = 150 },
                        },
                        preview = true,
                        mappings = {
                            i = {
                                ['<c-q>'] = actions.smart_send_to_qflist,
                            }
                        }
                    },
                    grep_string = {
                        layout_strategy = 'flex',
                        layout_config = {
                            flex = { flip_columns = 150 },
                        },
                        preview = true,
                        mappings = {
                            i = {
                                ['<c-q>'] = actions.smart_send_to_qflist,
                            }
                        }
                    },
                },
            }
        end,
        config = function(_, opts)
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')
            local lib = require('ernst.lib')

            telescope.setup(opts)
            telescope.load_extension("live_grep_args")

            local lga = telescope.extensions.live_grep_args

            -- Custom find_files flavors
            local function find_files_respecting_ignore()
                builtin.find_files({
                    no_ignore = false,
                    hidden = true,
                    find_command = {
                        'fdfind',
                        '--type', 'f',
                        '--hidden',
                        '--color=never',
                        '--follow',
                    },
                    file_ignore_patterns = file_ignore_patterns,
                })
            end

            -- Hilfsfunktion für Ag-Kommandos
            local function ag_with_args(prompt, extra_args)
                lga.live_grep_args({
                    default_text = prompt .. (extra_args or ""),
                })
            end

            -- Standard Keymaps
            vim.keymap.set('n', '<c-p>', find_files_respecting_ignore, {})
            -- vim.keymap.set('n', '<c-p>', lib.project_files, {})
            vim.keymap.set('n', '<c-s-p>', builtin.buffers, {})
            vim.keymap.set('n', '<f9>', builtin.buffers, {})

            -- Ag User Commands
            vim.api.nvim_create_user_command('Ag', function(o) ag_with_args(o.args) end, { nargs = '*' })
            vim.api.nvim_create_user_command('Agi', function(o) ag_with_args(o.args, " --ignore-case") end,
                { nargs = '*' })
            vim.api.nvim_create_user_command('Ags', function(o) ag_with_args(o.args, " --case-sensitive") end,
                { nargs = '*' })
            vim.api.nvim_create_user_command('Agn', function(o) ag_with_args(o.args, " --no-ignore") end, { nargs = '*' })
            vim.api.nvim_create_user_command('Agni', function(o) ag_with_args(o.args, " --no-ignore --ignore-case") end,
                { nargs = '*' })
            vim.api.nvim_create_user_command('Agns',
                function(o) ag_with_args(o.args, " --no-ignore --case-sensitive") end, { nargs = '*' })

            -- Which-Key
            require("which-key").add({
                {
                    mode = { "n" },
                    { '<leader>b',  builtin.buffers,         desc = 'telescope: buffers' },
                    { '<leader>tb', builtin.buffers,         desc = 'telescope: buffers' },
                    { '<leader>tf', builtin.find_files,      desc = 'telescope: find files (no ignore)' },
                    { '<leader>ta', lga.live_grep_args,      desc = 'telescope: grep (with args)' },
                    { '<leader>tl', builtin.live_grep,       desc = 'telescope: ripgrep (legacy)' },
                    { '<leader>th', builtin.help_tags,       desc = 'telescope: help tags' },
                    { '<leader>tk', builtin.keymaps,         desc = 'telescope: keymaps' },
                    { '<leader>tq', builtin.quickfix,        desc = 'telescope: quickfix list' },
                    { '<leader>t:', builtin.commands,        desc = 'telescope: commands' },
                    { '<leader>t;', builtin.command_history, desc = 'telescope: command history' },
                    {
                        '<leader>m',
                        function() builtin.oldfiles({ cwd_only = true }) end,
                        desc = 'telescope: recent files (cwd)'
                    },
                    {
                        '<leader>r',
                        function() builtin.grep_string({ search = vim.fn.input('ripgrep: ') }) end,
                        desc = 'telescope: ripgrep prompt'
                    },
                }
            })
        end
    }
}
