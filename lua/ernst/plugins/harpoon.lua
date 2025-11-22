return { {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        menu = {
            borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
        },
    },
    config = function(spec)
        require('harpoon').setup(spec.opts)

        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        require("which-key").add(
            {
                {
                    { "<leader>o",       mark.add_file,                  desc = "Harpoon: add file",   nowait = true, remap = false },
                    { "<leader><space>", ui.toggle_quick_menu,           desc = "Harpoon: quick menu", nowait = true, remap = false },
                    { "<leader>1",       function() ui.nav_file(1) end,  desc = "Harpoon: file 1",     nowait = true, remap = false },
                    { "<leader>2",       function() ui.nav_file(2) end,  desc = "Harpoon: file 2",     nowait = true, remap = false },
                    { "<leader>3",       function() ui.nav_file(3) end,  desc = "Harpoon: file 3",     nowait = true, remap = false },
                    { "<leader>4",       function() ui.nav_file(4) end,  desc = "Harpoon: file 4",     nowait = true, remap = false },
                    { "<leader>5",       function() ui.nav_file(5) end,  desc = "Harpoon: file 5",     nowait = true, remap = false },
                    { "<leader>6",       function() ui.nav_file(6) end,  desc = "Harpoon: file 6",     nowait = true, remap = false },
                    { "<leader>7",       function() ui.nav_file(7) end,  desc = "Harpoon: file 7",     nowait = true, remap = false },
                    { "<leader>8",       function() ui.nav_file(8) end,  desc = "Harpoon: file 8",     nowait = true, remap = false },
                    { "<leader>9",       function() ui.nav_file(9) end,  desc = "Harpoon: file 9",     nowait = true, remap = false },
                    { "<leader>0",       function() ui.nav_file(10) end, desc = "Harpoon: file 10",    nowait = true, remap = false },
                },
            })
    end
} }
