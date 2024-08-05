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
vim.fn.sign_define(n, { text = '', texthl = n, linehl = '', numhl = 'DiagnosticSignErrorNumber' })
n = 'DiagnosticSignWarn'
vim.fn.sign_define(n, { text = '', texthl = n, linehl = '', numhl = '' })
n = 'DiagnosticSignHint'
vim.fn.sign_define(n, { text = '', texthl = n, linehl = '', numhl = '' })
n = 'DiagnosticSignInfo'
vim.fn.sign_define(n, { text = '', texthl = n, linehl = '', numhl = '' })


local hl = vim.api.nvim_set_hl

-- Builtin
hl(0, 'CursorLine', { bg = 'none' })
hl(0, 'CursorLineNr', { fg = '#ffdd00' })
hl(0, 'Delimiter', { fg = '#cb4b16' })
hl(0, 'DiffAdd', { fg = '#c1d3b1', bg = '#485b39' })
hl(0, 'DiffChange', { fg = '#485b39', bg = '#c1d3b1' })
hl(0, 'DiffDelete', { fg = '#c47b7b', bg = '#934242' })
hl(0, 'DiffText', { fg = '#934242', bg = '#f9c2c2' })
hl(0, 'FloatBorder', { fg = '#cb4b16', bg = 'none' })
hl(0, 'IncSearch', { fg = '#1c1c1c', bg = '#f9c2c2' })
hl(0, 'Search', { fg = '#1c1c1c', bg = '#c47b7b' })
hl(0, 'LineNr', { fg = '#5f727f' })
hl(0, 'Normal', { fg = '#f2e9e1', bg = 'none', })
hl(0, 'NormalFloat', { bg = 'none' })
hl(0, 'NormalNC', { fg = '#f2e9e1', bg = 'none', })
hl(0, 'TabLine', { fg = '#586e75', bg = 'none' })
hl(0, 'TabLineFill', { fg = 'none', bg = 'none' })
hl(0, 'TabLineMod', { fg = '#934242', bg = 'none' })
hl(0, 'TabLineModSel', { fg = '#dc322f', bg = 'none' })
hl(0, 'TabLineSel', { fg = '#ceecee', bg = 'none' })
hl(0, 'Visual', { fg = '#f2e9e1', bg = '#934242' })

-- Autocomplete menus
hl(0, 'Pmenu', { fg = '#ffffff', bg = '#801316' })
hl(0, 'PmenuSel', { fg = '#ffffff', bg = '#485b39' })
hl(0, 'CmpBorder', { fg = '#505356' })

-- fugitive
hl(0, 'fugitiveHeader', { fg = '#ffbb29' })
hl(0, 'fugitiveHeading', { fg = '#af7f99' })
hl(0, 'fugitiveHash', { fg = '#efafc9' })
hl(0, 'fugitiveStagedHeading', { fg = '#669933' })
hl(0, 'fugitiveStagedModifier', { fg = '#669933' })
hl(0, 'fugitiveStagedSection', { fg = '#ccffaa' })
hl(0, 'fugitiveUnstagedHeading', { fg = '#cb4b16' })
hl(0, 'fugitiveUnstagedModifier', { fg = '#cb4b16' })
hl(0, 'fugitiveUnstagedSection', { fg = '#ffbb86' })
hl(0, 'fugitiveUntrackedHeading', { fg = '#7ab6e8' })
hl(0, 'fugitiveUntrackedModifier', { fg = '#7ab6e8' })
hl(0, 'fugitiveUntrackedSection', { fg = '#caf6ff' })


-- Telescope
hl(0, 'TelescopeNormal', { fg = '#f2e9e1', bg = 'none' })
hl(0, 'TelescopeBorder', { fg = '#404346', bg = 'none' })
hl(0, 'TelescopeSelection', { fg = '#ffffff', bg = '#202326' })
hl(0, 'TelescopeResultsTitle', { fg = '#404346', bg = 'none' })
hl(0, 'TelescopePromptBorder', { fg = '#634242', bg = 'none' })
hl(0, 'TelescopePromptTitle', { fg = '#934242', bg = 'none' })
hl(0, 'TelescopePromptPrefix', { fg = '#934242', bg = 'none' })
hl(0, 'TelescopePromptNormal', { fg = '#f2e9e1', bg = 'none' })
hl(0, 'TelescopePreviewNormal', { fg = '#f2e9e1', bg = 'none' })
hl(0, 'TelescopeResultsNormal', { fg = '#f2e9e1', bg = 'none' })

