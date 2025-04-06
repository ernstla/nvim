local c = require('serious/colors')

local M = {}

M.gui = {
    ColorColumn                = { link = 'CursorLine' },
    Conceal                    = { fg = c.none, bg = c.none },
    CurSearch                  = { fg = c.black, bg = c.sea3 },
    Cursor                     = { fg = c.black, bg = c.sea3 },
    CursorColumn               = { fg = c.none, bg = c.grey4 },
    CursorIM                   = { fg = c.black, bg = c.sea3 },
    CursorLine                 = { fg = c.none, bg = c.none },
    CursorLineFold             = { fg = c.none, bg = c.text },
    CursorLineNr               = { fg = c.yellow4, bg = c.none },
    CursorLineSign             = { fg = c.grey4, bg = c.none },
    DiagnosticSignError        = { fg = c.vermil6 },
    DiagnosticSignWarn         = { fg = c.brown5 },
    DiagnosticSignHint         = { fg = c.purple4 },
    DiagnosticSignInfo         = { fg = c.blue6 },
    DiagnosticVirtualTextError = { fg = c.organge8 },
    DiagnosticVirtualTextWarn  = { fg = c.sea8 },
    DiagnosticVirtualTextHint  = { fg = c.brown3 },
    DiagnosticVirtualTextInfo  = { fg = c.blue5 },
    DiagnosticSignErrorNumber  = { fg = c.vermil6 },
    DiagnosticUnderlineError   = { fg = c.none, bg = c.red7 },
    DiffAdd                    = { fg = c.green1, bg = c.green7 },
    DiffChange                 = { fg = c.green7, bg = c.green1 },
    DiffDelete                 = { fg = c.rose1, bg = c.red5 },
    DiffText                   = { fg = c.red5, bg = c.rose1 },
    Directory                  = { fg = c.sea5, bg = c.none },
    EndOfBuffer                = { fg = c.grey4, bg = c.none },
    ErrorMsg                   = { fg = c.red2, bg = c.none },
    FloatBorder                = { fg = c.vermil5, bg = c.none },
    FloatFooter                = { link = 'FloatBorder' },
    FloatTitle                 = { fg = c.text, bg = c.bg },
    FoldColumn                 = { fg = c.none, bg = c.none },
    Folded                     = { fg = c.none, bg = c.grey4 },
    IncSearch                  = { fg = c.grey6, bg = c.rose1 },
    LineNr                     = { fg = c.sea8 },
    LineNrAbove                = { fg = c.grey4, bg = c.none },
    LineNrBelow                = { fg = c.grey4, bg = c.none },
    MatchParen                 = { fg = c.white, bg = c.green4, },
    Menu                       = { fg = c.sea3, bg = c.bg },
    ModeMsg                    = { fg = c.text, bg = c.bg },
    MoreMsg                    = { fg = c.text, bg = c.bg },
    MsgArea                    = { fg = c.none, bg = c.grey8 },
    MsgSeparator               = { fg = c.grey4, bg = c.bg },
    NonText                    = { fg = c.grey4, bg = c.none },
    Normal                     = { fg = c.text, bg = c.bg, },
    NormalFloat                = { bg = c.none },
    NormalNC                   = { fg = c.text, bg = c.none, },
    Pmenu                      = { fg = c.white, bg = c.none },
    PmenuExtra                 = { fg = c.blue5, bg = c.none },
    PmenuExtraSel              = { fg = c.grey4, bg = c.blue4 },
    PmenuKind                  = { fg = c.sea3, bg = c.none },
    PmenuKindSel               = { fg = c.sea4, bg = c.blue4 },
    PmenuSbar                  = { fg = c.sea4, bg = c.none },
    PmenuSel                   = { fg = c.white, bg = c.red7 },
    PmenuThumb                 = { bg = c.red4, },
    PmenuMatch                 = { fg = c.white },
    PmenuMatchSel              = { fg = c.vermil4, bg = c.white },
    Question                   = { fg = c.red0, bg = c.none },
    QuickFixLine               = { fg = c.text, bg = c.none },
    Scrollbar                  = { link = 'PmenuSbar' },
    Search                     = { fg = c.grey6, bg = c.rose9 },
    SignColumn                 = { fg = c.none, bg = c.bg },
    SpecialKey                 = { fg = c.grey3, bg = c.bg },
    SpellBad                   = { fg = c.red2, bg = c.bg },
    SpellCap                   = { fg = c.red2, bg = c.bg },
    SpellLocal                 = { fg = c.orange2, bg = c.bg },
    SpellRare                  = { fg = c.orange2, bg = c.bg },
    StatusLine                 = { fg = c.none, bg = c.grey7 },
    StatusLineNC               = { link = 'StatusLine' },
    Substitute                 = { link = 'CurSearch' },
    TabLine                    = { fg = c.sea7, bg = c.none },
    TabLineFill                = { fg = c.none, bg = c.none },
    TabLineMod                 = { fg = c.red5, bg = c.none },
    TabLineModSel              = { fg = c.vermil4, bg = c.none },
    TabLineSel                 = { fg = c.sea2, bg = c.none },
    TermCursor                 = { fg = c.none, bg = c.blue4c1 },
    TermCursorNC               = { fg = c.none, bg = c.blue4c1 },
    TermNormal                 = { fg = c.text, bg = c.bg },
    Title                      = { fg = c.text, bg = c.bg },
    Tooltip                    = { fg = c.sea4, bg = c.bg },
    Visual                     = { fg = c.text, bg = c.red5 },
    VisualNOS                  = { fg = c.none, bg = c.blue4 },
    WarningMsg                 = { fg = c.orange2, bg = c.none },
    Whitespace                 = { fg = c.grey4, bg = c.none, sp = c.grey4 },
    WildMenu                   = { fg = c.sea3, bg = c.blue4c1 },
    WinBar                     = { fg = c.text, bg = c.bg },
    WinBarNC                   = { fg = c.text, bg = c.bg },
    WinSeparator               = { fg = c.grey4, bg = c.none },
    WindowPickerStatusLine     = { fg = c.text, bg = c.none },
    WindowPickerStatusLineNC   = { fg = c.text, bg = c.none },
    WindowPickerWinBar         = { fg = c.text, bg = c.none },
    WindowPickerWinBarNC       = { fg = c.text, bg = c.none },
    Yank                       = { fg = c.orange2, bg = c.sea4 },
    healthError                = { fg = c.red2, bg = c.red1 },
    healthSuccess              = { fg = c.green2, bg = c.green2 },
    healthWarning              = { fg = c.orange2, bg = c.orange1 },
    lCursor                    = { fg = c.black, bg = c.sea3 },
}

