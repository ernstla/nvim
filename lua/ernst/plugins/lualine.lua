local colors = {
    love = '#b4334a',
    muted = '#6e6a86',
    base = '#191724',
    overlay = '#f2e9e1',
    iris = '#a04a79',
    gold = '#da8d24',
    pine = '#286983',
    bg = '#080b0e',
}

local theme = {
    normal = {
        a = { fg = colors.overlay, bg = colors.love },
        b = { fg = colors.overlay, bg = colors.muted },
        c = { fg = colors.muted, bg = colors.bg },
        z = { fg = colors.overlay, bg = colors.base },
    },
    insert = {
        a = { fg = colors.overlay, bg = colors.pine },
        z = { fg = colors.overlay, bg = colors.base },
    },
    visual = {
        a = { fg = colors.overlay, bg = colors.gold },
        z = { fg = colors.overlay, bg = colors.base },
    },
    replace = {
        a = { fg = colors.overlay, bg = colors.iris },
        z = { fg = colors.overlay, bg = colors.base },
    },
    command = {
        a = { fg = colors.overlay, bg = colors.iris },
        z = { fg = colors.overlay, bg = colors.base },
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
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
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
