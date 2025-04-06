local c = require('serious/colors')

local theme = {
    normal = {
        a = { fg = c.text, bg = c.rose7 },
        b = { fg = c.text, bg = c.grey6 },
        c = { fg = c.comment, bg = c.grey7 },
        z = { fg = c.text, bg = c.grey6 },
    },
    insert = {
        a = { fg = c.text, bg = c.blue3 },
        z = { fg = c.text, bg = c.grey6 },
    },
    visual = {
        a = { fg = c.text, bg = c.orange7 },
        z = { fg = c.text, bg = c.grey6 },
    },
    replace = {
        a = { fg = c.text, bg = c.purple6 },
        z = { fg = c.text, bg = c.grey6 },
    },
    command = {
        a = { fg = c.text, bg = c.purple6 },
        z = { fg = c.text, bg = c.grey6 },
    },
}

return { {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    opts = {
        options = {
            icons_enabled = true,
            theme = theme,
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            -- Lualine kills the nvim intro screen if separators are used.
            -- If they are disabled like below, the intro screen stays.
            --    component_separators = '',
            --    section_separators = '',
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 50,
                tabline = 50,
                winbar = 50,
            }
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
            lualine_c = { { 'filename', path = 1 } },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress', 'location' },
            lualine_z = { 'diagnostics' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { { 'filename', path = 1 } },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
} }
