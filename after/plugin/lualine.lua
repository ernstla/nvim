local colors = {
    love = '#b4334a',
    muted = '#6e6a86',
    base = '#191724',
    overlay = '#f2e9e1',
    iris = '#806a99',
    gold = '#da8d24',
    pine = '#286983',
}

local theme = {
    normal = {
        a = { fg = colors.overlay, bg = colors.love },
        b = { fg = colors.overlay, bg = colors.muted },
        c = { fg = colors.muted, bg = 'none' },
        z = { fg = colors.overlay, bg = colors.base },
    },
    insert = { a = { fg = colors.overlay, bg = colors.pine } },
    visual = { a = { fg = colors.overlay, bg = colors.gold } },
    replace = { a = { fg = colors.overlay, bg = colors.iris } },
    command = { a = { fg = colors.overlay, bg = colors.iris } },
}

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress', 'location' },
        lualine_z = { 'diagnostics' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
