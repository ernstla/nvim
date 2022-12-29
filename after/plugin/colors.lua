require('rose-pine').setup({
    dark_variant = 'moon', --- 'main' | 'moon'
    bold_vert_split = false,
    dim_nc_background = false,
    disable_background = true,
    disable_float_background = false,
    disable_italics = false,

    --- string hex value or named color from rosepinetheme.com/palette
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
hl(0, 'LineNr', { fg = '#1f323f' })
hl(0, 'CursorLineNr', { fg = '#f4e28e' })
hl(0, 'CursorLine', { bg = 'none' })
hl(0, 'LirFloatCursorLine', { bg = '#202326' })
hl(0, 'NvimTreeCursorLine', { bg = '#202326' })

hl(0, 'TabLineFill', { fg = 'none', bg = 'none' })
hl(0, 'TabLine', { fg = '#586e75', bg = 'none' })
hl(0, 'TabLineSel', { fg = '#ceecee', bg = 'none' })
hl(0, 'TabLineMod', { fg = '#934242', bg = 'none' })
hl(0, 'TabLineModSel', { fg = '#dc322f', bg = 'none' })

hl(0, 'NvimTreeWindowPicker', { fg = '#ffffff', bg = '#669933' })

hl(0, 'GitSignsAdd', { fg = '#669933' })
hl(0, 'GitSignsChange', { fg = '#ccff99' })
hl(0, 'GitSignsDelete', { fg = '#cb4b16' })

hl(0, 'DiffAdd', { fg = '#c1d3b1', bg = '#485b39' })
hl(0, 'DiffChange', { fg = '#485b39', bg = '#c1d3b1' })
hl(0, 'DiffDelete', { fg = '#c47b7b', bg = '#934242' })
hl(0, 'DiffText', { fg = '#934242', bg = '#f9c2c2' })

hl(0, 'BackendBlue1', { fg = '#617fa0' })
hl(0, 'BackendBlue2', { fg = '#697eb3' })
hl(0, 'BackendBlue3', { fg = '#7ab6e8' })
hl(0, 'BackendBlue4', { fg = '#95c2e8' })
hl(0, 'BackendBlue5', { fg = '#c2dcf2' })
hl(0, 'BackendPurple1', { fg = '#af7f99' })
hl(0, 'BackendPurple2', { fg = '#df9faf' })
hl(0, 'BackendOrange1', { fg = '#f2592a' })
hl(0, 'BackendOrange2', { fg = '#f38630' })
hl(0, 'BackendOrange3', { fg = '#ffbb29' })
hl(0, 'BackendOrange4', { fg = '#f4e28e' })
hl(0, 'BackendWhite', { fg = '#f8f8f0' })
hl(0, 'BackendGray', { fg = '#98aeb5' })

hl(0, '@include', { link = 'BackendBlue1' })
hl(0, '@keyword', { link = 'BackendBlue2' })
hl(0, '@type', { link = 'BackendBlue5' })
hl(0, '@conditional', { link = 'BackendBlue3' })
hl(0, '@method', { link = 'BackendBlue5' })
hl(0, '@function.call', { link = 'BackendPurple1' })
hl(0, '@constructor', { link = 'BackendPurple2' })
hl(0, '@type.builtin', { link = 'BackendOrange2' })
hl(0, '@type.qualifier', { link = 'BackendBlue1' })

hl(0, 'phpAssignByRef', { fg = '#f8f8f0' })
hl(0, 'phpBackslashSequences', { fg = '#f2592a' })
hl(0, 'phpBoolean', { fg = '#f2592a' })
hl(0, 'phpClasses', { fg = '#df9faf' })
hl(0, 'phpCommentTitle', { fg = '#98aeb5' })
hl(0, 'phpComparison', { fg = '#f8f8f0' })
hl(0, 'phpConditional', { fg = '#7ab6e8' })
hl(0, 'phpConstant', { fg = '#697eb3' })
hl(0, 'phpCoreConstant', { fg = '#697eb3' })
hl(0, 'phpDefine', { fg = '#697eb3' })
hl(0, 'phpDocParam', { fg = '#95c2e8' })
hl(0, 'phpDocTags', { fg = '#98aeb5' })
hl(0, 'phpException', { fg = '#7ab6e8' })
hl(0, 'phpFunctions', { fg = '#af7f99' })
hl(0, 'phpIdentifier', { fg = '#f8f8f0' })
hl(0, 'phpInclude', { fg = '#617fa0' })
hl(0, 'phpKeyword', { fg = '#7ab6e8' })
hl(0, 'phpLabel', { fg = '#7ab6e8' })
hl(0, 'phpMemberSelector', { fg = '#f8f8f0' })
hl(0, 'phpMethods', { fg = '#f8f8f0' })
hl(0, 'phpNumber', { fg = '#f2592a' })
hl(0, 'phpOperator', { fg = '#f8f8f0' })
hl(0, 'phpParent', { fg = '#f8f8f0' })
hl(0, 'phpRegion', { fg = '#c2dcf2' })
hl(0, 'phpRelation', { fg = '#f8f8f0' })
hl(0, 'phpRepeat', { fg = '#7ab6e8' })
hl(0, 'phpSpecialFunction', { fg = '#f5e28e' })
hl(0, 'phpStatement', { fg = '#7ab6e8' })
hl(0, 'phpStorageClass', { fg = '#617fa0' })
hl(0, 'phpStringBacktick', { fg = '#ffbb29' })
hl(0, 'phpStringDouble', { fg = '#ffbb29' })
hl(0, 'phpStringSingle', { fg = '#ffbb29' })
hl(0, 'phpStructure', { fg = '#697eb3' })
hl(0, 'phpType', { fg = '#f38630' })
hl(0, 'phpVarSelector', { fg = '#f8f8f0' })

hl(0, 'pythonBuiltin', { fg = '#af7f99' })
hl(0, 'pythonConst', { fg = '#86a943' })
hl(0, 'pythonAsync', { fg = '#7ab6e8' })
hl(0, 'pythonClass', { fg = '#f5c264' })
hl(0, 'pythonComment', { fg = '#556270' })
hl(0, 'pythonConditional', { fg = '#7ab6e8' })
hl(0, 'pythonDecorator', { fg = '#fd971f' })
hl(0, 'pythonDecoratorName', { fg = '#fdd9ae' })
hl(0, 'pythonDocString', { fg = '#556270' })
hl(0, 'pythonEscape', { fg = '#fd971f' })
hl(0, 'pythonException', { fg = '#7ab6e8' })
hl(0, 'pythonExceptions', { fg = '#fdca49' })
hl(0, 'pythonFunction', { fg = '#f8f8f0' })
hl(0, 'pythonInclude', { fg = '#7ab6e8' })
hl(0, 'pythonNumber', { fg = '#f2592a' })
hl(0, 'pythonOperator', { fg = '#7ab6e8' })
hl(0, 'pythonRawString', { fg = '#ffbb29' })
hl(0, 'pythonQuotes', { fg = '#ffbb29' })
hl(0, 'pythonRepeat', { fg = '#7ab6e8' })
hl(0, 'pythonSelf', { fg = '#a3be8c' })
hl(0, 'pythonStatement', { fg = '#697eb3' })
hl(0, 'pythonString', { fg = '#ffbb29' })
hl(0, 'pythonUnderUnder', { fg = '#fd971f' })
