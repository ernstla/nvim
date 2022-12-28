require('rose-pine').setup({
    --- @usage 'main' | 'moon'
    dark_variant = 'moon',
    bold_vert_split = false,
    dim_nc_background = false,
    disable_background = true,
    disable_float_background = false,
    disable_italics = false,

    --- @usage string hex value or named color from rosepinetheme.com/palette
    groups = {
        background = 'base',
        panel = 'surface',
        border = 'highlight_med',
        comment = 'muted',
        link = 'iris',
        punctuation = 'subtle',

        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',

        headings = {
            h1 = 'iris',
            h2 = 'foam',
            h3 = 'rose',
            h4 = 'gold',
            h5 = 'pine',
            h6 = 'foam',
        }
        -- or set all headings at once
        -- headings = 'subtle'
    },

    -- Change specific vim highlight groups
    highlight_groups = {
        ColorColumn = { bg = 'rose' }
    }
})

vim.cmd.colorscheme('rose-pine')

local hl = vim.api.nvim_set_hl

hl(0, 'Normal', { bg = 'none' })
hl(0, 'NormalFloat', { bg = 'none' })
hl(0, 'CursorLine', { bg = 'none' })
hl(0, 'LirFloatCursorLine', { bg = '#202326' })
hl(0, 'NvimTreeCursorLine', { bg = '#202326' })

hl(0, 'NvimTreeWindowPicker', { fg = '#ffffff', bg = '#669933' })

hl(0, 'GitSignsAdd', { fg = '#669933' })
hl(0, 'GitSignsChange', { fg = '#ccff99' })
hl(0, 'GitSignsDelete', { fg = '#cb4b16' })

hl(0, 'DiffAdd', { fg = '#c1d3b1', bg = '#485b39' })
hl(0, 'DiffChange', { fg = '#485b39', bg = '#c1d3b1' })
hl(0, 'DiffDelete', { fg = '#c47b7b', bg = '#934242' })
hl(0, 'DiffText', { fg = '#934242', bg = '#f9c2c2' })
