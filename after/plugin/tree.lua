require('nvim-tree').setup({
    sort_by = 'case_sensitive',
    hijack_directories = {
        enable = false,
    },
    git = {
        enable = false
    },
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "-", action = "" },
                { key = "?", action = "toggle_help" },
                { key = 'O', action = 'edit' },
                { key = 'u', action = 'dir_up' },
                { key = { 'o', '<cr>' }, action = 'edit_no_picker' },
            },
        },
    },
    renderer = {
        group_empty = true,
        icons = {
            glyphs = {
                git = {
                    unstaged = '◦'
                }
            }
        }
    },
    filters = {
        dotfiles = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
            resize_window = true,
        }
    }
})

vim.keymap.set('n', '<f8>', '<cmd>NvimTreeToggle<cr>', { noremap = true, silent = true, nowait = true })
