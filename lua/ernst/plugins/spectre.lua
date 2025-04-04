-- To use oxi for replacement run
--     ~/.local/share/nvim/lazy/nvim-spectre/build.sh
-- See spectres README fo more information
-- Replace match sytax:
--     oxi ${1}
--     sed \1
return { {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        default = {
            find = {
                cmd = "rg",
                options = { 'hidden' }
            },
            replace = {
                cmd = "oxi"
            }
        }
    },
    config = function(spec)
        require('spectre').setup(spec.opts)

        vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
            desc = "Toggle Spectre"
        })
        vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
            desc = "Search current word"
        })
        vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
            desc = "Search current word"
        })
        vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
            desc = "Search on current file"
        })
    end,
} }
