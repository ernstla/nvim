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

local n = 'DiagnosticSignError'
vim.fn.sign_define(n, { text = '', texthl = n, linehl = '', numhl = 'DiagnosticSignErrorNumber' })
n = 'DiagnosticSignWarn'
vim.fn.sign_define(n, { text = '', texthl = n, linehl = '', numhl = '' })
n = 'DiagnosticSignHint'
vim.fn.sign_define(n, { text = '', texthl = n, linehl = '', numhl = '' })
n = 'DiagnosticSignInfo'
vim.fn.sign_define(n, { text = '', texthl = n, linehl = '', numhl = '' })


local hl = vim.api.nvim_set_hl

-- Builtin
hl(0, 'CursorLine', { bg = 'none' })
hl(0, 'CursorLineNr', { fg = '#f2e9e1', bg = '#303336' })
hl(0, 'Delimiter', { fg = '#cb4b16' })
hl(0, 'DiffAdd', { fg = '#c1d3b1', bg = '#485b39' })
hl(0, 'DiffChange', { fg = '#485b39', bg = '#c1d3b1' })
hl(0, 'DiffDelete', { fg = '#c47b7b', bg = '#934242' })
hl(0, 'DiffText', { fg = '#934242', bg = '#f9c2c2' })
hl(0, 'IncSearch', { fg = '#1c1c1c', bg = '#8fbe00' })
hl(0, 'LineNr', { fg = '#1f323f' })
hl(0, 'Normal', { fg = '#f2e9e1', bg = 'none', })
hl(0, 'NormalFloat', { bg = 'none' })
hl(0, 'NormalNC', { fg = '#f2e9e1', bg = 'none', })
hl(0, 'TabLine', { fg = '#586e75', bg = 'none' })
hl(0, 'TabLineFill', { fg = 'none', bg = 'none' })
hl(0, 'TabLineMod', { fg = '#934242', bg = 'none' })
hl(0, 'TabLineModSel', { fg = '#dc322f', bg = 'none' })
hl(0, 'TabLineSel', { fg = '#ceecee', bg = 'none' })
hl(0, 'Visual', { fg = '#f2e9e1', bg = '#a4233a' })

-- Autocomplete menus
hl(0, 'Pmenu', { fg = '#ffffff', bg = '#101316' })
hl(0, 'PmenuSel', { fg = '#ffffff', bg = '#485b39' })
hl(0, 'CmpBorder', { fg = '#505356' })

-- TreeSitter
hl(0, '@keyword', { fg = '#697eb3' })
hl(0, '@conditional', { fg = '#7ab6e8' })
hl(0, '@tag', { fg = '#f38630' })
hl(0, '@tag.delimiter', { fg = '#f38630' })
hl(0, '@tag.attribute', { fg = '#fdca49' })
hl(0, '@variable', { fg = '#f2e9e1' })

hl(0, '@cssid', { fg = '#7ab6e8' })
hl(0, '@cssclass', { fg = '#9ccfd8' })
hl(0, '@property.css', { fg = '#ea9a97' })
hl(0, '@function.css', { fg = '#eb6f92' })
hl(0, '@tag.css', { fg = '#ea9d34' })


hl(0, '@type.svelte', { fg = '#7ab6e8' })
hl(0, '@keyword.svelte', { fg = '#7ab6e8' })
hl(0, '@punctuation.bracket.svelte', { fg = '#7ab6e8' })
-- Strange vim groups not affected by TreeSitter
-- e. g. svelte custom component names (uppercase tag name)
hl(0, 'Structure', { fg = '#c47b7b' })

-- Diagnostics
hl(0, 'DiagnosticSignError', { fg = '#bb2b16' })
hl(0, 'DiagnosticSignErrorNumber', { fg = '#551100' })
hl(0, 'DiagnosticSignWarn', { fg = '#bb7722' })
hl(0, 'DiagnosticSignHint', { fg = '#af7f99' })
hl(0, 'DiagnosticSignInfo', { fg = '#95c2e8' })
hl(0, 'DiagnosticVirtualTextError', { fg = '#662200' })
hl(0, 'DiagnosticVirtualTextWarn', { fg = '#3f525f' })
hl(0, 'DiagnosticVirtualTextHint', { fg = '#5f3f49' })
hl(0, 'DiagnosticVirtualTextInfo', { fg = '#85b2d8' })
-- Plugins
hl(0, 'LirFloatCursorLine', { bg = '#202326' })
hl(0, 'NvimTreeCursorLine', { bg = '#202326' })

-- see nvim-tree.lua/lua/nvim-tree/colors.lua
hl(0, 'NvimTreeWindowPicker', { fg = '#ffffff', bg = '#669933' })
hl(0, 'NvimTreeFolderIcon', { fg = '#85b2d8' })
hl(0, 'NvimTreeFolderName', { fg = '#7ab6e8' })
hl(0, 'NvimTreeEmptyFolderName', { fg = '#7ab6e8' })
hl(0, 'NvimTreeNormal', { fg = '#f2e9e1' })

