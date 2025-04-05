local p = require('serious/palette')

local M = {}

M.gui = {
    ColorColumn              = { link = 'CursorLine' },
    Conceal                  = { fg = p.none, bg = p.none },
    CurSearch                = { fg = p.bg, bg = p.frost.turquoise },
    Cursor                   = { fg = p.bg, bg = p.frost.turquoise },
    CursorColumn             = { fg = p.none, bg = p.night.c1 },
    CursorIM                 = { fg = p.bg, bg = p.frost.turquoise },
    CursorLine               = { fg = p.none, bg = p.blend.blue },
    CursorLineFold           = { fg = p.none, bg = p.fg },
    CursorLineNr             = { fg = p.frost.turquoise, bg = p.blend.blue, bold = true },
    CursorLineSign           = { fg = p.night.c1, bg = p.blend.blue },
    Directory                = { fg = p.fg, bg = p.none },
    EndOfBuffer              = { fg = p.night.c1, bg = p.none },
    ErrorMsg                 = { fg = p.aurora.red, bg = p.none },
    FloatBorder              = { fg = p.frost.turquoise, bg = p.none },
    FloatFooter              = { link = 'FloatBorder' },
    FloatTitle               = { fg = p.fg, bg = p.bg },
    FoldColumn               = { fg = p.none, bg = p.none },
    Folded                   = { fg = p.none, bg = p.night.c3 },
    IncSearch                = { link = 'CurSearch' },
    LineNr                   = { fg = p.fg, bg = p.none },
    LineNrAbove              = { fg = p.night.c3, bg = p.none },
    LineNrBelow              = { fg = p.night.c3, bg = p.none },
    MatchParen               = { fg = p.none, bg = p.night.c3 },
    ModeMsg                  = { fg = p.fg, bg = p.bg },
    MoreMsg                  = { fg = p.fg, bg = p.bg },
    MsgArea                  = { fg = p.none, bg = p.bg },
    MsgSeparator             = { fg = p.night.c1, bg = p.bg },
    NonText                  = { fg = p.night.c3, bg = p.none },
    Normal                   = { fg = p.fg, bg = p.bg },
    NormalFloat              = { link = 'Normal' },
    NormalNC                 = { link = 'Normal' },
    Pmenu                    = { fg = p.fg, bg = p.bg },
    PmenuExtra               = { fg = p.frost.light_blue, bg = p.bg },
    PmenuExtraSel            = { fg = p.night.c1, bg = p.blend.blue },
    PmenuKind                = { fg = p.frost.turquoise, bg = p.bg },
    PmenuKindSel             = { fg = p.frost.sea, bg = p.blend.blue },
    PmenuSbar                = { fg = p.blend.turquoise, bg = p.bg },
    PmenuSel                 = { fg = p.none, bg = p.blend.blue },
    PmenuThumb               = { fg = p.night.c1, bg = p.night.c2 },
    Question                 = { fg = p.frost.turquoise, bg = p.bg },
    QuickFixLine             = { fg = p.fg, bg = p.none },
    Search                   = { link = 'CurSearch' },
    SignColumn               = { fg = p.none, bg = p.bg },
    SpecialKey               = { fg = p.night.c2, bg = p.bg },
    SpellBad                 = { fg = p.aurora.red, bg = p.bg },
    SpellCap                 = { fg = p.aurora.red, bg = p.bg },
    SpellLocal               = { fg = p.aurora.yellow, bg = p.bg },
    SpellRare                = { fg = p.aurora.yellow, bg = p.bg },
    StatusLine               = { fg = p.none, bg = p.bg },
    StatusLineNC             = { link = 'StatusLine' },
    Substitute               = { link = 'CurSearch' },
    TabLine                  = { fg = p.bg, bg = p.bg },
    TabLineFill              = { fg = p.bg, bg = p.bg },
    TabLineSel               = { fg = p.bg, bg = p.bg },
    TermCursor               = { fg = p.none, bg = p.blend.bluec1 },
    TermCursorNC             = { fg = p.none, bg = p.blend.bluec1 },
    TermNormal               = { fg = p.fg, bg = p.bg },
    Title                    = { fg = p.fg, bg = p.bg },
    Visual                   = { fg = p.none, bg = p.blend.blue },
    VisualNOS                = { fg = p.none, bg = p.blend.blue },
    WarningMsg               = { fg = p.aurora.yellow, bg = p.none },
    Whitespace               = { fg = p.night.c3, bg = p.none, sp = p.night.c3 },
    WildMenu                 = { fg = p.frost.turquoise, bg = p.blend.bluec1 },
    WinBar                   = { fg = p.fg, bg = p.bg },
    WinBarNC                 = { fg = p.fg, bg = p.bg },
    WinSeparator             = { fg = p.night.c1, bg = p.none },
    lCursor                  = { fg = p.bg, bg = p.frost.turquoise },
    DiffAdd                  = { fg = p.aurora.green, bg = p.blend.green },
    DiffChange               = { fg = p.aurora.yellow, bg = p.blend.yellow },
    DiffDelete               = { fg = p.aurora.red, bg = p.blend.red },
    DiffText                 = { fg = p.fg, bg = p.bg },
    healthError              = { fg = p.aurora.red, bg = p.blend.red },
    healthSuccess            = { fg = p.aurora.green, bg = p.blend.green },
    healthWarning            = { fg = p.aurora.yellow, bg = p.blend.yellow },
    Menu                     = { fg = p.frost.turquoise, bg = p.bg },
    Scrollbar                = { link = 'PmenuSbar' },
    Tooltip                  = { fg = p.blend.turquoise, bg = p.bg },
    Yank                     = { fg = p.aurora.yellow, bg = p.blend.turquoise },
    WindowPickerWinBar       = { fg = p.fg, bg = p.none },
    WindowPickerWinBarNC     = { fg = p.fg, bg = p.none },
    WindowPickerStatusLine   = { fg = p.fg, bg = p.none },
    WindowPickerStatusLineNC = { fg = p.fg, bg = p.none },
}