M.syntax = {
    Boolean        = { fg = c.purple2, bg = c.none },
    Character      = { fg = c.blue5, bg = c.none },
    Comment        = { fg = c.comment, bg = c.none },
    Conditional    = { fg = c.blue5, bg = c.none },
    Constant       = { fg = c.sea4, bg = c.none },
    Debug          = { fg = c.grey0, bg = c.none },
    Define         = { fg = c.sea3, bg = c.none },
    Delimiter      = { fg = c.vermil4, bg = c.none },
    Error          = { fg = c.red2, bg = c.none },
    Exception      = { fg = c.sea4, bg = c.none },
    Float          = { fg = c.purple2, bg = c.none },
    Function       = { fg = c.sea3, bg = c.none },
    Method         = { fg = c.sea4, bg = c.none },
    Identifier     = { fg = c.text, bg = c.none },
    Ignore         = { fg = c.none, bg = c.none },
    Include        = { fg = c.sea3, bg = c.none },
    Keyword        = { fg = c.blue5, bg = c.none },
    Label          = { fg = c.blue5, bg = c.none },
    Macro          = { fg = c.none, bg = c.none },
    Number         = { fg = c.red1, bg = c.none },
    Operator       = { fg = c.sea2, bg = c.none },
    PreCondit      = { fg = c.sea3, bg = c.none },
    PreProc        = { fg = c.sea3, bg = c.none },
    Repeat         = { fg = c.sea3, bg = c.none },
    Special        = { fg = c.sea3, bg = c.none },
    SpecialChar    = { fg = c.orange2, bg = c.none },
    SpecialComment = { fg = c.sea4, bg = c.none },
    Statement      = { fg = c.sea3, bg = c.none },
    StorageClass   = { fg = c.blue5, bg = c.none },
    String         = { fg = c.orange3, bg = c.none },
    Structure      = { fg = c.rose9, bg = c.none },
    Tag            = { fg = c.red2, bg = c.none },
    Todo           = { fg = c.salmon7, bg = c.none },
    Type           = { fg = c.sea3, bg = c.none },
    Typedef        = { fg = c.sea3, bg = c.none },
    Underlined     = { fg = c.green2, bg = c.none, underline = true, sp = c.green2 },
}

return M