hl(0, 'GitSignsAdd', { fg = '#669933' })
hl(0, 'GitSignsChange', { fg = '#ccff99' })
hl(0, 'GitSignsDelete', { fg = '#cb4b16' })

hl(0, 'LirFolderNode', { fg = '#cb4b16' })

-- Languages
hl(0, 'phpAssignByRef', { fg = '#f2e9e1' })
hl(0, 'phpBackslashSequences', { fg = '#f2592a' })
hl(0, 'phpBoolean', { fg = '#f2592a' })
hl(0, 'phpClasses', { fg = '#df9faf' })
hl(0, 'phpCommentTitle', { fg = '#98aeb5' })
hl(0, 'phpComparison', { fg = '#f2e9e1' })
hl(0, 'phpConditional', { fg = '#7ab6e8' })
hl(0, 'phpConstant', { fg = '#697eb3' })
hl(0, 'phpCoreConstant', { fg = '#697eb3' })
hl(0, 'phpDefine', { fg = '#697eb3' })
hl(0, 'phpDocParam', { fg = '#95c2e8' })
hl(0, 'phpDocTags', { fg = '#98aeb5' })
hl(0, 'phpException', { fg = '#7ab6e8' })
hl(0, 'phpFunctions', { fg = '#af7f99' })
hl(0, 'phpIdentifier', { fg = '#f2e9e1' })
hl(0, 'phpInclude', { fg = '#617fa0' })
hl(0, 'phpKeyword', { fg = '#7ab6e8' })
hl(0, 'phpLabel', { fg = '#7ab6e8' })
hl(0, 'phpMemberSelector', { fg = '#f2e9e1' })
hl(0, 'phpMethods', { fg = '#f2e9e1' })
hl(0, 'phpNumber', { fg = '#f2592a' })
hl(0, 'phpOperator', { fg = '#f2e9e1' })
hl(0, 'phpParent', { fg = '#f2e9e1' })
hl(0, 'phpRegion', { fg = '#c2dcf2' })
hl(0, 'phpRelation', { fg = '#f2e9e1' })
hl(0, 'phpRepeat', { fg = '#7ab6e8' })
hl(0, 'phpSpecialFunction', { fg = '#f5e28e' })
hl(0, 'phpStatement', { fg = '#7ab6e8' })
hl(0, 'phpStorageClass', { fg = '#617fa0' })
hl(0, 'phpStringBacktick', { fg = '#ffbb29' })
hl(0, 'phpStringDouble', { fg = '#ffbb29' })
hl(0, 'phpStringSingle', { fg = '#ffbb29' })
hl(0, 'phpStructure', { fg = '#697eb3' })
hl(0, 'phpType', { fg = '#f38630' })
hl(0, 'phpVarSelector', { fg = '#f2e9e1' })

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
hl(0, 'pythonFunction', { fg = '#f2e9e1' })
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

hl(0, 'sqlConstant', { fg = '#01a8c6' })
hl(0, 'sqlNumber', { fg = '#ffaaaa' })
hl(0, 'sqlType', { fg = '#ffc48c' })
hl(0, 'sqlTypeConversion', { fg = '#ffc48c' })
hl(0, 'sqlCreateTextSearchKeyword', { fg = '#ffc48c' })
hl(0, 'sqlString', { fg = '#f4e28e' })
hl(0, 'sqlFlow', { fg = '#fdca49' })
hl(0, 'sqlStatement', { fg = '#ea9d34' })
hl(0, 'sqlKeyword', { fg = '#ea9d34' })
hl(0, 'sqlOperator', { fg = '#ea9d34' })
hl(0, 'sqlPlpgsqlKeyword', { fg = '#ea9d34' })
hl(0, 'sqlFunction', { fg = '#a3be8c' })
hl(0, 'sqlCustomFunction', { fg = '#a3be8c' })
hl(0, 'sqlJsonFunction', { fg = '#a3be8c' })
hl(0, 'sqlPostgresFunction', { fg = '#a3be8c' })
hl(0, 'sqlIdentifier', { fg = '#ffffff' })
hl(0, 'sqlPublicSchema', { fg = '#b4637a' })
hl(0, 'sqlBoolean', { fg = '#ffaaaa' })
hl(0, 'sqlSpecial', { fg = '#ffaaaa' })
hl(0, 'sqlUnreserved', { fg = '#f2e9e1' })
hl(0, 'sqlMakoDelim', { fg = '#0095ff' })
hl(0, 'sqlMakoEnd', { fg = '#0095ff' })
hl(0, 'sqlPhpDelim', { fg = '#b4637a' })
hl(0, 'sqlPhpRegion', { fg = '#ffaaaa' })
hl(0, 'sqlColonParam', { fg = '#7ab6e8' })
hl(0, 'sqlPostgresDelim', { fg = '#7ab6e8' })
hl(0, 'sqlPostgresVariable', { fg = '#7ab6e8' })