-- Custom
hl(0, 'YankHigh', { fg = '#f2e9e1', bg = '#558822' })

hl(0, 'MasonNormal', { bg = 'none', default = true })
hl(0, 'LazyNormal', { bg = 'none', default = true })
hl(0, 'WhichKeyFloat', { bg = '#171313' })

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
hl(0, '@keyword.svelte', { fg = '#7ab6e8' })
hl(0, '@punctuation.bracket.svelte', { fg = '#7ab6e8' })

hl(0, '@variable.builtin.typescript', { fg = '#eb6f92' })

hl(0, '@method.vue', { fg = '#9ccfd8' })
hl(0, '@operator.vue', { fg = '#ffbb29' })
hl(0, '@variable.vue', { fg = '#f5e28e' })
hl(0, '@punctuation.special.vue', { fg = '#f5e28e' })
hl(0, '@tag.attribute.directive.vue', { fg = '#7ab6e8' })

hl(0, '@property.javascript', { fg = '#f2e9e1' })
hl(0, '@variable.javascript', { fg = '#f2e9e1' })

hl(0, '@text.literal.markdown_inline', { fg = '#eb6b36' })
hl(0, '@punctuation.delimiter.markdown_inline', { fg = '#eb6b36' })


-- Strange vim groups not affected by TreeSitter
-- e. g. svelte custom component names (uppercase tag name)
hl(0, 'Structure', { fg = '#c47b7b' })

-- Diagnostics
hl(0, 'DiagnosticSignError', { fg = '#bb2b16' })
-- hl(0, 'DiagnosticSignErrorNumber', { fg = '#bb2b16' })
hl(0, 'DiagnosticSignWarn', { fg = '#bb7722' })
hl(0, 'DiagnosticSignHint', { fg = '#af7f99' })
hl(0, 'DiagnosticSignInfo', { fg = '#95c2e8' })
hl(0, 'DiagnosticVirtualTextError', { fg = '#eb6b36' })
hl(0, 'DiagnosticVirtualTextWarn', { fg = '#6f828f' })
hl(0, 'DiagnosticVirtualTextHint', { fg = '#8f6f79' })
hl(0, 'DiagnosticVirtualTextInfo', { fg = '#85b2d8' })

-- Plugins
hl(0, 'LirFloatCursorLine', { bg = '#202326' })
hl(0, 'NvimTreeCursorLine', { bg = '#202326' })
hl(0, 'LspInfoBorder', { fg = '#404346', bg = 'none' })

-- see nvim-tree.lua/lua/nvim-tree/colors.lua
hl(0, 'NvimTreeWindowPicker', { fg = '#ffffff', bg = '#669933' })
hl(0, 'NvimTreeFolderIcon', { fg = '#85b2d8' })
hl(0, 'NvimTreeFolderName', { fg = '#7ab6e8' })
hl(0, 'NvimTreeEmptyFolderName', { fg = '#7ab6e8' })
hl(0, 'NvimTreeNormal', { fg = '#f2e9e1' })

hl(0, 'GitSignsAdd', { fg = '#669933' })
hl(0, 'GitSignsChange', { fg = '#669933' })
hl(0, 'GitSignsDelete', { fg = '#cb4b16' })
hl(0, 'GitSignsChangeDelete', { fg = '#cb4b16' })

hl(0, 'LirFolderNode', { fg = '#cb4b16' })

hl(0, 'Sneak', { bg = '#934242', fg = '#f2e9e1' })


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

