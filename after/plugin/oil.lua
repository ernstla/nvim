require("oil").setup({
    keymaps = {
        ["?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-s>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["q"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["."] = "actions.toggle_hidden",
    },
    float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
            winblend = 0,
        },
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
            local winpos = vim.api.nvim_win_get_position(0)
            local winwidth = vim.api.nvim_win_get_width(0)
            local winheight = vim.api.nvim_win_get_height(0)

            local width = math.min(80, winwidth - 20)
            local height = winheight - 50
            local row = (winheight / 3) - (height / 3) - 1

            if winheight <= 50 then
                height = winheight - 20
                row = (winheight / 2) - (height / 2) - 1
            end
            local col = (winwidth / 2) - (width / 2)

            conf.width = width
            conf.height = height
            conf.row = row + winpos[1]
            conf.col = col + winpos[2]

            return conf
        end,
    },
})

vim.keymap.set('n', '-', "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