M.syntax = {
    Boolean        = { fg = p.aurora.purple, bg = p.none },
    Character      = { fg = p.frost.light_blue, bg = p.none },
    Comment        = { fg = p.blend.comment, bg = p.none },
    Conditional    = { fg = p.frost.light_blue, bg = p.none },
    Constant       = { fg = p.frost.sea, bg = p.none },
    Debug          = { fg = p.snow.c0, bg = p.none },
    Define         = { fg = p.frost.turquoise, bg = p.none },
    Delimiter      = { fg = p.fg, bg = p.none },
    Error          = { fg = p.aurora.red, bg = p.none },
    Exception      = { fg = p.frost.sea, bg = p.none },
    Float          = { fg = p.aurora.purple, bg = p.none },
    Function       = { fg = p.frost.turquoise, bg = p.none },
    Method         = { fg = p.frost.sea, bg = p.none },
    Identifier     = { fg = p.fg, bg = p.none },
    Ignore         = { fg = p.none, bg = p.none },
    Include        = { fg = p.frost.turquoise, bg = p.none },
    Keyword        = { fg = p.frost.light_blue, bg = p.none },
    Label          = { fg = p.frost.light_blue, bg = p.none },
    Macro          = { fg = p.none, bg = p.none },
    Number         = { fg = p.aurora.purple, bg = p.none },
    Operator       = { fg = p.aurora.yellow, bg = p.none },
    PreCondit      = { fg = p.frost.turquoise, bg = p.none },
    PreProc        = { fg = p.frost.turquoise, bg = p.none },
    Repeat         = { fg = p.frost.turquoise, bg = p.none },
    Special        = { fg = p.frost.turquoise, bg = p.none },
    SpecialChar    = { fg = p.aurora.yellow, bg = p.none },
    SpecialComment = { fg = p.frost.sea, bg = p.none },
    Statement      = { fg = p.frost.turquoise, bg = p.none },
    StorageClass   = { fg = p.frost.light_blue, bg = p.none },
    String         = { fg = p.aurora.green, bg = p.none },
    Structure      = { fg = p.aurora.blue, bg = p.none },
    Tag            = { fg = p.aurora.red, bg = p.none },
    Todo           = { fg = p.aurora.orange, bg = p.none },
    Type           = { fg = p.frost.turquoise, bg = p.none },
    Typedef        = { fg = p.frost.turquoise, bg = p.none },
    Underlined     = { fg = p.aurora.green, bg = p.none, underline = true, sp = p.aurora.green },
}

return M