hl(0, 'htmlComment', { fg = '#556270' })
hl(0, 'htmlCommentPart', { fg = '#556270' })
hl(0, 'htmlTagName', { fg = '#f38630' })
hl(0, 'htmlEndTag', { fg = '#f38630' })
hl(0, 'htmlTag', { fg = '#f38630' })
hl(0, 'htmlTagN', { fg = '#f38630' })
hl(0, 'htmlArg', { fg = '#fdca49' })
hl(0, 'htmlString', { fg = '#ffbb29' })
hl(0, 'htmlSpecialTagName', { fg = '#f2592a' })
hl(0, 'htmlLink', { fg = '#ffffff' })
hl(0, 'htmlTitle', { fg = '#ffffff' })
hl(0, 'htmlH1', { fg = '#ffffff' })
hl(0, 'htmlH2', { fg = '#ffffff' })
hl(0, 'htmlH3', { fg = '#ffffff' })
hl(0, 'htmlH4', { fg = '#ffffff' })
hl(0, 'htmlH5', { fg = '#ffffff' })
hl(0, 'htmlH6', { fg = '#ffffff' })
hl(0, 'htmlSpecialChar', { fg = '#ffc48c' })

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
hl(0, 'sqlMakoDelim', { fg = '#b4637a' })
hl(0, 'sqlMakoEnd', { fg = '#b4637a' })
hl(0, 'sqlPhpDelim', { fg = '#b4637a' })
hl(0, 'sqlPhpRegion', { fg = '#ffaaaa' })
hl(0, 'sqlColonParam', { fg = '#95c2e8' })
hl(0, 'sqlPostgresDelim', { fg = '#95c2e8' })
hl(0, 'sqlPostgresVariable', { fg = '#95c2e8' })

hl(0, 'nimStatement', { fg = '#97b060' })
hl(0, 'nimException', { fg = '#97b060' })
hl(0, 'nimConditional', { fg = '#97b060' })
hl(0, 'nimInclude', { fg = '#97b060' })
hl(0, 'nimRepeat', { fg = '#97b060' })
hl(0, 'nimPragma', { fg = '#94435a' })
hl(0, 'nimPragmaList', { fg = '#94435a' })
hl(0, 'nimKeywordOperator', { fg = '#97b060' })
hl(0, 'nimComment', { fg = '#505345' })
hl(0, 'nimQuote', { fg = '#ffc470' })
hl(0, 'nimString', { fg = '#ffc470' })
hl(0, 'nimRawString', { fg = '#ffc470' })
hl(0, 'nimPreCondit', { fg = '#fd981f' })
hl(0, 'nimPreProcStmt', { fg = '#fd981f' })
hl(0, 'nimConstant', { fg = '#cb4b16' })
hl(0, 'nimNumber', { fg = '#cb4b16' })
hl(0, 'nimSugUnknown', { fg = '#fff8dc' })      -- Error
hl(0, 'nimSugParam', { fg = '#fff8dc' })        -- Identifier
hl(0, 'nimSugModule', { fg = '#fff8dc' })       -- Identifier
hl(0, 'nimSugType', { fg = '#ffca29' })         -- Type
hl(0, 'nimSugGenericParam', { fg = '#fff8dc' }) -- Type
hl(0, 'nimSugVar', { fg = '#fff8dc' })          -- Identifier
hl(0, 'nimSugGlobalVar', { fg = '#fff8dc' })    -- Identifier
hl(0, 'nimSugLet', { fg = '#fff8dc' })          -- Identifier
hl(0, 'nimSugGlobalLet', { fg = '#fff8dc' })    -- Identifier
hl(0, 'nimSugConst', { fg = '#fff8dc' })        -- Constant
hl(0, 'nimSugResult', { fg = '#fff8dc' })       -- Special
hl(0, 'nimSugProc', { fg = '#d7dfc0' })         -- Function
hl(0, 'nimSugFunc', { fg = '#dda48c' })         -- Function
hl(0, 'nimSugMethod', { fg = '#fff8dc' })       -- Function
hl(0, 'nimSugIterator', { fg = '#fff8dc' })     -- Function
hl(0, 'nimSugConverter', { fg = '#fff8dc' })    -- Macro
hl(0, 'nimSugMacro', { fg = '#fff8dc' })        -- Macro
hl(0, 'nimSugTemplate', { fg = '#fff8dc' })     -- Macro
hl(0, 'nimSugField', { fg = '#fff8dc' })        -- Identifier
hl(0, 'nimSugEnumField', { fg = '#fff8dc' })    -- Constant
hl(0, 'nimSugForVar', { fg = '#fff8dc' })       -- Identifier
hl(0, 'nimSugLabel', { fg = '#fff8dc' })        -- Identifier
